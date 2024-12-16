package com.jcm.system.api.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcm.common.mybatis.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 操作日志记录
 * </p>
 *
 * @author 吕世昊
 * @since 2024-05-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_oper_log")
@Schema(description="操作日志记录")
public class SysOperLog extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "日志主键")
    @TableId(value = "oper_id", type = IdType.AUTO)
    private Long operId;

    @Schema(description = "模块标题")
    private String title;

    @Schema(description = "业务名称")
    private String businessName;

    @Schema(description = "业务类型（0其它 1新增 2修改 3删除）")
    private Integer businessType;

    @Schema(description = "方法名称")
    private String method;

    @Schema(description = "请求方式")
    private String requestMethod;

    @Schema(description = "请求时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime requestTime;

    @Schema(description = "操作类别（0其它 1后台用户）")
    private Integer operatorType;

    @Schema(description = "操作人员")
    private String operName;

    @Schema(description = "请求URL")
    private String operUrl;

    @Schema(description = "主机地址")
    private String operIp;

    @Schema(description = "操作地点")
    private String operLocation;

    @Schema(description = "请求参数")
    private String operParam;

    @Schema(description = "返回参数")
    private String jsonResult;

    @Schema(description = "操作状态（0正常 1异常）")
    private Integer status;

    @Schema(description = "错误消息")
    private String errorMsg;

    @Schema(description = "消耗时间")
    private Long costTime;

}
