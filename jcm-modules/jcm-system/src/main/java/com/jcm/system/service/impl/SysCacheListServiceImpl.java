package com.jcm.system.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.jcm.common.log.constant.BusinessNameConstant;
import com.jcm.common.log.utils.OperLogCover;
import com.jcm.common.redis.service.RedisService;
import com.jcm.system.service.SysCacheListService;
import lombok.AllArgsConstructor;
import org.springframework.data.redis.connection.DataType;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author lvshihao
 */
@Service
@AllArgsConstructor
public class SysCacheListServiceImpl implements SysCacheListService {

    private final RedisService redisService;

    @Override
    public Object getRedisKeysByCacheName(String cacheName) {
        Set keys = redisService.redisTemplate.keys(cacheName + "*");
        if (keys.size() == 0) {
            return null;
        }
        return keys.parallelStream().map(key -> {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("keyName", String.valueOf(key).replace(cacheName, ""));
            return jsonObject;
        }).collect(Collectors.toList());
    }

    @Override
    public int deleteCacheName(String cacheName) {
        Set keys = redisService.redisTemplate.keys(cacheName + "*");
        OperLogCover.deleteLogMsg(BusinessNameConstant.CACHE_LIST, keys.size());
        if (keys.size() > 0) {
            redisService.redisTemplate.delete(keys);
        }
        return keys.size();
    }

    @Override
    public int deleteCacheKey(String keyName) {
        if (!redisService.hasKey(keyName)) {
            return 0;
        } else {
            redisService.deleteObject(keyName);
            OperLogCover.deleteLogMsg(BusinessNameConstant.CACHE_LIST, 1);
            return 1;
        }
    }

    @Override
    public Object getRedisKeyDataByKeyName(String keyName) {
        if (!redisService.hasKey(keyName)) {
            return null;
        }
        DataType type = redisService.redisTemplate.type(keyName);
        String typeName = type.name();
        if (typeName.equals("STRING")) {
            Object cacheObject = redisService.getCacheObject(keyName);
            return cacheObject;
        } else if (typeName.equals("LIST")) {
            List<Object> cacheList = redisService.getCacheList(keyName);
            return cacheList;
        } else {
            return null;
        }
    }
}
