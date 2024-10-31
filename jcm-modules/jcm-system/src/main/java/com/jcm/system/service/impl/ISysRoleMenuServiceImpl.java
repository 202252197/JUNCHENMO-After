package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.jcm.system.domain.SysRoleMenu;
import com.jcm.system.domain.dto.MenuDTO;
import com.jcm.system.mapper.SysRoleMenuMapper;
import com.jcm.system.service.ISysRoleMenuService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 角色和菜单关联关系表 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-20
 */
@Service
@AllArgsConstructor
public class ISysRoleMenuServiceImpl implements ISysRoleMenuService {

    private final SysRoleMenuMapper sysRoleMenuMapper;

    /**
     * 批量选择角色对用户授权
     * @param menuDTO 角色ID和菜单id集合
     * @return
     */
    @Override
    public Integer insertAuthRoleMenus(MenuDTO menuDTO) {
        //删除角色已经授权的所有菜单
        LambdaQueryWrapper<SysRoleMenu> lambdaQueryWrapper=new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(ObjectUtils.isNotEmpty(menuDTO.getRoleId()),SysRoleMenu::getRoleId,menuDTO.getRoleId());
        sysRoleMenuMapper.delete(lambdaQueryWrapper);
        if(menuDTO.getMenusId().length<=0){
            return 1;
        }
        //重新新增角色下所有的菜单
        List<SysRoleMenu> SysRoleMenus = new ArrayList<>();
        Arrays.asList(menuDTO.getMenusId()).forEach(menuId->{
            SysRoleMenu sysUserRole=new SysRoleMenu();
            sysUserRole.setRoleId(menuDTO.getRoleId());
            sysUserRole.setMenuId(menuId);
            SysRoleMenus.add(sysUserRole);
        });
        return sysRoleMenuMapper.batchRoleMenu(SysRoleMenus);
    }

    /**
     * 根据角色id查询所拥有的菜单id集合
     * @param roleId
     * @return
     */
    @Override
    public List<Integer> queryMenuIdsByRoleId(Integer roleId) {
        return sysRoleMenuMapper.queryMenuIdsByRoleId(roleId);
    }
}
