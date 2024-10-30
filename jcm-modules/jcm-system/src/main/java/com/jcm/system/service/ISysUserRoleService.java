package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.domain.SysUserRole;
import com.jcm.system.domain.dto.RoleDTO;

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
     * 批量选择角色对用户授权
     * @param roleDTO 用户ID和角色id集合
     * @return
     */
    public Integer insertAuthUserRoles(RoleDTO roleDTO);

    /**
     * 查询已分配用户角色列表
     * 根据用户ID获取角色ID列表
     * @param userId 用户ID
     * @return
     */
    public List<Integer> queryRoleIdsByUserId(Integer userId);

}
