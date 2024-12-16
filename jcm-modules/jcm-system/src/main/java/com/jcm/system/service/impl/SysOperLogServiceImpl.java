package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
        return this.lambdaQuery().list();
    }

    @Override
    public int deleteOperLog(List<Long> operIds) {
        return sysOperLogMapper.deleteByIds(operIds);
    }

}
