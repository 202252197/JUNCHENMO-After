package com.jcm.auth.service;

import com.jcm.common.core.constant.CacheConstants;
import com.jcm.common.core.constant.Constants;
import com.jcm.common.core.exception.ServiceException;
import com.jcm.common.redis.service.RedisService;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.domain.SysUser;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * 登录密码方法
 *
 * @author junchenmo
 */
@Component
@AllArgsConstructor
public class SysPasswordService {
    private final RedisService redisService;
    private final SysRecordLogService recordLogService;

    private final int maxRetryCount = CacheConstants.PASSWORD_MAX_RETRY_COUNT;
    private final Long lockTime = CacheConstants.PASSWORD_LOCK_TIME;


    /**
     * 登录账户密码错误次数缓存键名
     *
     * @param username 用户名
     * @return 缓存键key
     */
    private String getCacheKey(String username) {
        return CacheConstants.PWD_ERR_CNT_KEY + username;
    }

    /**
     * 验证用户密码是否正确
     *
     * @param sysUser SysUser对象，包含用户信息
     * @param password 用户输入的密码
     * @throws ServiceException 如果密码错误次数达到最大重试次数或密码不匹配，则抛出此异常
     */
    public void validate(SysUser sysUser, String password) {
        // 获取用户名
        String username = sysUser.getUsername();

        // 从缓存中获取用户密码重试次数
        Integer retryCount = redisService.getCacheObject(getCacheKey(username));

        // 如果没有重试次数记录，则初始化为0
        if (retryCount == null) {
            retryCount = 0;
        }

        // 检查重试次数是否达到最大值
        if (retryCount >= Integer.valueOf(maxRetryCount).intValue()) {
            // 当重试次数达到最大值时，生成错误信息并抛出异常
            String errMsg = String.format("密码输入错误%s次，帐户锁定%s分钟", maxRetryCount, lockTime);
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL,errMsg);
            throw new ServiceException(errMsg);
        }

        // 检查密码是否匹配
        if (!matches(sysUser, password)) {
            // 如果密码不匹配，增加重试次数
            retryCount = retryCount + 1;
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, String.format("密码输入错误%s次", retryCount));
            // 更新缓存中的重试次数，并设置锁定时间
            redisService.setCacheObject(getCacheKey(username), retryCount, lockTime, TimeUnit.MINUTES);
            // 抛出异常提示密码错误
            throw new ServiceException("用户不存在/密码错误");
        } else {
            // 如果密码匹配，则清除登录记录缓存
            clearLoginRecordCache(username);
        }
    }


    public boolean matches(SysUser sysUser, String rawPassword) {
        return SecurityUtils.matchesPassword(rawPassword, sysUser.getPassword());
    }

    public void clearLoginRecordCache(String loginName) {
        if (redisService.hasKey(getCacheKey(loginName))) {
            redisService.deleteObject(getCacheKey(loginName));
        }
    }
}
