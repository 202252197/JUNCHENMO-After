package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.domain.SysRole;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysRoleService extends IService<SysRole> {

    /**
     * 根据用户ID查询角色权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    List<SysRole> selectRolePermissionByUserId(Long userId);

    /**
     * 获取角色数据权限
     *
     * @param sysUser 用户
     * @return 角色权限信息
     */
    Set<String> getRolePermission(SysUser sysUser);

    /**
     * 校验角色名称是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    boolean checkRoleNameUnique(SysRole role);

    /**
     * 校验角色名称是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    boolean checkRoleKeyUnique(SysRole role);

    /**
     * 根据条件分页查询角色数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    List<SysRole> selectRoleList(SysRole role);

    /**
     * 通过角色ID查询角色
     *
     * @param roleId 角色ID
     * @return 角色对象信息
     */
    SysRole selectRoleById(Long roleId);

    /**
     * 新增保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    int insertRole(SysRole role);

    /**
     * 校验角色是否允许操作
     *
     * @param role 角色信息
     */
    void checkRoleAllowed(SysRole role);

    /**
     * 修改角色状态
     *
     * @param role 角色信息
     * @return 结果
     */
    int updateRoleStatus(SysRole role);

    /**
     * 修改角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    int updateRole(SysRole role);

    /**
     * 删除角色信息
     *
     * @param roleIds 角色Id集合
     * @return 结果
     */
    int deleteRole(List<Long> roleIds);

    /**
     * 查询所有启用的角色
     *
     * @return 角色列表
     */
    List<SysRole> selectRoleAll();


    /**
     * 批量选择菜单对角色授权
     *
     * @param roleId  角色ID
     * @param menusId 菜单ID集合
     * @return
     */
    int insertRoleAuth(Long roleId, Long[] menusId);


    /**
     * 通过角色ID查询角色使用数量
     *
     * @param roleId 角色ID
     * @return 结果
     */
    int countUserRoleByRoleId(Long roleId);

}
