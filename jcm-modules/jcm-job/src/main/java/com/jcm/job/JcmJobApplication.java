package com.jcm.job;


import com.jcm.common.security.annotation.EnableCustomConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author lvshihao
 */
@EnableFeignClients("com.jcm.system.api")
@MapperScan("com.jcm.job.mapper")
@EnableCustomConfig
@SpringBootApplication
public class JcmJobApplication {
    public static void main(String[] args)
    {
        SpringApplication.run(JcmJobApplication.class, args);
        System.out.println(" (♥◠‿◠)ﾉﾞ  定时任务模块启动成功   ლ(´ڡ`ლ)ﾞ ");
    }
}
