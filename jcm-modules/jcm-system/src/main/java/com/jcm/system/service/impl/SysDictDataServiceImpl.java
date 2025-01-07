package com.jcm.system.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jcm.common.core.constant.CacheConstants;
import com.jcm.common.redis.service.RedisService;
import com.jcm.system.domain.SysDictData;
import com.jcm.system.mapper.SysDictDataMapper;
import com.jcm.system.service.ISysDictDataService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author 吕世昊
 */
@Service
@AllArgsConstructor
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictData> implements ISysDictDataService {

    private final SysDictDataMapper sysDictDataMapper;
    private final RedisService redisService;


    @Override
    public int insertDictData(SysDictData dictData) {
        //插入数据
        return sysDictDataMapper.insert(dictData);
    }

    @Override
    public List<SysDictData> selectDictDataList(SysDictData dictType) {
        return sysDictDataMapper.selectListByCondition(dictType);
    }

    @Override
    public int deleteDictData(List<Long> dictDataIds) {
        return sysDictDataMapper.deleteBatchIds(dictDataIds);
    }

    @Override
    public List<JSONObject> getInfoList(List<String> names) {
        //存放缓存中查到的字典值
        List<JSONObject> dataList = new ArrayList<>();
        for (String name : names) {
            List<JSONObject> cacheList = redisService.getCacheList(CacheConstants.SYS_DICT_KEY + name);
            dataList.addAll(cacheList);
        }
        return dataList;
    }

    private void loadDataToCache() {
        Set keys = redisService.redisTemplate.keys(CacheConstants.SYS_DICT_KEY + "*");
        if(keys.size()>0){
            redisService.deleteObject(keys);
        }
        //获取全部的字典数据,加载并处理成JSONObject
        List<SysDictData> infoListAll = sysDictDataMapper.getInfoList(null);
        infoListAll.stream().map(dictData -> {
            JSONObject jsonObject = JSONObject.parseObject(dictData.getExtra());
            jsonObject.put("name", dictData.getName());
            jsonObject.put("value", dictData.getValue());
            jsonObject.put("description", dictData.getDescription());
            return jsonObject;
        }).collect(Collectors.groupingBy(json -> {
            // 根据dictData.getName()获取名称作为分组的键，这里假设dictData是一个对象实例，有对应的getName()方法
            return json.getString("name");
        })).forEach((name, jsonList)->{
            redisService.setCacheList(CacheConstants.SYS_DICT_KEY+name,jsonList);
        });


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


    @Override
    public int updateDictData(SysDictData sysDictData) {
        return sysDictDataMapper.updateById(sysDictData);
    }

    @Override
    public void refreshDictDataCache() {
        if(!redisService.hasKey(CacheConstants.SYS_DICT_KEY)){
            redisService.deleteObject(CacheConstants.SYS_DICT_KEY);
        }
        loadDataToCache();

    }

}
