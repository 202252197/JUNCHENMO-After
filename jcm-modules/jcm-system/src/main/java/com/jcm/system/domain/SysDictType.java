package com.jcm.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.mybatis.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * <p>
 * 字典配置项
 * </p>
 *
 * @author 吕世昊
 * @since 2024-10-31
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_dict_type")
public class SysDictType extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long dictTypeId;

    private String name;

    private String description;

    private Integer type;

    private Integer status;

    /**
     * 字典项额外参数
     */
    @TableField(exist = false)
    private List<SysDictTypeExtra> typeExtraSchemas;

    @TableField(exist = false)
    private ArrayList<Properties> ceshi;
}