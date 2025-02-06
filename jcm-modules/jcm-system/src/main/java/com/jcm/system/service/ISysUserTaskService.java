package com.jcm.system.service;

import com.jcm.system.domain.SysUserTask;

import java.util.List;

/**
 * taskService接口
 *
 * @author lvshihao
 * @date 2025-01-13
 */
public interface ISysUserTaskService {
    /**
     * 查询用户任务
     *
     * @param taskId 用户任务主键
     * @return 用户任务
     */
    SysUserTask selectSysUserTaskByTaskId(Long taskId);

    /**
     * 查询用户任务列表
     *
     * @param sysUserTask 用户任务
     * @return 用户任务集合
     */
    List<SysUserTask> selectSysUserTaskList(SysUserTask sysUserTask);

    /**
     * 新增用户任务
     *
     * @param sysUserTask 用户任务
     * @return 结果
     */
    int insertSysUserTask(SysUserTask sysUserTask);

    /**
     * 修改用户任务
     *
     * @param sysUserTask 用户任务
     * @return 结果
     */
    int updateSysUserTask(SysUserTask sysUserTask);

    /**
     * 批量删除用户任务
     *
     * @param taskIds 需要删除的用户任务主键集合
     * @return 结果
     */
    int deleteSysUserTaskByTaskIds(Long[] taskIds);

    /**
     * 删除用户任务信息
     *
     * @param taskId 用户任务主键
     * @return 结果
     */
    int deleteSysUserTaskByTaskId(Long taskId);
}
