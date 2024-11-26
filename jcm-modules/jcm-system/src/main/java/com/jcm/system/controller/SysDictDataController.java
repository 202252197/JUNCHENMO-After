package com.jcm.system.controller;


import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.mybatis.controller.PageBaseController;
import com.jcm.common.security.annotation.PrintParams;
import com.jcm.common.security.annotation.RequiresPermissions;
import com.jcm.system.domain.SysDictData;
import com.jcm.system.service.ISysDictDataService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
