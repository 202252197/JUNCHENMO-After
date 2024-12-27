package com.jcm.system.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.jcm.common.redis.service.RedisService;
import com.jcm.system.service.SysCacheMonitorService;
import lombok.AllArgsConstructor;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

@Service
@AllArgsConstructor
public class SysCacheMonitorServiceImpl implements SysCacheMonitorService {
    private final RedisService redisService;
    @Override
    public Properties getRedisBaseInfo() {
        Properties baseInfo =new Properties();
        redisService.redisTemplate.execute((RedisCallback<List<String>>) connection -> {
            JSONObject serverInfo = new JSONObject();
            Properties info = connection.info();
            serverInfo.put("redis_version", info.get("redis_version"));
            serverInfo.put("tcp_port", info.get("tcp_port"));
            serverInfo.put("process_id", info.get("process_id"));
            JSONObject memoryInfo = new JSONObject();
            memoryInfo.put("used_memory", String.format("%.2fKB", Double.parseDouble((String) info.get("used_memory")) / 1000));
            memoryInfo.put("used_memory_peak", String.format("%.2fKB", Double.parseDouble((String) info.get("used_memory_peak")) / 1000));
            memoryInfo.put("used_memory_lua", String.format("%.2fKB", Double.parseDouble((String) info.get("used_memory_lua")) / 1000));
            JSONObject statsInfo = new JSONObject();
            statsInfo.put("connected_clients", info.get("connected_clients"));
            statsInfo.put("total_connections_received", info.get("total_connections_received"));
            statsInfo.put("total_commands_processed", info.get("total_commands_processed"));
            JSONObject db0Info = new JSONObject();
            Object db0 = info.get("db0");
            Arrays.asList(String.valueOf(db0).split(",")).stream().forEach(item->{
                String[] split = item.split("=");
                db0Info.put(split[0], split[1]);
            });
            JSONObject otherInfo = new JSONObject();
            otherInfo.put("os", info.get("os"));
            otherInfo.put("role", info.get("role"));
            otherInfo.put("redis_mode", info.get("redis_mode"));
            otherInfo.put("uptime_in_days", "运行"+info.get("uptime_in_days")+"天");
            otherInfo.put("uptime_in_seconds", info.get("uptime_in_seconds"));
            otherInfo.put("cluster_enabled", info.get("cluster_enabled"));
            otherInfo.put("expired_keys", info.get("expired_keys"));
            otherInfo.put("maxmemory_policy", info.get("maxmemory_policy"));
            otherInfo.put("master_replid", String.valueOf(info.get("master_replid")).substring(0,25)+"...");
            otherInfo.put("run_id", String.valueOf(info.get("run_id")).substring(0,30)+"...");

            JSONObject persistenceInfo = new JSONObject();
            persistenceInfo.put("aof_enabled", info.get("aof_enabled"));
            persistenceInfo.put("aof_last_bgrewrite_status", info.get("aof_last_bgrewrite_status"));
            persistenceInfo.put("mem_aof_buffer", info.get("mem_aof_buffer"));
            persistenceInfo.put("aof_last_rewrite_time_sec", info.get("aof_last_rewrite_time_sec"));
            persistenceInfo.put("aof_rewrite_in_progress", info.get("aof_rewrite_in_progress"));
            persistenceInfo.put("aof_last_write_status", info.get("aof_last_write_status"));

            persistenceInfo.put("rdb_last_save_time", info.get("rdb_last_save_time"));
            persistenceInfo.put("rdb_last_bgsave_status", info.get("rdb_last_bgsave_status"));
            persistenceInfo.put("rdb_current_bgsave_time_sec", info.get("rdb_current_bgsave_time_sec"));
            persistenceInfo.put("rdb_bgsave_in_progress", info.get("rdb_bgsave_in_progress"));

            baseInfo.put("server", serverInfo);
            baseInfo.put("memory", memoryInfo);
            baseInfo.put("stats", statsInfo);
            baseInfo.put("db0", db0Info);
            baseInfo.put("other", otherInfo);
            baseInfo.put("persistenceInfo", persistenceInfo);
            return null;
        });
        return baseInfo;
    }

    @Override
    public List<JSONObject> getRedisInfo() {
        List<JSONObject> jsonObj = new ArrayList<>();
        redisService.redisTemplate.execute((RedisCallback<List<String>>) connection -> {
            Properties allInfo = connection.info();
            allInfo.keySet().forEach(key->{
                JSONObject jsonObject = new JSONObject();
                String keyStr = String.valueOf(key);
                String valueStr = String.valueOf(allInfo.get(key));
                jsonObject.put("configName", keyStr);
                jsonObject.put("configValue", valueStr);
                jsonObj.add(jsonObject);
            });
            return null;
        });
        return jsonObj;
    }
}
