package com.jcm.job.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.utils.poi.ExcelUtil;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.job.domain.SysJobLog;
import com.jcm.job.service.ISysJobLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * logController
 *
 * @author lvshihao
 * @date 2025-01-14
 */
@Api(tags="log管理")
@ApiSupport(author = "202252197@qq.com")
@BusinessName(title = OperationNameConstants.SYS_JOB_LOG)
@AllArgsConstructor
@RestController
@RequestMapping("/jobTaskLog")
public class SysJobLogController extends PageBaseController
{
    private final ISysJobLogService sysJobLogService;

    /**
     * 查询定时任务调度日志列表
     */
    @RequiresPermissions("job:log:list")
    @GetMapping("/list")
    public TableDataInfo list(SysJobLog sysJobLog)
    {
        startPage();
        List<SysJobLog> list = sysJobLogService.selectSysJobLogList(sysJobLog);
        return getDataTable(list);
    }

    /**
     * 导出定时任务调度日志列表
     */
    @RequiresPermissions("job:log:export")
    @Log(functionName = "导出定时任务调度日志列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysJobLog sysJobLog)
    {
        List<SysJobLog> list = sysJobLogService.selectSysJobLogList(sysJobLog);
        ExcelUtil<SysJobLog> util = new ExcelUtil<SysJobLog>(SysJobLog.class);
        util.exportEasyExcel(response, list, "定时任务调度日志数据");
    }

    /**
     * 获取定时任务调度日志详细信息
     */
    @RequiresPermissions("job:log:query")
    @GetMapping(value = "/{jobLogId}")
    public AjaxResult getInfo(@PathVariable("jobLogId") Long jobLogId)
    {
        return success(sysJobLogService.selectSysJobLogByJobLogId(jobLogId));
    }

    /**
     * 删除定时任务调度日志
     */
    @RequiresPermissions("job:log:remove")
    @Log(functionName = "删除定时任务调度日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{jobLogIds}")
    public AjaxResult remove(@PathVariable Long[] jobLogIds)
    {
        return toAjax(sysJobLogService.deleteSysJobLogByJobLogIds(jobLogIds));
    }


    @ApiOperation(value = "清空定时任务调度日志")
    @RequiresPermissions("job:log:clear")
    @DeleteMapping("/clear")
    @PrintParams
    public AjaxResult clear() {
        OperLogCover.outherLogMsg(BusinessNameConstant.JOB_TASK_LOG+"全部清空");
        return toAjax(sysJobLogService.clearOperLog());
    }
}
