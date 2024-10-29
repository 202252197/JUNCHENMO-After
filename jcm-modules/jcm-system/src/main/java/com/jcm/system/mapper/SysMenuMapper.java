package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.SysMenu;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-21
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    /**
     * 根据用户ID查询所拥有的权限列表
     * @param id 用户ID
     * @return 用户所拥有的权限列表
     */
    List<String> selectMenuPermsByUserId(Long id);

    /**
     * 查询全部的菜单树
     * @return 全部的菜单树
     */
    List<SysMenu> selectMenuTreeAll();

    /**
     * 根据用户ID查询所拥有的菜单树
     * @param userId 用户ID
     * @return 用户拥有的菜单树
     */
    List<SysMenu> selectMenuTreeByUserId(Long userId);

    /**
     * 获取新增菜单最后的sort值
     * @param parentId 父菜单id
     * @return 用户拥有的菜单树
     */
    Integer selectMenuChildLastSort(Long parentId);
}
