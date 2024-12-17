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
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 字典配置值 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-11-24
 */
@Tag(name="字典配置值管理")
@OperationName(title = OperationNameConstants.SYSTEM_DICT_VALUE)
@RestController
@AllArgsConstructor
@RequestMapping("/dict-data")
public class SysDictDataController  extends PageBaseController {

    private final ISysDictDataService sysDictDataService;

    /**
     * 新增字典项
     */
    @RequiresPermissions("system:role:add")
    @Log(businessName = "新增字典值",businessType= BusinessType.INSERT)
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysDictData dictData)
    {
        LogLocalThread.LOG_DESCRIPTION_LOCAL.set(OperLogCover.insertLogMsg(BusinessNameConstant.DICT_DATA,dictData.getName()));
        return toAjax(sysDictDataService.insertDictData(dictData));
    }

    /**
     * 删除字典值
     */
    @RequiresPermissions("system:menu:delete")
    @Log(businessName = "删除字典值",businessType= BusinessType.DELETE)
    @DeleteMapping
    @PrintParams
    public AjaxResult delete(@RequestBody List<Long> dictDataIds) {
        LogLocalThread.LOG_DESCRIPTION_LOCAL.set(OperLogCover.deleteLogMsg(BusinessNameConstant.DICT_DATA,dictDataIds.size()));
        return toAjax(sysDictDataService.deleteDictData(dictDataIds));
    }

    /**
     * 修改字典值
     */
    @RequiresPermissions("system:menu:edit")
    @Log(businessName = "修改字典值",businessType= BusinessType.UPDATE)
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysDictData dictData)
    {
        LogLocalThread.LOG_DESCRIPTION_LOCAL.set(OperLogCover.updateLogMsg(BusinessNameConstant.MENU,dictData.getDictDataId()));
        return toAjax(sysDictDataService.updateDictData(dictData));
    }

    /**
     * 获取字典配置值列表分页条件查询
     */
    @RequiresPermissions("system:dictData:list")
    @PostMapping("/list")
    @PrintParams
    public TableDataInfo list(@RequestBody SysDictData dictType)
    {
        startPage();
        List<SysDictData> list = sysDictDataService.selectDictDataList(dictType);
        return getDataTable(list);
    }

    /**
     * 根据字典项名称集合，获取字典项的所有配置值、描述、以及额外参数的配置
     */
    @RequiresPermissions("system:dictType:list")
    @PostMapping("/getInfoByNames")
    @PrintParams
    public AjaxResult getInfoList(@RequestBody List<String> names)
    {
        return AjaxResult.success(sysDictDataService.getInfoList(names));
    }


    /**
     * 字典项详情显示的内容
     */
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getInfoByName/{name}")
    @PrintParams
    public AjaxResult getInfo(@PathVariable(name = "name") String name)
    {
        return AjaxResult.success(sysDictDataService.getInfo(name));
    }


}
