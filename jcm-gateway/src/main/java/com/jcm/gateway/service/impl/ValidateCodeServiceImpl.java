package com.jcm.gateway.service.impl;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.google.code.kaptcha.Producer;
import com.jcm.common.core.constant.CacheConstants;
import com.jcm.common.core.constant.Constants;
import com.jcm.common.core.exception.CaptchaException;
import com.jcm.common.core.web.domain.AjaxResult;
import com.jcm.common.redis.service.RedisService;
import com.jcm.gateway.config.properties.CaptchaProperties;
import com.jcm.gateway.service.ValidateCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FastByteArrayOutputStream;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * 验证码实现处理
 *
 * @author 君尘陌
 */
@Service
public class ValidateCodeServiceImpl implements ValidateCodeService {
    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private RedisService redisService;

    @Autowired
    private CaptchaProperties captchaProperties;

    /**
     * 生成验证码
     */
    @Override
    public AjaxResult createCaptcha() throws IOException, CaptchaException {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = captchaProperties.getEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled) {
            return ajax;
        }

        // 保存验证码信息
        String uuid = IdUtil.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        String capStr = null, code = null;
        BufferedImage image = null;

        String captchaType = captchaProperties.getType();
        // 生成验证码
        if ("math".equals(captchaType)) {
            String capText = captchaProducerMath.createText();
            capStr = capText.substring(0, capText.lastIndexOf("@"));
            code = capText.substring(capText.lastIndexOf("@") + 1);
            image = captchaProducerMath.createImage(capStr);
        } else if ("char".equals(captchaType)) {
            capStr = code = captchaProducer.createText();
            image = captchaProducer.createImage(capStr);
        }
        //设置验证码的超时时间是2分钟
        redisService.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try {
            ImageIO.write(image, "jpg", os);
        } catch (IOException e) {
            return AjaxResult.error(e.getMessage());
        }

        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }

    /**
     * 校验验证码
     */
    @Override
    public void checkCaptcha(String code, String uuid) throws CaptchaException {
        if (StrUtil.isEmpty(code)) {
            throw new CaptchaException("验证码不能为空");
        }
        if (StrUtil.isEmpty(uuid)) {
            throw new CaptchaException("验证码已失效");
        }
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisService.getCacheObject(verifyKey);
        redisService.deleteObject(verifyKey);

        if (!code.equalsIgnoreCase(captcha)) {
            throw new CaptchaException("验证码错误");
        }
    }
}
