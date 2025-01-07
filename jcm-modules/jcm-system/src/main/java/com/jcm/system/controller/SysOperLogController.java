package com.jcm.system.controller;


import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.utils.poi.ExcelUtil;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.InnerAuth;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.api.domain.SysOperLog;
import com.jcm.system.service.ISysOperLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 * 操作日志 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-05-03
 */
@Api(tags="操作日志")
@ApiSupport(author = "202252197@qq.com",order = 6)
@BusinessName(title = OperationNameConstants.SYSTEM_OPERATION_LOG)
@RestController
@AllArgsConstructor
@RequestMapping("/operlog")
public class SysOperLogController extends PageBaseController {

    private final ISysOperLogService sysOperLogService;
    @InnerAuth
    @ApiOperation(value = "新增操作日志",notes = "内部服务使用")
    @PostMapping
    public AjaxResult add(@RequestBody SysOperLog operLog)
    {
        return toAjax(sysOperLogService.insertOperlog(operLog));
    }

    @ApiOperation(value = "删除操作日志")
    @RequiresPermissions("system:menu:remove")
    @DeleteMapping("/{operIds}")
    @PrintParams
    public AjaxResult remove(@PathVariable List<Long> operIds) {
        OperLogCover.deleteLogMsg(BusinessNameConstant.OPERATION_LOG,operIds.size());
        return toAjax( sysOperLogService.deleteOperLog(operIds));
    }

    @ApiOperation(value = "清空操作日志")
    @RequiresPermissions("system:menu:remove")
    @DeleteMapping("/clear")
    @PrintParams
    public AjaxResult clear() {
//        BusinessNameConstant.OPERATION_LOG+"全部清空");
        return toAjax(sysOperLogService.clearOperLog());
    }

    @ApiOperation(value = "分页条件查询操作日志列表")
    @RequiresPermissions("system:user:list")
    @GetMapping("/list")
    @PrintParams
    public TableDataInfo list(SysOperLog sysOperLog) {
        startPage();
        List<SysOperLog> list = sysOperLogService.selectOperLogList(sysOperLog);
        return getDataTable(list);
    }

    @ApiOperation(value = "获取可查询的操作用户选项值")
    @RequiresPermissions("system:user:list")
    @GetMapping("/nameOptionSelect")
    @PrintParams
    public AjaxResult nameOptionSelect() {
        return AjaxResult.success(sysOperLogService.nameOptionSelect());
    }

    @ApiOperation(value = "获取可查询的模块标题选项值")
    @RequiresPermissions("system:user:list")
    @GetMapping("/titleOptionSelect")
    @PrintParams
    public AjaxResult titleOptionSelect() {
        return AjaxResult.success(sysOperLogService.titleOptionSelect());
    }

    @ApiOperation(value = "获取可查询的业务名称选项值")
    @RequiresPermissions("system:user:list")
    @GetMapping("/businessNameOptionSelectByTitle")
    @PrintParams
    public AjaxResult businessNameOptionSelectByTitle(@RequestParam("title") String title) {
        return AjaxResult.success(sysOperLogService.businessNameOptionSelectByTitle(title));
    }

    @ApiOperation(value = "导出日志")
    @Log(functionName = "导出日志", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:operlog:export")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysOperLog operLog)
    {
        List<SysOperLog> list = sysOperLogService.selectOperLogList(operLog);
        ExcelUtil<SysOperLog> util = new ExcelUtil<>(SysOperLog.class);
        util.exportEasyExcel(response, list, "操作日志");
    }

}
