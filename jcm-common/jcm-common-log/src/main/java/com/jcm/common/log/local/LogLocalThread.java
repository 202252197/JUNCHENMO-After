package com.jcm.common.log.local;

import org.springframework.stereotype.Component;

/**
 * 存放日志信息
 */
@Component
public class LogLocalThread {
    public static final ThreadLocal<String> LOG_DESCRIPTION_LOCAL = new ThreadLocal<>();
}
