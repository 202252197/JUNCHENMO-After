package com.jcm.gen.controller;

import com.jcm.common.core.text.Convert;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.gen.domain.GenTable;
import com.jcm.gen.domain.GenTableColumn;
import com.jcm.gen.service.IGenTableColumnService;
import com.jcm.gen.service.IGenTableService;
import lombok.AllArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
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
    @Log(functionName = "代码生成", businessType = BusinessType.DELETE)
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
    @Log(functionName = "代码生成", businessType = BusinessType.IMPORT)
    @PostMapping("/importTable")
    public AjaxResult importTableSave(String tables)
    {
        String[] tableNames = Convert.toStrArray(tables);
        // 查询表信息
        List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
        genTableService.importGenTable(tableList);
        return success();
    }

    /**
     * 修改代码生成业务
     */
    @RequiresPermissions("tool:gen:query")
    @GetMapping(value = "/{tableId}")
    public AjaxResult getInfo(@PathVariable Long tableId)
    {
        GenTable table = genTableService.selectGenTableById(tableId);
        List<GenTableColumn> list = genTableColumnService.selectGenTableColumnListByTableId(tableId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("info", table);
        map.put("rows", list);
        return success(map);
    }

    /**
     * 修改保存代码生成业务
     */
    @RequiresPermissions("tool:gen:edit")
    @PutMapping
    public AjaxResult editSave(@Validated @RequestBody GenTable genTable)
    {
        genTableService.validateEdit(genTable);
        genTableService.updateGenTable(genTable);
        return success();
    }

    /**
     * 同步数据库
     */
    @RequiresPermissions("tool:gen:edit")
    @Log(functionName = "同步数据库", businessType = BusinessType.UPDATE)
    @GetMapping("/synchDb/{tableName}")
    public AjaxResult synchDb(@PathVariable("tableName") String tableName)
    {
        genTableService.synchDb(tableName);
        return success();
    }


    /**
     * 生成代码（自定义路径）
     */
    @RequiresPermissions("tool:gen:code")
    @Log(functionName = "代码生成", businessType = BusinessType.GENCODE)
    @GetMapping("/genCode/{tableName}")
    public AjaxResult genCode(@PathVariable("tableName") String tableName)
    {
        genTableService.generatorCode(tableName);
        return success();
    }

    /**
     * 批量生成代码
     */
    @RequiresPermissions("tool:gen:code")
    @Log(functionName = "代码生成", businessType = BusinessType.GENCODE)
    @GetMapping("/batchGenCode")
    public void batchGenCode(HttpServletResponse response, String tables) throws IOException
    {
        String[] tableNames = Convert.toStrArray(tables);
        byte[] data = genTableService.downloadCode(tableNames);
        genCode(response, data);
    }


    /**
     * 生成zip文件
     */
    private void genCode(HttpServletResponse response, byte[] data) throws IOException
    {
        response.reset();
        response.setHeader("Content-Disposition", "attachment; filename=\"jcm.zip\"");
        response.addHeader("Content-Length", "" + data.length);
        response.setContentType("application/octet-stream; charset=UTF-8");
        IOUtils.write(data, response.getOutputStream());
    }
}
