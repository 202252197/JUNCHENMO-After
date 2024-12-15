package com.jcm.system.controller;


import com.jcm.common.core.domain.R;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.core.web.page.TableDataInfo;
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
@RestController
@AllArgsConstructor
@RequestMapping("/dict-data")
public class SysDictDataController  extends PageBaseController {

    private final ISysDictDataService sysDictDataService;

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
     * 新增字典项
     */
    @RequiresPermissions("system:role:add")
    @PostMapping
    @PrintParams
    public AjaxResult add(@RequestBody SysDictData sysDictData)
    {
        return toAjax(sysDictDataService.insertDictData(sysDictData));
    }

    /**
     * 删除字典值
     */
    @RequiresPermissions("system:menu:delete")
    @DeleteMapping
    @PrintParams
    public AjaxResult delete(@RequestBody List<Long> dictDataIds) {
        sysDictDataService.deleteDictData(dictDataIds);
        return toAjax(true);
    }


    /**
     * 根据字典项名称，获取字典项的所有配置值、描述、以及额外参数的配置
     */
    @RequiresPermissions("system:dictType:list")
    @PostMapping("/getInfoByNames")
    @PrintParams
    public R getInfoList(@RequestBody List<String> names)
    {
        return R.ok(sysDictDataService.getInfoList(names));
    }


    /**
     * 根据字典项名称，获取字典项的配置值、描述、以及额外参数的配置
     */
    @RequiresPermissions("system:dictType:list")
    @GetMapping("/getInfoByName/{name}")
    @PrintParams
    public R getInfo(@PathVariable(name = "name") String name)
    {
        System.out.println("lvshihao");
        System.out.println(name);
        return R.ok(sysDictDataService.getInfo(name));
    }

    /**
     * 修改字典值
     */
    @RequiresPermissions("system:menu:edit")
    @PutMapping
    @PrintParams
    public AjaxResult edit(@RequestBody SysDictData sysDictData)
    {
        return toAjax(sysDictDataService.updateDictData(sysDictData));
    }
}
