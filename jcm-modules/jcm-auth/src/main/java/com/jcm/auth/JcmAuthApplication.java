package com.jcm.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author lvshihao
 */
@SpringBootApplication
@EnableFeignClients("com.jcm.system.api")
public class JcmAuthApplication {
    public static void main(String[] args) {
        SpringApplication.run(JcmAuthApplication.class, args);
        System.out.println(" (♥◠‿◠)ﾉﾞ  认证授权中心启动成功   ლ(´ڡ`ლ)ﾞ ");

    }
}
