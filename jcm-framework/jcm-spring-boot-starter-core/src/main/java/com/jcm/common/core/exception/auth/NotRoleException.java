package com.jcm.common.core.exception.auth;


import cn.hutool.core.util.StrUtil;

/**
 * 未能通过的角色认证异常
 *
 * @author junchenmo
 */
public class NotRoleException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public NotRoleException(String role) {
        super(role);
    }

    public NotRoleException(String[] roles) {
        super(StrUtil.join(",",roles));
    }
}
