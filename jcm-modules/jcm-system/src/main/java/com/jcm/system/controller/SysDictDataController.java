package com.jcm.system.controller;


import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.annotation.OperationName;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.local.LogLocalThread;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.domain.SysDictData;
import com.jcm.system.service.ISysDictDataService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 数据字典值 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-11-24
 */
@Api(tags="数据字典值管理")
@OperationName(title = OperationNameConstants.SYSTEM_DICT_VALUE)
@RestController
@AllArgsConstructor
@RequestMapping("/dict-data")
public class SysDictDataController  extends PageBaseController {

    private final ISysDictDataService sysDictDataService;

    @ApiOperation(value = "新增字典值")
    @RequiresPermissions("system:role:add")
    @Log(businessName = "新增字典值",businessType= BusinessType.INSERT)
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysDictData dictData)
    {
        LogLocalThread.LOG_DESCRIPTION_LOCAL.set(OperLogCover.insertLogMsg(BusinessNameConstant.DICT_DATA,dictData.getName()));
        return toAjax(sysDictDataService.insertDictData(dictData));
    }

    @ApiOperation(value = "删除字典值")
    @RequiresPermissions("system:menu:delete")
    @Log(businessName = "删除字典值",businessType= BusinessType.DELETE)
    @DeleteMapping
    @PrintParams
    public AjaxResult delete(@RequestBody List<Long> dictDataIds) {
        LogLocalThread.LOG_DESCRIPTION_LOCAL.set(OperLogCover.deleteLogMsg(BusinessNameConstant.DICT_DATA,dictDataIds.size()));
        return toAjax(sysDictDataService.deleteDictData(dictDataIds));
    }

    @ApiOperation(value = "修改字典值")
    @RequiresPermissions("system:menu:edit")
    @Log(businessName = "修改字典值",businessType= BusinessType.UPDATE)
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysDictData dictData)
    {
        LogLocalThread.LOG_DESCRIPTION_LOCAL.set(OperLogCover.updateLogMsg(BusinessNameConstant.MENU,dictData.getDictDataId()));
        return toAjax(sysDictDataService.updateDictData(dictData));
    }

    @ApiOperation(value = "分页条件查询字典值列表")
    @RequiresPermissions("system:dictData:list")
    @PostMapping("/list")
    @PrintParams
    public TableDataInfo list(@RequestBody SysDictData dictType)
    {
        startPage();
        List<SysDictData> list = sysDictDataService.selectDictDataList(dictType);
        return getDataTable(list);
    }

    @ApiOperation(value = "根据字典名称查询字典信息集合",notes = "用于前端选项值的获取")
    @RequiresPermissions("system:dictType:list")
    @PostMapping("/getInfoByNames")
    @PrintParams
    public AjaxResult getInfoList(@RequestBody List<String> names)
    {
        return AjaxResult.success(sysDictDataService.getInfoList(names));
    }

    @ApiOperation(value = "刷新字典缓存")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/refreshDictDataCache")
    @PrintParams
    public AjaxResult refreshDictDataCache()
    {
        sysDictDataService.refreshDictDataCache();
        return AjaxResult.success();
    }

    @ApiOperation(value = "字典项详情")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getInfoByName/{name}")
    @PrintParams
    public AjaxResult getInfo(@PathVariable(name = "name") String name)
    {
        return AjaxResult.success(sysDictDataService.getInfo(name));
    }

}
