package com.jcm.job.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.Constants;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.exception.job.TaskException;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.common.core.utils.poi.ExcelUtil;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.job.domain.SysJob;
import com.jcm.job.service.ISysJobService;
import com.jcm.job.util.CronUtils;
import com.jcm.job.util.ScheduleUtils;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.quartz.SchedulerException;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * jobController
 *
 * @author lvshihao
 * @date 2025-01-14
 */
@Api(tags = "job管理")
@ApiSupport(author = "202252197@qq.com")
@BusinessName(title = OperationNameConstants.SYS_JOB)
@AllArgsConstructor
@RestController
@RequestMapping("/jobTask")
public class SysJobController extends PageBaseController {
    private final ISysJobService sysJobService;

    /**
     * 查询定时任务调度列表
     */
    @RequiresPermissions("job:job:list")
    @GetMapping("/list")
    public TableDataInfo list(SysJob sysJob) {
        startPage();
        List<SysJob> list = sysJobService.selectSysJobList(sysJob);
        return getDataTable(list);
    }

    /**
     * 导出定时任务调度列表
     */
    @RequiresPermissions("job:job:export")
    @Log(functionName = "导出定时任务调度列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysJob sysJob) {
        List<SysJob> list = sysJobService.selectSysJobList(sysJob);
        OperLogCover.exportLogMsg(BusinessNameConstant.JOB_TASK, list.size());
        ExcelUtil<SysJob> util = new ExcelUtil<SysJob>(SysJob.class);
        util.exportEasyExcel(response, list, "定时任务调度数据");
    }

    /**
     * 获取定时任务调度详细信息
     */
    @RequiresPermissions("job:job:query")
    @GetMapping(value = "/{jobId}")
    public AjaxResult getInfo(@PathVariable("jobId") Long jobId) {
        return success(sysJobService.selectSysJobByJobId(jobId));
    }

    /**
     * 新增定时任务调度
     */
    @RequiresPermissions("job:job:add")
    @Log(functionName = "新增定时任务调度", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysJob sysJob) {
        OperLogCover.insertLogMsg(BusinessNameConstant.JOB_TASK, sysJob.getJobName());
        if (!CronUtils.isValid(sysJob.getCronExpression())) {
            return error("新增任务'" + sysJob.getJobName() + "'失败，Cron表达式不正确");
        } else if (StringUtils.containsIgnoreCase(sysJob.getInvokeTarget(), Constants.LOOKUP_RMI)) {
            return error("新增任务'" + sysJob.getJobName() + "'失败，目标字符串不允许'rmi'调用");
        } else if (StringUtils.containsAnyIgnoreCase(sysJob.getInvokeTarget(), new String[]{Constants.LOOKUP_LDAP, Constants.LOOKUP_LDAPS})) {
            return error("新增任务'" + sysJob.getJobName() + "'失败，目标字符串不允许'ldap(s)'调用");
        } else if (StringUtils.containsAnyIgnoreCase(sysJob.getInvokeTarget(), new String[]{Constants.HTTP, Constants.HTTPS})) {
            return error("新增任务'" + sysJob.getJobName() + "'失败，目标字符串不允许'http(s)'调用");
        } else if (StringUtils.containsAnyIgnoreCase(sysJob.getInvokeTarget(), Constants.JOB_ERROR_STR)) {
            return error("新增任务'" + sysJob.getJobName() + "'失败，目标字符串存在违规");
        } else if (!ScheduleUtils.whiteList(sysJob.getInvokeTarget())) {
            return error("新增任务'" + sysJob.getJobName() + "'失败，目标字符串不在白名单内");
        }
        return toAjax(sysJobService.insertSysJob(sysJob));
    }

    /**
     * 修改定时任务调度
     */
    @RequiresPermissions("job:job:edit")
    @Log(functionName = "修改定时任务调度", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysJob sysJob) throws SchedulerException, TaskException {
        OperLogCover.updateLogMsg(BusinessNameConstant.JOB_TASK, sysJob.getJobId());
        if (!CronUtils.isValid(sysJob.getCronExpression())) {
            return error("修改任务'" + sysJob.getJobName() + "'失败，Cron表达式不正确");
        } else if (StringUtils.containsIgnoreCase(sysJob.getInvokeTarget(), Constants.LOOKUP_RMI)) {
            return error("修改任务'" + sysJob.getJobName() + "'失败，目标字符串不允许'rmi'调用");
        } else if (StringUtils.containsAnyIgnoreCase(sysJob.getInvokeTarget(), new String[]{Constants.LOOKUP_LDAP, Constants.LOOKUP_LDAPS})) {
            return error("修改任务'" + sysJob.getJobName() + "'失败，目标字符串不允许'ldap(s)'调用");
        } else if (StringUtils.containsAnyIgnoreCase(sysJob.getInvokeTarget(), new String[]{Constants.HTTP, Constants.HTTPS})) {
            return error("修改任务'" + sysJob.getJobName() + "'失败，目标字符串不允许'http(s)'调用");
        } else if (StringUtils.containsAnyIgnoreCase(sysJob.getInvokeTarget(), Constants.JOB_ERROR_STR)) {
            return error("修改任务'" + sysJob.getJobName() + "'失败，目标字符串存在违规");
        } else if (!ScheduleUtils.whiteList(sysJob.getInvokeTarget())) {
            return error("修改任务'" + sysJob.getJobName() + "'失败，目标字符串不在白名单内");
        }
        return toAjax(sysJobService.updateSysJob(sysJob));
    }

    /**
     * 删除定时任务调度
     */
    @RequiresPermissions("job:job:remove")
    @Log(functionName = "删除定时任务调度", businessType = BusinessType.DELETE)
    @DeleteMapping("/{jobIds}")
    public AjaxResult remove(@PathVariable Long[] jobIds) throws SchedulerException {
        OperLogCover.deleteLogMsg(BusinessNameConstant.JOB_TASK, jobIds.length);
        sysJobService.deleteSysJobByJobIds(jobIds);
        return success();
    }

    /**
     * 定时任务立即执行一次
     */
    @RequiresPermissions("monitor:job:changeStatus")
    @Log(functionName = "执行一次定时任务", businessType = BusinessType.UPDATE)
    @PutMapping("/run")
    public AjaxResult run(@RequestBody SysJob job) throws SchedulerException {
        OperLogCover.outherLogMsg("执行了一次" + job.getJobName() + "定时任务");
        boolean result = sysJobService.run(job);
        return result ? success() : error("任务不存在或已过期！");
    }

    /**
     * 定时任务状态修改
     */
    @RequiresPermissions("monitor:job:changeStatus")
    @Log(functionName = "定时任务状态修改", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysJob job) throws SchedulerException {
        SysJob newJob = sysJobService.selectSysJobByJobId(job.getJobId());
        newJob.setStatus(job.getStatus());
        return toAjax(sysJobService.changeStatus(newJob));
    }
}
