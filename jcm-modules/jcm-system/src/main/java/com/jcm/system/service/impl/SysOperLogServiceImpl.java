package com.jcm.system.service.impl;

import com.jcm.system.api.domain.SysOperLog;
import com.jcm.system.mapper.SysOperLogMapper;
import com.jcm.system.service.ISysOperLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 操作日志记录 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-05-03
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
}
