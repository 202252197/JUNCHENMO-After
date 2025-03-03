package com.jcm.job.task;

import cn.hutool.core.util.StrUtil;
import org.springframework.stereotype.Component;

/**
 * 定时任务调度测试
 *
 * @author junchenmo
 */
@Component("jcmTask")
public class JcmTask {
    public void jcmMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
        System.out.println(StrUtil.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void jcmParams(String params) {
        System.out.println("执行有参方法：" + params);
    }

    public void jcmNoParams() {
        System.out.println("执行无参方法");
    }
}
