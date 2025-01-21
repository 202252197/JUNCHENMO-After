package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.system.domain.TxVip;
import com.jcm.system.mapper.TxVipMapper;
import com.jcm.system.service.ITxVipService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * vipService业务层处理
 *
 * @author lvshihao
 * @date 2025-01-11
 */
@Service
@AllArgsConstructor
public class TxVipServiceImpl extends ServiceImpl<TxVipMapper, TxVip> implements ITxVipService {

    private final TxVipMapper txVipMapper;

    /**
     * 查询vip
     *
     * @param vipId vip主键
     * @return vip
     */
    @Override
    public TxVip selectTxVipByVipId(Long vipId) {
        return txVipMapper.selectById(vipId);
    }

    /**
     * 查询vip列表
     *
     * @param txVip vip
     * @return vip
     */
    @Override
    public List<TxVip> selectTxVipList(TxVip txVip) {
        LambdaQueryWrapper<TxVip> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(TxVip::getVipId, TxVip::getXyName, TxVip::getStartingTime, TxVip::getStopingTime, TxVip::getPurchaseDays, TxVip::getUnitType, TxVip::getStatus, TxVip::getLoginMethod, TxVip::getLoginAccount, TxVip::getCreator, TxVip::getCreateTime, TxVip::getUpdater, TxVip::getUpdateTime, TxVip::getRemark, TxVip::getDeleted);
        queryWrapper.like(StringUtils.isNotEmpty(txVip.getXyName()), TxVip::getXyName, txVip.getXyName());
        queryWrapper.ge(StringUtils.isNotNull(txVip.getStartingTime()), TxVip::getStartingTime, txVip.getStartingTime());
        queryWrapper.le(StringUtils.isNotNull(txVip.getStopingTime()), TxVip::getStopingTime, txVip.getStopingTime());
        queryWrapper.eq(StringUtils.isNotEmpty(txVip.getPurchaseDays()), TxVip::getPurchaseDays, txVip.getPurchaseDays());
        queryWrapper.eq(StringUtils.isNotEmpty(txVip.getUnitType()), TxVip::getUnitType, txVip.getUnitType());
        queryWrapper.eq(StringUtils.isNotEmpty(txVip.getLoginMethod()), TxVip::getLoginMethod, txVip.getLoginMethod());
        return txVipMapper.selectList(queryWrapper);
    }

    /**
     * 新增vip
     *
     * @param txVip vip
     * @return 结果
     */
    @Override
    public int insertTxVip(TxVip txVip) {
        return txVipMapper.insert(txVip);
    }

    /**
     * 修改vip
     *
     * @param txVip vip
     * @return 结果
     */
    @Override
    public int updateTxVip(TxVip txVip) {
        return txVipMapper.updateById(txVip);
    }

    /**
     * 批量删除vip
     *
     * @param vipIds 需要删除的vip主键
     * @return 结果
     */
    @Override
    public int deleteTxVipByVipIds(Long[] vipIds) {
        return txVipMapper.deleteBatchIds(Arrays.asList(vipIds));
    }

    /**
     * 删除vip信息
     *
     * @param vipId vip主键
     * @return 结果
     */
    @Override
    public int deleteTxVipByVipId(Long vipId) {
        return txVipMapper.deleteById(vipId);
    }
}
