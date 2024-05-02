package com.jcm.common.springdoc.configure;

import com.jcm.common.core.constant.TokenConstants;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.media.StringSchema;
import io.swagger.v3.oas.models.parameters.Parameter;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;

/**
 * SpringDoc配置。
 * @author junchenmo
 */
@Profile({"dev"})
@ConditionalOnClass({OpenAPI.class})
@ConditionalOnProperty(name = "springdoc.api-docs.enabled", havingValue = "true")
@AutoConfiguration
public class SpringDocConfig {


    /**
     * 获取配置文件中配置文档的基本信息
     * @return
     */
    @Bean
    @ConfigurationProperties(prefix = "springdoc.api-docs.info")
    public Info springDocInfo() {
        return new Info();
    }

    /**
     * 配置文档的基本信息
     * @param infoConfig
     * @return
     */
    @Bean
    public OpenAPI openAPI(Info infoConfig) {
        return new OpenAPI().info(infoConfig);
    }

    /**
     * 构建 api 分组
     * 配置文档的默认分组、扫描的路径、并添加请求头参数
     * @return group
     */
    @Bean
    public GroupedOpenApi buildGroupedOpenApi() {
        return GroupedOpenApi.builder()
                .group("default")
                .pathsToMatch("/**")
                .addOperationCustomizer((operation, handlerMethod) -> operation
                        .addParametersItem(buildSecurityHeaderParameter()))
                .build();
    }

    /**
     * 配置请求头参数
     * @return Authorization 认证请求头参数
     */
    private Parameter buildSecurityHeaderParameter() {
        return new Parameter()
                .name(TokenConstants.AUTHENTICATION)
                .description("认证 Token")
                .in(String.valueOf(SecurityScheme.In.HEADER))
                .schema(new StringSchema()
                        ._default("Bearer 1")
                        .name(TokenConstants.AUTHENTICATION)
                        .description("认证 Token"));
    }

}
