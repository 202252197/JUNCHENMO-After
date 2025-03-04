package com.jcm.gen.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.jcm.common.core.constant.GenConstants;
import com.jcm.gen.domain.GenTable;
import com.jcm.gen.domain.GenTableColumn;
import org.apache.velocity.VelocityContext;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 模板工具类
 *
 * @author junchenmo
 */
public class VelocityUtils {
    /**
     * 项目空间路径
     */
    private static final String PROJECT_PATH = "main/java";

    /**
     * mybatis空间路径
     */
    private static final String MYBATIS_PATH = "main/resources/mapper";

    /**
     * 默认上级菜单，系统工具
     */
    private static final String DEFAULT_PARENT_MENU_ID = "3";

    /**
     * 前端接口枚举内容
     */
    private static final String DEFAULT_API_ENUM = "${API_ENUM.SERVER_MODE_NAME.***}";

    /**
     * 设置模板变量信息
     *
     * @return 模板列表
     */
    public static VelocityContext prepareContext(GenTable genTable) {
        String moduleName = genTable.getModuleName();
        String businessName = genTable.getBusinessName();
        String packageName = genTable.getPackageName();
        String tplCategory = genTable.getTplCategory();
        String functionName = genTable.getFunctionName();

        // 创建一个新的 VelocityContext 实例，用于存储模板变量
        VelocityContext velocityContext = new VelocityContext();

        // 设置模板类型（如 crud, tree, sub）
        velocityContext.put("tplCategory", genTable.getTplCategory());

        // 设置表名 tx_vips
        velocityContext.put("tableName", genTable.getTableName());

        // 设置大写的表名 TX_VIPS
        velocityContext.put("tableNameUC", genTable.getTableName().toUpperCase());

        // 设置前端接口枚举名称
        velocityContext.put("apiEnum", DEFAULT_API_ENUM.replace("***", genTable.getTableName().toUpperCase()));

        // 设置功能名称，如果为空则默认为“【请填写功能名称】”
        velocityContext.put("functionName", StrUtil.isNotEmpty(functionName) ? functionName : "【请填写功能名称】");

        // 设置类名（首字母大写）
        velocityContext.put("ClassName", genTable.getClassName());

        // 设置类名（首字母小写）
        velocityContext.put("className", StrUtil.lowerFirst(genTable.getClassName()));

        // 设置模块名
        velocityContext.put("moduleName", genTable.getModuleName());

        // 设置业务名（首字母大写）
        velocityContext.put("BusinessName", StrUtil.upperFirst(genTable.getBusinessName()));

        // 设置业务名（原样）
        velocityContext.put("businessName", genTable.getBusinessName());

        // 获取并设置包前缀（去掉最后一个点及其后面的部分）
        velocityContext.put("basePackage", getPackagePrefix(packageName));

        // 设置完整包路径
        velocityContext.put("packageName", packageName);

        // 设置生成功能的作者
        velocityContext.put("author", genTable.getFunctionAuthor());

        // 设置生成代码的时间
        velocityContext.put("datetime", DateUtil.today());

        // 设置主键列信息
        velocityContext.put("pkColumn", genTable.getPkColumn());

        // 获取并设置需要导入的包列表
        velocityContext.put("importList", getImportList(genTable));

        // 设置权限前缀（模块名:业务名）
        velocityContext.put("permissionPrefix", getPermissionPrefix(moduleName, businessName));

        // 设置表的所有列信息
        velocityContext.put("columns", genTable.getColumns());

        // 设置整个表对象
        velocityContext.put("table", genTable);

        // 设置字典信息（用于生成下拉框、单选框等）
        velocityContext.put("dicts", getDicts(genTable));

        setMenuVelocityContext(velocityContext, genTable);
        if (GenConstants.TPL_TREE.equals(tplCategory)) {
            setTreeVelocityContext(velocityContext, genTable);
        }

        return velocityContext;
    }

    public static void setMenuVelocityContext(VelocityContext context, GenTable genTable) {
        String options = genTable.getOptions();
        JSONObject paramsObj = JSON.parseObject(options);
        String parentMenuId = getParentMenuId(paramsObj);
        context.put("parentMenuId", parentMenuId);
    }

