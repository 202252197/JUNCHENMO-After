package com.jcm.job.service;

import com.jcm.job.domain.SysJob;

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
    public int updateSysJob(SysJob sysJob);

    /**
     * 批量删除定时任务调度
     * 
     * @param jobIds 需要删除的定时任务调度主键集合
     * @return 结果
     */
    public int deleteSysJobByJobIds(Long[] jobIds);

    /**
     * 删除定时任务调度信息
     * 
     * @param jobId 定时任务调度主键
     * @return 结果
     */
    public int deleteSysJobByJobId(Long jobId);
}
