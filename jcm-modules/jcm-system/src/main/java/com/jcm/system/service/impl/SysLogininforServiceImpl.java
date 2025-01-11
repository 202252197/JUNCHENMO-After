package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.system.api.domain.SysLogininfor;
import com.jcm.system.mapper.SysLogininforMapper;
import com.jcm.system.service.ISysLogininforService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 * logininforService业务层处理
 *
 * @author lvshihao
 * @date 2025-01-11
 */
@Service
@AllArgsConstructor
public class SysLogininforServiceImpl extends ServiceImpl<SysLogininforMapper, SysLogininfor> implements ISysLogininforService {

    private final SysLogininforMapper sysLogininforMapper;

    /**
     * 查询系统访问记录列表
     *
     * @param sysLogininfor 系统访问记录
     * @return 系统访问记录
     */
    @Override
    public List<SysLogininfor> selectSysLogininforList(SysLogininfor sysLogininfor)
    {
        LambdaQueryWrapper<SysLogininfor> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(SysLogininfor::getInfoId, SysLogininfor::getUserName, SysLogininfor::getIpaddr, SysLogininfor::getLoginLocation, SysLogininfor::getBrowser, SysLogininfor::getOs, SysLogininfor::getStatus, SysLogininfor::getMsg, SysLogininfor::getLoginTime, SysLogininfor::getRemark, SysLogininfor::getCreator, SysLogininfor::getCreateTime, SysLogininfor::getUpdater, SysLogininfor::getUpdateTime,  SysLogininfor::getDeleted );
        queryWrapper.like( StringUtils.isNotEmpty(sysLogininfor.getUserName()) , SysLogininfor::getUserName, sysLogininfor.getUserName());
        queryWrapper.eq( StringUtils.isNotEmpty(sysLogininfor.getIpaddr()) , SysLogininfor::getIpaddr, sysLogininfor.getIpaddr());
        queryWrapper.eq( StringUtils.isNotEmpty(sysLogininfor.getStatus()) , SysLogininfor::getStatus, sysLogininfor.getStatus());
        queryWrapper.eq( StringUtils.isNotEmpty(sysLogininfor.getOs()) , SysLogininfor::getOs, sysLogininfor.getOs());
        if(Objects.nonNull(sysLogininfor.getParams())){
            queryWrapper.ge(StringUtils.isNotNull(sysLogininfor.getParams().get("beginLoginTime")), SysLogininfor::getLoginTime,sysLogininfor.getParams().get("beginLoginTime"))
            .le(Objects.nonNull(sysLogininfor.getParams())&&StringUtils.isNotNull(sysLogininfor.getParams().get("endLoginTime")),SysLogininfor::getLoginTime,sysLogininfor.getParams().get("endLoginTime"));
        }
        return sysLogininforMapper.selectList(queryWrapper);
    }

    /**
     * 新增系统访问记录
     *
     * @param sysLogininfor 系统访问记录
     * @return 结果
     */
    @Override
    public int insertSysLogininfor(SysLogininfor sysLogininfor)
    {
        return sysLogininforMapper.insert(sysLogininfor);
    }


    /**
     * 批量删除系统访问记录
     *
     * @param infoIds 需要删除的系统访问记录主键
     * @return 结果
     */
    @Override
    public int deleteSysLogininforByInfoIds(Long[] infoIds)
    {
        return sysLogininforMapper.deleteBatchIds(Arrays.asList(infoIds));
    }

    /**
     * 删除系统访问记录信息
     *
     * @param infoId 系统访问记录主键
     * @return 结果
     */
    @Override
    public int deleteSysLogininforByInfoId(Long infoId)
    {
        return sysLogininforMapper.deleteById(infoId);
    }

    @Override
    public int clearLogininfor() {
        sysLogininforMapper.clearLogininfor();
        return 1;
    }
}
