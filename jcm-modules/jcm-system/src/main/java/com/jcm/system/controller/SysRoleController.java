package com.jcm.system.controller;


import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.domain.R;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.domain.DTO.RoleDTO;
import com.jcm.system.domain.SysRole;
import com.jcm.system.service.ISysRoleService;
import com.jcm.system.service.ISysUserRoleService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@Tag(name="角色管理")
@RestController
@RequestMapping("/role")
@AllArgsConstructor
public class SysRoleController extends PageBaseController {

    private final ISysRoleService sysRoleService;

    private final ISysUserRoleService sysUserRoleService;

    /**
     * 获取全部角色列表
     */
    @RequiresPermissions("system:role:list")
    @GetMapping("/listAll")
    @PrintParams
    public R listAll()
    {
        return R.ok(sysRoleService.selectRoleList(new SysRole()));
    }

    /**
     * 获取角色列表分页条件查询
     */
    @RequiresPermissions("system:role:list")
    @PostMapping("/list")
    @PrintParams
    public TableDataInfo list(@RequestBody SysRole role)
    {
        startPage();
        List<SysRole> list = sysRoleService.selectRoleList(role);
        return getDataTable(list);
    }


    /**
     * 新增角色
     */
    @RequiresPermissions("system:role:add")
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysRole role)
    {
        if (!sysRoleService.checkRoleNameUnique(role))
        {
            return error("新增角色'" + role.getName() + "'失败，角色名称已存在");
        }
        else if (!sysRoleService.checkRoleKeyUnique(role))
        {
            return error("新增角色'" + role.getCode() + "'失败，角色权限已存在");
        }
        role.setStatus(Integer.valueOf(UserConstants.USER_NORMAL));
        return toAjax(sysRoleService.insertRole(role));

    }


    /**
     * 状态修改
     */
    @RequiresPermissions("system:role:edit")
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysRole role)
    {
        sysRoleService.checkRoleAllowed(role);
        return toAjax(sysRoleService.updateRoleStatus(role));
    }

    /**
     * 查询已分配用户角色列表
     */
    @PrintParams
    @RequiresPermissions("system:role:query")
    @GetMapping("/queryUserRoles/{userId}")
    public R queryUserRoles(@PathVariable Long userId)
    {
        return R.ok(sysUserRoleService.queryUserRoles(userId));
    }



    /**
     * 批量选择角色对用户授权
     */
    @PrintParams
    @RequiresPermissions("system:role:edit")
    @PutMapping("/authUserRole/selectAll")
    public AjaxResult selectAuthUserRoleAll(@RequestBody RoleDTO roleDTO)
    {
        return toAjax(sysUserRoleService.insertAuthUserRoles(roleDTO));
    }

}
