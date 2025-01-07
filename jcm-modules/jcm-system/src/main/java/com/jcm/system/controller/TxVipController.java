package com.jcm.system.controller;

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
import com.jcm.system.domain.TxVip;
import com.jcm.system.service.ITxVipService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * vipController
 *
 * @author lvshihao
 * @date 2025-01-07
 */
@Api(tags="vip管理")
@ApiSupport(author = "202252197@qq.com")
@BusinessName(title = OperationNameConstants.TX_VIP)
@AllArgsConstructor
@RestController
@RequestMapping("/vip")
public class TxVipController extends PageBaseController
{
    private final ITxVipService txVipService;

    /**
     * 查询vip列表
     */
    @RequiresPermissions("system:vip:list")
    @GetMapping("/list")
    public TableDataInfo list(TxVip txVip)
    {
        startPage();
        List<TxVip> list = txVipService.selectTxVipList(txVip);
        return getDataTable(list);
    }

    /**
     * 导出vip列表
     */
    @RequiresPermissions("system:vip:export")
    @Log(functionName = "导出vip列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TxVip txVip)
    {
        List<TxVip> list = txVipService.selectTxVipList(txVip);
        ExcelUtil<TxVip> util = new ExcelUtil<TxVip>(TxVip.class);
        util.exportEasyExcel(response, list, "vip数据");
    }

    /**
     * 获取vip详细信息
     */
    @RequiresPermissions("system:vip:query")
    @GetMapping(value = "/{vipId}")
    public AjaxResult getInfo(@PathVariable("vipId") Long vipId)
    {
        return success(txVipService.selectTxVipByVipId(vipId));
    }

    /**
     * 新增vip
     */
    @RequiresPermissions("system:vip:add")
    @Log(functionName = "新增vip", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TxVip txVip)
    {
        return toAjax(txVipService.insertTxVip(txVip));
    }

    /**
     * 修改vip
     */
    @RequiresPermissions("system:vip:edit")
    @Log(functionName = "修改vip", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TxVip txVip)
    {
        return toAjax(txVipService.updateTxVip(txVip));
    }

    /**
     * 删除vip
     */
    @RequiresPermissions("system:vip:remove")
    @Log(functionName = "删除vip", businessType = BusinessType.DELETE)
    @DeleteMapping("/{vipIds}")
    public AjaxResult remove(@PathVariable Long[] vipIds)
    {
        return toAjax(txVipService.deleteTxVipByVipIds(vipIds));
    }
}
