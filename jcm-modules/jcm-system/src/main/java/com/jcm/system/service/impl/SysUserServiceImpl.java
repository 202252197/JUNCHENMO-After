package com.jcm.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.exception.ServiceException;
import cn.hutool.core.util.StrUtil;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.domain.SysUserRole;
import com.jcm.system.domain.SysUserSetting;
import com.jcm.system.mapper.SysUserMapper;
import com.jcm.system.mapper.SysUserRoleMapper;
import com.jcm.system.service.ISysUserService;
import com.jcm.system.service.ISysUserSettingService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 吕世昊
 */
@Service
@AllArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    private final SysUserMapper sysUserMapper;
    private final SysUserRoleMapper sysUserRoleMapper;

    private final ISysUserSettingService sysUserSettingService;

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    @Override
    public SysUser selectUserByUserName(String userName) {
        return this.lambdaQuery().eq(SysUser::getUsername, userName).one();
    }

    /**
     * 根据ID查询用户信息
     *
     * @param userId 用户ID
     * @return 用户信息
     */
    @Override
    public SysUser selectUserById(Long userId) {
        return this.lambdaQuery()
                .select(SysUser.class, (e) -> !"password".equals(e.getColumn()))
                .eq(SysUser::getUserId, userId).one();
    }

    /**
     * 根据条件进行查找用户列表
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public List<SysUser> selectUserList(SysUser user) {
        return this.lambdaQuery().select(SysUser.class, (e) -> !"password".equals(e.getColumn()))
                .like(StrUtil.isNotEmpty(user.getUsername()), SysUser::getUsername, user.getUsername())
                .like(StrUtil.isNotEmpty(user.getNickname()), SysUser::getNickname, user.getNickname())
                .eq(ObjectUtil.isNotNull(user.getStatus()), SysUser::getStatus, user.getStatus())
                .like(StrUtil.isNotEmpty(user.getMobile()), SysUser::getMobile, user.getMobile())
                .like(StrUtil.isNotEmpty(user.getEmail()), SysUser::getEmail, user.getEmail()).list();
    }

    /**
     * 检查用户名是否重复
     *
     * @param user 用户
     * @return
     */
    @Override
    public boolean checkUserNameUnique(SysUser user) {
        List<SysUser> list = this.lambdaQuery().eq(StrUtil.isNotEmpty(user.getUsername()), SysUser::getUsername, user.getUsername()).list();
        return list.size() == 0;
    }

    /**
     * 检查手机号是否重复
     *
     * @param user 用户
     * @return
     */
    @Override
    public boolean checkPhoneUnique(SysUser user) {
        List<SysUser> list = this.lambdaQuery()
                .eq(StrUtil.isNotEmpty(user.getMobile()), SysUser::getMobile, user.getMobile())
                .eq(SysUser::getDeleted, 0)
                .list();
        return list.size() == 0;
    }

    /**
     * 检查邮箱是否重复
     *
     * @param user 用户
     * @return
     */
    @Override
    public boolean checkEmailUnique(SysUser user) {
        List<SysUser> list = this.lambdaQuery().eq(StrUtil.isNotEmpty(user.getEmail()), SysUser::getEmail, user.getEmail()).list();
        return list.size() == 0;
    }

    /**
     * 新增用户
     *
     * @param user 用户
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insertUser(SysUser user) {
        SysUserSetting sysUserSetting = new SysUserSetting();
        int insert = sysUserMapper.insert(user);
        sysUserSetting.setUserId(user.getUserId());
        sysUserSettingService.insertUserSetting(sysUserSetting);
        return insert;
    }

    /**
     * 禁用用户账号
     *
     * @param userId
     */
    @Override
    public int disableUser(Long userId) {
        UpdateWrapper<SysUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("user_id", userId).set("status", UserConstants.USER_DISABLE);
        return sysUserMapper.update(null, updateWrapper);
    }

    /**
     * 删除用户
     *
     * @param userId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteUser(Long userId) {
        sysUserRoleMapper.deleteUserRoleByUserId(userId);
        return sysUserMapper.deleteById(userId);
    }

    /**
     * 重置密码
     *
     * @param user
     * @return
     */
    @Override
    public int resetUserPassword(SysUser user) {
        UpdateWrapper<SysUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("user_id", user.getUserId()).set("password", user.getPassword());
        return sysUserMapper.update(null, updateWrapper);
    }

    /**
     * 校验用户是否允许操作
     *
     * @param userId 用户信息id
     */
    @Override
    public void checkUserAllowed(Long userId) {
        if (ObjectUtil.isNotNull(userId) && 1L == userId) {
            throw new ServiceException("不允许操作超级管理员用户");
        }
    }


    /**
     * 修改保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int updateUser(SysUser user) {
        UpdateWrapper<SysUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("user_id", user.getUserId())
                .set("nickname", user.getNickname())
                .set("mobile", user.getMobile())
                .set("email", user.getEmail());
        return sysUserMapper.update(null, updateWrapper);
    }

    /**
     * 修改用户最后登录时间和IP
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public int changeLoginInfo(SysUser user) {
        UpdateWrapper<SysUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("user_id", user.getUserId())
                .set("login_ip", user.getLoginIp())
                .set("login_date", user.getLoginDate());
        return sysUserMapper.update(null, updateWrapper);
    }

    /**
     * 用户授权角色
     *
     * @param userId  用户ID
     * @param roleIds 角色组
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertUserAuth(Long userId, Long[] roleIds) {
        sysUserRoleMapper.deleteUserRoleByUserId(userId);
        return insertUserRole(userId, roleIds);
    }

    @Override
    public List<SysUser> selectUserAll() {
        LambdaQueryWrapper<SysUser> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.select(SysUser::getUserId, SysUser::getUsername);
        lambdaQueryWrapper.eq(SysUser::getDeleted, 0);
        lambdaQueryWrapper.eq(SysUser::getStatus, UserConstants.USER_NORMAL);
        return baseMapper.selectList(lambdaQueryWrapper);
    }


    /**
     * 新增用户角色信息
     *
     * @param userId  用户ID
     * @param roleIds 角色组
     */
    public int insertUserRole(Long userId, Long[] roleIds) {
        if (ObjectUtil.isEmpty(roleIds)) {
            return 0;
        }
        // 新增用户与角色管理
        List<SysUserRole> list = new ArrayList<SysUserRole>();
        for (Long roleId : roleIds) {
            SysUserRole ur = new SysUserRole();
            ur.setUserId(userId);
            ur.setRoleId(roleId);
            list.add(ur);
        }
        return sysUserRoleMapper.batchUserRole(list);
    }

}
