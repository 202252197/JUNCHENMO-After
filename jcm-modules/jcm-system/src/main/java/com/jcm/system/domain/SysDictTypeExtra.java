package com.jcm.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.mybatis.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 字典配置项额外参数
 * </p>
 *
 * @author 吕世昊
 * @since 2024-10-31
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_dict_type_extra")
public class SysDictTypeExtra extends BaseEntity implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long dictTypeExtraId;

    private Long dictTypeId;

    private Integer type;

    private String parameter;
}