    public static void setTreeVelocityContext(VelocityContext context, GenTable genTable) {
        String options = genTable.getOptions();
        JSONObject paramsObj = JSON.parseObject(options);
        String treeCode = getTreecode(paramsObj);
        String treeParentCode = getTreeParentCode(paramsObj);
        String treeName = getTreeName(paramsObj);

        context.put("treeCode", treeCode);
        context.put("treeParentCode", treeParentCode);
        context.put("treeName", treeName);
        context.put("expandColumn", getExpandColumn(genTable));
        if (paramsObj.containsKey(GenConstants.TREE_PARENT_CODE)) {
            context.put("tree_parent_code", paramsObj.getString(GenConstants.TREE_PARENT_CODE));
        }
        if (paramsObj.containsKey(GenConstants.TREE_NAME)) {
            context.put("tree_name", paramsObj.getString(GenConstants.TREE_NAME));
        }
    }

    /**
     * 获取模板信息
     *
     * @param tplCategory 生成的模板
     * @return 模板列表
     */
    public static List<String> getTemplateList(String tplCategory) {
        String useWebType = "vm/vue";
        List<String> templates = new ArrayList<String>();
        templates.add("vm/java/controller.java.vm");
        templates.add("vm/java/domain.java.vm");
        templates.add("vm/java/service.java.vm");
        templates.add("vm/java/serviceImpl.java.vm");
        templates.add("vm/java/mapper.java.vm");
        templates.add("vm/xml/mapper.xml.vm");
//        templates.add("vm/sql/sql.vm");
        templates.add("vm/ts/api.ts.vm");
        templates.add("vm/store/indexStore.ts.vm");
        templates.add(useWebType + "/components/indexAddModal.vue.vm");
        templates.add(useWebType + "/components/indexUpdateModal.vue.vm");
        if (GenConstants.TPL_CRUD.equals(tplCategory)) {
            templates.add(useWebType + "/index.vue.vm");
        }
//        else if (GenConstants.TPL_TREE.equals(tplCategory))
//        {
//            templates.add(useWebType + "/index-tree.vue.vm");
//        }
        return templates;
    }

    /**
     * 获取文件名
     */
    public static String getFileName(String template, GenTable genTable) {
        // 文件名称
        String fileName = "";
        // 包路径
        String packageName = genTable.getPackageName();
        // 模块名
        String moduleName = genTable.getModuleName();
        // 大写类名
        String className = genTable.getClassName();
        // 业务名称
        String businessName = genTable.getBusinessName();

        String javaPath = PROJECT_PATH + "/" + StrUtil.replace(packageName, ".", "/");
        String mybatisPath = MYBATIS_PATH + "/";
        String vuePath = "vue";

        if (template.contains("domain.java.vm")) {
            fileName = StrUtil.format("{}/domain/{}.java", javaPath, className);
        }
        if (template.contains("mapper.java.vm")) {
            fileName = StrUtil.format("{}/mapper/{}Mapper.java", javaPath, className);
        } else if (template.contains("service.java.vm")) {
            fileName = StrUtil.format("{}/service/I{}Service.java", javaPath, className);
        } else if (template.contains("serviceImpl.java.vm")) {
            fileName = StrUtil.format("{}/service/impl/{}ServiceImpl.java", javaPath, className);
        } else if (template.contains("controller.java.vm")) {
            fileName = StrUtil.format("{}/controller/{}Controller.java", javaPath, className);
        } else if (template.contains("mapper.xml.vm")) {
            fileName = StrUtil.format("{}/{}Mapper.xml", mybatisPath, className);
        } else if (template.contains("sql.vm")) {
            fileName = businessName + "Menu.sql";
        } else if (template.contains("api.ts.vm")) {
            fileName = StrUtil.format("{}/api/{}/index.ts", vuePath, moduleName, businessName);
        } else if (template.contains("indexStore.ts.vm")) {
            fileName = StrUtil.format("{}/store/{}/{}.ts", vuePath, moduleName, businessName);
        } else if (template.contains("indexAddModal.vue.vm")) {
            fileName = StrUtil.format("{}/views/{}/{}/components/{}-add-from-modal.vue", vuePath, moduleName, businessName, businessName.replace("_", "-"));
        } else if (template.contains("indexUpdateModal.vue.vm")) {
            fileName = StrUtil.format("{}/views/{}/{}/components/{}-update-from-modal.vue", vuePath, moduleName, businessName, businessName.replace("_", "-"));
        } else if (template.contains("index.vue.vm")) {
            fileName = StrUtil.format("{}/views/{}/{}/index.vue", vuePath, moduleName, businessName);
        } else if (template.contains("index-tree.vue.vm")) {
            fileName = StrUtil.format("{}/views/{}/{}/index.vue", vuePath, moduleName, businessName);
        }
        return fileName;
    }

    /**
     * 获取包前缀
     *
     * @param packageName 包名称
     * @return 包前缀名称
     */
    public static String getPackagePrefix(String packageName) {
        int lastIndex = packageName.lastIndexOf(".");
        return StrUtil.sub(packageName, 0, lastIndex);
    }

