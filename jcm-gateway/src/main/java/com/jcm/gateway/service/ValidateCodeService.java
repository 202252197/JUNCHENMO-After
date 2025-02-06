package com.jcm.gateway.service;

import com.jcm.common.core.exception.CaptchaException;
import com.jcm.common.core.web.domain.AjaxResult;

import java.io.IOException;

/**
 * 验证码处理
 *
 * @author 君尘陌
 */
public interface ValidateCodeService {
    /**
     * 生成验证码
     */
    AjaxResult createCaptcha() throws IOException, CaptchaException;

    /**
     * 校验验证码
     */
    void checkCaptcha(String key, String value) throws CaptchaException;
}
