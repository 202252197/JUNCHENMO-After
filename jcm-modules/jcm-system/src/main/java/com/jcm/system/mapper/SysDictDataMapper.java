package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.SysDictData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 字典配置值 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-11-24
 */
public interface SysDictDataMapper extends BaseMapper<SysDictData> {


    List<SysDictData> selectListByCondition(SysDictData dictType);

    List<SysDictData> getInfoList(List<String> names);

    int deleteByDictTypeIds(@Param("dictTypeIds") List<Long> dictTypeIds);

    int deleteByIds(@Param("dictDataIds") List<Long> dictDataIds);
}
