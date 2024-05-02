package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.jcm.system.entity.SysRole;
import com.jcm.system.entity.SysUser;
import com.jcm.system.entity.SysUserRole;
import com.jcm.system.mapper.SysUserRoleMapper;
import com.jcm.system.service.ISysUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户和角色关联关系表 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-20
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements ISysUserRoleService {

    /**
     * 查找用户下所有的角色信息
     * @param user
     * @return
     */
    @Override
    public List<SysRole> queryUserRoles(SysUser user) {
        return null;
    }
}
