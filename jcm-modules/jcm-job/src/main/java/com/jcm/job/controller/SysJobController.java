package com.jcm.job.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.utils.poi.ExcelUtil;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.job.domain.SysJob;
import com.jcm.job.service.ISysJobService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * jobController
 *
 * @author lvshihao
 * @date 2025-01-14
 */
@Api(tags="job管理")
@ApiSupport(author = "202252197@qq.com")
@BusinessName(title = OperationNameConstants.SYS_JOB)
@AllArgsConstructor
@RestController
@RequestMapping("/job")
public class SysJobController extends PageBaseController
{
    private final ISysJobService sysJobService;

    /**
     * 查询定时任务调度列表
     */
    @RequiresPermissions("job:job:list")
    @GetMapping("/list")
    public TableDataInfo list(SysJob sysJob)
    {
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
    public void export(HttpServletResponse response, SysJob sysJob)
    {
        List<SysJob> list = sysJobService.selectSysJobList(sysJob);
        ExcelUtil<SysJob> util = new ExcelUtil<SysJob>(SysJob.class);
        util.exportEasyExcel(response, list, "定时任务调度数据");
    }

    /**
     * 获取定时任务调度详细信息
     */
    @RequiresPermissions("job:job:query")
    @GetMapping(value = "/{jobId}")
    public AjaxResult getInfo(@PathVariable("jobId") Long jobId)
    {
        return success(sysJobService.selectSysJobByJobId(jobId));
    }

    /**
     * 新增定时任务调度
     */
    @RequiresPermissions("job:job:add")
    @Log(functionName = "新增定时任务调度", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysJob sysJob)
    {
        return toAjax(sysJobService.insertSysJob(sysJob));
    }

    /**
     * 修改定时任务调度
     */
    @RequiresPermissions("job:job:edit")
    @Log(functionName = "修改定时任务调度", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysJob sysJob)
    {
        return toAjax(sysJobService.updateSysJob(sysJob));
    }

    /**
     * 删除定时任务调度
     */
    @RequiresPermissions("job:job:remove")
    @Log(functionName = "删除定时任务调度", businessType = BusinessType.DELETE)
    @DeleteMapping("/{jobIds}")
    public AjaxResult remove(@PathVariable Long[] jobIds)
    {
        return toAjax(sysJobService.deleteSysJobByJobIds(jobIds));
    }
}
