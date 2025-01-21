package com.jcm.gen;

import com.jcm.common.security.annotation.EnableCustomConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author lvshihao
 */
@EnableFeignClients("com.jcm.system.api")
@MapperScan("com.jcm.gen.mapper")
@EnableCustomConfig
@SpringBootApplication
public class JcmGenApplication {
    public static void main(String[] args) {
        SpringApplication.run(JcmGenApplication.class, args);
        System.out.println(" (♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)ﾞ ");
    }
}
