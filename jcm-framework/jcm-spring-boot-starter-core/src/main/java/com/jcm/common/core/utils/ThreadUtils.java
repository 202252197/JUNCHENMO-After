package com.jcm.common.core.utils;

import java.util.concurrent.Callable;
/**
 * 多线程下工具类
 *
 * @author Junchenmo
 * @version 1.0.0
 * @since 2023/7/10 14:55
 */
public class ThreadUtils {

    private ThreadUtils() {
    }

    /**
     * 设置线程 MDC 上下文
     *
     * @param callable callable
     * @param <T>      T
     * @return callable
     */
    public static <T> Callable<T> wrap(Callable<T> callable) {
        return () -> {
            // 执行线程并且清理MDC
           return callable.call();
        };
    }

    /**
     * 设置线程 MDC 上下文
     *
     * @param runnable runnable
     * @return callable
     */
    public static Runnable wrap(Runnable runnable) {
        return () -> {
           runnable.run();
        };
    }

}