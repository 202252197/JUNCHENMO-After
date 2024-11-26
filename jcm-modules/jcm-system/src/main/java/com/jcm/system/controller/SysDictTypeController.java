package com.jcm.system.controller;


import com.jcm.common.core.domain.R;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.domain.SysDictType;
import com.jcm.system.service.ISysDictTypeService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 字典配置项 前端控制器
 * </p>
 *
 * @author 吕世昊
 * @since 2024-10-31
 */
@Tag(name="字典配置项管理")
@RestController
@AllArgsConstructor
@RequestMapping("/dict-type")
public class SysDictTypeController extends PageBaseController {
    private final ISysDictTypeService sysDictTypeService;

    /**
     * 获取字典配置项列表分页条件查询
     */
    @RequiresPermissions("system:dictType:list")
    @PostMapping("/list")
    @PrintParams
    public TableDataInfo list(@RequestBody SysDictType dictType)
    {
        startPage();
        List<SysDictType> list = sysDictTypeService.selectDictTypeList(dictType);
        return getDataTable(list);
    }

    /**
     * 新增字典项
     */
    @RequiresPermissions("system:role:add")
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysDictType sysDictType)
    {
        return toAjax(sysDictTypeService.insertDictType(sysDictType));
    }


    /**
     * 获取全部字典配置项列表以及扩展参数
     */
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/listAll")
    @PrintParams
    public R listAll()
    {
        List<SysDictType> list = sysDictTypeService.selectDictTypeAndExtraAllList();
        return R.ok(list);
    }

}
