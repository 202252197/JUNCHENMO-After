package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.SysRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    List<SysRole> selectRolePermissionByUserId(Long userId);

    /**
     * 删除角色集合
     *
     * @param roleIds 角色ID集合
     * @return
     */
    int deleteByIds(@Param("roleIds") List<Long> roleIds);
}
