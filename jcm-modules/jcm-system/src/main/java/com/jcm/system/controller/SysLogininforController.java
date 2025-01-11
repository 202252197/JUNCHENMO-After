package com.jcm.system.controller;

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
import com.jcm.common.security.annotation.InnerAuth;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.api.domain.SysLogininfor;
import com.jcm.system.service.ISysLogininforService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * logininforController
 *
 * @author lvshihao
 * @date 2025-01-11
 */
@Api(tags="logininfor管理")
@ApiSupport(author = "202252197@qq.com")
@BusinessName(title = OperationNameConstants.LOGIN_INFO)
@AllArgsConstructor
@RestController
@RequestMapping("/logininfor")
public class SysLogininforController extends PageBaseController
{
    private final ISysLogininforService sysLogininforService;

    /**
     * 查询系统访问记录列表
     */
    @RequiresPermissions("system:logininfor:list")
    @GetMapping("/list")
    public TableDataInfo list(SysLogininfor sysLogininfor)
    {
        startPage();
        List<SysLogininfor> list = sysLogininforService.selectSysLogininforList(sysLogininfor);
        return getDataTable(list);
    }

    /**
     * 导出系统访问记录列表
     */
    @RequiresPermissions("system:logininfor:export")
    @Log(functionName = "导出系统访问记录列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLogininfor sysLogininfor)
    {
        List<SysLogininfor> list = sysLogininforService.selectSysLogininforList(sysLogininfor);
        ExcelUtil<SysLogininfor> util = new ExcelUtil<SysLogininfor>(SysLogininfor.class);
        util.exportEasyExcel(response, list, "系统访问记录数据");
    }


    /**
     * 新增系统访问记录
     */
    @InnerAuth
    @PostMapping
    public AjaxResult add(@RequestBody SysLogininfor sysLogininfor)
    {
        return toAjax(sysLogininforService.insertSysLogininfor(sysLogininfor));
    }


    /**
     * 删除系统访问记录
     */
    @RequiresPermissions("system:logininfor:remove")
    @Log(functionName = "删除系统访问记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{infoIds}")
    public AjaxResult remove(@PathVariable Long[] infoIds)
    {
        return toAjax(sysLogininforService.deleteSysLogininforByInfoIds(infoIds));
    }

    @ApiOperation(value = "清空系统访问记录")
    @RequiresPermissions("system:logininfor:remove")
    @Log(functionName = "清空系统访问记录", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clear")
    @PrintParams
    public AjaxResult clear() {
        OperLogCover.outherLogMsg(BusinessNameConstant.LOGIN_INFO+"全部清空");
        return toAjax(sysLogininforService.clearLogininfor());
    }
}
