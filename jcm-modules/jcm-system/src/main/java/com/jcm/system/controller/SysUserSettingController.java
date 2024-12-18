package com.jcm.system.controller;


import com.jcm.common.core.web.controller.BaseController;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.domain.SysUserSetting;
import com.jcm.system.service.ISysUserSettingService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户前端样式设置表 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-12-18
 */
@RestController
@AllArgsConstructor
@RequestMapping("/sys-user-setting")
public class SysUserSettingController extends BaseController {

    private ISysUserSettingService sysUserSettingService;

    /**
     * 修改用户设置信息
     */
    @Log(businessName = "修改用户设置信息",businessType= BusinessType.UPDATE)
    @Operation(summary = "修改用户设置信息", description = "修改用户设置信息")
    @RequiresPermissions("system:role:edit")
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysUserSetting userSetting)
    {
        userSetting.setUserId(SecurityUtils.getUserId());
        return toAjax(sysUserSettingService.updateUserSetting(userSetting));
    }

    /**
     * 获取当前用户设置信息
     * @return 用户设置信息
     */
    @Operation(summary = "获取当前用户设置的详细信息", description = "")
    @GetMapping("/getInfo")
    @PrintParams
    public AjaxResult getInfo() {
        SysUserSetting userSetting = sysUserSettingService.selectUserSettingByUserId(SecurityUtils.getUserId());
        return AjaxResult.success(userSetting);
    }



}
