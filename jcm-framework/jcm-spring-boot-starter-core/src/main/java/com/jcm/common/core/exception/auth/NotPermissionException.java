package com.jcm.common.core.exception.auth;


import cn.hutool.core.util.StrUtil;

/**
 * 未能通过的权限认证异常
 *
 * @author junchenmo
 */
public class NotPermissionException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public NotPermissionException(String permission) {
        super(permission);
    }

    public NotPermissionException(String[] permissions) {
        super(StrUtil.join(",",permissions));
    }
}
