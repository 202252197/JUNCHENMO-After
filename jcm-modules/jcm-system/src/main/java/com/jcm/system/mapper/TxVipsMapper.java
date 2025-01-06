package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.TxVips;

import java.util.List;

/**
 * vipMapper接口
 *
 * @author lvshihao
 * @date 2025-01-06
 */
public interface TxVipsMapper extends BaseMapper<TxVips>
{

    /**
     * 查询vip列表
     *
     * @param txVips vip
     * @return vip集合
     */
    public List<TxVips> selectTxVipsList(TxVips txVips);

}
