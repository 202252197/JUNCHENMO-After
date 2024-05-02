package com.jcm.auth.controller;

import com.jcm.auth.form.LoginBody;
import com.jcm.auth.service.SysLoginService;
import com.jcm.common.core.domain.R;
import com.jcm.common.core.utils.JwtUtils;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.common.security.auth.AuthUtil;
import com.jcm.common.security.service.TokenService;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.model.LoginUser;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@Tag(name="认证服务")
@RestController
@AllArgsConstructor
public class TokenController {
    private final TokenService tokenService;

    private final SysLoginService sysLoginService;

    @Operation(summary = "用户登录",description = "登录用户并创建JWT TOKEN返回")
    @PostMapping("/login")
    public R<?> login(@RequestBody LoginBody form) {
        // 用户登录
        LoginUser userInfo = sysLoginService.login(form.getUsername(), form.getPassword());
        // 获取登录token
        return R.ok(tokenService.createToken(userInfo));
    }

    @Operation(summary = "用户登出",description = "退出登录，删除TOKEN")
    @DeleteMapping("/logout")
    public R<?> logout(HttpServletRequest request) {
        String token = SecurityUtils.getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
        }
        return R.ok();
    }

}
