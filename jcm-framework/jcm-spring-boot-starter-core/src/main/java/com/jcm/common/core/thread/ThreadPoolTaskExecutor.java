package com.jcm.common.core.thread;

import java.util.concurrent.Callable;
import java.util.concurrent.Future;

/**
 * 自动注入异步线程池
 *
 * @author Junchenmo
 * @version 1.0.0
 * @since 2023/7/10 15:16
 */
public class ThreadPoolTaskExecutor extends org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor {

    @Override
    public void execute(Runnable task) {
        super.execute(ThreadUtils.wrap(task));
    }

    @Override
    public <T> Future<T> submit(Callable<T> task) {
        return super.submit(ThreadUtils.wrap(task));
    }

    @Override
    public Future<?> submit(Runnable task) {
        return super.submit(ThreadUtils.wrap(task));
    }

}