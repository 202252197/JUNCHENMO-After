package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.system.api.domain.SysOperLog;
import com.jcm.system.mapper.SysOperLogMapper;
import com.jcm.system.service.ISysOperLogService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 吕世昊
 */
@Service
@AllArgsConstructor
public class SysOperLogServiceImpl extends ServiceImpl<SysOperLogMapper, SysOperLog> implements ISysOperLogService {

    private final SysOperLogMapper sysOperLogMapper;

    /**
     * 新增操作日志
     *
     * @param operLog 操作日志对象
     * @return 结果
     */
    @Override
    public int insertOperlog(SysOperLog operLog)
    {
        return sysOperLogMapper.insert(operLog);
    }

    @Override
    public List<SysOperLog> selectOperLogList(SysOperLog sysOperLog) {
        return this.lambdaQuery()
                .eq(StringUtils.isNotEmpty(sysOperLog.getOperName()),SysOperLog::getOperName,sysOperLog.getOperName())
                .eq(StringUtils.isNotEmpty(sysOperLog.getTitle()),SysOperLog::getTitle,sysOperLog.getTitle())
                .eq(StringUtils.isNotEmpty(sysOperLog.getBusinessName()),SysOperLog::getBusinessName,sysOperLog.getBusinessName())
                .eq(StringUtils.isNotNull(sysOperLog.getStatus()),SysOperLog::getStatus,sysOperLog.getStatus())
                .ge(StringUtils.isNotNull(sysOperLog.getParams().get("requestTimeBeginTime")),SysOperLog::getRequestTime,sysOperLog.getParams().get("requestTimeBeginTime"))
                .le(StringUtils.isNotNull(sysOperLog.getParams().get("requestTimeEndTime")),SysOperLog::getRequestTime,sysOperLog.getParams().get("requestTimeEndTime"))
                .orderByDesc(SysOperLog::getRequestTime)
                .list();
    }

    @Override
    public int deleteOperLog(List<Long> operIds) {
        return sysOperLogMapper.deleteByIds(operIds);
    }

    @Override
    public int clearOperLog() {
        sysOperLogMapper.clearOperLog();
        return 1;
    }

    @Override
    public List<String> nameOptionSelect() {
        return sysOperLogMapper.nameOptionSelect();
    }

    @Override
    public List<String> titleOptionSelect() {
        return sysOperLogMapper.titleOptionSelect();
    }

    @Override
    public List<String> businessNameOptionSelectByTitle(String title) {
        return sysOperLogMapper.businessNameOptionSelectByTitle(title);
    }

}
