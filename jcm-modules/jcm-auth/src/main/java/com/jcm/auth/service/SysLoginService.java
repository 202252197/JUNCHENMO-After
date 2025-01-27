package com.jcm.auth.service;

import com.jcm.common.core.constant.CacheConstants;
import com.jcm.common.core.constant.Constants;
import com.jcm.common.core.constant.SecurityConstants;
import com.jcm.common.core.constant.UserConstants;
import com.jcm.common.core.domain.R;
import com.jcm.common.core.enums.UserStatus;
import com.jcm.common.core.exception.ServiceException;
import com.jcm.common.core.text.Convert;
import cn.hutool.core.util.StrUtil;
import com.jcm.common.core.utils.ip.IpUtils;
import com.jcm.common.redis.service.RedisService;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.RemoteUserService;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.api.model.LoginUser;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 登录校验方法
 *
 * @author junchenmo
 */
@Component
@AllArgsConstructor
public class SysLoginService {
    private final RemoteUserService remoteUserService;
    private final SysRecordLogService recordLogService;

    private final SysPasswordService passwordService;
    private final RedisService redisService;

    /**
     * 登录
     */
    public LoginUser login(String username, String password) {
        // 用户名或密码为空 错误
        if (StrUtil.isAnyBlank(username, password)) {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户/密码必须填写");
            throw new ServiceException("用户/密码必须填写");
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户密码不在指定范围");
            throw new ServiceException("用户密码不在指定范围");
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户名不在指定范围");
            throw new ServiceException("用户名不在指定范围");
        }
        // IP黑名单校验
        String blackStr = Convert.toStr(redisService.getCacheObject(CacheConstants.SYS_LOGIN_BLACKIPLIST));
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr())) {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "很遗憾，访问IP已被列入系统黑名单");
            throw new ServiceException("很遗憾，访问IP已被列入系统黑名单");
        }
        // 查询用户信息
        R<LoginUser> userResult = remoteUserService.getUserInfo(username, SecurityConstants.INNER);

        if (StrUtil.isNull(userResult) || StrUtil.isNull(userResult.getData())) {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "登录用户不存在");
            throw new ServiceException("登录用户：" + username + " 不存在");
        }

        if (R.FAIL == userResult.getCode()) {
            throw new ServiceException(userResult.getMsg());
        }

        LoginUser userInfo = userResult.getData();
        SysUser sysUser = userResult.getData().getSysUser();
        if (UserStatus.DISABLE.getCode().equals(sysUser.getStatus().toString())) {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户已停用，请联系管理员");
            throw new ServiceException("对不起，您的账号：" + username + " 已停用");
        }
        passwordService.validate(sysUser, password);
        // 设置用户最后登录的时间和IP
        sysUser.setLoginDate(LocalDateTime.now());
        sysUser.setLoginIp(IpUtils.getHostIp());
        remoteUserService.changeLoginInfo(sysUser, SecurityConstants.INNER);
        recordLogService.recordLogininfor(username, Constants.LOGIN_SUCCESS, "登录成功");
        return userInfo;
    }

//    public void logout(String loginName)
//    {
//        recordLogService.recordLogininfor(loginName, Constants.LOGOUT, "退出成功");
//    }

    /**
     * 注册
     */
    public void register(String username, String password) {
        // 用户名或密码为空 错误
        if (StrUtil.isAnyBlank(username, password)) {
            throw new ServiceException("用户/密码必须填写");
        }
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            throw new ServiceException("账户长度必须在2到20个字符之间");
        }
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            throw new ServiceException("密码长度必须在5到20个字符之间");
        }

        // 注册用户信息
        SysUser sysUser = new SysUser();
        sysUser.setUsername(username);
        sysUser.setNickname(username);
        sysUser.setPassword(SecurityUtils.encryptPassword(password));
        R<?> registerResult = remoteUserService.registerUserInfo(sysUser, SecurityConstants.INNER);

        if (R.FAIL == registerResult.getCode()) {
            throw new ServiceException(registerResult.getMsg());
        }
//        recordLogService.recordLogininfor(username, Constants.REGISTER, "注册成功");
    }

    public void logout(String loginName) {
//        recordLogService.recordLogininfor(loginName, Constants.LOGOUT, "退出成功");
    }

}
