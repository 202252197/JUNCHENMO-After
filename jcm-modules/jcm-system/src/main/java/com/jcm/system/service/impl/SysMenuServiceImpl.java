package com.jcm.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.constant.MenuConstant;
import com.jcm.common.core.constant.UserConstants;
import cn.hutool.core.util.StrUtil;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.domain.SysMenu;
import com.jcm.system.domain.vo.MetaVo;
import com.jcm.system.domain.vo.RouterVo;
import com.jcm.system.mapper.SysMenuMapper;
import com.jcm.system.service.ISysMenuService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author 吕世昊
 */
@Service
@AllArgsConstructor
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {
    private final SysMenuMapper sysMenuMapper;

    /**
     * 获取菜单数据权限
     *
     * @param sysUser 用户
     * @return 菜单权限信息
     */
    @Override
    public Set<String> getMenuPermission(SysUser sysUser) {

        Set<String> perms = new HashSet<String>();
        // 管理员拥有所有权限
        if (sysUser.isAdmin()) {
            perms.add("*:*:*");
        } else {
            perms.addAll(selectMenuPermsByUserId(sysUser.getUserId()));
        }
        return perms;
    }


    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    public Set<String> selectMenuPermsByUserId(Long userId) {
        return sysMenuMapper.selectMenuPermsByUserId(userId).stream()
                .filter(StrUtil::isNotEmpty).map(String::trim).collect(Collectors.toSet());
    }

    /**
     * 构建前端路由所需要的菜单
     *
     * @param menus 菜单列表
     * @return 路由列表
     */
    @Override
    public List<RouterVo> buildMenus(List<SysMenu> menus, String parentPath) {
        List<RouterVo> routers = new LinkedList<RouterVo>();
        for (SysMenu menu : menus) {
            RouterVo router = new RouterVo();
            router.setMeta(new MetaVo(menu.getName(), menu.getVisible(), menu.getIsFrame(), menu.getIcon(), menu.getKeepAlive()));
            List<SysMenu> cMenus = menu.getChildren();

            //如果是外链
            if (menu.getIsFrame()) {
                router.setPath(menu.getLink());
                router.setComponent(UserConstants.LAYOUT);
            } else {
                if (MenuConstant.TYPE_DIR == menu.getType()) {
                    router.setPath("/" + menu.getComponent());
                    router.setComponent(UserConstants.LAYOUT);
                } else if (MenuConstant.TYPE_MENU == menu.getType() && menu.getParentId() != 0) {
                    router.setName(menu.getComponent());
                    router.setPath("/" + parentPath + "/" + menu.getComponent());
                    router.setComponent("/" + parentPath + "/" + menu.getComponent() + "/index");
                } else if (MenuConstant.TYPE_MENU == menu.getType() && menu.getParentId() == 0) {
                    List<RouterVo> routerVos = new ArrayList<>();
                    RouterVo routerVo = new RouterVo();
                    routerVo.setPath("/index");
                    routerVo.setComponent("/" + menu.getComponent() + "/index");
                    routerVo.setMeta(router.getMeta());


                    if ("home".equals(menu.getComponent())) {
                        router.setPath("/");
                        router.setRedirect("/home");
                        routerVo.setName("home");
                        routerVo.setPath("/home");
                    } else {
                        routerVo.setName(menu.getComponent());
                        routerVo.setPath("/index");
                        router.setPath("/" + menu.getComponent());
                    }
                    routerVos.add(routerVo);

                    router.setComponent(UserConstants.LAYOUT);
                    router.setMeta(null);
                    router.setChildren(routerVos);
                }
            }

            //如果还有子菜单，递归
            if (ObjectUtil.isNotEmpty(cMenus)) {
                router.setChildren(buildMenus(cMenus, menu.getComponent()));
            }
            //如果组件是空的
            if (StrUtil.isEmpty(menu.getComponent())) {
                router.setComponent(UserConstants.LAYOUT);
            }
            routers.add(router);
        }

        routers.forEach(routerVo -> {
            if (routerVo.getChildren() != null && routerVo.getChildren().size() >= 1) {
                RouterVo routerVoChildren = routerVo.getChildren().get(0);
                routerVo.setRedirect(routerVoChildren.getPath());
            }
        });
        return routers;
    }


    /**
     * 根据用户ID获取菜单树
     *
     * @param userId 用户ID
     * @return 菜单树信息
     */
    @Override
    public List<SysMenu> selectMenuTreeByUserId(Long userId) {
        List<SysMenu> menus = null;
        if (SecurityUtils.isAdmin(userId)) {
            menus = sysMenuMapper.selectMenuTreeAll(true);
        } else {
            menus = sysMenuMapper.selectMenuTreeByUserId(userId, true);
        }
        return getChildPerms(menus, 0);
    }

    @Override
    public List<SysMenu> selectRouterTreeByUserId(Long userId) {
        List<SysMenu> menus = null;
        if (SecurityUtils.isAdmin(userId)) {
            menus = sysMenuMapper.selectMenuTreeAll(null);
        } else {
            menus = sysMenuMapper.selectMenuTreeByUserId(userId, null);
        }
        return getChildPerms(menus, 0);
    }


    /**
     * 根据父节点的ID获取所有子节点
     *
     * @param list     分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public List<SysMenu> getChildPerms(List<SysMenu> list, int parentId) {
        List<SysMenu> returnList = new ArrayList<SysMenu>();
        for (Iterator<SysMenu> iterator = list.iterator(); iterator.hasNext(); ) {
            SysMenu t = (SysMenu) iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId) {
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    /**
     * 递归列表
     *
     * @param list 分类表
     * @param t    子节点
     */
    private void recursionFn(List<SysMenu> list, SysMenu t) {
        // 得到子节点列表
        List<SysMenu> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysMenu tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysMenu> list, SysMenu t) {
        return getChildList(list, t).size() > 0;
    }


    /**
     * 得到子节点列表
     */
    private List<SysMenu> getChildList(List<SysMenu> list, SysMenu t) {
        List<SysMenu> tlist = new ArrayList<SysMenu>();
        Iterator<SysMenu> it = list.iterator();
        while (it.hasNext()) {
            SysMenu n = (SysMenu) it.next();
            if (n.getParentId().longValue() == t.getMenuId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }


    @Override
    public List<SysMenu> selectMenuAllTree(SysMenu sysMenu) {
        List<SysMenu> allMenus = this.lambdaQuery()
                .like(StrUtil.isNotEmpty(sysMenu.getName()), SysMenu::getName, sysMenu.getName())
                .eq(Objects.nonNull(sysMenu.getStatus()), SysMenu::getStatus, sysMenu.getStatus())
                .orderByAsc(SysMenu::getSort)
                .list();

        if (allMenus.isEmpty()) {
            return new ArrayList<>();
        }

        List<SysMenu> rootMenus = findRootMenus(allMenus);

        for (SysMenu rootMenu : rootMenus) {
            addChildren(rootMenu, allMenus);
        }

        return rootMenus;
    }

    /**
     * 新增菜单
     *
     * @param sysMenu 菜单
     * @return
     */
    @Override
    public int insertMenu(SysMenu sysMenu) {
        if (StrUtil.isNotEmpty(sysMenu.getComponent())) {
            sysMenu.setIsFrame(false);
        } else {
            sysMenu.setIsFrame(true);
        }
        return sysMenuMapper.insert(sysMenu);
    }

    /**
     * 删除菜单通过id
     *
     * @param menuId
     * @return
     */
    @Override
    public int deleteMenu(Long menuId) {
        return sysMenuMapper.deleteById(menuId);
    }

    /**
     * 修改菜单信息
     *
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public int updateMenu(SysMenu menu) {
        UpdateWrapper<SysMenu> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("menu_id", menu.getMenuId());
        return sysMenuMapper.update(menu, updateWrapper);
    }

    /**
     * 获取新增菜单最后的sort值
     *
     * @param parentId 父菜单id
     * @return 结果
     */
    @Override
    public Integer getMenuChildLastSort(Long parentId) {
        return sysMenuMapper.selectMenuChildLastSort(parentId);
    }

    /**
     * 获取首页动态图标名称
     *
     * @return 结果
     */
    @Override
    public String getHomeMenuIcon() {
        LambdaQueryWrapper<SysMenu> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(SysMenu::getName, "首页");
        SysMenu sysMenu = sysMenuMapper.selectOne(lambdaQueryWrapper);
        return sysMenu.getIcon();
    }

    /**
     * 修改菜单及所有子菜单的状态/显示状态
     *
     * @param menu 父菜单对象
     * @return
     */
    @Override
    public int changeStatusWithChildStatus(SysMenu menu) {
        List<SysMenu> menus = sysMenuMapper.selectList(null);
        List<SysMenu> menuList = getChildList(menus, menu);
        //把当前菜单也添加进去
        menuList.add(menu);
        return sysMenuMapper.updateBatchById(menuList, menu.getStatus(), menu.getVisible());
    }

    /**
     * 过滤菜单：遍历每个菜单项 menu，检查是否存在其他菜单项的 menuId 等于当前菜单项的 parentId。
     * 收集结果：如果不存在这样的菜单项，则认为当前菜单项是根菜单，将其加入结果列表。
     *
     * @param menus 菜单项 menu对象集合
     * @return
     */
    private List<SysMenu> findRootMenus(List<SysMenu> menus) {
        return menus.stream()
                .filter(menu -> menus.stream().noneMatch(m -> m.getMenuId().equals(menu.getParentId())))
                .collect(Collectors.toList());
    }

    /**
     * 1：创建一个空的子菜单列表 children。
     * 2：遍历所有菜单 allMenus。
     * 3：检查当前菜单 menu 的 parentId 是否等于 parentMenu 的 menuId。
     * 4：如果条件成立，将 menu 添加到 children 列表中。
     * 5：递归调用 addChildren 方法为 menu 添加子菜单。
     * 6：设置 parentMenu 的 children 属性为 children 列表。
     *
     * @param parentMenu 父菜单
     * @param allMenus   需要遍历的菜单对象集合
     */
    private void addChildren(SysMenu parentMenu, List<SysMenu> allMenus) {
        List<SysMenu> children = new ArrayList<>();
        for (SysMenu menu : allMenus) {
            if (menu.getParentId() != null && menu.getParentId().equals(parentMenu.getMenuId())) {
                children.add(menu);
                addChildren(menu, allMenus);
            }
        }
        parentMenu.setChildren(children);
    }
}
