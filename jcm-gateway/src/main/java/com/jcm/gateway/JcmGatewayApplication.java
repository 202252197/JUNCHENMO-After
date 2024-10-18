package com.jcm.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 网关启动程序
 * 
 * @author junchenmo
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class JcmGatewayApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JcmGatewayApplication.class, args);
        System.out.println(" (♥◠‿◠)ﾉﾞ  网关启动成功   ლ(´ڡ`ლ)ﾞ ");
    }


}
