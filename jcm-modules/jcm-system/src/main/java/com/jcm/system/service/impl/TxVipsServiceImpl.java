package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.system.domain.TxVips;
import com.jcm.system.mapper.TxVipsMapper;
import com.jcm.system.service.ITxVipsService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * vipService业务层处理
 *
 * @author lvshihao
 * @date 2025-01-06
 */
@Service
@AllArgsConstructor
public class TxVipsServiceImpl extends ServiceImpl<TxVipsMapper, TxVips> implements ITxVipsService {

        private final TxVipsMapper txVipsMapper;

        /**
         * 查询vip
         *
         * @param vipId vip主键
         * @return vip
         */
        @Override
        public TxVips selectTxVipsByVipId(Long vipId)
        {
                return txVipsMapper.selectById(vipId);
        }

        /**
         * 查询vip列表
         *
         * @param txVips vip
         * @return vip
         */
        @Override
        public List<TxVips> selectTxVipsList(TxVips txVips)
        {
                return txVipsMapper.selectTxVipsList(txVips);
        }

        /**
         * 新增vip
         *
         * @param txVips vip
         * @return 结果
         */
        @Override
        public int insertTxVips(TxVips txVips)
        {
                return txVipsMapper.insert(txVips);
        }

        /**
         * 修改vip
         *
         * @param txVips vip
         * @return 结果
         */
        @Override
        public int updateTxVips(TxVips txVips)
        {
                return txVipsMapper.updateById(txVips);
        }

        /**
         * 批量删除vip
         *
         * @param vipIds 需要删除的vip主键
         * @return 结果
         */
        @Override
        public int deleteTxVipsByVipIds(Long[] vipIds)
        {
                return txVipsMapper.deleteBatchIds(Arrays.asList(vipIds));
        }

        /**
         * 删除vip信息
         *
         * @param vipId vip主键
         * @return 结果
         */
        @Override
        public int deleteTxVipsByVipId(Long vipId)
        {
                return txVipsMapper.deleteById(vipId);
        }
}
