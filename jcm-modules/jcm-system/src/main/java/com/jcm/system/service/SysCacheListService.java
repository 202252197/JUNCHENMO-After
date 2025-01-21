package com.jcm.system.service;

/**
 * 系统缓存列表服务
 *
 * @author junchenmo
 * @date 2025/01/19 10:00
 */
public interface SysCacheListService {

    Object getRedisKeysByCacheName(String cacheName);

    int deleteCacheName(String cacheName);

    int deleteCacheKey(String keyName);

    Object getRedisKeyDataByKeyName(String keyName);
}
