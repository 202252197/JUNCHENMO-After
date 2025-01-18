package com.jcm.job.service;

import com.jcm.job.domain.SysJobLog;

import java.util.List;

/**
 * logService接口
 * 
 * @author lvshihao
 * @date 2025-01-14
 */
public interface ISysJobLogService 
{
    /**
     * 查询定时任务调度日志
     * 
     * @param jobLogId 定时任务调度日志主键
     * @return 定时任务调度日志
     */
    public SysJobLog selectSysJobLogByJobLogId(Long jobLogId);

    /**
     * 查询定时任务调度日志列表
     * 
     * @param sysJobLog 定时任务调度日志
     * @return 定时任务调度日志集合
     */
    public List<SysJobLog> selectSysJobLogList(SysJobLog sysJobLog);

    /**
     * 新增定时任务调度日志
     * 
     * @param sysJobLog 定时任务调度日志
     * @return 结果
     */
    public int insertSysJobLog(SysJobLog sysJobLog);

    /**
     * 批量删除定时任务调度日志
     * 
     * @param jobLogIds 需要删除的定时任务调度日志主键集合
     * @return 结果
     */
    public int deleteSysJobLogByJobLogIds(Long[] jobLogIds);

    /**
     * 删除定时任务调度日志信息
     * 
     * @param jobLogId 定时任务调度日志主键
     * @return 结果
     */
    public int deleteSysJobLogByJobLogId(Long jobLogId);
    /**
     * 清空全部定时任务调度日志
     *
     * @return 结果
     */
    int clearOperLog();
}
