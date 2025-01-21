package com.jcm.common.core.utils;

public class HttpUtil {

    public static boolean isHttpWithHttps(String url) {
        return (url.indexOf("http://") != -1 || url.indexOf("https://") != -1);
    }

    public static boolean isNotHttpWithHttps(String url) {
        return !(url.indexOf("http://") != -1 || url.indexOf("https://") != -1);
    }
}
