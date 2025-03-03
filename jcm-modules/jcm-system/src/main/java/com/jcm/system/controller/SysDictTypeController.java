package com.jcm.system.controller;


import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.common.log.annotation.Log;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.enums.BusinessType;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.domain.SysDictType;
import com.jcm.system.service.ISysDictTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 数据字典项 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-10-31
 */
@Api(tags = "数据字典项管理")
@ApiSupport(author = "202252197@qq.com", order = 4)
@BusinessName(title = OperationNameConstants.SYSTEM_DICT_TYPE)
@RestController
@AllArgsConstructor
@RequestMapping("/dict-type")
public class SysDictTypeController extends PageBaseController {
    private final ISysDictTypeService sysDictTypeService;


    @ApiOperation(value = "新增字典项")
    @RequiresPermissions("system:role:add")
    @Log(functionName = "新增字典项", businessType = BusinessType.INSERT)
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysDictType dictType) {
        OperLogCover.insertLogMsg(BusinessNameConstant.DICT_TYPE, dictType.getName());
        return toAjax(sysDictTypeService.insertDictType(dictType));
    }

    @ApiOperation(value = "删除字典项")
    @RequiresPermissions("system:menu:remove")
    @Log(functionName = "删除字典项", businessType = BusinessType.DELETE)
    @DeleteMapping("/{dictTypeIds}")
    @PrintParams
    public AjaxResult remove(@PathVariable List<Long> dictTypeIds) {
        OperLogCover.deleteLogMsg(BusinessNameConstant.DICT_TYPE, dictTypeIds.size());
        return toAjax(sysDictTypeService.deleteDictType(dictTypeIds));
    }


    @ApiOperation(value = "修改字典项")
    @RequiresPermissions("system:menu:edit")
    @Log(functionName = "修改字典项", businessType = BusinessType.UPDATE)
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysDictType dictType) {
        OperLogCover.updateLogMsg(BusinessNameConstant.MENU, dictType.getDictTypeId());
        return toAjax(sysDictTypeService.updateDictType(dictType));
    }

    @ApiOperation(value = "分页条件查询字典项列表")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/list")
    @PrintParams
    public TableDataInfo list(SysDictType dictType) {
        startPage();
        List<SysDictType> list = sysDictTypeService.selectDictTypeList(dictType);
        return getDataTable(list);
    }

    @ApiOperation(value = "查询字典项的选项值")
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/optionSelect")
    @PrintParams
    public AjaxResult optionSelect() {
        return success(sysDictTypeService.selectDictTypeAndExtraAllList());
    }


}
