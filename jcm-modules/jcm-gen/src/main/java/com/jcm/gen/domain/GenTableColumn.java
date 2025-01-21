package com.jcm.gen.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.core.domain.BaseEntity;
import com.jcm.common.core.utils.StringUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * <p>
 * 代码生成业务表字段
 * </p>
 *
 * @author 吕世昊
 * @since 2025-01-05
 */
@Data
@Accessors(chain = true)
@TableName("gen_table_column")
@ApiModel(value = "GenTableColumn对象", description = "代码生成业务表字段")
public class GenTableColumn extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "编号")
    @TableId(value = "column_id", type = IdType.AUTO)
    private Long columnId;

    @ApiModelProperty(value = "归属表编号")
    private Long tableId;

    @ApiModelProperty(value = "列名称")
    private String columnName;

    @ApiModelProperty(value = "列描述")
    private String columnComment;

    @ApiModelProperty(value = "列类型")
    private String columnType;

    @ApiModelProperty(value = "JAVA类型")
    private String javaType;

    @ApiModelProperty(value = "JAVA字段名")
    private String javaField;

    @ApiModelProperty(value = "是否主键（1是）")
    private String isPk;

    @ApiModelProperty(value = "是否自增（1是）")
    private String isIncrement;

    @ApiModelProperty(value = "是否必填（1是）")
    private String isRequired;

    @ApiModelProperty(value = "是否为插入字段（1是）")
    private String isInsert;

    @ApiModelProperty(value = "是否编辑字段（1是）")
    private String isEdit;

    @ApiModelProperty(value = "是否列表字段（1是）")
    private String isList;

    @ApiModelProperty(value = "是否查询字段（1是）")
    private String isQuery;

    @ApiModelProperty(value = "查询方式（等于、不等于、大于、小于、范围）")
    private String queryType;

    @ApiModelProperty(value = "显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）")
    private String htmlType;

    @ApiModelProperty(value = "字典类型")
    private String dictType;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    /**
     * 判断字段是否为超级列（用于忽略某些基础实体或树实体的属性）
     *
     * @param javaField 字段名
     * @return 如果字段名与预定义的超级列名之一匹配（不区分大小写），则返回true，否则返回false
     */
    public static boolean isSuperColumn(String javaField) {
        return StringUtils.equalsAnyIgnoreCase(javaField,
                // BaseEntity
                "create", "creator", "createTime", "update", "updater", "updateTime", "remark",
                // TreeEntity
                "parentName", "parentId", "sort", "ancestors");
    }

    /**
     * 判断字段是否为可用列（创建页面时需要的属性白名单）
     *
     * @param javaField 字段名
     * @return 如果字段名与预定义的可用列名之一匹配（不区分大小写），则返回true，否则返回false
     */
    public static boolean isUsableColumn(String javaField) {
        // isSuperColumn()中的名单用于避免生成多余Domain属性，若某些属性在生成页面时需要用到不能忽略，则放在此处白名单
        return StringUtils.equalsAnyIgnoreCase(javaField, "parentId", "sort", "remark");
    }

    public String getCapJavaField() {
        return StringUtils.capitalize(javaField);
    }

    public boolean isPk() {
        return isPk(this.isPk);
    }

    /**
     * 判断是否为主键
     *
     * @param isPk 表示是否为主键的字符串标识
     * @return 如果isPk为"1"且不为空，则返回true，否则返回false
     */
    public boolean isPk(String isPk) {
        return isPk != null && StringUtils.equals("1", isPk);
    }

    public boolean isIncrement() {
        return isIncrement(this.isIncrement);
    }

    /**
     * 判断是否为自增字段
     *
     * @param isIncrement 表示是否为自增字段的字符串标识
     * @return 如果isIncrement为"1"且不为空，则返回true，否则返回false
     */
    public boolean isIncrement(String isIncrement) {
        return isIncrement != null && StringUtils.equals("1", isIncrement);
    }

    public boolean isRequired() {
        return isRequired(this.isRequired);
    }

    /**
     * 判断字段是否为必填
     *
     * @param isRequired 表示字段是否必填的字符串标识
     * @return 如果isRequired为"1"且不为空，则返回true，否则返回false
     */
    public boolean isRequired(String isRequired) {
        return isRequired != null && StringUtils.equals("1", isRequired);
    }

    public boolean isInsert() {
        return isInsert(this.isInsert);
    }

    /**
     * 判断字段是否在插入时需要
     *
     * @param isInsert 表示字段是否在插入时需要的字符串标识
     * @return 如果isInsert为"1"且不为空，则返回true，否则返回false
     */
    public boolean isInsert(String isInsert) {
        return isInsert != null && StringUtils.equals("1", isInsert);
    }

    public boolean isEdit() {
        return isInsert(this.isEdit);
    }

    /**
     * 判断字段是否在编辑时需要
     *
     * @param isEdit 表示字段是否在编辑时需要的字符串标识
     * @return 如果isEdit为"1"且不为空，则返回true，否则返回false
     */
    public boolean isEdit(String isEdit) {
        return isEdit != null && StringUtils.equals("1", isEdit);
    }

    public boolean isList() {
        return isList(this.isList);
    }

    /**
     * 判断字段是否在列表中显示
     *
     * @param isList 表示字段是否在列表中显示的字符串标识
     * @return 如果isList为"1"且不为空，则返回true，否则返回false
     */
    public boolean isList(String isList) {
        return isList != null && StringUtils.equals("1", isList);
    }

    public boolean isQuery() {
        return isQuery(this.isQuery);
    }

    /**
     * 判断字段是否可用于查询
     *
     * @param isQuery 表示字段是否可用于查询的字符串标识
     * @return 如果isQuery为"1"且不为空，则返回true，否则返回false
     */
    public boolean isQuery(String isQuery) {
        return isQuery != null && StringUtils.equals("1", isQuery);
    }

    public boolean isSuperColumn() {
        return isSuperColumn(this.javaField);
    }

    public boolean isUsableColumn() {
        return isUsableColumn(javaField);
    }

    /**
     * 读取并转换列的备注信息
     *
     * @return 转换后的备注信息字符串
     */
    public String readConverterExp() {
        // 提取列注释中的备注信息
        String remarks = StringUtils.substringBetween(this.columnComment, "（", "）");
        StringBuffer sb = new StringBuffer();
        if (StringUtils.isNotEmpty(remarks)) {
            // 处理备注信息，生成特定格式的字符串
            for (String value : remarks.split(" ")) {
                if (StringUtils.isNotEmpty(value)) {
                    Object startStr = value.subSequence(0, 1);
                    String endStr = value.substring(1);
                    sb.append("").append(startStr).append("=").append(endStr).append(",");
                }
            }
            // 移除最后的逗号
            return sb.deleteCharAt(sb.length() - 1).toString();
        } else {
            // 如果没有备注信息，则直接返回列的注释
            return this.columnComment;
        }
    }
}
