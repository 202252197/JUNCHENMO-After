package com.jcm.common.log.utils;

import com.jcm.common.log.constant.StyleClassConstant;

/**
 * 样式转换工具类
 * @author lvshihao
 */
public class StyleCover {

    public static String getContextSpan(String context){
        return "<span class="+ StyleClassConstant.LOG_LIGHT_SPAN + ">" +context + "</span>";
    }
    public static String getStyleSpan(String className,String context){
        return "<span class="+ className + ">" +context + "</span>";
    }
    public static String getStyleErrorSpan(String context){
        return "<span class="+ StyleClassConstant.HEIGHT_LIGHT_SPAN_ERROR + ">" +context + "</span>";
    }
}
