package com.jcm.system;

import com.jcm.common.security.annotation.EnableCustomConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author 君尘陌
 */
@EnableFeignClients("com.jcm.system.api")
@MapperScan("com.jcm.system.mapper")
@EnableCustomConfig
@SpringBootApplication
public class JcmSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JcmSystemApplication.class, args);
        System.out.println(" (♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)ﾞ ");

    }
}
