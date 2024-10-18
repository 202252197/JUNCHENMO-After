package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.utils.StringUtils;
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
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-04-01
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
    public Set<String> selectMenuPermsByUserId(Long userId){
        return  sysMenuMapper.selectMenuPermsByUserId(userId).stream()
                .filter(StringUtils::isNotEmpty).map(String::trim).collect(Collectors.toSet());
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
            router.setComponent(menu.getComponent());
            router.setMeta(new MetaVo(menu.getName(),menu.getVisible(),menu.getIsFrame(),menu.getIcon(), menu.getKeepAlive()));
            List<SysMenu> cMenus = menu.getChildren();


            if(isHttp(menu)){
                router.setPath(menu.getPath());
            }else{
                //如果是目录
                if (UserConstants.TYPE_DIR.equals(String.valueOf(menu.getType()))){
                    router.setPath(getPath(menu.getPath()));
                }

                //如果是菜单
                if(UserConstants.TYPE_MENU.equals(String.valueOf(menu.getType()))) {
                    router.setPath(getPath(parentPath)+getPath(menu.getPath()));
                }
            }

            //如果还有子菜单，递归
            if(StringUtils.isNotEmpty(cMenus)) {
                router.setChildren(buildMenus(cMenus,menu.getPath()));
            }
            //如果父id是根路径
            if(menu.getParentId()==0){
                router.setComponent(UserConstants.LAYOUT);
            }

            routers.add(router);
        }
        return routers;
    }



    private static boolean isHttp(SysMenu menu) {
        return menu.getPath().startsWith("http://") || menu.getPath().startsWith("https://");
    }

    /**
     * 构建路由的Path
     * @param menu 路由对象
     * @return 路由Path
     */
    private static String getPath(String menu) {
        return "/"+menu.replaceAll("/","");
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
            menus = sysMenuMapper.selectMenuTreeAll();
        } else {
            menus = sysMenuMapper.selectMenuTreeByUserId(userId);
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
                .like(StringUtils.isNotEmpty(sysMenu.getName()), SysMenu::getName, sysMenu.getName())
                .eq(Objects.nonNull(sysMenu.getStatus()), SysMenu::getStatus, sysMenu.getStatus())
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

    private List<SysMenu> findRootMenus(List<SysMenu> menus) {
        return menus.stream()
                .filter(menu -> menus.stream().noneMatch(m -> m.getMenuId().equals(menu.getParentId())))
                .collect(Collectors.toList());
    }

    private void addChildren(SysMenu parentMenu, List<SysMenu> allMenus) {
        List<SysMenu> children = new ArrayList<>();
        for (SysMenu menu : allMenus) {
            if (menu.getParentId()!= null && menu.getParentId().equals(parentMenu.getMenuId())) {
                children.add(menu);
                addChildren(menu, allMenus);
            }
        }
        parentMenu.setChildren(children);
    }
}
