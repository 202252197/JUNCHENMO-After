package com.jcm.job.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcm.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * log对象 sys_job_log
 * 
 * @author lvshihao
 * @date 2025-01-14
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ExcelIgnoreUnannotated
@TableName("sys_job_log")
public class SysJobLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务日志ID */
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "${comment}")
    private Long jobLogId;

    /** 任务名称 */
    @ExcelProperty(value = "任务名称")
    private String jobName;

    /** 任务组名 */
    @ExcelProperty(value = "任务组名")
    private String jobGroup;

    /** 调用目标字符串 */
    @ExcelProperty(value = "调用目标字符串")
    private String invokeTarget;

    /** 日志信息 */
    @ExcelProperty(value = "日志信息")
    private String jobMessage;

    /** 执行状态（0正常 1失败） */
    @ExcelProperty(value = "执行状态（0正常 1失败）")
    private String status;

    /** 任务执行时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime executeTime;

    /** 异常信息 */
    private String exceptionInfo;

    /** 开始时间 */
    @TableField(exist = false)
    private Date startTime;

    /** 停止时间 */
    @TableField(exist = false)
    private Date stopTime;
}
