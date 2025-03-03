package com.jcm.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.exception.ServiceException;
import cn.hutool.core.util.StrUtil;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.domain.SysRole;
import com.jcm.system.domain.SysRoleMenu;
import com.jcm.system.mapper.SysRoleMapper;
import com.jcm.system.mapper.SysRoleMenuMapper;
import com.jcm.system.mapper.SysUserRoleMapper;
import com.jcm.system.service.ISysRoleService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @author 吕世昊
 */
@Service
@AllArgsConstructor
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {

    private final SysRoleMapper sysRoleMapper;
    private final SysUserRoleMapper sysUserRoleMapper;
    private final SysRoleMenuMapper sysRoleMenuMapper;

    /**
     * 根据用户ID查询角色权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    public List<SysRole> selectRolePermissionByUserId(Long userId) {
        return sysRoleMapper.selectRolePermissionByUserId(userId);
    }

    /**
     * 校验角色名称是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public boolean checkRoleNameUnique(SysRole role) {
        List<SysRole> list = this.lambdaQuery().eq(StrUtil.isNotEmpty(role.getName()), SysRole::getName, role.getName()).list();
        return list.size() == 0;
    }

    /**
     * 校验角色权限是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public boolean checkRoleKeyUnique(SysRole role) {
        List<SysRole> list = this.lambdaQuery().eq(StrUtil.isNotEmpty(role.getCode()), SysRole::getCode, role.getCode()).list();
        return list.size() == 0;
    }

    /**
     * 根据条件分页查询角色数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    @Override
    public List<SysRole> selectRoleList(SysRole role) {
        return this.lambdaQuery()
                .like(StrUtil.isNotEmpty(role.getName()), SysRole::getName, role.getName())
                .like(StrUtil.isNotEmpty(role.getCode()), SysRole::getCode, role.getCode())
                .eq(ObjectUtil.isNotNull(role.getStatus()), SysRole::getStatus, role.getStatus())
                .list();
    }

    /**
     * 通过角色ID查询角色
     *
     * @param roleId 角色ID
     * @return 角色对象信息
     */
    @Override
    public SysRole selectRoleById(Long roleId) {
        return this.lambdaQuery().eq(Objects.nonNull(roleId), SysRole::getRoleId, roleId).one();
    }

    /**
     * 新增保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertRole(SysRole role) {
        return sysRoleMapper.insert(role);
    }

    /**
     * 校验角色是否允许操作
     *
     * @param role 角色信息
     */
    @Override
    public void checkRoleAllowed(SysRole role) {
        if (ObjectUtil.isNotNull(role.getRoleId()) && role.isAdmin()) {
            throw new ServiceException("不允许操作超级管理员角色");
        }
    }

    /**
     * 修改角色状态
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public int updateRoleStatus(SysRole role) {
        UpdateWrapper<SysRole> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("role_id", role.getRoleId()).set("status", 1);
        return sysRoleMapper.update(null, updateWrapper);
    }

    /**
     * 修改角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public int updateRole(SysRole role) {
        UpdateWrapper<SysRole> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("role_id", role.getRoleId());
        return sysRoleMapper.update(role, updateWrapper);
    }

    /**
     * 删除角色信息
     *
     * @param roleIds 角色Id集合
     * @return 结果
     */
    @Override
    public int deleteRole(List<Long> roleIds) {
        for (Long roleId : roleIds) {
            checkRoleAllowed(new SysRole(roleId));
            SysRole role = selectRoleById(roleId);
            if (countUserRoleByRoleId(roleId) > 0) {
                throw new ServiceException(String.format("%1$s已分配,不能删除", role.getName()));
            }
        }
        sysRoleMenuMapper.deleteByRoleIds(roleIds);
        return sysRoleMapper.deleteBatchIds(roleIds);
    }

    /**
     * 查询所有启用的角色
     *
     * @return 角色列表
     */
    @Override
    public List<SysRole> selectRoleAll() {
        return this.lambdaQuery().eq(SysRole::getStatus, 0).list();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insertRoleAuth(Long roleId, Long[] menusId) {
        if (ObjectUtil.isEmpty(menusId)) {
            return 0;
        }

        //删除角色已经授权的所有菜单
        LambdaQueryWrapper<SysRoleMenu> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(ObjectUtils.isNotEmpty(roleId), SysRoleMenu::getRoleId, roleId);
        sysRoleMenuMapper.delete(lambdaQueryWrapper);

        //重新新增角色下所有的菜单
        List<SysRoleMenu> SysRoleMenus = new ArrayList<>();
        Arrays.asList(menusId).forEach(menuId -> {
            SysRoleMenu sysUserRole = new SysRoleMenu();
            sysUserRole.setRoleId(roleId);
            sysUserRole.setMenuId(menuId);
            SysRoleMenus.add(sysUserRole);
        });
        return sysRoleMenuMapper.batchRoleMenu(SysRoleMenus);
    }

    /**
     * 通过角色ID查询角色使用数量
     *
     * @param roleId 角色ID
     * @return 结果
     */
    @Override
    public int countUserRoleByRoleId(Long roleId) {
        return sysUserRoleMapper.countUserRoleByRoleId(roleId);
    }

    /**
     * 获取角色数据权限
     *
     * @param user 用户
     * @return 角色权限信息
     */
    @Override
    public Set<String> getRolePermission(SysUser user) {
        Set<String> roles = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin()) {
            roles.add("admin");
        } else {
            this.selectRolePermissionByUserId(user.getUserId()).stream()
                    .map(SysRole::getCode).filter(ObjectUtil::isNotNull)
                    .map(String::trim).forEach(roles::add);
        }
        return roles;
    }

    /**
     * 批量删除角色信息
     * @param roleIds 需要删除的角色ID
     * @return 结果
     */
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public int deleteRoleByIds(Long[] roleIds)
//    {
//        for (Long roleId : roleIds)
//        {
//            checkRoleAllowed(new SysRole(roleId));
//            SysRole role = selectRoleById(roleId);
//            if (countUserRoleByRoleId(roleId) > 0)
//            {
//                throw new ServiceException(String.format("%1$s已分配,不能删除", role.getRoleName()));
//            }
//        }
//        // 删除角色与菜单关联
//        roleMenuMapper.deleteRoleMenu(roleIds);
//        return roleMapper.deleteRoleByIds(roleIds);
//    }
}
