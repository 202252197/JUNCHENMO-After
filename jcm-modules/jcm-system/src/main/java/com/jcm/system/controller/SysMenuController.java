package com.jcm.system.controller;


import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.entity.SysMenu;
import com.jcm.system.service.ISysMenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    @GetMapping("getRouters")
    @PrintParams
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = sysMenuService.selectMenuTreeByUserId(userId);
        return success(sysMenuService.buildMenus(menus,null));
    }
}
