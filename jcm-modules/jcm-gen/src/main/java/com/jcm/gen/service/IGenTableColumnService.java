package com.jcm.gen.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.gen.domain.GenTableColumn;

import java.util.List;

/**
 * <p>
 * 代码生成业务表字段 服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2025-01-05
 */
public interface IGenTableColumnService extends IService<GenTableColumn> {

    /**
     * 查询业务字段列表
     *
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    public List<GenTableColumn> selectGenTableColumnListByTableId(Long tableId);
}
