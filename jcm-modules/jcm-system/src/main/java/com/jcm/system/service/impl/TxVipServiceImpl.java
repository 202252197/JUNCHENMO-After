package com.jcm.system.service.impl;

import java.util.List;
import java.util.Arrays;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import com.jcm.system.mapper.TxVipMapper;
import com.jcm.system.domain.TxVip;
import com.jcm.system.service.ITxVipService;

/**
 * vipService业务层处理
 *
 * @author lvshihao
 * @date 2025-01-07
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
        public TxVip selectTxVipByVipId(Long vipId)
        {
                return txVipMapper.selectById(vipId);
        }

        /**
         * 查询vip列表
         *
         * @param txVip vip
         * @return vip
         */
        @Override
        public List<TxVip> selectTxVipList(TxVip txVip)
        {
                return txVipMapper.selectTxVipList(txVip);
        }

        /**
         * 新增vip
         *
         * @param txVip vip
         * @return 结果
         */
        @Override
        public int insertTxVip(TxVip txVip)
        {
                return txVipMapper.insert(txVip);
        }

        /**
         * 修改vip
         *
         * @param txVip vip
         * @return 结果
         */
        @Override
        public int updateTxVip(TxVip txVip)
        {
                return txVipMapper.updateById(txVip);
        }

        /**
         * 批量删除vip
         *
         * @param vipIds 需要删除的vip主键
         * @return 结果
         */
        @Override
        public int deleteTxVipByVipIds(Long[] vipIds)
        {
                return txVipMapper.deleteBatchIds(Arrays.asList(vipIds));
        }

        /**
         * 删除vip信息
         *
         * @param vipId vip主键
         * @return 结果
         */
        @Override
        public int deleteTxVipByVipId(Long vipId)
        {
                return txVipMapper.deleteById(vipId);
        }
}
