package com.jcm.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.system.domain.SysDictType;

import java.util.List;

/**
 * <p>
 * 字典配置项 服务类
 * </p>
 *
 * @author 吕世昊
 */
public interface ISysDictTypeService extends IService<SysDictType> {


    /**
     * 根据条件分页查询字典配置项数据
     *
     * @param dictType 字典项信息
     * @return 字典项数据集合信息
     */
    List<SysDictType> selectDictTypeList(SysDictType dictType);


    /**
     * 新增保存字典项信息
     *
     * @param dictType 字典项信息
     * @return 结果
     */
    int insertDictType(SysDictType dictType);


    List<SysDictType> selectDictTypeAndExtraAllList();

    int deleteDictType(List<Long> dictTypeIds);


    int updateDictType(SysDictType sysDictType);
}
