package com.jcm.common.log.service;

import com.jcm.common.core.constant.SecurityConstants;
import com.jcm.system.api.RemoteLogService;
import com.jcm.system.api.domain.SysOperLog;
import lombok.AllArgsConstructor;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * 异步调用日志服务
 * 
 * @author junchenmo
 */
@Service
@AllArgsConstructor
public class AsyncLogService
{
    private final RemoteLogService remoteLogService;

    /**
     * 保存系统日志记录
     */
    @Async
    public void saveSysLog(SysOperLog sysOperLog) throws Exception
    {
        remoteLogService.saveLog(sysOperLog, SecurityConstants.INNER);
    }
}
