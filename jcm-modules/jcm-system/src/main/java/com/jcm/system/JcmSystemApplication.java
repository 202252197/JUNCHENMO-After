package com.junchenmo.system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
// 指定要扫描的Mapper类的包的路径

@MapperScan
@SpringBootApplication
public class JcmSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JcmSystemApplication.class, args);

        System.out.println(" (♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)ﾞ ");

    }
}
