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
    public Map<String, String> previewCode(Long tableId);

    /**
     * 删除业务信息
     *
     * @param tableIds 需要删除的表数据ID
     * @return 结果
     */
    public void deleteGenTableByIds(Long[] tableIds);


    /**
     * 查询业务列表
     *
     * @param genTable 业务信息
     * @return 业务集合
     */
    public List<GenTable> selectGenTableList(GenTable genTable);

    /**
     * 查询据库列表
     *
     * @param genTable 业务信息
     * @return 数据库表集合
     */
    public List<GenTable> selectDbTableList(GenTable genTable);


    /**
     * 查询据库列表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    public List<GenTable> selectDbTableListByNames(String[] tableNames);

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     */
    public void importGenTable(List<GenTable> tableList);


}
