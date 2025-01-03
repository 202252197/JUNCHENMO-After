package com.jcm.system.controller;


import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.domain.R;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.annotation.OperationName;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.domain.SysMenu;
import com.jcm.system.domain.vo.RouterVo;
import com.jcm.system.service.ISysMenuService;
import com.jcm.system.service.ISysRoleMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 菜单管理 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@Api(tags="菜单管理")
@ApiSupport(author = "202252197@qq.com",order = 3)
@OperationName(title = OperationNameConstants.SYSTEM_MENU)
@RestController
@RequestMapping("/menu")
@AllArgsConstructor
public class SysMenuController extends PageBaseController {

    private final ISysMenuService sysMenuService;

    private final ISysRoleMenuService sysRoleMenuService;

    @ApiOperation(value = "新增菜单")
    @RequiresPermissions("system:menu:add")
    @Log(businessName = "新增菜单",businessType= BusinessType.INSERT)
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysMenu menu)
    {
        OperLogCover.insertLogMsg(BusinessNameConstant.MENU,menu.getName());
        return toAjax(sysMenuService.insertMenu(menu));

    }


    @ApiOperation(value = "删除菜单")
    @RequiresPermissions("system:menu:delete")
    @Log(businessName = "删除菜单",businessType= BusinessType.DELETE)
    @DeleteMapping("/{menuId}")
    @PrintParams
    public AjaxResult delete(@PathVariable("menuId") Long menuId) {
        OperLogCover.deleteLogMsg(BusinessNameConstant.MENU,1);
        return toAjax(sysMenuService.deleteMenu(menuId));
    }

    @ApiOperation(value = "修改菜单")
    @RequiresPermissions("system:menu:edit")
    @Log(businessName = "修改菜单",businessType= BusinessType.UPDATE)
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysMenu menu)
    {
        OperLogCover.updateLogMsg(BusinessNameConstant.MENU,menu.getMenuId());
        return toAjax(sysMenuService.updateMenu(menu));
    }


    @ApiOperation(value = "分页条件查询菜单列表")
    @RequiresPermissions("system:menu:list")
    @Operation(summary = "获取全部菜单列表",description = "获取全部菜单列表，管理员才有次权限")
    @GetMapping("/list")
    @PrintParams
    public AjaxResult list(SysMenu menu)
    {
        List<SysMenu> menus = sysMenuService.selectMenuAllTree(menu);
        return success(menus);
    }


    @ApiOperation(value = "查询用户的菜单列表/路由")
    @Operation(summary = "获取菜单列表",description = "获取前端菜单列表")
    @GetMapping("/getRouters")
    @PrintParams
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = sysMenuService.selectMenuTreeByUserId(userId);
        List<RouterVo> routerVos = sysMenuService.buildMenus(menus, null);
        routerVos.forEach(routerVo -> {
            if(routerVo.getChildren()!=null &&routerVo.getChildren().size()>=1){
                RouterVo routerVoChildren = routerVo.getChildren().get(0);
                routerVo.setRedirect(routerVoChildren.getPath());
            }
        });
        return success(routerVos);
    }


    @ApiOperation(value = "查询新增菜单Sort值",notes = "根据父菜单的ID查询子菜单最大的Sort+100")
    @Operation(summary = "查询新增菜单最后的sort值",description = "通过id查询所有子菜单，对子菜单的最大sort加100返回")
    @RequiresPermissions("system:menu:list")
    @GetMapping("/getChildLastSort/{parentId}")
    @PrintParams
    public AjaxResult getMenuChildLastSort(@PathVariable("parentId") Long parentId)
    {
        Integer childLastSort = sysMenuService.getMenuChildLastSort(parentId) + 100;
        return success(childLastSort);
    }


    @ApiOperation(value = "查询首页动态设置的icon图标")
    @RequiresPermissions("system:menu:list")
    @Operation(summary = "查询首页图标名称",description = "获取首页动态设置的icon图标")
    @GetMapping("/getHomeMenuIcon")
    @PrintParams
    public AjaxResult getHomeMenuIcon()
    {
        String homeIcon = sysMenuService.getHomeMenuIcon();
        return success(homeIcon);
    }

    @ApiOperation(value = "查询角色菜单")
    @PrintParams
    @RequiresPermissions("system:menu:list")
    @GetMapping("/queryRoleMenus/{roleId}")
    public R queryRoleMenus(@PathVariable Integer roleId)
    {
        return R.ok(sysRoleMenuService.queryMenuIdsByRoleId(roleId));
    }

    @ApiOperation(value = "修改菜单及子菜单状态")
    @PutMapping("/changeStatusWithChildStatus")
    @RequiresPermissions("system:user:disableAccount")
    @PrintParams
    public AjaxResult changeStatusWithChildStatus(@RequestBody SysMenu menu) {
        sysMenuService.changeStatusWithChildStatus(menu);
        return toAjax(true);
    }
}
