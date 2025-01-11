package com.jcm.system.service;

import com.jcm.system.domain.TxVip;

import java.util.List;

/**
 * vipService接口
 * 
 * @author lvshihao
 * @date 2025-01-11
 */
public interface ITxVipService 
{
    /**
     * 查询vip
     * 
     * @param vipId vip主键
     * @return vip
     */
    public TxVip selectTxVipByVipId(Long vipId);

    /**
     * 查询vip列表
     * 
     * @param txVip vip
     * @return vip集合
     */
    public List<TxVip> selectTxVipList(TxVip txVip);

    /**
     * 新增vip
     * 
     * @param txVip vip
     * @return 结果
     */
    public int insertTxVip(TxVip txVip);

    /**
     * 修改vip
     * 
     * @param txVip vip
     * @return 结果
     */
    public int updateTxVip(TxVip txVip);

    /**
     * 批量删除vip
     * 
     * @param vipIds 需要删除的vip主键集合
     * @return 结果
     */
    public int deleteTxVipByVipIds(Long[] vipIds);

    /**
     * 删除vip信息
     * 
     * @param vipId vip主键
     * @return 结果
     */
    public int deleteTxVipByVipId(Long vipId);
}
