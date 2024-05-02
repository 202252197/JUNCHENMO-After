package com.jcm.system.mapper;

import com.jcm.system.entity.SysUserRole;
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
    public int batchUserRole(List<SysUserRole> userRoleList);



}
