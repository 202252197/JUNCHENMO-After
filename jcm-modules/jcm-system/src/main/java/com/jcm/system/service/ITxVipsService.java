package com.jcm.system.service;

import com.jcm.system.domain.TxVips;

import java.util.List;

/**
 * vipService接口
 *
 * @author lvshihao
 * @date 2025-01-06
 */
public interface ITxVipsService
{
    /**
     * 查询vip
     *
     * @param vipId vip主键
     * @return vip
     */
    public TxVips selectTxVipsByVipId(Long vipId);

    /**
     * 查询vip列表
     *
     * @param txVips vip
     * @return vip集合
     */
    public List<TxVips> selectTxVipsList(TxVips txVips);

    /**
     * 新增vip
     *
     * @param txVips vip
     * @return 结果
     */
    public int insertTxVips(TxVips txVips);

    /**
     * 修改vip
     *
     * @param txVips vip
     * @return 结果
     */
    public int updateTxVips(TxVips txVips);

    /**
     * 批量删除vip
     *
     * @param vipIds 需要删除的vip主键集合
     * @return 结果
     */
    public int deleteTxVipsByVipIds(Long[] vipIds);

    /**
     * 删除vip信息
     *
     * @param vipId vip主键
     * @return 结果
     */
    public int deleteTxVipsByVipId(Long vipId);
}
