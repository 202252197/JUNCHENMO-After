package com.jcm.system.service;

import com.jcm.system.domain.dto.MenuDTO;

import java.util.List;

/**
 * <p>
 * 角色和菜单关联关系表 服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysRoleMenuService {

    /**
     * 批量选择菜单对角色授权
     * @param menuDTO 角色ID和菜单id集合
     * @return
     */
    public Integer insertAuthRoleMenus(MenuDTO menuDTO);

    /**
     * 查询已分配角色菜单列表
     * 根据角色ID获取菜单ID列表
     * @param roleId 用户ID
     * @return
     */
    public List<Integer> queryMenuIdsByRoleId(Integer roleId);

}
