package com.jcm.system.controller;

import cn.hutool.core.util.ObjectUtil;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.service.SysCacheListService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 缓存列表 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-11-24
 */
@Api(tags = "缓存列表")
@ApiSupport(author = "202252197@qq.com", order = 7)
@BusinessName(title = OperationNameConstants.SYSTEM_CACHE_LIST)
@RestController
@AllArgsConstructor
@RequestMapping("/cacheList")
public class SysCacheListController extends PageBaseController {

    private final SysCacheListService sysCacheListService;

    @ApiOperation(value = "删除键名列表", notes = "根据缓存名称删除键名列表")
    @RequiresPermissions("system:dictType:list")
    @DeleteMapping("/deleteCacheName")
    @PrintParams
    public AjaxResult removeCacheName(@RequestParam String cacheName) {
        return toAjax(sysCacheListService.deleteCacheName(cacheName));
    }

    @ApiOperation(value = "删除缓存", notes = "根据缓存键名删除缓存")
    @RequiresPermissions("system:dictType:list")
    @DeleteMapping("/deleteCacheKey")
    @PrintParams
    public AjaxResult removeCacheKey(@RequestParam String keyName) {
        return toAjax(sysCacheListService.deleteCacheKey(keyName));
    }

    @ApiOperation(value = "查询键名列表", notes = "根据缓存名称查询")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getRedisKeys")
    @PrintParams
    public AjaxResult getRedisKeys(@RequestParam String cacheName) {
        return AjaxResult.success(sysCacheListService.getRedisKeysByCacheName(cacheName));
    }

    @ApiOperation(value = "查询缓存内容", notes = "根据键名查询缓存内容")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getRedisKeyData")
    @PrintParams
    public AjaxResult getRedisKeyData(@RequestParam String keyName) {
        Object redisKeyData = sysCacheListService.getRedisKeyDataByKeyName(keyName);
        if (ObjectUtil.isNotNull(redisKeyData)) {
            return AjaxResult.success(redisKeyData);
        } else {
            return AjaxResult.error("站不支持此类型");
        }
    }

}
