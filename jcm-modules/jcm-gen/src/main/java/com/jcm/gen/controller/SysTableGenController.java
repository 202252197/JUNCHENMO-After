package com.jcm.gen.controller;

import com.alibaba.dashscope.exception.ApiException;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.gen.configuration.TableGeneratorConfig;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * @author lvshihao
 */
@RestController
@AllArgsConstructor
@RequestMapping("/tableGen")
public class SysTableGenController {

    private final TableGeneratorConfig generateTableStructure;
    @GetMapping("/genTable")
    public AjaxResult genTable(String prompts) throws ApiException{
        HashMap<String, String> dataMap = generateTableStructure.generateTableStructure(prompts);
        return AjaxResult.success("成功",dataMap);
    }


    @GetMapping("/genSql")
    public AjaxResult genSql(String prompts) throws ApiException{
        System.out.println("表数据");
        System.out.println(prompts);
        String sql = generateTableStructure.generateSqlStructure(prompts);
        return AjaxResult.success("成功",sql);
    }

}
