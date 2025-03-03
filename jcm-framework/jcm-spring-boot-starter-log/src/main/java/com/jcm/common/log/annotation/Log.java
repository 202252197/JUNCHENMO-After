package com.jcm.common.log.annotation;


import com.jcm.common.log.enums.BusinessType;

import java.lang.annotation.*;

/**
 * 自定义操作日志记录注解
 *
 * @author junchenmo
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 方法名称
     */
    String functionName() default "";

    /**
     * 功能
     */
    BusinessType businessType() default BusinessType.OTHER;

    /**
     * 是否保存请求的参数
     */
    boolean isSaveRequestData() default true;

    /**
     * 是否保存响应的参数
     */
    boolean isSaveResponseData() default true;

    /**
     * 排除指定的请求参数
     */
    String[] excludeParamNames() default {};
}
