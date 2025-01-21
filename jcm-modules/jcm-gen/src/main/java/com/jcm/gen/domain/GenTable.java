package com.jcm.gen.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.core.constant.GenConstants;
import com.jcm.common.core.domain.BaseEntity;
import com.jcm.common.core.utils.StringUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.ArrayUtils;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 代码生成业务表
 * </p>
 *
 * @author 吕世昊
 * @since 2025-01-05
 */
@Data
@Accessors(chain = true)
@TableName("gen_table")
@ApiModel(value = "GenTable对象", description = "代码生成业务表")
public class GenTable extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "编号")
    @TableId(value = "table_id", type = IdType.AUTO)
    private Long tableId;

    @ApiModelProperty(value = "表名称")
    private String tableName;

    @ApiModelProperty(value = "表描述")
    private String tableComment;

    @ApiModelProperty(value = "实体类名称")
    private String className;

    @ApiModelProperty(value = "使用的模板（crud单表操作 tree树表操作）")
    private String tplCategory;

    @ApiModelProperty(value = "生成包路径")
    private String packageName;

    @ApiModelProperty(value = "生成模块名")
    private String moduleName;

    @ApiModelProperty(value = "生成业务名")
    private String businessName;

    @ApiModelProperty(value = "生成功能名")
    private String functionName;

    @ApiModelProperty(value = "生成功能作者")
    private String functionAuthor;

    @ApiModelProperty(value = "生成代码方式（0zip压缩包 1自定义路径）")
    private String genType;

    @ApiModelProperty(value = "生成路径（不填默认项目路径）")
    private String genPath;

    /**
     * 主键信息
     */
    private GenTableColumn pkColumn;

    /**
     * 表列信息
     */
    @Valid
    @TableField(exist = false)
    private List<GenTableColumn> columns;

    @ApiModelProperty(value = "其它生成选项")
    private String options;

    /**
     * 树编码字段
     */
    private String treeCode;

    /**
     * 树父编码字段
     */
    private String treeParentCode;

    /**
     * 树名称字段
     */
    private String treeName;

    /**
     * 上级菜单ID字段
     */
    private String parentMenuId;

    /**
     * 上级菜单名称字段
     */
    private String parentMenuName;

    public static boolean isTree(String tplCategory) {
        return tplCategory != null && StringUtils.equals(GenConstants.TPL_TREE, tplCategory);
    }

    public static boolean isCrud(String tplCategory) {
        return tplCategory != null && StringUtils.equals(GenConstants.TPL_CRUD, tplCategory);
    }

    public static boolean isSuperColumn(String tplCategory, String javaField) {
        if (isTree(tplCategory)) {
            return StringUtils.equalsAnyIgnoreCase(javaField,
                    ArrayUtils.addAll(GenConstants.TREE_ENTITY, GenConstants.BASE_ENTITY));
        }
        return StringUtils.equalsAnyIgnoreCase(javaField, GenConstants.BASE_ENTITY);
    }

    public boolean isTree() {
        return isTree(this.tplCategory);
    }

    public boolean isCrud() {
        return isCrud(this.tplCategory);
    }

    public boolean isSuperColumn(String javaField) {
        return isSuperColumn(this.tplCategory, javaField);
    }
}
