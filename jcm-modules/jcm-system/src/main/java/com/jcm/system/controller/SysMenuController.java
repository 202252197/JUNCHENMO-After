package com.jcm.system.controller;


import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.domain.SysMenu;
import com.jcm.system.domain.SysRole;
import com.jcm.system.service.ISysMenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.jcm.common.core.web.domain.AjaxResult.success;

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
@RequestMapping("/permission")
@AllArgsConstructor
public class SysMenuController {

    private final ISysMenuService sysMenuService;
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
        return success(sysMenuService.buildMenus(menus,null));
    }

    /**
     * 获取全部菜单列表
     *
     * @return 菜单列表
     */
    @Operation(summary = "获取全部菜单列表",description = "获取全部菜单列表，管理员才有次权限")
    @PostMapping("/list")
    @PrintParams
    public AjaxResult list(@RequestBody SysMenu menu)
    {
        List<SysMenu> menus = sysMenuService.selectMenuAllTree(menu);
        return success(menus);
    }



}
