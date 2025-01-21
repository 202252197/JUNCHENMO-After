package com.jcm.system.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.service.SysCacheMonitorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lvshihao
 */
@Api(tags = "缓存监控")
@ApiSupport(author = "202252197@qq.com", order = 8)
@RestController
@AllArgsConstructor
@RequestMapping("/cacheMonitor")
public class SysCacheMonitorController extends PageBaseController {

    private final SysCacheMonitorService sysCacheMonitorService;

    @ApiOperation(value = "查询Redis服务基本信息")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getRedisBaseInfo")
    @PrintParams
    public AjaxResult getRedisBaseInfo() {
        return AjaxResult.success(sysCacheMonitorService.getRedisBaseInfo());
    }

    @ApiOperation(value = "查询Redis所有配置信息")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getRedisInfo")
    @PrintParams
    public AjaxResult getRedisInfo() {
        return AjaxResult.success(sysCacheMonitorService.getRedisInfo());
    }

}
