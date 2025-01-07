package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.api.domain.SysOperLog;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 操作日志记录 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 */
public interface SysOperLogMapper extends BaseMapper<SysOperLog> {

    /**
     * 定义方法用于截断（清空）sys_oper_log表
     * @return
     */
    @Delete("TRUNCATE TABLE sys_oper_log")
    void clearOperLog();

    List<String> nameOptionSelect();

    List<String> titleOptionSelect();

    List<String> businessNameOptionSelectByTitle(String title);
}
