package com.jcm.system.api.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcm.common.core.domain.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

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
@ExcelIgnoreUnannotated
@TableName("sys_oper_log")
@Schema(description = "操作日志记录")
public class SysOperLog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 日志主键
     * 在Excel导入导出中，对应表头名称为"日志主键"，列索引默认为0（按定义顺序依次递增）
     */
    @Schema(description = "日志主键")
    @ExcelProperty(value = "日志主键")
    @TableId(value = "oper_id", type = IdType.AUTO)
    private Long operId;

    /**
     * 模块标题
     * 在Excel导入导出中，对应表头名称为"模块标题"，列索引为1
     */
    @Schema(description = "模块标题")
    @ExcelProperty(value = "模块标题", index = 1)
    private String title;

    /**
     * 业务名称
     * 在Excel导入导出中，对应表头名称为"业务名称"，列索引为2
     */
    @Schema(description = "业务名称")
    @ExcelProperty(value = "业务名称", index = 2)
    private String businessName;

    /**
     * 业务类型（0其它 1新增 2修改 3删除）
     * 在Excel导入导出中，对应表头名称为"业务类型"，列索引为3
     */
    @Schema(description = "业务类型（0其它 1新增 2修改 3删除）")
    @ExcelProperty(value = "业务类型", index = 3)
    private Integer businessType;

    /**
     * 操作日志
     * 在Excel导入导出中，对应表头名称为"操作日志"，列索引为4
     */
    @Schema(description = "操作日志")
    @ExcelProperty(value = "操作日志", index = 4)
    private String description;

    /**
     * 操作日志Html
     */
    @Schema(description = "操作日志Html")
    private String descriptionHtml;

    /**
     * 方法名称
     * 在Excel导入导出中，对应表头名称为"方法名称"，列索引为5
     */
    @Schema(description = "方法名称")
    @ExcelProperty(value = "方法名称", index = 5)
    private String method;

    /**
     * 请求方式
     * 在Excel导入导出中，对应表头名称为"请求方式"，列索引为6
     */
    @Schema(description = "请求方式")
    @ExcelProperty(value = "请求方式", index = 6)
    private String requestMethod;

    /**
     * 请求时间
     * 在Excel导入导出中，对应表头名称为"请求时间"，列索引为7。
     * 同时使用了 @JsonFormat 和 @DateTimeFormat 注解来规范时间格式的序列化与反序列化，在Excel中期望的格式为 "yyyy-MM-dd HH:mm:ss"
     */
    @Schema(description = "请求时间")
    @ExcelProperty(value = "请求时间", index = 7)
    private LocalDateTime requestTime;

    /**
     * 操作人员
     * 在Excel导入导出中，对应表头名称为"操作人员"，列索引为9
     */
    @Schema(description = "操作人员")
    @ExcelProperty(value = "操作人员", index = 9)
    private String operName;

    /**
     * 请求URL
     * 在Excel导入导出中，对应表头名称为"请求URL"，列索引为10
     */
    @Schema(description = "请求URL")
    @ExcelProperty(value = "请求URL", index = 10)
    private String operUrl;

    /**
     * 主机地址
     * 在Excel导入导出中，对应表头名称为"主机地址"，列索引为11
     */
    @Schema(description = "主机地址")
    @ExcelProperty(value = "主机地址", index = 11)
    private String operIp;

    /**
     * 操作地点
     * 在Excel导入导出中，对应表头名称为"操作地点"，列索引为12
     */
    @Schema(description = "操作地点")
    @ExcelProperty(value = "操作地点", index = 12)
    private String operLocation;

    /**
     * 请求参数
     * 在Excel导入导出中，对应表头名称为"请求参数"，列索引为13
     */
    @Schema(description = "请求参数")
    @ExcelProperty(value = "请求参数", index = 13)
    private String operParam;

    /**
     * 返回参数
     * 在Excel导入导出中，对应表头名称为"返回参数"，列索引为14
     */
    @Schema(description = "返回参数")
    @ExcelProperty(value = "返回参数", index = 14)
    private String jsonResult;

    /**
     * 操作状态（0正常 1异常）
     * 在Excel导入导出中，对应表头名称为"操作状态"，列索引为15
     */
    @Schema(description = "操作状态（0正常 1异常）")
    @ExcelProperty(value = "操作状态", index = 15)
    private Integer status;

    /**
     * 错误消息
     * 在Excel导入导出中，对应表头名称为"错误消息"，列索引为16
     */
    @Schema(description = "错误消息")
    @ExcelProperty(value = "错误消息", index = 16)
    private String errorMsg;

    /**
     * 错误消息
     */
    @Schema(description = "错误消息Html")
    private String errorMsgHtml;

    /**
     * 消耗时间
     * 在Excel导入导出中，对应表头名称为"消耗时间"，列索引为17
     */
    @Schema(description = "消耗时间")
    @ExcelProperty(value = "消耗时间", index = 17)
    private Long costTime;


}
