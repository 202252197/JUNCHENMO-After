package com.jcm.framework.swagger.conf;

import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author lvshihao
 */
@Component
@ConfigurationProperties(prefix = "jcm.swagger")
@AutoConfiguration
public class SwaggerProperties {

    /**
     * 标题
     */
    private String title;

    /**
     * 文档描述
     */
    private String description;

    /**
     * url
     */
    private String url;

    /**
     * license
     */
    private String license;

    /**
     * licenseUrl
     */
    private String licenseUrl;

    /**
     * 扫描包的路径
     */
    private String basePackage;

    /**
     * 文档版本
     */
    private String version;

    /**
     * 文档版本
     */
    private Boolean enable;

    /**
     * 联系人信息
     */
    private SwaggerContactProperties contact;

    public SwaggerContactProperties getContact() {
        return contact;
    }

    public void setContact(SwaggerContactProperties contact) {
        this.contact = contact;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getLicenseUrl() {
        return licenseUrl;
    }

    public void setLicenseUrl(String licenseUrl) {
        this.licenseUrl = licenseUrl;
    }


}
