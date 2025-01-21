package com.jcm.system.api;

import com.jcm.common.core.constant.SecurityConstants;
import com.jcm.common.core.constant.ServiceNameConstants;
import com.jcm.common.core.domain.R;
import com.jcm.system.api.domain.SysUser;
import com.jcm.system.api.factory.RemoteUserFallbackFactory;
import com.jcm.system.api.model.LoginUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * 用户服务
 *
 * @author junchenmo
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteUserService {
    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @param source   请求来源
     * @return 结果
     */
    @GetMapping("/user/info/{username}")
    public R<LoginUser> getUserInfo(@PathVariable("username") String username, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 注册用户信息
     *
     * @param sysUser 用户信息
     * @param source  请求来源
     * @return 结果
     */
    @PostMapping("/user/register")
    public R<Boolean> registerUserInfo(@RequestBody SysUser sysUser, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 修改用户最后登录时间和登录IP
     *
     * @param sysUser 用户信息
     * @param source  请求来源
     * @return 结果
     */
    @PutMapping("/user/changeLoginInfo")
    public R<Integer> changeLoginInfo(@RequestBody SysUser sysUser, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);
}
