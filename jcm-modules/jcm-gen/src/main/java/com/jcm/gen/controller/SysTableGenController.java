package com.jcm.gen.controller;

import com.alibaba.dashscope.exception.ApiException;
import com.jcm.common.core.constant.OperationNameConstants;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.log.annotation.BusinessName;
import com.jcm.gen.config.TableGeneratorConfig;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * @author lvshihao
 */
@RestController
@AllArgsConstructor
@BusinessName(title = OperationNameConstants.GEN_DATA_TABLE)
@RequestMapping("/tableGen")
public class SysTableGenController {

    private final TableGeneratorConfig generateTableStructure;

    @GetMapping("/genTable")
    public AjaxResult genTable(String prompts) throws ApiException {
        HashMap<String, String> dataMap = generateTableStructure.generateTableStructure(prompts);
        return AjaxResult.success("成功", dataMap);
    }


    @PostMapping("/genSql")
    public AjaxResult genSql(@RequestBody String prompts) throws ApiException {
        System.out.println("表数据");
        System.out.println(prompts);
        String sql = generateTableStructure.generateSqlStructure(prompts);
        return AjaxResult.success("成功", sql);
    }


}
