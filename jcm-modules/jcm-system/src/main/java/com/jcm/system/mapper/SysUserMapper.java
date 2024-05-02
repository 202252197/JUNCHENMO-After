package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.entity.SysUser;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
     * 通过用户ID删除用户和角色关联
     *
     * @param userId 用户ID
     * @return 结果
     */
    void deleteUserRoleByUserId(Long userId);
}
