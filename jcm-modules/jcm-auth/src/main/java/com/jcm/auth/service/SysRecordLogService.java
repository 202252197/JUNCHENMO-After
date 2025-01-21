package com.jcm.auth.service;


import com.jcm.common.core.constant.Constants;
import com.jcm.common.core.constant.SecurityConstants;
import com.jcm.common.core.utils.ServletUtils;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.common.core.utils.ip.IpUtils;
import com.jcm.system.api.RemoteLogService;
import com.jcm.system.api.domain.SysLogininfor;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

/**
 * 记录日志方法
 *
 * @author junchenmo
 */
@Component
@AllArgsConstructor
public class SysRecordLogService {
    private final RemoteLogService remoteLogService;

    /**
     * 记录登录信息
     *
     * @param username 用户名
     * @param status   状态
     * @param message  消息内容
     * @return
     */
    public void recordLogininfor(String username, String status, String message) {
        HttpServletRequest request = ServletUtils.getRequest();

        SysLogininfor logininfor = new SysLogininfor();
        logininfor.setUserName(username);
        logininfor.setIpaddr(IpUtils.getIpAddr());
        String cityInfo = IpUtils.getCityInfo(IpUtils.getIpAddr());
        if (StringUtils.isNotEmpty(cityInfo) && cityInfo.split("\\|").length == 5) {
            String[] cityInfoArr = cityInfo.split("\\|");
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(cityInfoArr[0] + "-")
                    .append(cityInfoArr[2] + "-")
                    .append(cityInfoArr[3] + "-")
                    .append("(" + cityInfoArr[4] + ")");
            logininfor.setLoginLocation(stringBuffer.toString());
        }
        logininfor.setMsg(message);
        // 获取当前时间作为请求时间
        LocalDateTime requestTime = LocalDateTime.now();
        logininfor.setLoginTime(requestTime);

        // 从请求头中获取User-Agent信息来解析浏览器相关信息
        String userAgent = request.getHeader("User-Agent");
        String browserInfo = parseBrowserInfo(userAgent);
        logininfor.setBrowser(browserInfo);

        // 尝试获取操作系统相关信息（从User-Agent等信息中解析，简单示例，可能不准确）
        String operatingSystem = parseOperatingSystemInfo(userAgent);
        logininfor.setOs(operatingSystem);

        // 日志状态
        if (StringUtils.equalsAny(status, Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
            logininfor.setStatus(Constants.LOGIN_SUCCESS_STATUS);
        } else if (Constants.LOGIN_FAIL.equals(status)) {
            logininfor.setStatus(Constants.LOGIN_FAIL_STATUS);
        }
        remoteLogService.saveLogininfor(logininfor, SecurityConstants.INNER);
    }


    private String parseBrowserInfo(String userAgent) {
        if (userAgent == null) {
            return "未知浏览器";
        }
        // 简单示例，可根据实际需求使用更完善的解析库来准确判断浏览器类型和版本等信息
        if (userAgent.contains("Chrome")) {
            return "Chrome浏览器";
        } else if (userAgent.contains("Firefox")) {
            return "Firefox浏览器";
        } else if (userAgent.contains("Safari")) {
            return "Safari浏览器";
        }
        return "其他浏览器";
    }

    private String parseOperatingSystemInfo(String userAgent) {
        if (userAgent == null) {
            return "未知操作系统";
        }
        // 简单示例，可根据实际需求使用更完善的解析库来准确判断操作系统类型等信息
        if (userAgent.contains("Windows")) {
            return "Windows操作系统";
        } else if (userAgent.contains("Mac OS")) {
            return "Mac OS操作系统";
        } else if (userAgent.contains("Linux")) {
            return "Linux操作系统";
        }
        return "其他操作系统";
    }
}
