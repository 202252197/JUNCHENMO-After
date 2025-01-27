package com.jcm.system.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * task对象 sys_user_task
 *
 * @author lvshihao
 * @date 2025-01-13
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ExcelIgnoreUnannotated
@TableName("sys_user_task")
public class SysUserTask extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 任务ID，主键
     */
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "${comment}")
    private Long taskId;

    /**
     * 任务标题
     */
    @ExcelProperty(value = "任务标题")
    private String title;

    /**
     * 任务描述
     */
    @ExcelProperty(value = "任务描述")
    private String description;

    /**
     * 任务开始日期
     */
    @ExcelProperty(value = "任务开始日期")
    private LocalDateTime startDate;

    /**
     * 任务结束日期
     */
    @ExcelProperty(value = "任务结束日期")
    private LocalDateTime endDate;

    /**
     * 任务优先级（0:一般、1:中等、2:加急）
     */
    @ExcelProperty(value = "任务优先级（0:一般、1:中等、2:加急）")
    private Long priority;

    /**
     * 任务状态（0:未开始、1:进行中、2:已完成）
     */
    @ExcelProperty(value = "任务状态（0:未开始、1:进行中、2:已完成）")
    private Long status;

    /**
     * 任务类型（0:修复bug，1：新增功能）
     */
    @ExcelProperty(value = "任务类型（0:修复bug，1：新增功能）")
    private Long type;

    /**
     * 执行任务的用户ID
     */
    @ExcelProperty(value = "执行任务的用户ID")
    private Long userId;

    @TableField(exist = false)
    @ExcelProperty(value = "用户名称")
    private String username;

}
