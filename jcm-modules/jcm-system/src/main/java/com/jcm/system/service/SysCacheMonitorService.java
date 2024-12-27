package com.jcm.system.service;


import com.alibaba.fastjson2.JSONObject;

import java.util.List;
import java.util.Properties;

/**
 * @author lvshihao
 */
public interface SysCacheMonitorService {
    Properties getRedisBaseInfo();

    List<JSONObject> getRedisInfo();
}
