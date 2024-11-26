package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.domain.SysDictData;

import java.util.List;

/**
 * <p>
 * 字典配置值 服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2024-11-24
 */
public interface ISysDictDataService extends IService<SysDictData> {

    List<SysDictData> selectDictDataList(SysDictData dictData);
}
