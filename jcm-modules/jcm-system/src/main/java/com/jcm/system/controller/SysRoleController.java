package com.jcm.system.controller;


import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.OperationName;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.domain.SysRole;
import com.jcm.system.service.ISysRoleService;
import com.jcm.system.service.ISysUserRoleService;
import io.swagger.v3.oas.annotations.Operation;
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
@OperationName(title = OperationNameConstants.SYSTEM_ROLE)
@RestController
@AllArgsConstructor
@RequestMapping("/role")
public class SysRoleController extends PageBaseController {

    private final ISysRoleService sysRoleService;

    private final ISysUserRoleService sysUserRoleService;

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
        return toAjax(sysRoleService.insertRole(role));
    }

    /**
     * 删除用户账号
     */
    @Operation(summary = "删除角色", description = "将角色删除")
    @RequiresPermissions("system:user:delete")
    @DeleteMapping
    @PrintParams
    public AjaxResult delete(@RequestBody List<Long> roleIds) {
        return toAjax(sysRoleService.deleteRole(roleIds));
    }

    /**
     * 修改角色信息
     */
    @Operation(summary = "修改角色信息", description = "修改角色信息")
    @RequiresPermissions("system:role:edit")
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysRole role)
    {
        return toAjax(sysRoleService.updateRole(role));
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
     * 状态修改
     */
    @RequiresPermissions("system:role:editStatus")
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysRole role)
    {
        sysRoleService.checkRoleAllowed(role);
        return toAjax(sysRoleService.updateRoleStatus(role));
    }

    /**
     * 查询所有启用的角色
     */
    @RequiresPermissions("system:role:list")
    @GetMapping("/optionSelect")
    @PrintParams
    public AjaxResult optionSelect()
    {
        return success(sysRoleService.selectRoleAll());
    }

    /**
     * 根据用户ID查询已经分配的角色列表
     */
    @PrintParams
    @RequiresPermissions("system:role:list")
    @GetMapping("/authUser/allocatedList/{userId}")
    public AjaxResult allocatedList(@PathVariable Long userId)
    {
        return success(sysUserRoleService.selectAllocatedList(userId));
    }

    /**
     * 角色授权菜单
     */
    @PrintParams
    @RequiresPermissions("system:role:authMenu")
    @PutMapping("/authMenu")
    public AjaxResult insertAuthMenu(Long roleId,Long[] menusId)
    {
        return toAjax(sysRoleService.insertRoleAuth(roleId,menusId));
    }

}
