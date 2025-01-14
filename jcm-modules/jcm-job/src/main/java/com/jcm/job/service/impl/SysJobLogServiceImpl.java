package com.jcm.job.service.impl;

import java.util.List;
import java.util.Arrays;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import lombok.AllArgsConstructor;
import com.jcm.common.core.utils.DateUtils;
import org.springframework.stereotype.Service;
import com.jcm.job.mapper.SysJobLogMapper;
import com.jcm.job.domain.SysJobLog;
import com.jcm.job.service.ISysJobLogService;

/**
 * logService业务层处理
 *
 * @author lvshihao
 * @date 2025-01-14
 */
@Service
@AllArgsConstructor
public class SysJobLogServiceImpl extends ServiceImpl<SysJobLogMapper, SysJobLog> implements ISysJobLogService {

    private final SysJobLogMapper sysJobLogMapper;

    /**
     * 查询定时任务调度日志
     *
     * @param jobLogId 定时任务调度日志主键
     * @return 定时任务调度日志
     */
    @Override
    public SysJobLog selectSysJobLogByJobLogId(Long jobLogId)
    {
        return sysJobLogMapper.selectById(jobLogId);
    }

    /**
     * 查询定时任务调度日志列表
     *
     * @param sysJobLog 定时任务调度日志
     * @return 定时任务调度日志
     */
    @Override
    public List<SysJobLog> selectSysJobLogList(SysJobLog sysJobLog)
    {
        LambdaQueryWrapper<SysJobLog> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(SysJobLog::getJobLogId, SysJobLog::getJobName, SysJobLog::getJobGroup, SysJobLog::getInvokeTarget, SysJobLog::getJobMessage, SysJobLog::getStatus, SysJobLog::getExceptionInfo, SysJobLog::getRemark, SysJobLog::getCreator, SysJobLog::getCreateTime, SysJobLog::getUpdater, SysJobLog::getUpdateTime,  SysJobLog::getDeleted );
        queryWrapper.like( StringUtils.isNotEmpty(sysJobLog.getJobName()) , SysJobLog::getJobName, sysJobLog.getJobName());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJobLog.getJobGroup()) , SysJobLog::getJobGroup, sysJobLog.getJobGroup());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJobLog.getInvokeTarget()) , SysJobLog::getInvokeTarget, sysJobLog.getInvokeTarget());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJobLog.getJobMessage()) , SysJobLog::getJobMessage, sysJobLog.getJobMessage());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJobLog.getStatus()) , SysJobLog::getStatus, sysJobLog.getStatus());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJobLog.getExceptionInfo()) , SysJobLog::getExceptionInfo, sysJobLog.getExceptionInfo());
        queryWrapper.eq( StringUtils.isNotNull(sysJobLog.getCreateTime()), SysJobLog::getCreateTime, sysJobLog.getCreateTime());
        return sysJobLogMapper.selectList(queryWrapper);
    }

    /**
     * 新增定时任务调度日志
     *
     * @param sysJobLog 定时任务调度日志
     * @return 结果
     */
    @Override
    public int insertSysJobLog(SysJobLog sysJobLog)
    {
        return sysJobLogMapper.insert(sysJobLog);
    }

    /**
     * 修改定时任务调度日志
     *
     * @param sysJobLog 定时任务调度日志
     * @return 结果
     */
    @Override
    public int updateSysJobLog(SysJobLog sysJobLog)
    {
        return sysJobLogMapper.updateById(sysJobLog);
    }

    /**
     * 批量删除定时任务调度日志
     *
     * @param jobLogIds 需要删除的定时任务调度日志主键
     * @return 结果
     */
    @Override
    public int deleteSysJobLogByJobLogIds(Long[] jobLogIds)
    {
        return sysJobLogMapper.deleteBatchIds(Arrays.asList(jobLogIds));
    }

    /**
     * 删除定时任务调度日志信息
     *
     * @param jobLogId 定时任务调度日志主键
     * @return 结果
     */
    @Override
    public int deleteSysJobLogByJobLogId(Long jobLogId)
    {
        return sysJobLogMapper.deleteById(jobLogId);
    }
}
