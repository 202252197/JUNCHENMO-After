package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.TxVip;

import java.util.List;


/**
 * vipMapper接口
 *
 * @author lvshihao
 * @date 2025-01-07
 */
public interface TxVipMapper extends BaseMapper<TxVip>
{

    /**
     * 查询vip列表
     *
     * @param txVip vip
     * @return vip集合
     */
    public List<TxVip> selectTxVipList(TxVip txVip);
}
