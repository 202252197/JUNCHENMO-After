package com.jcm.common.core.configuration;

import cn.hutool.extra.spring.SpringUtil;
import com.jcm.common.core.configuration.config.AsyncExecutorConfig;
import com.jcm.common.core.configuration.config.DateFormatConfig;
import com.jcm.common.core.thread.ThreadPoolTaskExecutor;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.core.task.TaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

@AutoConfiguration
@Import(DateFormatConfig.class)
@EnableConfigurationProperties(AsyncExecutorConfig.class)
public class JcmCommonAutoConfiguration {

    /**
     * 异步线程池
     * <p>
     * {@code @Async("asyncExecutor")}
     *
     * @return 异步线程池
     */
    @Primary
    @Bean(name = "asyncExecutor")
    public TaskExecutor asyncExecutor(AsyncExecutorConfig config) {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(config.getCorePoolSize());
        executor.setMaxPoolSize(config.getMaxPoolSize());
        executor.setQueueCapacity(config.getQueueCapacity());
        executor.setKeepAliveSeconds(config.getKeepAliveSeconds());
        executor.setAllowCoreThreadTimeOut(true);
        executor.setThreadNamePrefix("async-task-");
        // 设置等待所有任务执行结束再关闭线程池
        executor.setWaitForTasksToCompleteOnShutdown(true);
        // 以确保应用最后能够被关闭
        executor.setAwaitTerminationSeconds(60);
        // 调用者调用拒绝策略
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        executor.initialize();
        return executor;
    }
}
