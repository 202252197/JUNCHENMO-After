package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.api.domain.SysUser;
import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysUserService extends IService<SysUser> {
    /**
     * 通过用户名查询用户
     *
     * @param username 用户名
     * @return 用户对象信息
     */
    public SysUser selectUserByUserName(String username);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysUser selectUserById(Long userId);

    /**
     * 根据条件分页查询用户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<SysUser> selectUserList(SysUser user);

    /**
     * 检查用户名是否独有
     * @param user 用户
     * @return 是或否
     */
    boolean checkUserNameUnique(SysUser user);

    /**
     * 检查手机号是否独有
     * @param user 用户
     * @return 是或否
     */
    boolean checkPhoneUnique(SysUser user);

    /**
     * 检查邮箱是否独有
     * @param user 用户
     * @return 是或否
     */
    boolean checkEmailUnique(SysUser user);

    /**
     * 添加用户
     * @param user 用户
     * @return 成功的记录数
     */
    int insertUser(SysUser user);


    /**
     * 禁用用户账号
     * @param userId
     * @return
     */
    int disableUser(Long userId);


    /**
     * 根据ID删除用户
     * @param userId
     * @return
     */
    int deleteUser(Long userId);

    /**
     * 根据用户ID重置密码
     * @param user
     * @return
     */
    int resetUserPassword(SysUser user);

    /**
     * 校验用户是否允许操作
     *
     * @param user 用户信息
     */
     void checkUserAllowed(Long user);

    /**
     * 修改用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    int updateUser(SysUser user);

    /**
     * 修改用户最后登录时间和登录IP
     *
     * @param sysUser 用户信息
     * @return 结果
     */
    int changeLoginInfo(SysUser sysUser);

    /**
     * 用户授权角色
     *
     * @param userId 用户ID
     * @param roleIds 角色组
     */
    int insertUserAuth(Long userId, Long[] roleIds);

    List<SysUser> selectUserAll();
}
