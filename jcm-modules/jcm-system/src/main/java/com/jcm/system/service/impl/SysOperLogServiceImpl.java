package com.jcm.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.system.api.domain.SysOperLog;
import com.jcm.system.mapper.SysOperLogMapper;
import com.jcm.system.service.ISysOperLogService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

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
    public int insertOperlog(SysOperLog operLog) {
        return sysOperLogMapper.insert(operLog);
    }

    @Override
    public List<SysOperLog> selectOperLogList(SysOperLog sysOperLog) {
        LambdaQueryChainWrapper<SysOperLog> queryChainWrapper = this.lambdaQuery()
                .eq(StrUtil.isNotEmpty(sysOperLog.getOperName()), SysOperLog::getOperName, sysOperLog.getOperName())
                .eq(StrUtil.isNotEmpty(sysOperLog.getTitle()), SysOperLog::getTitle, sysOperLog.getTitle())
                .eq(StrUtil.isNotEmpty(sysOperLog.getBusinessName()), SysOperLog::getBusinessName, sysOperLog.getBusinessName())
                .eq(ObjectUtil.isNotNull(sysOperLog.getStatus()), SysOperLog::getStatus, sysOperLog.getStatus())
                .orderByDesc(SysOperLog::getRequestTime);
        if (Objects.nonNull(sysOperLog.getParams())) {
            queryChainWrapper.ge(ObjectUtil.isNotNull(sysOperLog.getParams().get("beginRequestTime")), SysOperLog::getRequestTime, sysOperLog.getParams().get("beginRequestTime"))
                    .le(Objects.nonNull(sysOperLog.getParams()) && ObjectUtil.isNotNull(sysOperLog.getParams().get("endRequestTime")), SysOperLog::getRequestTime, sysOperLog.getParams().get("endRequestTime"));
        }

        return queryChainWrapper.list();
    }

    @Override
    public int deleteOperLog(List<Long> operIds) {
        return sysOperLogMapper.deleteBatchIds(operIds);
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
