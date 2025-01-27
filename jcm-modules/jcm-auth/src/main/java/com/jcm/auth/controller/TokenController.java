package com.jcm.auth.controller;

import com.jcm.auth.form.LoginBody;
import com.jcm.auth.service.SysLoginService;
import com.jcm.common.core.domain.R;
import com.jcm.common.core.utils.JwtUtils;
import cn.hutool.core.util.StrUtil;
import com.jcm.common.security.auth.AuthUtil;
import com.jcm.common.security.service.TokenService;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.model.LoginUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


/**
 * 令牌控制器
 *
 * @author junchenmo
 * @date 2025/01/19 09:57
 */
@Api(tags = "认证服务")
@RestController
@AllArgsConstructor
public class TokenController {
    private final TokenService tokenService;

    private final SysLoginService sysLoginService;

    @ApiOperation(value = "用户登录", notes = "登录用户并创建JWT TOKEN返回")
    @PostMapping("/login")
    public R<?> login(@RequestBody LoginBody form) {
        // 用户登录
        LoginUser userInfo = sysLoginService.login(form.getUsername(), form.getPassword());
        // 获取登录token
        return R.ok(tokenService.createToken(userInfo));
    }

    @ApiOperation(value = "用户登出", notes = "退出登录，删除TOKEN")
    @DeleteMapping("/logout")
    public R<?> logout(HttpServletRequest request) {
        String token = SecurityUtils.getToken(request);
        if (StrUtil.isNotEmpty(token)) {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
        }
        return R.ok();
    }

}
