package com.jcm.gen.controller;

import com.jcm.common.core.text.Convert;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.gen.domain.GenTable;
import com.jcm.gen.service.IGenTableColumnService;
import com.jcm.gen.service.IGenTableService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 代码生成 操作处理
 *
 * @author Junchenmo
 */
@RequestMapping("/genCode")
@AllArgsConstructor
@RestController
public class GenController extends PageBaseController {

    private final IGenTableService genTableService;

    private final IGenTableColumnService genTableColumnService;

    /**
     * 查询代码生成列表
     */
    @RequiresPermissions("tool:gen:list")
    @GetMapping("/list")
    public TableDataInfo genList(GenTable genTable)
    {
        startPage();
        List<GenTable> list = genTableService.selectGenTableList(genTable);
        return getDataTable(list);
    }

    /**
     * 预览代码
     */
    @RequiresPermissions("tool:gen:preview")
    @GetMapping("/preview/{tableId}")
    public AjaxResult preview(@PathVariable("tableId") Long tableId) throws IOException
    {
        Map<String, String> dataMap = genTableService.previewCode(tableId);
        return success(dataMap);
    }

    /**
     * 删除代码生成
     */
    @RequiresPermissions("tool:gen:remove")
    @Log(businessName = "代码生成", businessType = BusinessType.DELETE)
    @DeleteMapping("/")
    public AjaxResult remove(@RequestBody Long[] tableIds)
    {
        genTableService.deleteGenTableByIds(tableIds);
        return success();
    }

    /**
     * 查询数据库列表
     */
    @RequiresPermissions("tool:gen:list")
    @GetMapping("/db/list")
    public TableDataInfo dataList(GenTable genTable)
    {
        System.out.println(genTable);
        startPage();
        List<GenTable> list = genTableService.selectDbTableList(genTable);
        return getDataTable(list);
    }

    /**
     * 导入表结构（保存）
     */
    @RequiresPermissions("tool:gen:import")
    @Log(businessName = "代码生成", businessType = BusinessType.IMPORT)
    @PostMapping("/importTable")
    public AjaxResult importTableSave(String tables)
    {
        String[] tableNames = Convert.toStrArray(tables);
        // 查询表信息
        List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
        genTableService.importGenTable(tableList);
        return success();
    }



}
