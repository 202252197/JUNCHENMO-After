package com.jcm.system.service;

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
     * 查询已分配角色菜单列表
     * 根据角色ID获取菜单ID列表
     *
     * @param roleId 用户ID
     * @return
     */
    public List<Integer> queryMenuIdsByRoleId(Integer roleId);

}
