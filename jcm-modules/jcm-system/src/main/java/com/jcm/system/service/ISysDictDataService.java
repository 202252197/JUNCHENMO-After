package com.jcm.system.service;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.domain.SysDictData;

import java.util.List;

/**
 * <p>
 * 字典配置值 服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysDictDataService extends IService<SysDictData> {


    int insertDictData(SysDictData sysDictData);

    List<SysDictData> selectDictDataList(SysDictData dictType);

    int deleteDictData(List<Long> dictDataIds);

    List<JSONObject> getInfoList(List<String> names);

    List<JSONObject> getInfo(String name);

    int updateDictData(SysDictData sysDictData);

    void refreshDictDataCache();
}
