package com.jcm.common.core.configuration.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 线程池配置类
 *
 * @author Junchenmo
 * @version 1.0.0
 * @since 2023/7/10 15:49
 */
@Data
@Component
@ConfigurationProperties(prefix = "jcm.async.executor")
public class AsyncExecutorConfig {

    /**
     * 核心线程数量
     */
    private int corePoolSize;

    /**
     * 最大线程数量
     */
    private int maxPoolSize;

    /**
     * 队列容量
     */
    private int queueCapacity;

    /**
     * 活跃时间
     */
    private int keepAliveSeconds;

    public AsyncExecutorConfig() {
        this.corePoolSize = 16;
        this.maxPoolSize = 32;
        this.queueCapacity = 100;
        this.keepAliveSeconds = 300;
    }

}