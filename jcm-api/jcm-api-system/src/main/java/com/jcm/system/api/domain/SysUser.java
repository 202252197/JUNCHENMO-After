package com.jcm.system.api.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcm.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
@Data
@Accessors(chain = true)
@TableName("sys_user")
@ApiModel(description = "用户信息")
public class SysUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID，自增主键
     */
    @ApiModelProperty(value = "用户ID，自增主键", example = "1")
    @TableId(type = IdType.AUTO)
    private Long userId;

    /**
     * 用户名
     */
    @ApiModelProperty(value = "用户名", example = "admin")
    private String username;

    /**
     * 密码
     */
    @ApiModelProperty(value = "密码", example = "password")
    private String password;

    /**
     * 用户昵称
     */
    @ApiModelProperty(value = "用户昵称", example = "管理员")
    private String nickname;

    /**
     * 邮箱
     */
    @ApiModelProperty(value = "邮箱", example = "admin@example.com")
    private String email;

    /**
     * 手机号
     */
    @ApiModelProperty(value = "手机号", example = "13800138000")
    private String mobile;

    /**
     * 性别(0男,1女,2未知)
     */
    @ApiModelProperty(value = "性别(0男,1女,2未知)", example = "0")
    private Integer sex;

    /**
     * 头像
     */
    @ApiModelProperty(value = "头像", example = "http://example.com/avatar.jpg")
    private String avatar;

    /**
     * 状态(0正常,1禁用)
     */
    @ApiModelProperty(value = "状态(0正常,1禁用)", example = "0")
    private Integer status;

    /**
     * 最后登录IP地址
     */
    @ApiModelProperty(value = "最后登录IP地址", example = "127.0.0.1")
    private String loginIp;

    /**
     * 最后登录时间
     */
    @ApiModelProperty(value = "最后登录时间", example = "2024-12-28 00:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime loginDate;

    public static boolean isAdmin(Long userId) {
        return userId != null && 1L == userId;
    }

    public boolean isAdmin() {
        return isAdmin(this.userId);
    }

}

