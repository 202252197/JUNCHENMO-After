package com.jcm.system.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.system.domain.SysDictData;
import com.jcm.system.mapper.SysDictDataMapper;
import com.jcm.system.service.ISysDictDataService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 字典配置值 服务实现类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-11-24
 */
@Service
@AllArgsConstructor
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictData> implements ISysDictDataService {

    private final SysDictDataMapper sysDictDataMapper;



    @Override
    public Integer insertDictData(SysDictData dictData) {
        //插入数据
        return sysDictDataMapper.insert(dictData);
    }

    @Override
    public List<SysDictData> selectDictDataList(SysDictData dictType) {
        return sysDictDataMapper.selectListByCondition(dictType);
    }

    @Override
    public Integer deleteDictData(Long dictDataId) {
        //插入数据
        return sysDictDataMapper.deleteById(dictDataId);
    }

    @Override
    public List<JSONObject> getInfoList(List<String> names) {
        List<SysDictData> infoList = sysDictDataMapper.getInfoList(names);

        List<JSONObject> infoObjList = infoList.stream().map(dictData -> {
            JSONObject jsonObject = JSONObject.parseObject(dictData.getExtra());
            jsonObject.put("name", dictData.getName());
            jsonObject.put("value", dictData.getValue());
            jsonObject.put("description", dictData.getDescription());
            return jsonObject;
        }).collect(Collectors.toList());
        return infoObjList;
    }

    @Override
    public List<JSONObject> getInfo(String name) {
        List<SysDictData> infoList = sysDictDataMapper.getInfoList(Collections.singletonList(name));

        List<JSONObject> infoObjList = infoList.stream().map(dictData -> {
            JSONObject jsonObject = JSONObject.parseObject(dictData.getExtra());
            jsonObject.put("value", dictData.getValue());
            jsonObject.put("description", dictData.getDescription());
            return jsonObject;
        }).collect(Collectors.toList());
        return infoObjList;
    }

}
