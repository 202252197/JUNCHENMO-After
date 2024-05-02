package com.jcm.system.entity.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 路由配置信息
 * 
 * @author ruoyi
 */
@Schema(description ="统一返回格式")
@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class RouterVo
{

    /**
     * 路由地址
     */
    private String path;

    /**
     * 组件地址
     */
    private String component;

    /**
     * 路由名字
     */
    private String name;

    /**
     * 其他元素
     */
    private MetaVo meta;

    /**
     * 子路由
     */
    private List<RouterVo> children;


}
