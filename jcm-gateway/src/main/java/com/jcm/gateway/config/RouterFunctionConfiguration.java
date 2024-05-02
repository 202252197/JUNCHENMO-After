package com.jcm.gateway.config;

import com.jcm.gateway.handler.ValidateCodeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;

/**
 * 路由配置信息
 * 
 * @author 君尘陌
 */
@Configuration
public class RouterFunctionConfiguration
{
    /**
     * 获取验证码的请求处理类
     */
    @Autowired
    private ValidateCodeHandler validateCodeHandler;

    /**
     * Spring 5的RouterFunction函数式编程模式
     * 这里配置
     * /code = 获取验证码
     */
    @SuppressWarnings("rawtypes")
    @Bean
    public RouterFunction routerFunction()
    {
        return RouterFunctions.route(
                RequestPredicates.GET("/code").and(RequestPredicates.accept(MediaType.TEXT_PLAIN)),
                validateCodeHandler);
    }
}
