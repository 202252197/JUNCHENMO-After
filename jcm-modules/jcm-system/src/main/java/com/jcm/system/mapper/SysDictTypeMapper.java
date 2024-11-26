package com.jcm.system.mapper;

import com.jcm.system.domain.SysDictType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.ArrayList;

/**
 * <p>
 * 字典配置项 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-10-31
 */
public interface SysDictTypeMapper extends BaseMapper<SysDictType> {

    ArrayList<SysDictType> selectDictTypeAndExtraAllList();
}
