package com.jcm.common.security.annotation;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 说明：在方法上添加@PrintParams注解即可
 * 方式1（默认同时打印入参和返回结果）：@PrintParams
 * 方式2（可选打印入参或返回结果），如打印入参但不打印返回结果：@PrintParams(requestParam = true,responseParam = false)
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface PrintParams {
    /**
     * 是否打印请求参数
     *
     * @return
     */
    boolean requestParam() default true;

    /**
     * 是否打印返回结果
     *
     * @return
     */
    boolean responseParam() default true;
}