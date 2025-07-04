package com.jcm.common.security.interceptor;

import cn.hutool.core.util.ObjUtil;
import com.jcm.common.core.constant.SecurityConstants;
import com.jcm.common.core.context.SecurityContextHolder;
import com.jcm.common.core.utils.ServletUtils;
import cn.hutool.core.util.StrUtil;
import com.jcm.common.security.auth.AuthUtil;
import com.jcm.common.security.utils.SecurityUtils;
import com.jcm.system.api.model.LoginUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.AsyncHandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

/**
 * 自定义请求头拦截器，将Header数据封装到线程变量中方便获取
 * 注意：此拦截器会同时验证当前用户有效期自动刷新有效期
 *
 * @author junchenmo
 */
@Slf4j
public class HeaderInterceptor implements AsyncHandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }

        SecurityContextHolder.setUserId(ServletUtils.getHeader(request, SecurityConstants.DETAILS_USER_ID));
        SecurityContextHolder.setUserName(ServletUtils.getHeader(request, SecurityConstants.DETAILS_USERNAME));
        SecurityContextHolder.setUserKey(ServletUtils.getHeader(request, SecurityConstants.USER_KEY));

        String token = SecurityUtils.getToken();
        if (StrUtil.isNotEmpty(token)) {
            LoginUser loginUser = AuthUtil.getLoginUser(token);
            if (ObjUtil.isNotNull(loginUser)) {
                AuthUtil.verifyLoginUserExpire(loginUser);
                log.info("用户访问接口通过token设置的用户信息");
                Set<String> permissions = loginUser.getPermissions();
                permissions.forEach(permission -> log.info(permission));
                SecurityContextHolder.set(SecurityConstants.LOGIN_USER, loginUser);
            }
        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        SecurityContextHolder.remove();
    }
}
