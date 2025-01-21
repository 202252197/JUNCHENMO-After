package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.api.domain.SysOperLog;

import java.util.List;

/**
 * <p>
 * 操作日志记录 服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysOperLogService extends IService<SysOperLog> {

    /**
     * 新增操作日志
     *
     * @param operLog 操作日志对象
     * @return 结果
     */
    int insertOperlog(SysOperLog operLog);

    /**
     * 查找操作日志集合
     *
     * @return 结果
     * @sysOperLog 查询条件
     */
    List<SysOperLog> selectOperLogList(SysOperLog sysOperLog);

    /**
     * 删除操作日志
     *
     * @return 结果
     * @operIds 操作日志主键集合
     */
    int deleteOperLog(List<Long> operIds);

    /**
     * 清空操作日志
     *
     * @return 结果
     */
    int clearOperLog();

    /**
     * 获取操作日志操作人员可选项
     *
     * @return 操作人员可选项集合
     */
    List<String> nameOptionSelect();

    /**
     * 获取操作日志操模块标题可选项
     *
     * @return 模块标题可选项集合
     */
    List<String> titleOptionSelect();

    /**
     * 获取操作日志操业务名称可选项
     *
     * @return 业务名称可选项集合
     */
    List<String> businessNameOptionSelectByTitle(String title);

}
