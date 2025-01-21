package com.jcm.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 角色和菜单关联关系表
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_role_menu")
@Tag(name = "SysRoleMenu对象", description = "角色和菜单关联关系表")
public class SysRoleMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "角色id")
    private Long roleId;

    @Schema(description = "菜单id")
    private Long menuId;


}
