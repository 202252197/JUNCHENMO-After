package com.jcm.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.system.domain.SysDictTypeExtra;

import java.util.List;

/**
 * <p>
 * 字典配置项扩展参数 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2024-10-31
 */
public interface SysDictTypeExtraMapper extends BaseMapper<SysDictTypeExtra> {

    /**
     * 批量新增字典配置项信息
     *
     * @param dictTypeExtras 字典配置项列表
     * @return 结果
     */
    public Integer batchDictTypeExtra(List<SysDictTypeExtra> dictTypeExtras);

}
