package com.jcm.job.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.job.domain.SysJobLog;
import org.apache.ibatis.annotations.Delete;


/**
 * logMapper接口
 *
 * @author lvshihao
 * @date 2025-01-14
 */
public interface SysJobLogMapper extends BaseMapper<SysJobLog> {
    /**
     * 定义方法用于截断（清空）sys_oper_log表
     *
     * @return
     */
    @Delete("TRUNCATE TABLE sys_job_log")
    void clearOperLog();
}
