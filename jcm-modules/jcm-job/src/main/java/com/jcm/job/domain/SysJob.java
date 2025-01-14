package com.jcm.job.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * job对象 sys_job
 * 
 * @author lvshihao
 * @date 2025-01-14
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ExcelIgnoreUnannotated
@TableName("sys_job")
public class SysJob extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务ID */
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "${comment}")
    private Long jobId;

    /** 任务名称 */
    @ExcelProperty(value = "任务名称")
    private String jobName;

    /** 任务组名 */
    @ExcelProperty(value = "任务组名")
    private String jobGroup;

    /** 调用目标字符串 */
    @ExcelProperty(value = "调用目标字符串")
    private String invokeTarget;

    /** cron执行表达式 */
    @ExcelProperty(value = "cron执行表达式")
    private String cronExpression;

    /** 计划执行错误策略（1立即执行 2执行一次 3放弃执行） */
    private String misfirePolicy;

    /** 是否并发执行（0允许 1禁止） */
    private String concurrent;

    /** 状态（0正常 1暂停） */
    @ExcelProperty(value = "状态（0正常 1暂停）")
    private String status;


}
