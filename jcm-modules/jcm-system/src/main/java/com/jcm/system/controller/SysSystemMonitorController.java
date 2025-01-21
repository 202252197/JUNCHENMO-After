package com.jcm.system.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.service.SysSystemMonitorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lvshihao
 */
@Api(tags = "服务监控")
@ApiSupport(author = "202252197@qq.com", order = 9)
@RestController
@AllArgsConstructor
@RequestMapping("/systemMonitor")
public class SysSystemMonitorController {

    private final SysSystemMonitorService sysSystemMonitorService;

    @ApiOperation(value = "查询系统的CPU和内存")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getSystemBaseInfo")
    @PrintParams
    public AjaxResult getSystemBaseInfo() {
        return AjaxResult.success(sysSystemMonitorService.getSystemBaseInfo());
    }
}
