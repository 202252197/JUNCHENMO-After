package com.jcm.system.controller;

import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.domain.R;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.utils.OperLogCover;
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
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 用户管理 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@Api(tags = "用户管理")
@ApiSupport(author = "202252197@qq.com", order = 1)
@BusinessName(title = OperationNameConstants.SYSTEM_USER)
@RestController
@AllArgsConstructor
@RequestMapping("/user")
public class SysUserController extends PageBaseController {

    private final ISysUserService sysUserService;
    private final ISysMenuService sysPermissionService;
    private final ISysRoleService sysRoleService;

    @InnerAuth
    @ApiOperation(value = "获取当前用户信息", notes = "内部服务使用")
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

    @InnerAuth
    @ApiOperation(value = "修改用户最后登录时间和IP", notes = "内部服务使用")
    @PutMapping("/changeLoginInfo")
    public R<Integer> changeLoginInfo(@RequestBody SysUser sysUser) {
        return R.ok(sysUserService.changeLoginInfo(sysUser));
    }

    @ApiOperation(value = "新增用户", notes = "新增用户的时候判断账号账号是否存在、手机号码是否绑定过、邮箱是否绑定过")
    @ApiOperationSupport(order = 1)
    @RequiresPermissions("system:user:add")
    @Log(functionName = "新增用户", businessType = BusinessType.INSERT)
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysUser user) {
        OperLogCover.insertLogMsg(BusinessNameConstant.USER, user.getUsername());
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


    @ApiOperation(value = "删除用户", notes = "将用户账号删除")
    @ApiOperationSupport(order = 2)
    @RequiresPermissions("system:user:remove")
    @Log(functionName = "删除用户", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userId}")
    @PrintParams
    public AjaxResult remove(@PathVariable("userId") Long userId) {
        OperLogCover.deleteLogMsg(BusinessNameConstant.USER, 1);
        sysUserService.checkUserAllowed(userId);
        return toAjax(sysUserService.deleteUser(userId));
    }

    @ApiOperation(value = "修改用户", notes = "修改用户的信息")
    @ApiOperationSupport(order = 3)
    @RequiresPermissions("system:user:edit")
    @Log(functionName = "修改用户信息", businessType = BusinessType.UPDATE, excludeParamNames = {"email", "admin"})
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysUser user) {
        OperLogCover.updateLogMsg(BusinessNameConstant.USER, user.getUserId());
        sysUserService.checkUserAllowed(user.getUserId());
        SysUser sysUser = sysUserService.selectUserById(user.getUserId());
        if (StringUtils.isNotEmpty(user.getMobile()) && !sysUserService.checkPhoneUnique(user)) {
            if (!sysUser.getMobile().equals(user.getMobile())) {
                return error("修改用户'" + user.getMobile() + "'失败，手机号码已存在");
            }
        }
        if (StringUtils.isNotEmpty(user.getEmail()) && !sysUserService.checkEmailUnique(user)) {
            if (!sysUser.getEmail().equals(user.getEmail())) {
                return error("修改用户'" + user.getEmail() + "'失败，邮箱账号已存在");
            }
        }
        return toAjax(sysUserService.updateUser(user));
    }

    @ApiOperation(value = "分页条件查询用户列表")
    @ApiOperationSupport(order = 4)
    @RequiresPermissions("system:user:list")
    @GetMapping("/list")
    @PrintParams
    public TableDataInfo list(SysUser user) {
        startPage();
        List<SysUser> list = sysUserService.selectUserList(user);
        return getDataTable(list);
    }

    @ApiOperation(value = "获取当前用户的详细信息", notes = "返回用户信息,角色集合,权限集合")
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

    @ApiOperation(value = "修改用户密码")
    @RequiresPermissions("system:user:resetPassword")
    @Log(functionName = "重置用户密码", businessType = BusinessType.UPDATE)
    @PutMapping("/changePassword")
    @PrintParams
    public AjaxResult resetPassword(@RequestBody SysUser user) {
        sysUserService.checkUserAllowed(user.getUserId());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return toAjax(sysUserService.resetUserPassword(user));
    }

    @ApiOperation(value = "禁用用户")
    @PutMapping("/changeStatus")
    @RequiresPermissions("system:user:disableAccount")
    @PrintParams
    public AjaxResult disable(@RequestBody SysUser user) {
        sysUserService.checkUserAllowed(user.getUserId());
        return toAjax(sysUserService.disableUser(user.getUserId()));
    }

    @ApiOperation(value = "授权用户角色", notes = "传入用户ID和角色集合")
    @RequiresPermissions("system:user:authRole")
    @PutMapping("/authRole")
    @PrintParams
    public AjaxResult insertAuthRole(Long userId, Long[] roleIds) {
        return toAjax(sysUserService.insertUserAuth(userId, roleIds));
    }


    @ApiOperation(value = "查询用户选项值")
    @RequiresPermissions("system:user:list")
    @GetMapping("/optionSelect")
    @PrintParams
    public AjaxResult optionSelect() {
        return success(sysUserService.selectUserAll());
    }

}
