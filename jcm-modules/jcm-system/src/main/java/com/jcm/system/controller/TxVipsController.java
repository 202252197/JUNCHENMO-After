package com.jcm.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.jcm.system.domain.TxVips;
import com.jcm.system.service.ITxVipsService;
import com.jcm.common.core.web.page.TableDataInfo;

/**
 * vipController
 *
 * @author lvshihao
 * @date 2025-01-06
 */
@Api(tags="vips管理")
@ApiSupport(author = "202252197@qq.com")
@BusinessName(title = OperationNameConstants.TxVips)
@AllArgsConstructor
@RestController
@RequestMapping("/vips")
public class TxVipsController extends PageBaseController
{
    private final ITxVipsService txVipsService;

    /**
     * 查询vip列表
     */
    @RequiresPermissions("system:vips:list")
    @GetMapping("/list")
    public TableDataInfo list(TxVips txVips)
    {
        startPage();
        List<TxVips> list = txVipsService.selectTxVipsList(txVips);
        return getDataTable(list);
    }

    /**
     * 导出vip列表
     */
    @RequiresPermissions("system:vips:export")
    @Log(functionName = "导出vip列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TxVips txVips)
    {
        List<TxVips> list = txVipsService.selectTxVipsList(txVips);
        ExcelUtil<TxVips> util = new ExcelUtil<TxVips>(TxVips.class);
        util.exportEasyExcel(response, list, "vip数据");
    }

    /**
     * 获取vip详细信息
     */
    @RequiresPermissions("system:vips:query")
    @GetMapping(value = "/{vipId}")
    public AjaxResult getInfo(@PathVariable("vipId") Long vipId)
    {
        return success(txVipsService.selectTxVipsByVipId(vipId));
    }

    /**
     * 新增vip
     */
    @RequiresPermissions("system:vips:add")
    @Log(functionName = "新增vip", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TxVips txVips)
    {
        return toAjax(txVipsService.insertTxVips(txVips));
    }

    /**
     * 修改vip
     */
    @RequiresPermissions("system:vips:edit")
    @Log(functionName = "修改vip", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TxVips txVips)
    {
        return toAjax(txVipsService.updateTxVips(txVips));
    }

    /**
     * 删除vip
     */
    @RequiresPermissions("system:vips:remove")
    @Log(functionName = "删除vip", businessType = BusinessType.DELETE)
    @DeleteMapping("/{vipIds}")
    public AjaxResult remove(@PathVariable Long[] vipIds)
    {
        return toAjax(txVipsService.deleteTxVipsByVipIds(vipIds));
    }
}
