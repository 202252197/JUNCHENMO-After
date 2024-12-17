package com.jcm.common.log.utils;

import com.jcm.common.log.constant.StyleClassConstant;

public class OperLogCover {

    private static final String INSERT="新增";
    private static final String UPDATE="信息被修改";
    private static final String DELECT="删除";

    //添加信息
    public static String insertLogMsg(String BUSINESS_NAME,String context){
        return StyleCover.getContextSpan(INSERT+BUSINESS_NAME+StyleCover.getStyleSpan(StyleClassConstant.HEIGHT_LIGHT_SPAN, context));
    }


    //删除信息
    public static String deleteLogMsg(String BUSINESS_NAME,Integer size){
        return StyleCover.getContextSpan(DELECT+StyleCover.getStyleSpan(StyleClassConstant.HEIGHT_LIGHT_SPAN, String.valueOf(size))+"条"+BUSINESS_NAME+"信息");
    }


    //修改信息
    public static String updateLogMsg(String BUSINESS_NAME,Long Id){
        return StyleCover.getContextSpan(BUSINESS_NAME+"ID: "+StyleCover.getStyleSpan(StyleClassConstant.HEIGHT_LIGHT_SPAN, String.valueOf(Id))+UPDATE);
    }
}
