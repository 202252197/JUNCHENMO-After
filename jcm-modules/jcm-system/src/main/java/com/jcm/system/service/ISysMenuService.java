package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.domain.SysMenu;
import com.jcm.system.domain.vo.RouterVo;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysMenuService extends IService<SysMenu> {

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
    List<SysMenu> selectMenuTreeByUserId(Long userId);

    /**
     * 将菜单树构建为路由结构
     * @param menus 菜单树
     * @param parentPath 父级菜单路径
     * @return 路由树
     */
    List<RouterVo> buildMenus(List<SysMenu> menus, String parentPath);


    /**
     * 获取全部菜单列表
     * @param sysMenu
     * @return 菜单权限信息
     */
    List<SysMenu> selectMenuAllTree(SysMenu sysMenu);

    /**
     * 新增菜单
     * @param sysMenu
     * @return
     */
    int insertMenu(SysMenu sysMenu);

    /**
     * 根据ID删除菜单
     * @param menuId
     * @return
     */
    int deleteMenu(Long menuId);

    /**
     * 根据菜单信息
     * @param menu
     * @return
     */
    int updateMenu(SysMenu menu);

    /**
     * 获取新增菜单最后的sort值
     * @param parentId 父菜单id
     * @return
     */
    Integer getMenuChildLastSort(Long parentId);

    /**
     * 获取首页动态图标名称
     * @return
     */
    String getHomeMenuIcon();

    int changeStatusWithChildStatus(SysMenu menu);

    List<SysMenu> selectRouterTreeByUserId(Long userId);
}
