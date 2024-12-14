package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.system.domain.SysUserRole;
import com.jcm.system.domain.dto.RoleDTO;
import com.jcm.system.mapper.SysUserRoleMapper;
import com.jcm.system.service.ISysUserRoleService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 吕世昊
 */
@SuppressWarnings(value = "all")
@Service
@AllArgsConstructor
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements ISysUserRoleService {

    private final SysUserRoleMapper sysUserRoleMapper;

    /**
     * 批量选择角色对用户授权
     * @param roleDTO 用户ID和角色id集合
     * @return
     */
    @Transactional
    @Override
    public Integer insertAuthUserRoles(RoleDTO roleDTO) {
        //删除用户已经授权的所有角色
        LambdaQueryWrapper<SysUserRole> lambdaQueryWrapper=new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(ObjectUtils.isNotEmpty(roleDTO.getUserId()),SysUserRole::getUserId,roleDTO.getUserId());
        sysUserRoleMapper.delete(lambdaQueryWrapper);
        if(roleDTO.getRolesId().length<=0){
            return 1;
        }
        //重新新增用户所有的角色
        List<SysUserRole> SysUserRoles = new ArrayList<>();
        Arrays.asList(roleDTO.getRolesId()).forEach(roleId->{
            SysUserRole sysUserRole=new SysUserRole();
            sysUserRole.setUserId(roleDTO.getUserId());
            sysUserRole.setRoleId(roleId);
            SysUserRoles.add(sysUserRole);
        });
        return sysUserRoleMapper.batchUserRole(SysUserRoles);
    }

    /**
     * 根据用户ID获取角色ID列表
     * @param userId 用户ID
     * @return
     */
    @Override
    public List<Integer> queryRoleIdsByUserId(Integer userId) {
        return sysUserRoleMapper.queryRoleIdsByUserId(userId);
    }


}
