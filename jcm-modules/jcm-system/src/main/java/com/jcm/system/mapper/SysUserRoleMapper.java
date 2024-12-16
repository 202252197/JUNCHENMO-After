package com.jcm.system.mapper;

import com.jcm.system.domain.SysUserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 用户和角色关联关系表 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-20
 */
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {

    /**
     * 批量新增用户角色信息
     *
     * @param userRoleList 用户角色列表
     * @return 结果
     */
    int batchUserRole(List<SysUserRole> userRoleList);

    /**
     * 根据用户ID获取角色ID列表
     * @param userId 用户ID
     * @return
     */
    List<Integer> selectAllocatedList(Long userId);

    /**
     * 通过用户ID删除用户和角色关联
     *
     * @param userId 用户ID
     * @return 结果
     */
    int deleteUserRoleByUserId(Long userId);

    /**
     * 通过角色ID查询角色使用数量
     *
     * @param roleId 角色ID
     * @return 结果
     */
    int countUserRoleByRoleId(Long roleId);
}
