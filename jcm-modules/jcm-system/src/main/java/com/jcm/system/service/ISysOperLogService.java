package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.api.domain.SysOperLog;

import java.util.List;

/**
 * <p>
 * 操作日志记录 服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysOperLogService extends IService<SysOperLog> {

    /**
     * 新增操作日志
     *
     * @param operLog 操作日志对象
     * @return 结果
     */
    int insertOperlog(SysOperLog operLog);

    List<SysOperLog> selectOperLogList(SysOperLog sysOperLog);

    int deleteOperLog(List<Long> operIds);
}
