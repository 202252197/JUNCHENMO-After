package com.jcm.system.controller;


import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.domain.SysPermission;
import com.jcm.system.service.ISysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RestController
@RequestMapping("/permission")
public class SysPermissionController {

    @Autowired
    private ISysPermissionService sysPermissionService;
    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysPermission> menus = sysPermissionService.selectMenuTreeByUserId(userId);
        return success(sysPermissionService.buildMenus(menus,null));
    }
}
