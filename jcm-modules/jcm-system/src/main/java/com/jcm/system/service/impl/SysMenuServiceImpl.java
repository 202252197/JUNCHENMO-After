package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.domain.SysPermission;
import com.jcm.system.api.domain.SysRole;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.domain.vo.MetaVo;
import com.jcm.system.domain.vo.RouterVo;
import com.jcm.system.mapper.SysPermissionMapper;
import com.jcm.system.service.ISysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
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
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements ISysPermissionService {
    @Autowired
    private SysRoleServiceImpl sysRoleService;
    @Autowired
    private SysPermissionMapper sysPermissionMapper;

    /**
     * 获取角色数据权限
     *
     * @param user 用户
     * @return 角色权限信息
     */
    @Override
    public Set<String> getRolePermission(SysUser user) {
        Set<String> roles = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin()) {
            roles.add("admin");
        } else {
            sysRoleService.selectRolePermissionByUserId(user.getId()).stream()
                    .map(SysRole::getCode).filter(StringUtils::isNotNull)
                    .map(String::trim).forEach(roles::add);
        }
        return roles;
    }

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
            perms.addAll(selectMenuPermsByUserId(sysUser.getId()));
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
        return  sysPermissionMapper.selectMenuPermsByUserId(userId).stream()
                .filter(StringUtils::isNotEmpty).map(String::trim).collect(Collectors.toSet());
    }

    /**
     * 构建前端路由所需要的菜单
     *
     * @param menus 菜单列表
     * @return 路由列表
     */
    @Override
    public List<RouterVo> buildMenus(List<SysPermission> menus,String parentPath) {
        List<RouterVo> routers = new LinkedList<RouterVo>();
        for (SysPermission menu : menus) {
            RouterVo router = new RouterVo();
            router.setName(menu.getComponentName());
            router.setComponent(menu.getComponent());
            router.setMeta(new MetaVo(menu.getName(),menu.getVisible(),menu.getIcon(), menu.getKeepAlive()));
            List<SysPermission> cMenus = menu.getChildren();

            //如果是目录
            if (UserConstants.TYPE_DIR.equals(String.valueOf(menu.getType()))){
                router.setPath(getPath(menu.getPath()));
            }

            //如果是菜单
            if(UserConstants.TYPE_MENU.equals(String.valueOf(menu.getType()))) {
                router.setPath(getPath(parentPath)+getPath(menu.getPath()));
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
    public List<SysPermission> selectMenuTreeByUserId(Long userId) {
        List<SysPermission> menus = null;
        if (SecurityUtils.isAdmin(userId)) {
            menus = sysPermissionMapper.selectMenuTreeAll();
        } else {
            menus = sysPermissionMapper.selectMenuTreeByUserId(userId);
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
    public List<SysPermission> getChildPerms(List<SysPermission> list, int parentId) {
        List<SysPermission> returnList = new ArrayList<SysPermission>();
        for (Iterator<SysPermission> iterator = list.iterator(); iterator.hasNext(); ) {
            SysPermission t = (SysPermission) iterator.next();
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
    private void recursionFn(List<SysPermission> list, SysPermission t) {
        // 得到子节点列表
        List<SysPermission> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysPermission tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysPermission> list, SysPermission t) {
        return getChildList(list, t).size() > 0;
    }


    /**
     * 得到子节点列表
     */
    private List<SysPermission> getChildList(List<SysPermission> list, SysPermission t) {
        List<SysPermission> tlist = new ArrayList<SysPermission>();
        Iterator<SysPermission> it = list.iterator();
        while (it.hasNext()) {
            SysPermission n = (SysPermission) it.next();
            if (n.getParentId().longValue() == t.getId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }
}
