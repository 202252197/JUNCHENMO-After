package com.jcm.system.controller;


import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.InnerAuth;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.api.domain.SysOperLog;
import com.jcm.system.service.ISysOperLogService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 操作日志记录 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-05-03
 */
@RestController
@AllArgsConstructor
@RequestMapping("/operlog")
public class SysOperLogController extends PageBaseController {

    private final ISysOperLogService sysOperLogService;
    @InnerAuth
    @PostMapping
    public AjaxResult add(@RequestBody SysOperLog operLog)
    {
        return toAjax(sysOperLogService.insertOperlog(operLog));
    }


    /**
     * 删除日志
     */
    @RequiresPermissions("system:menu:delete")
    @DeleteMapping
    @PrintParams
    public AjaxResult delete(@RequestBody List<Long> operIds) {

        return toAjax( sysOperLogService.deleteOperLog(operIds));
    }


    /**
     * 获取操作日志列表
     */
    @RequiresPermissions("system:user:list")
    @PostMapping("/list")
    @PrintParams
    public TableDataInfo list(@RequestBody SysOperLog sysOperLog) {
        startPage();
        List<SysOperLog> list = sysOperLogService.selectOperLogList(sysOperLog);
        return getDataTable(list);
    }


}
