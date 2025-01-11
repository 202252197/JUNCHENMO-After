package com.jcm.system.service;

import com.jcm.system.api.domain.SysLogininfor;

import java.util.List;

/**
 * logininforService接口
 * 
 * @author lvshihao
 * @date 2025-01-11
 */
public interface ISysLogininforService 
{

    /**
     * 查询系统访问记录列表
     * 
     * @param sysLogininfor 系统访问记录
     * @return 系统访问记录集合
     */
    public List<SysLogininfor> selectSysLogininforList(SysLogininfor sysLogininfor);

    /**
     * 新增系统访问记录
     * 
     * @param sysLogininfor 系统访问记录
     * @return 结果
     */
    public int insertSysLogininfor(SysLogininfor sysLogininfor);


    /**
     * 批量删除系统访问记录
     * 
     * @param infoIds 需要删除的系统访问记录主键集合
     * @return 结果
     */
    public int deleteSysLogininforByInfoIds(Long[] infoIds);

    /**
     * 删除系统访问记录信息
     * 
     * @param infoId 系统访问记录主键
     * @return 结果
     */
    public int deleteSysLogininforByInfoId(Long infoId);

    int clearLogininfor();
}
