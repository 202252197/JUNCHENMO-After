package com.jcm.system.api.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcm.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * logininfor对象 sys_logininfor
 *
 * @author lvshihao
 * @date 2025-01-11
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ExcelIgnoreUnannotated
@TableName("sys_logininfor")
public class SysLogininfor extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 访问ID
     */
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "登录日志ID")
    private Long infoId;

    /**
     * 用户账号
     */
    @ExcelProperty(value = "用户账号")
    private String userName;

    /**
     * 登录IP地址
     */
    @ExcelProperty(value = "登录IP地址")
    private String ipaddr;

    /**
     * 登录地点
     */
    @ExcelProperty(value = "登录地点")
    private String loginLocation;

    /**
     * 浏览器类型
     */
    @ExcelProperty(value = "浏览器类型")
    private String browser;

    /**
     * 操作系统
     */
    @ExcelProperty(value = "操作系统")
    private String os;

    /**
     * 登录状态（0成功 1失败）
     */
    @ExcelProperty(value = "登录状态（0成功 1失败）")
    private String status;

    /**
     * 提示消息
     */
    @ExcelProperty(value = "提示消息")
    private String msg;

    /**
     * 访问时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelProperty(value = "访问时间")
    private LocalDateTime loginTime;


}
