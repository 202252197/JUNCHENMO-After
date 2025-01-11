package com.jcm.common.log.utils;

import com.jcm.common.log.aspect.LogAspect;
import com.jcm.common.log.constant.StyleClassConstant;

public class OperLogCover {

    private static final String INSERT="新增";
    private static final String UPDATE="信息被修改";
    private static final String DELECT="删除";

    //添加信息
    public static void insertLogMsg(String BUSINESS_NAME,String context){
        LogAspect.LOG_DESCRIPTION_HTML_LOCAL.set(INSERT+BUSINESS_NAME+StyleCover.getStyleSpan(StyleClassConstant.HEIGHT_LIGHT_SPAN, context));
        LogAspect.LOG_DESCRIPTION_LOCAL.set(INSERT+BUSINESS_NAME+context);
    }


    //删除信息
    public static void deleteLogMsg(String BUSINESS_NAME,Integer size){
        LogAspect.LOG_DESCRIPTION_HTML_LOCAL.set(DELECT+StyleCover.getStyleSpan(StyleClassConstant.HEIGHT_LIGHT_SPAN, String.valueOf(size))+"条"+BUSINESS_NAME+"信息");
        LogAspect.LOG_DESCRIPTION_LOCAL.set(DELECT+size+"条"+BUSINESS_NAME+"信息");
    }


    //修改信息
    public static void updateLogMsg(String BUSINESS_NAME,Long Id){
        LogAspect.LOG_DESCRIPTION_HTML_LOCAL.set(BUSINESS_NAME+"ID: "+StyleCover.getStyleSpan(StyleClassConstant.HEIGHT_LIGHT_SPAN, String.valueOf(Id))+UPDATE);
        LogAspect.LOG_DESCRIPTION_LOCAL.set(BUSINESS_NAME+"ID: "+ Id +UPDATE);
    }


    //其他信息
    public static void outherLogMsg(String context){
        LogAspect.LOG_DESCRIPTION_HTML_LOCAL.set(context);
        LogAspect.LOG_DESCRIPTION_LOCAL.set(context);
    }

}
