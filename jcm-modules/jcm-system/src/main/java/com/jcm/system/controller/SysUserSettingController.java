package com.jcm.system.controller;


import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.web.controller.BaseController;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.domain.SysUserSetting;
import com.jcm.system.service.ISysUserSettingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户样式设置表 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-12-18
 */

@Api(tags = "用户设置")
@ApiSupport(author = "202252197@qq.com", order = 10)
@RestController
@AllArgsConstructor
@RequestMapping("/sys-user-setting")
public class SysUserSettingController extends BaseController {

    private ISysUserSettingService sysUserSettingService;

    @ApiOperation(value = "修改用户设置")
    @RequiresPermissions("system:role:edit")
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysUserSetting userSetting) {
        return toAjax(sysUserSettingService.updateUserSetting(userSetting));
    }

    @ApiOperation(value = "查询用户设置")
    @Operation(summary = "获取当前用户设置的详细信息", description = "")
    @GetMapping("/getInfo")
    @PrintParams
    public AjaxResult getInfo() {
        SysUserSetting userSetting = sysUserSettingService.selectUserSettingByUserId(SecurityUtils.getUserId());
        return AjaxResult.success(userSetting);
    }


}
