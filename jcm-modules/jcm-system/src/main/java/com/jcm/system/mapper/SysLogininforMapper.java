package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.api.domain.SysLogininfor;
import org.apache.ibatis.annotations.Delete;


/**
 * logininforMapper接口
 * 
 * @author lvshihao
 * @date 2025-01-11
 */
public interface SysLogininforMapper extends BaseMapper<SysLogininfor>
{

    @Delete("TRUNCATE TABLE sys_logininfor")
    void clearLogininfor();
}
