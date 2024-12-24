package com.jcm.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.mybatis.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

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
public class SysUserSetting extends BaseEntity implements Serializable {

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
    private Integer theme;

    /**
     * 界面主题颜色
     */
    private String themeColor;

    /**
     * 导航栏
     */
    private Boolean navigationBar;

    /**
     * 多页签
     */
    private Boolean tabs;

    /**
     * 多页签图标
     */
    private Boolean tabsIcon;

    /**
     * 面包屑
     */
    private Boolean breadcrumb;

    /**
     * 菜单栏
     */
    private Boolean menu;

    /**
     * 版权内容
     */
    private Boolean copyright;

    /**
     * 用户水印
     */
    private Boolean watermark;

    /**
     * 弱色模式
     */
    private Boolean weakColor;

    /**
     * 黑白模式
     */
    private Boolean grayscale;

    /**
     * 高斯模式
     */
    private Boolean blur;

    /**
     * 对比度
     */
    private Boolean contrast;

    /**
     * 色相旋转
     */
    private Boolean hueRotate;

    /**
     * 饱和度
     */
    private Boolean saturate;

    /**
     * 数据加载动画
     */
    private Boolean dataLoading;

    /**
     * 表格默认页数
     */
    private Integer size;

}
