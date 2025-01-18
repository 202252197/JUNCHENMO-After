package com.jcm.saToken;

import cn.dev33.satoken.SaManager;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * JCM sa令牌应用程序
 *
 * @author junchenmo
 * @date 2025/01/18 15:38
 */
@SpringBootApplication
public class JcmSaTokenApplication {

    public static void main(String[] args) throws JsonProcessingException {
        SpringApplication.run(JcmSaTokenApplication.class, args);
        System.out.println("启动成功，Sa-Token 配置如下：" + SaManager.getConfig());
    }
}
