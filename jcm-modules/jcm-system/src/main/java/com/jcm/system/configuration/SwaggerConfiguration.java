package com.jcm.system.configuration;


import com.github.xiaoymin.knife4j.spring.extension.OpenApiExtensionResolver;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.spring.web.plugins.WebMvcRequestHandlerProvider;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Configuration
@EnableSwagger2WebMvc
public class SwaggerConfiguration {


//    var contentType=ke.response.headers["content-type"];
//console.log("响应ContentType:"+contentType)
//    var code = ke.response.data.code;
//
////判断,如果服务端响应code是200才执行操作
//if( code == 200 ){
//        // 获取token
//        var token = ke.response.data.data.access_token;
//
//        //1、如过需要设置的参数是Header，则设置全局Header
//        ke.global.setAllHeader("Authorization", "Bearer "+token);
//    }
    private final OpenApiExtensionResolver openApiExtensionResolver;

    @Autowired
    public SwaggerConfiguration(OpenApiExtensionResolver openApiExtensionResolver) {
        this.openApiExtensionResolver = openApiExtensionResolver;
    }

    @Order(1)
    @Bean(value = "api")
    public Docket groupRestApi() {
        // 定义全局参数列表
        List<Parameter> globalParameters = new ArrayList<>();

        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(groupApiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.jcm.system"))
                .paths(PathSelectors.any())
                .build().globalOperationParameters(globalParameters);
    }

    private ApiInfo groupApiInfo(){
        return new ApiInfoBuilder()
                .title("系统模块")
                .description("<div style='font-size:14px;color:red;'>JCM 系统模块 APIs</div>")
                .termsOfServiceUrl("http://www.group.com/")
                .contact(new Contact("junchenmo","localhost","202252197@qq.com"))
                .version("1.0")
                .build();
    }


    /**
     * 解决springboot高版本 swagger启动报错
     * @return
     */
    @Bean
    public static BeanPostProcessor springfoxHandlerProviderBeanPostProcessor() {
        return new BeanPostProcessor() {

            @Override
            public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
                if (bean instanceof WebMvcRequestHandlerProvider) {
                    customizeSpringfoxHandlerMappings(getHandlerMappings(bean));
                }
                return bean;
            }

            private <T extends RequestMappingInfoHandlerMapping> void customizeSpringfoxHandlerMappings(List<T> mappings) {
                List<T> copy = mappings.stream()
                        .filter(mapping -> mapping.getPatternParser() == null)
                        .collect(Collectors.toList());
                mappings.clear();
                mappings.addAll(copy);
            }

            @SuppressWarnings("unchecked")
            private List<RequestMappingInfoHandlerMapping> getHandlerMappings(Object bean) {
                try {
                    Field field = ReflectionUtils.findField(bean.getClass(), "handlerMappings");
                    field.setAccessible(true);
                    return (List<RequestMappingInfoHandlerMapping>) field.get(bean);
                } catch (IllegalArgumentException | IllegalAccessException e) {
                    throw new IllegalStateException(e);
                }
            }
        };
    }


}

