package com.jcm.common.log.annotation;

import java.lang.annotation.*;

/**
 * 自定义操作日志模块标记注解
 *
 * @author ruoyi
 *
 */
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OperationName {

    /**
     * 业务标题
     */
    public String title() default "";
}