    /**
     * 根据列类型获取导入包
     *
     * @param genTable 业务表对象
     * @return 返回需要导入的包列表
     */
    public static HashSet<String> getImportList(GenTable genTable) {
        List<GenTableColumn> columns = genTable.getColumns();
        HashSet<String> importList = new HashSet<String>();
        for (GenTableColumn column : columns) {
            if (!column.isSuperColumn() && GenConstants.TYPE_DATE.equals(column.getJavaType())) {
                importList.add("java.util.Date");
                importList.add("com.fasterxml.jackson.annotation.JsonFormat");
            } else if (!column.isSuperColumn() && GenConstants.TYPE_BIGDECIMAL.equals(column.getJavaType())) {
                importList.add("java.math.BigDecimal");
            }
        }
        return importList;
    }

    /**
     * 根据列类型获取字典组
     *
     * @param genTable 业务表对象
     * @return 返回字典组
     */
    public static String getDicts(GenTable genTable) {
        List<GenTableColumn> columns = genTable.getColumns();
        Set<String> dicts = new HashSet<String>();
        addDicts(dicts, columns);
        return StrUtil.join(", ",dicts);
    }

    /**
     * 添加字典列表
     *
     * @param dicts   字典列表
     * @param columns 列集合
     */
    public static void addDicts(Set<String> dicts, List<GenTableColumn> columns) {
        for (GenTableColumn column : columns) {
            if (!column.isSuperColumn() && StrUtil.isNotEmpty(column.getDictType()) && StrUtil.equalsAny(
                    column.getHtmlType(),
                    new String[]{GenConstants.HTML_SELECT, GenConstants.HTML_RADIO, GenConstants.HTML_CHECKBOX})) {
                dicts.add("'" + column.getDictType() + "'");
            }
        }
    }

    /**
     * 获取权限前缀
     *
     * @param moduleName   模块名称
     * @param businessName 业务名称
     * @return 返回权限前缀
     */
    public static String getPermissionPrefix(String moduleName, String businessName) {
        return StrUtil.format("{}:{}", moduleName, businessName);
    }

    /**
     * 获取上级菜单ID字段
     *
     * @param paramsObj 生成其他选项
     * @return 上级菜单ID字段
     */
    public static String getParentMenuId(JSONObject paramsObj) {
        if (ObjectUtil.isNotEmpty(paramsObj) && paramsObj.containsKey(GenConstants.PARENT_MENU_ID)
                && StrUtil.isNotEmpty(paramsObj.getString(GenConstants.PARENT_MENU_ID))) {
            return paramsObj.getString(GenConstants.PARENT_MENU_ID);
        }
        return DEFAULT_PARENT_MENU_ID;
    }

    /**
     * 获取树编码
     *
     * @param paramsObj 生成其他选项
     * @return 树编码
     */
    public static String getTreecode(JSONObject paramsObj) {
        if (paramsObj.containsKey(GenConstants.TREE_CODE)) {
            return StrUtil.toCamelCase(paramsObj.getString(GenConstants.TREE_CODE));
        }
        return StrUtil.EMPTY;
    }

    /**
     * 获取树父编码
     *
     * @param paramsObj 生成其他选项
     * @return 树父编码
     */
    public static String getTreeParentCode(JSONObject paramsObj) {
        if (paramsObj.containsKey(GenConstants.TREE_PARENT_CODE)) {
            return StrUtil.toCamelCase(paramsObj.getString(GenConstants.TREE_PARENT_CODE));
        }
        return StrUtil.EMPTY;
    }

    /**
     * 获取树名称
     *
     * @param paramsObj 生成其他选项
     * @return 树名称
     */
    public static String getTreeName(JSONObject paramsObj) {
        if (paramsObj.containsKey(GenConstants.TREE_NAME)) {
            return StrUtil.toCamelCase(paramsObj.getString(GenConstants.TREE_NAME));
        }
        return StrUtil.EMPTY;
    }

    /**
     * 获取需要在哪一列上面显示展开按钮
     *
     * @param genTable 业务表对象
     * @return 展开按钮列序号
     */
    public static int getExpandColumn(GenTable genTable) {
        String options = genTable.getOptions();
        JSONObject paramsObj = JSON.parseObject(options);
        String treeName = paramsObj.getString(GenConstants.TREE_NAME);
        int num = 0;
        for (GenTableColumn column : genTable.getColumns()) {
            if (column.isList()) {
                num++;
                String columnName = column.getColumnName();
                if (columnName.equals(treeName)) {
                    break;
                }
            }
        }
        return num;
    }
}
