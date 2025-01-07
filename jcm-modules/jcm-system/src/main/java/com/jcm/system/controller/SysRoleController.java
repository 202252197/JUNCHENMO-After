package com.jcm.system.controller;


import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.domain.SysRole;
import com.jcm.system.service.ISysRoleService;
import com.jcm.system.service.ISysUserRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 角色管理 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@Api(tags="角色管理")
@ApiSupport(author = "202252197@qq.com",order = 2)
@BusinessName(title = OperationNameConstants.SYSTEM_ROLE)
@RestController
@AllArgsConstructor
@RequestMapping("/role")
public class SysRoleController extends PageBaseController {

    private final ISysRoleService sysRoleService;

    private final ISysUserRoleService sysUserRoleService;

    @ApiOperation(value = "新增角色", notes = "新增角色的时候判断角色名称，角色编码是否存在")
    @RequiresPermissions("system:role:add")
    @Log(functionName = "新增角色",businessType= BusinessType.INSERT)
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysRole role)
    {
        OperLogCover.insertLogMsg(BusinessNameConstant.ROLE,role.getName());
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


    @ApiOperation(value = "删除角色")
    @RequiresPermissions("system:role:remove")
    @Log(functionName = "删除角色",businessType= BusinessType.DELETE)
    @DeleteMapping("/{roleIds}")
    @PrintParams
    public AjaxResult remove(@PathVariable List<Long> roleIds) {
        OperLogCover.deleteLogMsg(BusinessNameConstant.ROLE,roleIds.size());
        return toAjax(sysRoleService.deleteRole(roleIds));
    }


    @ApiOperation(value = "修改角色")
    @RequiresPermissions("system:role:edit")
    @Log(functionName = "修改角色",businessType= BusinessType.UPDATE)
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysRole role)
    {
        OperLogCover.updateLogMsg(BusinessNameConstant.USER,role.getRoleId());
        return toAjax(sysRoleService.updateRole(role));
    }

    @ApiOperation(value = "分页条件查询角色列表")
    @RequiresPermissions("system:role:list")
    @GetMapping("/list")
    @PrintParams
    public TableDataInfo list(SysRole role)
    {
        startPage();
        List<SysRole> list = sysRoleService.selectRoleList(role);
        return getDataTable(list);
    }


    @ApiOperation(value = "禁用角色")
    @RequiresPermissions("system:role:editStatus")
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysRole role)
    {
        sysRoleService.checkRoleAllowed(role);
        return toAjax(sysRoleService.updateRoleStatus(role));
    }

    @ApiOperation(value = "查询角色选项值")
    @RequiresPermissions("system:role:list")
    @GetMapping("/optionSelect")
    @PrintParams
    public AjaxResult optionSelect()
    {
        return success(sysRoleService.selectRoleAll());
    }

    @ApiOperation(value = "查询用户角色")
    @PrintParams
    @RequiresPermissions("system:role:list")
    @GetMapping("/authUser/allocatedList/{userId}")
    public AjaxResult allocatedList(@PathVariable Long userId)
    {
        return success(sysUserRoleService.selectAllocatedList(userId));
    }

    @ApiOperation(value = "授权角色菜单")
    @PrintParams
    @RequiresPermissions("system:role:authMenu")
    @PutMapping("/authMenu")
    public AjaxResult insertAuthMenu(Long roleId,Long[] menusId)
    {
        return toAjax(sysRoleService.insertRoleAuth(roleId,menusId));
    }

}
