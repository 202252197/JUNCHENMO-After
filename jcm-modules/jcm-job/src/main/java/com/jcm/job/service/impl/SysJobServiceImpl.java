package com.jcm.job.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.constant.ScheduleConstants;
import com.jcm.common.core.exception.job.TaskException;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.job.domain.SysJob;
import com.jcm.job.mapper.SysJobMapper;
import com.jcm.job.service.ISysJobService;
import com.jcm.job.util.ScheduleUtils;
import lombok.AllArgsConstructor;
import org.quartz.JobDataMap;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
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
    @Transactional(rollbackFor = Exception.class)
    public int updateSysJob(SysJob sysJob) throws SchedulerException, TaskException
    {
        int rows = sysJobMapper.updateById(sysJob);
        if (rows > 0)
        {
            updateSchedulerJob(sysJob, sysJob.getJobGroup());
        }
        return rows;
    }
    /**
     * 更新任务
     *
     * @param job 任务对象
     * @param jobGroup 任务组名
     */
    public void updateSchedulerJob(SysJob job, String jobGroup) throws SchedulerException, TaskException
    {
        Long jobId = job.getJobId();
        // 判断是否存在
        JobKey jobKey = ScheduleUtils.getJobKey(jobId, jobGroup);
        if (scheduler.checkExists(jobKey))
        {
            // 防止创建时存在数据问题 先移除，然后在执行创建操作
            scheduler.deleteJob(jobKey);
        }
        ScheduleUtils.createScheduleJob(scheduler, job);
    }

    /**
     * 批量删除定时任务调度
     *
     * @param jobIds 需要删除的定时任务调度主键
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteSysJobByJobIds(Long[] jobIds) throws SchedulerException {
        for (Long jobId : jobIds)
        {
            SysJob job = baseMapper.selectById(jobId);
            deleteJob(job);
        }
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


    /**
     * 立即运行任务
     *
     * @param job 调度信息
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean run(SysJob job) throws SchedulerException
    {
        boolean result = false;
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        SysJob properties = baseMapper.selectById(job.getJobId());
        // 参数
        JobDataMap dataMap = new JobDataMap();
        dataMap.put(ScheduleConstants.TASK_PROPERTIES, properties);
        JobKey jobKey = ScheduleUtils.getJobKey(jobId, jobGroup);
        if (scheduler.checkExists(jobKey))
        {
            result = true;
            scheduler.triggerJob(jobKey, dataMap);
        }
        return result;
    }


    /**
     * 删除任务后，所对应的trigger也将被删除
     *
     * @param job 调度信息
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteJob(SysJob job) throws SchedulerException
    {
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        int rows = baseMapper.deleteById(jobId);
        if (rows > 0)
        {
            scheduler.deleteJob(ScheduleUtils.getJobKey(jobId, jobGroup));
        }
        return rows;
    }

    /**
     * 任务调度状态修改
     *
     * @param job 调度信息
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int changeStatus(SysJob job) throws SchedulerException
    {
        int rows = 0;
        String status = job.getStatus();
        if (ScheduleConstants.Status.NORMAL.getValue().equals(status))
        {
            rows = resumeJob(job);
        }
        else if (ScheduleConstants.Status.PAUSE.getValue().equals(status))
        {
            rows = pauseJob(job);
        }
        return rows;
    }

    /**
     * 恢复任务
     *
     * @param job 调度信息
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int resumeJob(SysJob job) throws SchedulerException
    {
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        job.setStatus(ScheduleConstants.Status.NORMAL.getValue());
        int rows = baseMapper.updateById(job);
        if (rows > 0)
        {
            scheduler.resumeJob(ScheduleUtils.getJobKey(jobId, jobGroup));
        }
        return rows;
    }

    /**
     * 暂停任务
     *
     * @param job 调度信息
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int pauseJob(SysJob job) throws SchedulerException
    {
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        job.setStatus(ScheduleConstants.Status.PAUSE.getValue());
        int rows = baseMapper.updateById(job);
        if (rows > 0)
        {
            scheduler.pauseJob(ScheduleUtils.getJobKey(jobId, jobGroup));
        }
        return rows;
    }
}
