package com.jcm.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户前端样式设置表
 * </p>
 *
 * @author 吕世昊
 * @since 2024-12-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_user_setting")
public class SysUserSetting implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 界面设置ID
     */
    @TableId(value = "setting_id", type = IdType.AUTO)
    private Long settingId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 界面主题
     */
    private Boolean theme;

    /**
     * 菜单栏
     */
    private Boolean menu;

    /**
     * 顶部菜单栏
     */
    private Boolean topMenu;

    /**
     * 版权内容
     */
    private Boolean copyright;

    /**
     * 多页签
     */
    private Boolean tabs;

    /**
     * 表格默认页数
     */
    private Integer size;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建人
     */
    private String creator;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新人
     */
    private String updater;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 是否被删除: 0是未删除, 1是已删除
     */
    private Boolean deleted;


}
