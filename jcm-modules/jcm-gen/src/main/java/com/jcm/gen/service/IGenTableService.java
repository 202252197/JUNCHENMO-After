package com.jcm.gen.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jcm.gen.domain.GenTable;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 代码生成业务表 服务类
 * </p>
 *
 * @author 吕世昊
 * @since 2025-01-05
 */
public interface IGenTableService extends IService<GenTable> {

    /**
     * 预览代码
     *
     * @param tableId 表编号
     * @return 预览数据列表
     */
    Map<String, String> previewCode(Long tableId);

    /**
     * 删除业务信息
     *
     * @param tableIds 需要删除的表数据ID
     * @return 结果
     */
    void deleteGenTableByIds(Long[] tableIds);


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
     * 导入表结构
     *
     * @param tableList 导入表列表
     */
    void importGenTable(List<GenTable> tableList);

    /**
     * 查询业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    GenTable selectGenTableById(Long id);

    /**
     * 修改保存参数校验
     *
     * @param genTable 业务信息
     */
    void validateEdit(GenTable genTable);

    /**
     * 修改业务
     *
     * @param genTable 业务信息
     * @return 结果
     */
    void updateGenTable(GenTable genTable);

    /**
     * 同步数据库
     *
     * @param tableName 表名称
     */
    void synchDb(String tableName);

    /**
     * 批量生成代码（下载方式）
     *
     * @param tableNames 表数组
     * @return 数据
     */
    byte[] downloadCode(String[] tableNames);


    /**
     * 生成代码（自定义路径）
     *
     * @param tableName 表名称
     * @return 数据
     */
    void generatorCode(String tableName);


}
