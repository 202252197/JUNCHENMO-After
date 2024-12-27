package com.jcm.system.service;

public interface SysCacheListService {

    Object getRedisKeysByCacheName(String cacheName);

    int deleteCacheName(String cacheName);

    int deleteCacheKey(String keyName);
    Object getRedisKeyDataByKeyName(String keyName);
}
