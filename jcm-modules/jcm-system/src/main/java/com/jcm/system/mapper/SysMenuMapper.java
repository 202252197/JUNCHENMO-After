package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.SysMenu;
import org.apache.ibatis.annotations.Param;

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

    /**
     * 修改菜单及所有子菜单的状态/显示状态
     * @param childList 当前菜单以及所有子菜单的列表
     * @param status 修改的状态
     * @param visible 修改的显示状态
     * @return 用户拥有的菜单树
     */
    void updateBatchById(@Param("menuList") List<SysMenu> menuList,@Param("status") Integer status,@Param("visible") Boolean visible);
}
