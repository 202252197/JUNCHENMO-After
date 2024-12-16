package com.jcm.system.controller;


import com.jcm.common.core.domain.R;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.domain.SysMenu;
import com.jcm.system.domain.vo.RouterVo;
import com.jcm.system.service.ISysMenuService;
import com.jcm.system.service.ISysRoleMenuService;
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
@Tag(name="菜单管理")
@RestController
@RequestMapping("/menu")
@AllArgsConstructor
public class SysMenuController extends PageBaseController {

    private final ISysMenuService sysMenuService;

    private final ISysRoleMenuService sysRoleMenuService;

    /**
     * 获取前端菜单列表
     *
     * @return 菜单列表
     */
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

    /**
     * 获取全部菜单列表
     * @return 菜单列表
     */
    @RequiresPermissions("system:menu:list")
    @Operation(summary = "获取全部菜单列表",description = "获取全部菜单列表，管理员才有次权限")
    @PostMapping("/list")
    @PrintParams
    public AjaxResult list(@RequestBody SysMenu menu)
    {
        List<SysMenu> menus = sysMenuService.selectMenuAllTree(menu);
        return success(menus);
    }


    /**
     * 新增角色
     */
    @RequiresPermissions("system:menu:add")
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysMenu menu)
    {
        return toAjax(sysMenuService.insertMenu(menu));

    }

    /**
     * 删除菜单
     */
    @Operation(summary = "删除菜单", description = "将菜单删除")
    @RequiresPermissions("system:menu:delete")
    @DeleteMapping("/{menuId}")
    @PrintParams
    public AjaxResult delete(@PathVariable("menuId") Long menuId) {
        return toAjax(sysMenuService.deleteMenu(menuId));
    }

    /**
     * 修改菜单
     */
    @Operation(summary = "修改菜单的信息", description = "修改菜单的信息")
    @RequiresPermissions("system:menu:edit")
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysMenu menu)
    {
        return toAjax(sysMenuService.updateMenu(menu));
    }

    /**
     * 获取新增菜单最后的sort值
     * @return 菜单最后的sort值
     */
    @Operation(summary = "获取新增菜单最后的sort值",description = "通过id查询所有子菜单，对子菜单的最大sort加100返回")
    @RequiresPermissions("system:menu:list")
    @GetMapping("/getChildLastSort/{parentId}")
    @PrintParams
    public AjaxResult getMenuChildLastSort(@PathVariable("parentId") Long parentId)
    {
        Integer childLastSort = sysMenuService.getMenuChildLastSort(parentId) + 100;
        return success(childLastSort);
    }

    /**
     * 获取首页动态设置的icon图标
     * @return 获取首页图标名称
     */
    @RequiresPermissions("system:menu:list")
    @Operation(summary = "获取首页图标名称",description = "获取首页动态设置的icon图标")
    @GetMapping("/getHomeMenuIcon")
    @PrintParams
    public AjaxResult getHomeMenuIcon()
    {
        String homeIcon = sysMenuService.getHomeMenuIcon();
        return success(homeIcon);
    }


    /**
     * 查询已分配角色的菜单列表
     */
    @PrintParams
    @RequiresPermissions("system:menu:list")
    @GetMapping("/queryRoleMenus/{roleId}")
    public R queryRoleMenus(@PathVariable Integer roleId)
    {
        return R.ok(sysRoleMenuService.queryMenuIdsByRoleId(roleId));
    }


    /**
     * 更改菜单状态以及子菜单状态
     */
    @PutMapping("/changeStatusWithChildStatus")
    @RequiresPermissions("system:user:disableAccount")
    @PrintParams
    public AjaxResult changeStatusWithChildStatus(@RequestBody SysMenu menu) {
        sysMenuService.changeStatusWithChildStatus(menu);
        return toAjax(true);
    }
}
