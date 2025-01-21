package com.jcm.system.service.impl;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.utils.StringUtils;
import com.jcm.system.domain.SysDictData;
import com.jcm.system.domain.SysDictType;
import com.jcm.system.mapper.SysDictDataMapper;
import com.jcm.system.mapper.SysDictTypeMapper;
import com.jcm.system.service.ISysDictTypeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @author 吕世昊
 */
@Service
@AllArgsConstructor
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType> implements ISysDictTypeService {

    private final SysDictTypeMapper sysDictTypeMapper;

    private final SysDictDataMapper sysDictDataMapper;

    /**
     * 根据条件分页查询字典配置项数据
     *
     * @param dictType 字典项信息
     * @return 字典项数据集合信息
     */
    @Override
    public List<SysDictType> selectDictTypeList(SysDictType dictType) {
        return this.lambdaQuery()
                .like(StringUtils.isNotEmpty(dictType.getName()), SysDictType::getName, dictType.getName())
                .like(StringUtils.isNotEmpty(dictType.getDescription()), SysDictType::getDescription, dictType.getDescription())
                .eq(Objects.nonNull(dictType.getStatus()), SysDictType::getStatus, dictType.getStatus()).list();
    }


    /**
     * 新增保存字典项信息
     *
     * @param dictType 字典项信息
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insertDictType(SysDictType dictType) {
        //插入数据
        return sysDictTypeMapper.insert(dictType);
    }

    @Override
    public List<SysDictType> selectDictTypeAndExtraAllList() {
        return sysDictTypeMapper.selectDictTypeAndExtraAllList();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteDictType(List<Long> dictTypeIds) {
        sysDictDataMapper.deleteByDictTypeIds(dictTypeIds);
        return sysDictTypeMapper.deleteBatchIds(dictTypeIds);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateDictType(SysDictType sysDictType) {
        UpdateWrapper<SysDictType> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("dict_type_id", sysDictType.getDictTypeId());
        //获取存在的额外参数名称
        Set<String> extraSchemasNameSet = new HashSet<>();
        JSONArray extraSchemasJson = JSONArray.parse(sysDictType.getExtraSchema());
        extraSchemasJson.stream().forEach(extraSchemaJson -> {
            extraSchemasNameSet.add((String) JSONObject.from(extraSchemaJson).get("parameter"));
        });

        //查询配置项之前的所有配置值
        QueryWrapper<SysDictData> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("dict_type_id", sysDictType.getDictTypeId());
        List<SysDictData> sysDictDataList = sysDictDataMapper.selectList(queryWrapper);

        //如果配置项修改的时候删除了配置参数，那么配置值中的配置参数也会被删除
        for (SysDictData sysDictData : sysDictDataList) {
            JSONObject extraJson = JSONObject.parse(sysDictData.getExtra());
            Set<String> extrasName = extraJson.keySet();

            List<String> removeNameList = new ArrayList<>();
            for (String name : extrasName) {
                if (!extraSchemasNameSet.contains(name)) {
                    removeNameList.add(name);
                }
            }

            //删除配置项中不存在的配置参数
            for (int i = 0; i < removeNameList.size(); i++) {
                extraJson.remove(removeNameList.get(i));
            }

            sysDictData.setExtra(extraJson.toString());
            sysDictDataMapper.updateById(sysDictData);
        }

        return sysDictTypeMapper.update(sysDictType, updateWrapper);
    }
}
