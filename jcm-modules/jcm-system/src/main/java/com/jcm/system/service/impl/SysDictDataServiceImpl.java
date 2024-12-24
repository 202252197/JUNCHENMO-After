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
        return sysDictDataMapper.deleteByIds(dictDataIds);
    }

    @Override
    public List<JSONObject> getInfoList(List<String> names) {
        if(!redisService.hasKey(CacheConstants.SYS_DICT_KEY)){
            //获取全部的字典数据,加载并处理成JSONObject
            List<SysDictData> infoListAll = sysDictDataMapper.getInfoList(null);
            HashMap<String, List<JSONObject>> jsonListMap = new HashMap();
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
                jsonListMap.put(name, jsonList);
            });
            redisService.setCacheMap(CacheConstants.SYS_DICT_KEY,jsonListMap);
        }

        //存放缓存中查到的字典值
        List<JSONObject> dataList = new ArrayList<>();
        Map<String, List<JSONObject>> dictDataCache = redisService.getCacheMap(CacheConstants.SYS_DICT_KEY);
        for (String name : names) {
            List<JSONObject> jsonObjects = dictDataCache.get(name);
            dataList.addAll(jsonObjects);
        }
        //因序列化保存了对象的类型这里给这个@type属性移除
        for(JSONObject jsonObject:dataList){
            jsonObject.remove("@type");
        }

        return dataList;
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

}
