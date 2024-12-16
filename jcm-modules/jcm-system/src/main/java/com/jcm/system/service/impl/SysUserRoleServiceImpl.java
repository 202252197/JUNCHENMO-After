package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.system.domain.SysUserRole;
import com.jcm.system.mapper.SysUserRoleMapper;
import com.jcm.system.service.ISysUserRoleService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

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
     * 根据用户ID获取角色ID列表
     * @param userId 用户ID
     * @return
     */
    @Override
    public List<Integer> selectAllocatedList(Long userId) {
        return sysUserRoleMapper.selectAllocatedList(userId);
    }


}
