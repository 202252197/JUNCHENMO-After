package com.jcm.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 用户和角色关联关系表
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_user_role")
@Tag(name="SysUserRole对象", description="用户和角色关联关系表")
public class SysUserRole   implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "用户id")
    private Long userId;

    @Schema(description = "角色id")
    private Long roleId;


}
