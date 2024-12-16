package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.api.domain.SysOperLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 操作日志记录 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-05-03
 */
public interface SysOperLogMapper extends BaseMapper<SysOperLog> {

    int deleteByIds(@Param("operIds") List<Long> operIds);
}
