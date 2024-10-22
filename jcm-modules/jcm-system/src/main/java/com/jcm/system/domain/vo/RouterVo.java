package com.jcm.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 路由配置信息
 * 
 * @author junchenmo
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
     * 路由名称
     */
    private String name;

    /**
     * 组件地址
     */
    private String component;

    /**
     * 转发请求地址
     */
    private String redirect;

    /**
     * 其他元素
     */
    private MetaVo meta;

    /**
     * 子路由
     */
    private List<RouterVo> children;


}
