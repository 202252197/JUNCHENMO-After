package com.jcm.job.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.exception.job.TaskException;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.job.domain.SysJob;
import com.jcm.job.mapper.SysJobMapper;
import com.jcm.job.service.ISysJobService;
import com.jcm.job.util.ScheduleUtils;
import lombok.AllArgsConstructor;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.List;

/**
 * jobService业务层处理
 *
 * @author lvshihao
 * @date 2025-01-14
 */
@Service
@AllArgsConstructor
public class SysJobServiceImpl extends ServiceImpl<SysJobMapper, SysJob> implements ISysJobService {

    private final Scheduler scheduler;
    private final SysJobMapper sysJobMapper;

    /**
     * 项目启动时，初始化定时器 主要是防止手动修改数据库导致未同步到定时任务处理（注：不能手动修改数据库ID和任务组名，否则会导致脏数据）
     */
    @PostConstruct
    public void init() throws SchedulerException, TaskException
    {
        scheduler.clear();
        List<SysJob> jobList = sysJobMapper.selectList(null);
        for (SysJob job : jobList)
        {
            ScheduleUtils.createScheduleJob(scheduler, job);
        }
    }

    /**
     * 查询定时任务调度
     *
     * @param jobId 定时任务调度主键
     * @return 定时任务调度
     */
    @Override
    public SysJob selectSysJobByJobId(Long jobId)
    {
        return sysJobMapper.selectById(jobId);
    }

    /**
     * 查询定时任务调度列表
     *
     * @param sysJob 定时任务调度
     * @return 定时任务调度
     */
    @Override
    public List<SysJob> selectSysJobList(SysJob sysJob)
    {
        LambdaQueryWrapper<SysJob> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(SysJob::getJobId, SysJob::getJobName, SysJob::getJobGroup, SysJob::getInvokeTarget, SysJob::getCronExpression, SysJob::getMisfirePolicy, SysJob::getConcurrent, SysJob::getStatus, SysJob::getRemark, SysJob::getCreator, SysJob::getCreateTime, SysJob::getUpdater, SysJob::getUpdateTime,  SysJob::getDeleted );
        queryWrapper.like( StringUtils.isNotEmpty(sysJob.getJobName()) , SysJob::getJobName, sysJob.getJobName());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJob.getJobGroup()) , SysJob::getJobGroup, sysJob.getJobGroup());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJob.getInvokeTarget()) , SysJob::getInvokeTarget, sysJob.getInvokeTarget());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJob.getCronExpression()) , SysJob::getCronExpression, sysJob.getCronExpression());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJob.getMisfirePolicy()) , SysJob::getMisfirePolicy, sysJob.getMisfirePolicy());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJob.getConcurrent()) , SysJob::getConcurrent, sysJob.getConcurrent());
        queryWrapper.eq( StringUtils.isNotEmpty(sysJob.getStatus()) , SysJob::getStatus, sysJob.getStatus());
        return sysJobMapper.selectList(queryWrapper);
    }

    /**
     * 新增定时任务调度
     *
     * @param sysJob 定时任务调度
     * @return 结果
     */
    @Override
    public int insertSysJob(SysJob sysJob)
    {
        return sysJobMapper.insert(sysJob);
    }

    /**
     * 修改定时任务调度
     *
     * @param sysJob 定时任务调度
     * @return 结果
     */
    @Override
    public int updateSysJob(SysJob sysJob)
    {
        return sysJobMapper.updateById(sysJob);
    }

    /**
     * 批量删除定时任务调度
     *
     * @param jobIds 需要删除的定时任务调度主键
     * @return 结果
     */
    @Override
    public int deleteSysJobByJobIds(Long[] jobIds)
    {
        return sysJobMapper.deleteBatchIds(Arrays.asList(jobIds));
    }

    /**
     * 删除定时任务调度信息
     *
     * @param jobId 定时任务调度主键
     * @return 结果
     */
    @Override
    public int deleteSysJobByJobId(Long jobId)
    {
        return sysJobMapper.deleteById(jobId);
    }
}
