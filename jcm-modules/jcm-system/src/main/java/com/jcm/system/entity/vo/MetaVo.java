package com.jcm.system.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 路由显示信息
 * 
 * @author ruoyi
 */
@Data
@AllArgsConstructor
public class MetaVo
{
    /**
     * 设置该路由在侧边栏和面包屑中展示的名字
     */
    private String title;

    /**
     * 是否隐藏路由，当设置 true 的时候该路由不会再侧边栏出现
     */
    private boolean hidden;

    /**
     * 是否外联，当为 true 的时候跳转到外联地址，当为false就是内联地址
     */
    private boolean isFrame;

    /**
     * 设置该路由的图标，对应路径src/assets/icons/svg
     */
    private String icon;

    /**
     * 设置为true，则会被 <keep-alive>缓存
     */
    private boolean cache;

}
