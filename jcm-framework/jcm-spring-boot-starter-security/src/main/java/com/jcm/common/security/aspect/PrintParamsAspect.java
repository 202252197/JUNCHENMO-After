package com.jcm.common.security.aspect;


import com.alibaba.fastjson2.JSONObject;
import com.jcm.common.security.annotation.PrintParams;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Arrays;

/**
 * @description:
 * @author:
 * @create: 2023/9/26 15:31
 * restful接口请求参数打印切面
 * 说明：在方法上添加@PrintParams注解即可
 * 方式1（默认同时打印入参和返回结果）：@PrintParams
 * 方式2（可选打印入参或返回结果），如打印入参但不打印返回结果：@PrintParams(requestParam = true,responseParam = false)
 */
@Aspect
@Component
public class PrintParamsAspect {

    private static final Logger logger = LoggerFactory.getLogger(PrintParamsAspect.class);

    @Around("@annotation(com.jcm.common.security.annotation.PrintParams)")
    public Object printParams(ProceedingJoinPoint joinPoint) throws Throwable {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        String methodName = method.getName();
        Object[] args = joinPoint.getArgs();
        String declaringTypeName = signature.getDeclaringTypeName();
        String methodFullPath = declaringTypeName + "." + method.getName();
        String[] paramNames = signature.getParameterNames();
        PrintParams printParams = method.getAnnotation(PrintParams.class);
        try {
            if (printParams.requestParam()) {
                logger.info("调用接口{}，请求入参：参数名{}，参数值{}", methodFullPath, Arrays.toString(paramNames), Arrays.toString(args));
            }
        } catch (Exception e) {
            logger.error("打印请求参数失败");
        }
        // 在调用方法之前记录开始时间
        long startTime = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        // 在目标方法返回后记录结束时间
        long endTime = System.currentTimeMillis();
        // 计算已过去的时间（单位：毫秒）
        long duration = endTime - startTime;
        logger.info("调用接口{}，耗时：{} 毫秒", methodFullPath, duration);
        try {
            if (printParams.responseParam()) {
                logger.info("调用接口{}，返回结果：{}", methodFullPath, JSONObject.toJSONString(result));
            }
        } catch (Exception e) {
            logger.error("打印返回结果参数失败");
        }
        return result;
    }

}
