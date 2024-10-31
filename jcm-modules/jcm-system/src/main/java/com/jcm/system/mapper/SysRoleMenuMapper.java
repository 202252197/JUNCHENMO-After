package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.SysRoleMenu;

import java.util.List;

/**
 * <p>
 * 用户和角色关联关系表 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-20
 */
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

    /**
     * 批量新增角色菜单信息
     *
     * @param roleMenuList 用户角色列表
     * @return 结果
     */
    public Integer batchRoleMenu(List<SysRoleMenu> roleMenuList);

    /**
     * 根据角色ID获取菜单ID列表
     * @param roleId 用户ID
     * @return
     */
    public List<Integer> queryMenuIdsByRoleId(Integer roleId);

    /**
     * 通过用户ID删除角色和菜单的关联
     *
     * @param roleId 用户ID
     * @return 结果
     */
    public Long deleteRoleMenuByRoleId(Long roleId);

}
