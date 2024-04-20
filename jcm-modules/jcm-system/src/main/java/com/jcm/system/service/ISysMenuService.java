package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.api.domain.SysPermission;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.domain.vo.RouterVo;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
 */
public interface ISysPermissionService extends IService<SysPermission> {

    /**
     * 获取角色数据权限
     *
     * @param sysUser 用户
     * @return 角色权限信息
     */
    Set<String> getRolePermission(SysUser sysUser);

    /**
     * 获取菜单数据权限
     *
     * @param sysUser 用户
     * @return 菜单权限信息
     */
    Set<String> getMenuPermission(SysUser sysUser);

    /**
     * 根据用户ID获取菜单树
     *
     * @param userId 用户ID
     * @return 菜单树信息
     */
    List<SysPermission> selectMenuTreeByUserId(Long userId);

    /**
     * 将菜单树构建为路由结构
     * @param menus 菜单树
     * @param parentPath 父级菜单路径
     * @return 路由树
     */
    List<RouterVo> buildMenus(List<SysPermission> menus,String parentPath);
}
