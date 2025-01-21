package com.jcm.common.core.constant;

/**
 * 用户常量信息
 *
 * @author junchenmo
 */
public class UserConstants {
    /**
     * 平台内系统用户的唯一标志
     */
    public static final String SYS_USER = "SYS_USER";

    /**
     * 用户正常状态
     */
    public static final String USER_NORMAL = "0";

    /**
     * 用户封禁状态
     */
    public static final String USER_DISABLE = "1";

    /**
     * Layout组件标识
     */
    public final static String LAYOUT = "Layout";

    /**
     * 校验是否唯一的返回标识
     */
    public final static boolean UNIQUE = true;
    public final static boolean NOT_UNIQUE = false;

    /**
     * 用户名长度限制
     */
    public static final int USERNAME_MIN_LENGTH = 2;

    public static final int USERNAME_MAX_LENGTH = 20;

    /**
     * 密码长度限制
     */
    public static final int PASSWORD_MIN_LENGTH = 5;

    public static final int PASSWORD_MAX_LENGTH = 20;
}
