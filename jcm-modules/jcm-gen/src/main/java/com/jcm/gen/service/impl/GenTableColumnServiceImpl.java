package com.jcm.gen.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.gen.domain.GenTableColumn;
import com.jcm.gen.mapper.GenTableColumnMapper;
import com.jcm.gen.service.IGenTableColumnService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 代码生成业务表字段 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2025-01-05
 */
@Service
public class GenTableColumnServiceImpl extends ServiceImpl<GenTableColumnMapper, GenTableColumn> implements IGenTableColumnService {

    @Override
    public List<GenTableColumn> selectGenTableColumnListByTableId(Long tableId) {
        LambdaQueryWrapper<GenTableColumn> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(StringUtils.isNotNull(tableId), GenTableColumn::getTableId, tableId);
        lambdaQueryWrapper.orderByAsc(GenTableColumn::getSort);
        return this.baseMapper.selectList(lambdaQueryWrapper);
    }
}
