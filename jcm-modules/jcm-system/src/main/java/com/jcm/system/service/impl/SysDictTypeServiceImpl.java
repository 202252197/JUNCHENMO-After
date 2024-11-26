package com.jcm.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.system.domain.SysDictType;
import com.jcm.system.domain.SysDictTypeExtra;
import com.jcm.system.mapper.SysDictTypeExtraMapper;
import com.jcm.system.mapper.SysDictTypeMapper;
import com.jcm.system.service.ISysDictTypeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 字典配置项 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-10-31
 */
@Service
@AllArgsConstructor
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType> implements ISysDictTypeService {


    private final SysDictTypeMapper sysDictTypeMapper;
    private final SysDictTypeExtraMapper sysDictTypeExtraMapper;

    /**
     * 根据条件分页查询字典配置项数据
     * @param dictType 字典项信息
     * @return 字典项数据集合信息
     */
    @Override
    public List<SysDictType> selectDictTypeList(SysDictType dictType) {
        return this.lambdaQuery()
                .like(StringUtils.isNotEmpty(dictType.getName()), SysDictType::getName,dictType.getName())
                .like(StringUtils.isNotEmpty(dictType.getDescription()),SysDictType::getDescription,dictType.getDescription())
                .eq(Objects.nonNull(dictType.getStatus()),SysDictType::getStatus,dictType.getStatus()).list();
    }


    /**
     * 新增保存字典项信息
     * @param dictType 字典项信息
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insertDictType(SysDictType dictType) {
        //插入数据
        int insert = sysDictTypeMapper.insert(dictType);
        //查询插入的数据
        LambdaQueryWrapper<SysDictType> lambdaQueryWrapper=new LambdaQueryWrapper();
        lambdaQueryWrapper.eq(StringUtils.isNotEmpty(dictType.getName()),SysDictType::getName,dictType.getName());
        SysDictType sysDictType = sysDictTypeMapper.selectOne(lambdaQueryWrapper);
        //插入字典项额外配置项
        List<SysDictTypeExtra> extraSchemas = dictType.getTypeExtraSchemas();
        if(!Objects.isNull(extraSchemas)){
            for (SysDictTypeExtra extraSchema : extraSchemas) {
                extraSchema.setDictTypeId(sysDictType.getDictTypeId());
            }
            sysDictTypeExtraMapper.batchDictTypeExtra(extraSchemas);
        }
        return insert;
    }

    @Override
    public List<SysDictType> selectDictTypeAndExtraAllList() {
        ArrayList<SysDictType> sysDictTypes = sysDictTypeMapper.selectDictTypeAndExtraAllList();
        return sysDictTypes;
    }
}
