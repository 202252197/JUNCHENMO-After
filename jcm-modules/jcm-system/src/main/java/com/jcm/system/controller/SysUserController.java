package com.jcm.system.controller;

import com.jcm.common.core.constant.ServiceNameConstants;
import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.domain.R;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.InnerAuth;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.api.model.LoginUser;
import com.jcm.system.service.ISysMenuService;
import com.jcm.system.service.ISysRoleService;
import com.jcm.system.service.ISysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@Tag(name = "用户管理")
@RestController
@AllArgsConstructor
@RequestMapping("/user")
public class SysUserController extends PageBaseController {

    private final ISysUserService sysUserService;
    private final ISysMenuService sysPermissionService;
    private final ISysRoleService sysRoleService;

    /**
     * 内部服务调用接口，获取当前用户信息
     */
    @Operation(summary = "根据用户账号获取用户信息", description = "内部接口根据用户账号获取用户详情、用户角色集合、用户权限集合", tags = "内部接口")
    @InnerAuth
    @GetMapping("/info/{username}")
    public R<LoginUser> info(@PathVariable("username") String username) {
        SysUser sysUser = sysUserService.selectUserByUserName(username);
        if (StringUtils.isNull(sysUser)) {
            return R.fail("用户名或密码错误");
        }
        // 角色集合
        Set<String> roles = sysRoleService.getRolePermission(sysUser);
        // 权限集合
        Set<String> permissions = sysPermissionService.getMenuPermission(sysUser);
        LoginUser sysUserVo = new LoginUser();
        sysUserVo.setSysUser(sysUser);
        sysUserVo.setRoles(roles);
        sysUserVo.setPermissions(permissions);
        return R.ok(sysUserVo);
    }


    /**
     * 内部服务调用接口，根据用户ID修改用户最后登录时间和IP
     */
    @Operation(summary = "根据用户ID修改用户最后登录时间和IP", description = "根据用户ID修改用户最后登录时间和IP", tags = "内部接口")
    @InnerAuth
    @PutMapping("/changeLoginInfo")
    public R<Integer> changeLoginInfo(@RequestBody SysUser sysUser) {
        return R.ok(sysUserService.changeLoginInfo(sysUser));
    }

    /**
     * 获取用户列表
     */
    @Operation(summary = "分页条件查询用户列表", description = "分页获取用户列表")
    @RequiresPermissions("system:user:list")
    @PostMapping("/list")
    @PrintParams
    public TableDataInfo list(@RequestBody SysUser user) {
        startPage();
        List<SysUser> list = sysUserService.selectUserList(user);
        return getDataTable(list);
    }

    /**
     * 获取用户信息
     * @return 用户信息
     */
    @Operation(summary = "获取用户的详细信息", description = "包括用户信息、用户角色列表、用户权限列表")
    @GetMapping("/getInfo")
    @PrintParams
    public AjaxResult getInfo() {
        SysUser user = sysUserService.selectUserById(SecurityUtils.getUserId());
        // 角色集合
        Set<String> roles = sysRoleService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = sysPermissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 新增用户
     */
    @Operation(summary = "新增用户", description = "新增用户的时候判断账号账号是否存在、手机号码是否绑定过、邮箱是否绑定过")
    @RequiresPermissions("system:user:add")
    @Log(title = ServiceNameConstants.SYSTEM_SERVICE,businessType= BusinessType.INSERT)
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysUser user) {
        if (!sysUserService.checkUserNameUnique(user)) {
            return error("新增用户'" + user.getUsername() + "'失败，登录账号已存在");
        } else if (StringUtils.isNotEmpty(user.getMobile()) && !sysUserService.checkPhoneUnique(user)) {
            return error("新增用户'" + user.getUsername() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(user.getEmail()) && !sysUserService.checkEmailUnique(user)) {
            return error("新增用户'" + user.getUsername() + "'失败，邮箱账号已存在");
        }
        user.setStatus(Integer.valueOf(UserConstants.USER_NORMAL));
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return toAjax(sysUserService.insertUser(user));
    }


    /**
     * 删除用户账号
     */
    @Operation(summary = "删除用户账号", description = "将用户账号删除")
    @RequiresPermissions("system:user:delete")
    @Log(title = ServiceNameConstants.SYSTEM_SERVICE,businessType= BusinessType.DELETE)
    @DeleteMapping("/{userId}")
    @PrintParams
    public AjaxResult delete(@PathVariable("userId") Long userId) {
        sysUserService.checkUserAllowed(userId);
        return toAjax(sysUserService.deleteUser(userId));
    }

    /**
     * 修改用户
     */
    @Operation(summary = "修改用户的信息", description = "修改用户的信息")
    @RequiresPermissions("system:user:edit")
    @Log(title = ServiceNameConstants.SYSTEM_SERVICE,businessType= BusinessType.UPDATE)
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysUser user)
    {
        sysUserService.checkUserAllowed(user.getUserId());
        SysUser sysUser = sysUserService.selectUserById(user.getUserId());
        if (StringUtils.isNotEmpty(user.getMobile()) && !sysUserService.checkPhoneUnique(user))
        {
            if(!sysUser.getMobile().equals(user.getMobile())){
                return error("修改用户'" + user.getMobile() + "'失败，手机号码已存在");
            }
        }
       if (StringUtils.isNotEmpty(user.getEmail()) && !sysUserService.checkEmailUnique(user))
        {
            if(!sysUser.getEmail().equals(user.getEmail())){
                return error("修改用户'" + user.getEmail() + "'失败，邮箱账号已存在");
            }
        }
        return toAjax(sysUserService.updateUser(user));
    }

    /**
     * 重置用户的密码
     */
    @Operation(summary = "重置用户的密码", description = "修改用户的密码")
    @RequiresPermissions("system:user:resetPassword")
    @Log(title = ServiceNameConstants.SYSTEM_SERVICE,businessType= BusinessType.UPDATE)
    @PutMapping("/changePassword")
    @PrintParams
    public AjaxResult resetPassword(@RequestBody SysUser user) {
        sysUserService.checkUserAllowed(user.getUserId());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return toAjax(sysUserService.resetUserPassword(user));
    }


    /**
     * 禁用用户账号
     */
    @Operation(summary = "禁用用户账号", description = "将用户账号禁用，不可用")
    @Log(title = ServiceNameConstants.SYSTEM_SERVICE,businessType= BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @RequiresPermissions("system:user:disableAccount")
    @PrintParams
    public AjaxResult disable(@RequestBody SysUser user) {
        sysUserService.checkUserAllowed(user.getUserId());
        return toAjax(sysUserService.disableUser(user.getUserId()));
    }

    /**
     * 用户授权角色
     */
    @RequiresPermissions("system:user:authRole")
    @Log(title = ServiceNameConstants.SYSTEM_SERVICE,businessType= BusinessType.UPDATE)
    @PutMapping("/authRole")
    public AjaxResult insertAuthRole(Long userId, Long[] roleIds)
    {
        sysUserService.insertUserAuth(userId, roleIds);
        return success();
    }


}
