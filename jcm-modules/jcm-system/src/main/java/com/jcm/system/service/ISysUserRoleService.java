package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.entity.SysRole;
import com.jcm.system.entity.SysUser;
import com.jcm.system.entity.SysUserRole;

import java.util.List;

/**
 * <p>
 * 用户和角色关联关系表 服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-20
 */
public interface ISysUserRoleService extends IService<SysUserRole> {

    /**
     *  查找用户下所有的角色信息
     * @param user
     * @return
     */
    List<SysRole> queryUserRoles(SysUser user);
}
