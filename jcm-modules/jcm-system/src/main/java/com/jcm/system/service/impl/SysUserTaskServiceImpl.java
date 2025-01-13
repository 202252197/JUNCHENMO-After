package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.system.domain.SysUserTask;
import com.jcm.system.mapper.SysUserTaskMapper;
import com.jcm.system.service.ISysUserTaskService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * taskService业务层处理
 *
 * @author lvshihao
 * @date 2025-01-13
 */
@Service
@AllArgsConstructor
public class SysUserTaskServiceImpl extends ServiceImpl<SysUserTaskMapper, SysUserTask> implements ISysUserTaskService {

    private final SysUserTaskMapper sysUserTaskMapper;

    /**
     * 查询用户任务
     *
     * @param taskId 用户任务主键
     * @return 用户任务
     */
    @Override
    public SysUserTask selectSysUserTaskByTaskId(Long taskId)
    {
        return sysUserTaskMapper.selectById(taskId);
    }

    /**
     * 查询用户任务列表
     *
     * @param sysUserTask 用户任务
     * @return 用户任务
     */
    @Override
    public List<SysUserTask> selectSysUserTaskList(SysUserTask sysUserTask)
    {
        return sysUserTaskMapper.selectList(sysUserTask);
    }

    /**
     * 新增用户任务
     *
     * @param sysUserTask 用户任务
     * @return 结果
     */
    @Override
    public int insertSysUserTask(SysUserTask sysUserTask)
    {
        return sysUserTaskMapper.insert(sysUserTask);
    }

    /**
     * 修改用户任务
     *
     * @param sysUserTask 用户任务
     * @return 结果
     */
    @Override
    public int updateSysUserTask(SysUserTask sysUserTask)
    {
        return sysUserTaskMapper.updateById(sysUserTask);
    }

    /**
     * 批量删除用户任务
     *
     * @param taskIds 需要删除的用户任务主键
     * @return 结果
     */
    @Override
    public int deleteSysUserTaskByTaskIds(Long[] taskIds)
    {
        return sysUserTaskMapper.deleteBatchIds(Arrays.asList(taskIds));
    }

    /**
     * 删除用户任务信息
     *
     * @param taskId 用户任务主键
     * @return 结果
     */
    @Override
    public int deleteSysUserTaskByTaskId(Long taskId)
    {
        return sysUserTaskMapper.deleteById(taskId);
    }
}
