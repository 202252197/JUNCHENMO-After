package com.jcm.system.service.impl;

import com.jcm.system.mapper.SysRoleMenuMapper;
import com.jcm.system.service.ISysRoleMenuService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 吕世昊
 */
@Service
@AllArgsConstructor
public class ISysRoleMenuServiceImpl implements ISysRoleMenuService {

    private final SysRoleMenuMapper sysRoleMenuMapper;

    /**
     * 根据角色id查询所拥有的菜单id集合
     *
     * @param roleId
     * @return
     */
    @Override
    public List<Integer> queryMenuIdsByRoleId(Integer roleId) {
        return sysRoleMenuMapper.queryMenuIdsByRoleId(roleId);
    }
}
