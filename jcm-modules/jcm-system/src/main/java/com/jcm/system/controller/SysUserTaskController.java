package com.jcm.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.core.utils.poi.ExcelUtil;
import io.swagger.annotations.Api;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import lombok.AllArgsConstructor;
import com.jcm.system.domain.SysUserTask;
import com.jcm.system.service.ISysUserTaskService;
import com.jcm.common.core.web.page.TableDataInfo;

/**
 * taskController
 *
 * @author lvshihao
 * @date 2025-01-13
 */
@Api(tags="task管理")
@ApiSupport(author = "202252197@qq.com")
@BusinessName(title = OperationNameConstants.SYS_USER_TASK)
@AllArgsConstructor
@RestController
@RequestMapping("/task")
public class SysUserTaskController extends PageBaseController
{
    private final ISysUserTaskService sysUserTaskService;

    /**
     * 查询用户任务列表
     */
    @RequiresPermissions("system:task:list")
    @GetMapping("/list")
    public TableDataInfo list(SysUserTask sysUserTask)
    {
        startPage();
        List<SysUserTask> list = sysUserTaskService.selectSysUserTaskList(sysUserTask);
        return getDataTable(list);
    }

    /**
     * 导出用户任务列表
     */
    @RequiresPermissions("system:task:export")
    @Log(functionName = "导出用户任务列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserTask sysUserTask)
    {
        List<SysUserTask> list = sysUserTaskService.selectSysUserTaskList(sysUserTask);
        ExcelUtil<SysUserTask> util = new ExcelUtil<SysUserTask>(SysUserTask.class);
        util.exportEasyExcel(response, list, "用户任务数据");
    }

    /**
     * 获取用户任务详细信息
     */
    @RequiresPermissions("system:task:query")
    @GetMapping(value = "/{taskId}")
    public AjaxResult getInfo(@PathVariable("taskId") Long taskId)
    {
        return success(sysUserTaskService.selectSysUserTaskByTaskId(taskId));
    }

    /**
     * 新增用户任务
     */
    @RequiresPermissions("system:task:add")
    @Log(functionName = "新增用户任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserTask sysUserTask)
    {
        return toAjax(sysUserTaskService.insertSysUserTask(sysUserTask));
    }

    /**
     * 修改用户任务
     */
    @RequiresPermissions("system:task:edit")
    @Log(functionName = "修改用户任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserTask sysUserTask)
    {
        return toAjax(sysUserTaskService.updateSysUserTask(sysUserTask));
    }

    /**
     * 删除用户任务
     */
    @RequiresPermissions("system:task:remove")
    @Log(functionName = "删除用户任务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{taskIds}")
    public AjaxResult remove(@PathVariable Long[] taskIds)
    {
        return toAjax(sysUserTaskService.deleteSysUserTaskByTaskIds(taskIds));
    }
}
