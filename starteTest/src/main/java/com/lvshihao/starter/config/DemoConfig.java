package com.lvshihao.starter.config;


import com.lvshihao.starter.properties.DemoProperties;
import com.lvshihao.starter.serivce.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 描述：配置类
 *
 * @Author shf
 * @Date 2019/5/7 21:50
 * @Version V1.0
 **/
@Configuration
@EnableConfigurationProperties(DemoProperties.class)
public class DemoConfig {
    @Autowired
    private DemoProperties demoProperties;

    @Bean(name = "demo")
    public DemoService demoService(){
        return new DemoService(demoProperties.getSayWhat(), demoProperties.getToWho());
    }
}