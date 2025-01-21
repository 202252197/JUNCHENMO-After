package com.jcm.gateway.filter;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.core.io.buffer.DataBufferUtils;
import org.springframework.http.HttpMethod;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpRequestDecorator;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.net.URI;
import java.nio.CharBuffer;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/***
 * @ClassName: MyGlobalFilter
 * @Description: 自定义gateway全局过滤器, 全局过滤器无需配置, 对所有的路由都生效
 * @Author: TKQ
 * @Create_time: 14:30 2021-03-02
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class CacheRequestFilter implements GlobalFilter, Ordered {

    /**
     * 请求频率限制时间
     */
    private static final Integer OFFSET = 3;

    /**
     * 去掉空格,换行和制表符
     *
     * @param str
     * @return
     */
    private static String formatStr(String str) {
        if (str != null && str.length() > 0) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            return m.replaceAll("");
        }
        return str;
    }

    @SneakyThrows
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //获取当前请求的url
        String requestUrl = exchange.getRequest().getURI().toString();
        if (requestUrl.contains("chat-record/timCallBack")) {
            log.debug("{} 请求进入 {}", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")), requestUrl);
        }
        //TODO 校验token合法性等等,自定义逻辑
        ServerHttpRequest serverHttpRequest = exchange.getRequest();
        String methodName = serverHttpRequest.getMethodValue();
        String contentType = serverHttpRequest.getHeaders().getFirst("Content-Type");
        URI uri = serverHttpRequest.getURI();

        //post请求拦截判断重复调用
        if (HttpMethod.POST.name().equals(methodName) && contentType != null && !contentType.startsWith("multipart/form-data")) {
            AtomicReference<String> bodyRef = new AtomicReference<>();
            return DataBufferUtils.join(exchange.getRequest().getBody())
                    .flatMap(dataBuffer -> {
                        CharBuffer charBuffer = StandardCharsets.UTF_8.decode(dataBuffer.asByteBuffer());
                        DataBufferUtils.retain(dataBuffer);
                        bodyRef.set(charBuffer.toString());
                        String bodyStr = formatStr(bodyRef.get());
                        Flux<DataBuffer> cachedFlux = Flux
                                .defer(() -> Flux.just(dataBuffer.slice(0, dataBuffer.readableByteCount())));

                        log.info("请求拦截器; url={}", uri.toString());

                        // 封装 request，传给下一级
                        ServerHttpRequest mutatedRequest = new ServerHttpRequestDecorator(
                                exchange.getRequest()) {
                            @Override
                            public Flux<DataBuffer> getBody() {
                                return cachedFlux;
                            }
                        };
                        return chain.filter(exchange.mutate().request(mutatedRequest).build());
                    });
        }

        // 放行请求
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        // 设置最高级别, 优先执行该过滤器, 防止gateway读取body后后续的过滤器不能正常获取body
        return Ordered.HIGHEST_PRECEDENCE;
    }
}
