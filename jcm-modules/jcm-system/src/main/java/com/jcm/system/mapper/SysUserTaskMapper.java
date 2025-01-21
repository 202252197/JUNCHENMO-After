package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.SysUserTask;

import java.util.List;


/**
 * taskMapper接口
 *
 * @author lvshihao
 * @date 2025-01-13
 */
public interface SysUserTaskMapper extends BaseMapper<SysUserTask> {

    List<SysUserTask> selectList(SysUserTask sysUserTask);
}
