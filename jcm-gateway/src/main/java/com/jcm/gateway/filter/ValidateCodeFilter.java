package com.jcm.gateway.filter;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.jcm.common.core.utils.ServletUtils;
import cn.hutool.core.util.StrUtil;
import com.jcm.gateway.config.properties.CaptchaProperties;
import com.jcm.gateway.service.ValidateCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Flux;

import java.nio.charset.StandardCharsets;

/**
 * 验证码过滤器
 *
 * @author 君尘陌
 */
@Component
public class ValidateCodeFilter extends AbstractGatewayFilterFactory<Object> {
    private final static String[] VALIDATE_URL = new String[]{"/auth/login", "/auth/register",};
    private static final String CODE = "code";
    private static final String UUID = "uuid";
    @Autowired
    private ValidateCodeService validateCodeService;
    @Autowired
    private CaptchaProperties captchaProperties;

    @Override
    public GatewayFilter apply(Object config) {
        return (exchange, chain) -> {
            ServerHttpRequest request = exchange.getRequest();

            // 非登录/注册请求或验证码关闭，不处理
            if (!StrUtil.equalsAnyIgnoreCase(request.getURI().getPath(), VALIDATE_URL) || !captchaProperties.getEnabled()) {
                return chain.filter(exchange);
            }

            try {
                String rspStr = resolveBodyFromRequest(request);
                JSONObject obj = JSON.parseObject(rspStr);
                validateCodeService.checkCaptcha(obj.getString(CODE), obj.getString(UUID));
            } catch (Exception e) {
                return ServletUtils.webFluxResponseWriter(exchange.getResponse(), e.getMessage());
            }
            return chain.filter(exchange);
        };
    }

    private String resolveBodyFromRequest(ServerHttpRequest serverHttpRequest) {
        //获取请求体
        Flux<DataBuffer> body = serverHttpRequest.getBody();
        StringBuilder sb = new StringBuilder();

        body.subscribe(buffer -> {
            byte[] bytes = new byte[buffer.readableByteCount()];
            buffer.read(bytes);
            String bodyString = new String(bytes, StandardCharsets.UTF_8);
            sb.append(bodyString);
        });
        return formatStr(sb.toString());
    }

    private String formatStr(String str) {
        return str.trim().replaceAll("\\s+", "");
    }

}
