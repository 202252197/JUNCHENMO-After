package com.jcm.job.service;

import com.jcm.common.core.exception.job.TaskException;
import com.jcm.job.domain.SysJob;
import org.quartz.SchedulerException;

import java.util.List;

/**
 * jobService接口
 * 
 * @author lvshihao
 * @date 2025-01-14
 */
public interface ISysJobService 
{
    /**
     * 查询定时任务调度
     * 
     * @param jobId 定时任务调度主键
     * @return 定时任务调度
     */
    public SysJob selectSysJobByJobId(Long jobId);

    /**
     * 查询定时任务调度列表
     * 
     * @param sysJob 定时任务调度
     * @return 定时任务调度集合
     */
    public List<SysJob> selectSysJobList(SysJob sysJob);

    /**
     * 新增定时任务调度
     * 
     * @param sysJob 定时任务调度
     * @return 结果
     */
    public int insertSysJob(SysJob sysJob);

    /**
     * 修改定时任务调度
     * 
     * @param sysJob 定时任务调度
     * @return 结果
     */
    public int updateSysJob(SysJob sysJob) throws SchedulerException, TaskException;

    /**
     * 批量删除定时任务调度
     * 
     * @param jobIds 需要删除的定时任务调度主键集合
     * @return 结果
     */
    public void deleteSysJobByJobIds(Long[] jobIds) throws SchedulerException;

    /**
     * 删除定时任务调度信息
     * 
     * @param jobId 定时任务调度主键
     * @return 结果
     */
    public int deleteSysJobByJobId(Long jobId);

    /**
     * 立即运行任务
     *
     * @param job 调度信息
     * @return 结果
     */
    public boolean run(SysJob job) throws SchedulerException;

    /**
     * 删除任务后，所对应的trigger也将被删除
     *
     * @param job 调度信息
     * @return 结果
     */
    public int deleteJob(SysJob job) throws SchedulerException;

    /**
     * 任务调度状态修改
     *
     * @param job 调度信息
     * @return 结果
     */
    public int changeStatus(SysJob job) throws SchedulerException;

    /**
     * 暂停任务
     *
     * @param job 调度信息
     * @return 结果
     */
    public int pauseJob(SysJob job) throws SchedulerException;

    /**
     * 恢复任务
     *
     * @param job 调度信息
     * @return 结果
     */
    public int resumeJob(SysJob job) throws SchedulerException;
}
