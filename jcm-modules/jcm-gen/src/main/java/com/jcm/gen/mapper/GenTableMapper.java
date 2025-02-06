package com.jcm.gen.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jcm.gen.domain.GenTable;

import java.util.List;

/**
 * <p>
 * 代码生成业务表 Mapper 接口
 * </p>
 *
 * @author 吕世昊
 * @since 2025-01-05
 */
public interface GenTableMapper extends BaseMapper<GenTable> {

    /**
     * 批量删除业务
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteGenTableByIds(Long[] ids);

    /**
     * 查询表ID业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    GenTable selectGenTableById(Long id);

    /**
     * 查询表名称业务信息
     *
     * @param tableName 表名称
     * @return 业务信息
     */
    GenTable selectGenTableByName(String tableName);

    /**
     * 查询业务列表
     *
     * @param genTable 业务信息
     * @return 业务集合
     */
    List<GenTable> selectGenTableList(GenTable genTable);

    /**
     * 查询据库列表
     *
     * @param genTable 业务信息
     * @return 数据库表集合
     */
    List<GenTable> selectDbTableList(GenTable genTable);

    /**
     * 查询据库列表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    List<GenTable> selectDbTableListByNames(String[] tableNames);

    /**
     * 新增业务
     *
     * @param genTable 业务信息
     * @return 结果
     */
    int insertGenTable(GenTable genTable);


}
