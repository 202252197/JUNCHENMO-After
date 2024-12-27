package com.jcm.common.mybatis.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Map;

/**
 * Entity基类
 * 
 * @author junchenmo
 */
@Data
public class BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 创建者 */
    @TableField(value = "creator", fill = FieldFill.INSERT)
    private String creator;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 更新者 */
    @TableField(value = "updater", fill = FieldFill.UPDATE)
    private String updater;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /** 备注 */
    private String remark;

    /**
     * 是否被删除: 0是未删除, 1是已删除
     */
    private Boolean deleted;

    /** 请求参数 */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;
}
