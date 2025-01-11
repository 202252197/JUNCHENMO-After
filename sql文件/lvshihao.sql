/*
 Navicat Premium Data Transfer

 Source Server         : lvshihao
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : lvshihao

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 11/01/2025 21:19:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '删除标识(0未删除，1已经删除)',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (21, 'tx_vip', 'vip表', 'TxVip', 'crud', 'com.jcm.system', 'system', 'vip', 'vip', 'lvshihao', '1', 'D:\\lvshihao\\Jcm\\jcm-modules\\jcm-system\\src\\', 'null', 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', 'ceshi', b'0');
INSERT INTO `gen_table` VALUES (22, 'sys_oper_log', '操作日志记录', 'SysOperLog', 'crud', 'com.jcm.system', 'system', 'log', '操作日志记录', 'lvshihao', '0', '/', NULL, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table` VALUES (23, 'sys_logininfor', '系统访问记录', 'SysLogininfor', 'crud', 'com.jcm.system', 'system', 'logininfor', '系统访问记录', 'lvshihao', '1', 'D:\\lvshihao\\Jcm\\jcm-modules\\jcm-system\\src\\', 'null', 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识(0未删除，1已经删除)',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 313 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (275, 21, 'vip_id', '会员id', 'bigint', 'Long', 'vipId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (276, 21, 'xy_name', '咸鱼名称', 'varchar(255)', 'String', 'xyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (277, 21, 'starting_time', '起始时间', 'datetime', 'Date', 'startingTime', '0', '0', NULL, '1', '1', '1', '1', 'GTE', 'datetime', '', 3, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (278, 21, 'stoping_time', '结束时间', 'datetime', 'Date', 'stopingTime', '0', '0', NULL, '1', '1', '1', '1', 'LTE', 'datetime', '', 4, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (279, 21, 'purchase_days', '开通天数', 'varchar(255)', 'String', 'purchaseDays', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (280, 21, 'unit_type', '设备名称', 'varchar(255)', 'String', 'unitType', '0', '0', NULL, '0', '1', '0', '1', 'EQ', 'input', '', 6, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (281, 21, 'status', '状态(0在用，1下线)', 'bit(1)', 'Boolean', 'status', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 7, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (282, 21, 'login_method', '登录方式（QQ或微信）', 'varchar(255)', 'String', 'loginMethod', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (283, 21, 'login_account', '登录账号', 'varchar(255)', 'String', 'loginAccount', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (284, 22, 'oper_id', '日志主键', 'bigint', 'Long', 'operId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (285, 22, 'title', '模块标题', 'varchar(50)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (286, 22, 'business_name', '业务名称', 'varchar(255)', 'String', 'businessName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (287, 22, 'business_type', '业务类型（0其它 1新增 2修改 3删除）', 'int', 'Long', 'businessType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (288, 22, 'description', '操作日志', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (289, 22, 'method', '方法名称', 'varchar(100)', 'String', 'method', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (290, 22, 'request_method', '请求方式', 'varchar(10)', 'String', 'requestMethod', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (291, 22, 'request_time', '请求时间', 'datetime', 'Date', 'requestTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (292, 22, 'oper_name', '操作人员', 'varchar(50)', 'String', 'operName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (293, 22, 'oper_url', '请求URL', 'varchar(255)', 'String', 'operUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (294, 22, 'oper_ip', '主机地址', 'varchar(128)', 'String', 'operIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (295, 22, 'oper_location', '操作地点', 'varchar(255)', 'String', 'operLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (296, 22, 'oper_param', '请求参数', 'varchar(2000)', 'String', 'operParam', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 13, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (297, 22, 'json_result', '返回参数', 'varchar(2000)', 'String', 'jsonResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 14, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (298, 22, 'status', '操作状态（0正常 1异常）', 'int', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 15, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (299, 22, 'error_msg', '错误消息', 'varchar(2000)', 'String', 'errorMsg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 16, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (300, 22, 'cost_time', '消耗时间', 'bigint', 'Long', 'costTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (301, 22, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 18, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (302, 22, 'creator', '创建人', 'varchar(64)', 'String', 'creator', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (303, 22, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (304, 22, 'updater', '修改人', 'varchar(64)', 'String', 'updater', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (305, 22, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (306, 22, 'deleted', '删除标识(0未删除，1已经删除)', 'bit(1)', 'String', 'deleted', '0', '0', '1', '1', '1', '1', '1', 'EQ', NULL, '', 23, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table_column` VALUES (307, 21, 'creator', '创建者', 'varchar(64)', 'String', 'creator', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 10, '', '2025-01-10 14:42:32', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (308, 21, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, '', '2025-01-10 14:42:32', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (309, 21, 'updater', '更新者', 'varchar(64)', 'String', 'updater', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 12, '', '2025-01-10 14:42:32', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (310, 21, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 13, '', '2025-01-10 14:42:32', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (311, 21, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 14, '', '2025-01-10 14:42:32', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (312, 21, 'deleted', '删除标识(0未删除，1已经删除)', 'bit(1)', 'String', 'deleted', '0', '0', '1', '0', '0', '0', '0', 'EQ', NULL, '', 15, '', '2025-01-10 14:42:32', 'admin', '2025-01-11 10:30:04', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (313, 23, 'info_id', '访问ID', 'bigint', 'Long', 'infoId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (314, 23, 'user_name', '用户账号', 'varchar(50)', 'String', 'userName', '0', '0', NULL, '0', '0', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (315, 23, 'ipaddr', '登录IP地址', 'varchar(128)', 'String', 'ipaddr', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (316, 23, 'login_location', '登录地点', 'varchar(255)', 'String', 'loginLocation', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (317, 23, 'browser', '浏览器类型', 'varchar(50)', 'String', 'browser', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (318, 23, 'os', '操作系统', 'varchar(50)', 'String', 'os', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (319, 23, 'status', '登录状态（0成功 1失败）', 'char(1)', 'String', 'status', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'select', 'loginStatus', 7, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (320, 23, 'msg', '提示消息', 'varchar(255)', 'String', 'msg', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 8, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (321, 23, 'login_time', '访问时间', 'datetime', 'Date', 'loginTime', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (322, 23, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'input', '', 10, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (323, 23, 'creator', '创建人', 'varchar(64)', 'String', 'creator', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (324, 23, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (325, 23, 'updater', '修改人', 'varchar(64)', 'String', 'updater', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (326, 23, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (327, 23, 'deleted', '删除标识(0未删除，1已经删除)', 'bit(1)', 'String', 'deleted', '0', '0', '1', '0', NULL, NULL, NULL, 'EQ', NULL, '', 15, 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_data_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_type_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '配置项ID',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '配置值',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '配置描述',
  `sort` int NOT NULL COMMENT '排序',
  `extra` json NULL COMMENT '额外参数',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`dict_data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典配置值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (2, '22', 'junchenmo', '个人信息', 10, NULL, 0, NULL, 'admin', '2024-12-06 18:32:15', NULL, '2024-12-06 18:32:15', b'1');
INSERT INTO `sys_dict_data` VALUES (14, '25', '0', '字符串', 10, '{}', 0, NULL, 'admin', '2024-12-12 14:01:34', NULL, '2024-12-12 14:01:34', b'1');
INSERT INTO `sys_dict_data` VALUES (15, '25', '0', '字符串', 10, '{}', 0, NULL, 'admin', '2024-12-12 14:04:04', NULL, '2024-12-12 14:04:04', b'0');
INSERT INTO `sys_dict_data` VALUES (16, '25', '1', '整数', 20, '{}', 0, NULL, 'admin', '2024-12-12 14:04:24', NULL, '2024-12-12 14:04:24', b'0');
INSERT INTO `sys_dict_data` VALUES (17, '25', '2', '小数', 30, '{}', 0, NULL, 'admin', '2024-12-12 14:04:42', NULL, '2024-12-12 14:04:42', b'0');
INSERT INTO `sys_dict_data` VALUES (18, '25', '3', '布尔值', 40, '{}', 0, NULL, 'admin', '2024-12-12 14:05:12', NULL, '2024-12-12 14:05:12', b'0');
INSERT INTO `sys_dict_data` VALUES (19, '25', '4', '颜色', 50, '{}', 0, NULL, 'admin', '2024-12-12 14:05:30', NULL, '2024-12-12 14:05:30', b'0');
INSERT INTO `sys_dict_data` VALUES (20, '26', '0', '正常', 10, '{}', 0, NULL, 'admin', '2024-12-12 15:17:53', NULL, '2024-12-12 15:17:53', b'1');
INSERT INTO `sys_dict_data` VALUES (21, '26', '1', '停用', 20, '{}', 0, NULL, 'admin', '2024-12-12 15:18:22', NULL, '2024-12-12 15:18:22', b'1');
INSERT INTO `sys_dict_data` VALUES (22, '27', '11', '测试用', 10, '{\"status\": \"true\"}', 0, NULL, 'admin', '2024-12-13 17:13:41', 'admin', '2024-12-13 18:56:21', b'1');
INSERT INTO `sys_dict_data` VALUES (25, '24', 'color', '颜色', 10, '{\"type\": \"4\"}', 0, NULL, 'admin', '2024-12-14 21:24:46', NULL, '2024-12-14 21:24:46', b'0');
INSERT INTO `sys_dict_data` VALUES (26, '24', 'disabled', '禁用状态', 20, '{\"type\": \"3\"}', 0, NULL, 'admin', '2024-12-14 21:25:58', NULL, '2024-12-14 21:25:58', b'0');
INSERT INTO `sys_dict_data` VALUES (27, '24', 'type', '类型', 30, '{\"type\": \"0\"}', 0, NULL, 'admin', '2024-12-14 21:26:43', NULL, '2024-12-14 21:26:43', b'0');
INSERT INTO `sys_dict_data` VALUES (28, '24', 'icon', '图标', 40, '{\"type\": \"0\"}', 0, NULL, 'admin', '2024-12-14 21:27:11', NULL, '2024-12-14 21:27:11', b'0');
INSERT INTO `sys_dict_data` VALUES (29, '24', 'style', '类样式', 50, '{\"type\": \"0\"}', 0, NULL, 'admin', '2024-12-14 21:28:23', NULL, '2024-12-14 21:28:23', b'0');
INSERT INTO `sys_dict_data` VALUES (30, '24', 'label', '标签', 60, '{\"type\": \"0\"}', 0, NULL, 'admin', '2024-12-14 21:29:01', NULL, '2024-12-14 21:29:01', b'0');
INSERT INTO `sys_dict_data` VALUES (41, '35', '0', '目录', 10, '{\"label\": \"目录\"}', 0, NULL, 'admin', '2024-12-25 10:47:35', NULL, '2024-12-25 10:47:35', b'0');
INSERT INTO `sys_dict_data` VALUES (42, '35', '1', '菜单', 20, '{\"label\": \"菜单\"}', 0, NULL, 'admin', '2024-12-25 10:47:58', NULL, '2024-12-25 10:47:58', b'0');
INSERT INTO `sys_dict_data` VALUES (43, '35', '2', '按钮', 30, '{\"label\": \"按钮\"}', 0, NULL, 'admin', '2024-12-25 10:48:22', NULL, '2024-12-25 10:48:22', b'0');
INSERT INTO `sys_dict_data` VALUES (46, '36', 'login_tokens:', '用户信息', 1, '{}', 0, NULL, 'admin', '2024-12-25 16:49:06', NULL, '2024-12-25 16:49:06', b'0');
INSERT INTO `sys_dict_data` VALUES (47, '36', 'captcha_codes:', '验证码', 2, '{}', 0, NULL, 'admin', '2024-12-25 16:49:59', NULL, '2024-12-25 16:49:59', b'0');
INSERT INTO `sys_dict_data` VALUES (48, '36', 'sys_dict_data:', '字典数据', 3, '{}', 0, NULL, 'admin', '2024-12-25 16:50:32', NULL, '2024-12-25 16:50:32', b'0');
INSERT INTO `sys_dict_data` VALUES (49, '36', 'pwd_err_cnt:', '密码错误次数', 4, '{}', 0, NULL, 'admin', '2024-12-25 17:39:04', NULL, '2024-12-25 17:39:04', b'0');
INSERT INTO `sys_dict_data` VALUES (51, '38', 'bigint', 'bigint', 1, '{}', 0, NULL, 'admin', '2024-12-31 18:15:01', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (52, '38', 'binary', 'binary', 2, '{}', 0, NULL, 'admin', '2024-12-31 18:19:28', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (53, '38', 'bit', 'bit', 3, '{}', 0, NULL, 'admin', '2024-12-31 18:19:36', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (54, '38', 'blob', 'blob', 4, '{}', 0, NULL, 'admin', '2024-12-31 18:19:50', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (55, '38', 'char', 'char', 5, '{}', 0, NULL, 'admin', '2024-12-31 18:20:00', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (56, '38', 'date', 'date', 6, '{}', 0, NULL, 'admin', '2024-12-31 18:20:17', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (57, '38', 'datetime', 'datetime', 7, '{}', 0, NULL, 'admin', '2024-12-31 18:21:04', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (58, '38', 'decimal', 'decimal', 8, '{}', 0, NULL, 'admin', '2024-12-31 18:21:14', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (59, '38', 'double', 'double', 9, '{}', 0, NULL, 'admin', '2024-12-31 18:21:23', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (60, '38', 'enum', 'enum', 10, '{}', 0, NULL, 'admin', '2024-12-31 18:21:38', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (61, '38', 'float', 'float', 11, '{}', 0, NULL, 'admin', '2024-12-31 18:21:52', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (62, '38', 'geometry', 'geometry', 12, '{}', 0, NULL, 'admin', '2024-12-31 18:22:07', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (63, '38', 'geometrycollection', 'geometrycollection', 13, '{}', 0, NULL, 'admin', '2024-12-31 18:23:05', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (64, '38', 'int', 'int', 14, '{}', 0, NULL, 'admin', '2024-12-31 18:23:28', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (65, '38', 'integer', 'integer', 15, '{}', 0, NULL, 'admin', '2024-12-31 18:23:38', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (66, '38', 'json', 'json', 16, '{}', 0, NULL, 'admin', '2024-12-31 18:23:48', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (67, '38', 'linestring', 'linestring', 17, '{}', 0, NULL, 'admin', '2024-12-31 18:23:57', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (68, '38', 'longblob', 'longblob', 18, '{}', 0, NULL, 'admin', '2024-12-31 18:25:35', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (69, '38', 'longtext', 'longtext', 19, '{}', 0, NULL, 'admin', '2024-12-31 18:25:47', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (70, '38', 'mediumblob', 'mediumblob', 20, '{}', 0, NULL, 'admin', '2024-12-31 18:25:57', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (71, '38', 'mediumint', 'mediumint', 21, '{}', 0, NULL, 'admin', '2024-12-31 18:26:04', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (72, '38', 'mediumtext', 'mediumtext', 22, '{}', 0, NULL, 'admin', '2024-12-31 18:26:11', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (73, '38', 'multilinestring', 'multilinestring', 23, '{}', 0, NULL, 'admin', '2024-12-31 18:27:01', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (74, '38', 'multipoint', 'multipoint', 24, '{}', 0, NULL, 'admin', '2024-12-31 18:27:08', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (75, '38', 'multipolygon', 'multipolygon', 25, '{}', 0, NULL, 'admin', '2024-12-31 18:27:16', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (76, '38', 'numeric', 'numeric', 26, '{}', 0, NULL, 'admin', '2024-12-31 18:27:24', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (77, '38', 'point', 'point', 27, '{}', 0, NULL, 'admin', '2024-12-31 18:27:32', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (78, '38', 'polygon', 'polygon', 28, '{}', 0, NULL, 'admin', '2024-12-31 18:28:13', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (79, '38', 'real', 'real', 29, '{}', 0, NULL, 'admin', '2024-12-31 18:28:21', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (80, '38', 'set', 'set', 30, '{}', 0, NULL, 'admin', '2024-12-31 18:28:30', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (81, '38', 'smallint', 'smallint', 31, '{}', 0, NULL, 'admin', '2024-12-31 18:28:40', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (82, '38', 'text', 'text', 32, '{}', 0, NULL, 'admin', '2024-12-31 18:28:48', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (83, '38', 'time', 'time', 33, '{}', 0, NULL, 'admin', '2024-12-31 18:28:55', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (84, '38', 'timestamp', 'timestamp', 34, '{}', 0, NULL, 'admin', '2024-12-31 18:29:42', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (85, '38', 'tinyblob', 'tinyblob', 35, '{}', 0, NULL, 'admin', '2024-12-31 18:29:52', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (86, '38', 'tinyint', 'tinyint', 36, '{}', 0, NULL, 'admin', '2024-12-31 18:29:59', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (87, '38', 'tinytext', 'tinytext', 37, '{}', 0, NULL, 'admin', '2024-12-31 18:30:07', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (88, '38', 'varbinary', 'varbinary', 38, '{}', 0, NULL, 'admin', '2024-12-31 18:30:20', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (89, '38', 'varchar', 'varchar', 39, '{}', 0, NULL, 'admin', '2024-12-31 18:30:30', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (90, '38', 'year', 'year', 40, '{}', 0, NULL, 'admin', '2024-12-31 18:30:37', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_data` VALUES (91, '36', 'aiTable:', 'AI表结构请求', 5, '{}', 0, NULL, 'admin', '2025-01-01 17:03:54', 'admin', '2025-01-01 17:05:05', b'0');
INSERT INTO `sys_dict_data` VALUES (93, '40', 'Long', 'Long', 0, '{}', 0, NULL, 'admin', '2025-01-08 09:30:15', NULL, '2025-01-08 09:30:15', b'0');
INSERT INTO `sys_dict_data` VALUES (94, '40', 'String', 'String', 1, '{}', 0, NULL, 'admin', '2025-01-08 09:30:26', NULL, '2025-01-08 09:30:26', b'0');
INSERT INTO `sys_dict_data` VALUES (95, '40', 'Integer', 'Integer', 2, '{}', 0, NULL, 'admin', '2025-01-08 09:30:44', NULL, '2025-01-08 09:30:44', b'0');
INSERT INTO `sys_dict_data` VALUES (96, '40', 'Double', 'Double', 3, '{}', 0, NULL, 'admin', '2025-01-08 09:31:00', NULL, '2025-01-08 09:31:00', b'0');
INSERT INTO `sys_dict_data` VALUES (97, '40', 'BigDecimal', 'BigDecimal', 4, '{}', 0, NULL, 'admin', '2025-01-08 09:31:23', NULL, '2025-01-08 09:31:23', b'0');
INSERT INTO `sys_dict_data` VALUES (98, '40', 'Date', 'Date', 5, '{}', 0, NULL, 'admin', '2025-01-08 09:31:37', NULL, '2025-01-08 09:31:37', b'0');
INSERT INTO `sys_dict_data` VALUES (99, '40', 'Boolean', 'Boolean', 6, '{}', 0, NULL, 'admin', '2025-01-08 09:32:00', NULL, '2025-01-08 09:32:00', b'0');
INSERT INTO `sys_dict_data` VALUES (100, '41', 'EQ', '=', 0, '{}', 0, NULL, 'admin', '2025-01-08 09:33:16', 'admin', '2025-01-08 09:47:20', b'0');
INSERT INTO `sys_dict_data` VALUES (101, '41', 'NE', '!=', 1, '{}', 0, NULL, 'admin', '2025-01-08 09:33:30', 'admin', '2025-01-08 09:47:35', b'0');
INSERT INTO `sys_dict_data` VALUES (102, '41', 'GT', '>', 2, '{}', 0, NULL, 'admin', '2025-01-08 09:33:47', 'admin', '2025-01-08 09:47:50', b'0');
INSERT INTO `sys_dict_data` VALUES (103, '41', 'GTE', '>=', 3, '{}', 0, NULL, 'admin', '2025-01-08 09:34:07', 'admin', '2025-01-08 09:48:00', b'0');
INSERT INTO `sys_dict_data` VALUES (104, '41', 'LT', '<', 4, '{}', 0, NULL, 'admin', '2025-01-08 09:35:29', 'admin', '2025-01-08 09:48:10', b'0');
INSERT INTO `sys_dict_data` VALUES (105, '41', 'LTE', '<=', 5, '{}', 0, NULL, 'admin', '2025-01-08 09:35:47', 'admin', '2025-01-08 09:48:24', b'0');
INSERT INTO `sys_dict_data` VALUES (106, '41', 'LIKE', 'LIKE', 6, '{}', 0, NULL, 'admin', '2025-01-08 09:36:29', 'admin', '2025-01-08 09:48:50', b'0');
INSERT INTO `sys_dict_data` VALUES (107, '41', 'BETWEEN', 'BETWEEN', 7, '{}', 0, NULL, 'admin', '2025-01-08 09:37:07', 'admin', '2025-01-08 09:49:08', b'0');
INSERT INTO `sys_dict_data` VALUES (108, '42', 'input', '文本框', 0, '{}', 0, NULL, 'admin', '2025-01-08 09:38:10', 'admin', '2025-01-08 09:50:12', b'0');
INSERT INTO `sys_dict_data` VALUES (109, '42', '文本域', '文本域', 1, '{}', 0, NULL, 'admin', '2025-01-08 09:38:22', NULL, '2025-01-08 09:38:22', b'0');
INSERT INTO `sys_dict_data` VALUES (110, '42', 'select', '下拉框', 2, '{}', 0, NULL, 'admin', '2025-01-08 09:38:31', 'admin', '2025-01-08 09:50:54', b'0');
INSERT INTO `sys_dict_data` VALUES (111, '42', 'radio', '单选框', 3, '{}', 0, NULL, 'admin', '2025-01-08 09:38:41', 'admin', '2025-01-08 09:51:07', b'0');
INSERT INTO `sys_dict_data` VALUES (112, '42', '复选框', '复选框', 4, '{}', 0, NULL, 'admin', '2025-01-08 09:38:54', NULL, '2025-01-08 09:38:54', b'0');
INSERT INTO `sys_dict_data` VALUES (113, '42', 'datetime', '日期控件', 5, '{}', 0, NULL, 'admin', '2025-01-08 09:39:07', 'admin', '2025-01-08 09:51:34', b'0');
INSERT INTO `sys_dict_data` VALUES (114, '42', '图片上传', '图片上传', 6, '{}', 0, NULL, 'admin', '2025-01-08 09:39:17', NULL, '2025-01-08 09:39:17', b'0');
INSERT INTO `sys_dict_data` VALUES (115, '42', '文件上传', '文件上传', 7, '{}', 0, NULL, 'admin', '2025-01-08 09:39:29', NULL, '2025-01-08 09:39:29', b'0');
INSERT INTO `sys_dict_data` VALUES (116, '42', '富文本控件', '富文本控件', 8, '{}', 0, NULL, 'admin', '2025-01-08 09:41:06', NULL, '2025-01-08 09:41:06', b'0');
INSERT INTO `sys_dict_data` VALUES (117, '43', 'crud', '单表（增删改查）', 0, '{}', 0, NULL, 'admin', '2025-01-08 15:10:14', NULL, '2025-01-08 15:10:14', b'0');
INSERT INTO `sys_dict_data` VALUES (118, '43', 'tree', '树表（增删改查）', 1, '{}', 0, NULL, 'admin', '2025-01-08 15:11:01', NULL, '2025-01-08 15:11:01', b'0');
INSERT INTO `sys_dict_data` VALUES (119, '44', '0', '成功', 0, '{}', 0, NULL, 'admin', '2025-01-11 14:56:46', NULL, '2025-01-11 14:56:46', b'0');
INSERT INTO `sys_dict_data` VALUES (120, '44', '1', '失败', 1, '{}', 0, NULL, 'admin', '2025-01-11 14:56:58', NULL, '2025-01-11 14:56:58', b'0');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '配置项',
  `type` tinyint NULL DEFAULT NULL COMMENT '配置值类型（0:字符串,1:整数,2:小数,3:布尔值,4:颜色）',
  `extra_schema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '额外配置定义',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '配置描述',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识(0未删除，1已经删除)',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典配置项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, 'hostType', 0, NULL, '主机类型', NULL, 0, NULL, '2024-10-31 21:20:34', NULL, '2024-10-31 21:20:37', b'1');
INSERT INTO `sys_dict_type` VALUES (2, 'hostData', 0, NULL, '测试', NULL, 1, NULL, '2024-10-31 21:31:25', NULL, '2024-10-31 21:31:28', b'1');
INSERT INTO `sys_dict_type` VALUES (4, 'ceshi', 0, NULL, '测试', 'admin', 0, NULL, '2024-11-01 16:28:19', NULL, '2024-11-01 16:28:19', b'1');
INSERT INTO `sys_dict_type` VALUES (7, 'status', 3, NULL, '状态', 'admin', 0, NULL, '2024-11-01 16:34:54', NULL, '2024-11-01 16:34:54', b'1');
INSERT INTO `sys_dict_type` VALUES (11, 'status1', 3, NULL, '状态', 'admin', 0, NULL, '2024-11-01 16:42:52', NULL, '2024-11-01 16:42:52', b'1');
INSERT INTO `sys_dict_type` VALUES (12, '测试', 0, NULL, 'ceshi', 'admin', 0, NULL, '2024-11-02 20:26:38', NULL, '2024-11-02 20:26:38', b'1');
INSERT INTO `sys_dict_type` VALUES (13, '22', 0, NULL, '33', 'admin', 0, NULL, '2024-11-23 16:48:19', NULL, '2024-11-23 16:48:19', b'1');
INSERT INTO `sys_dict_type` VALUES (14, '23', 0, NULL, '555', 'admin', 0, NULL, '2024-11-24 20:30:32', NULL, '2024-11-24 20:30:32', b'1');
INSERT INTO `sys_dict_type` VALUES (16, 'hidden', 3, NULL, '隐藏参数', 'admin', 0, NULL, '2024-11-28 17:22:35', NULL, '2024-11-28 17:22:35', b'1');
INSERT INTO `sys_dict_type` VALUES (17, 'outher', 0, NULL, '作者', 'admin', 0, NULL, '2024-11-28 17:26:09', NULL, '2024-11-28 17:26:09', b'1');
INSERT INTO `sys_dict_type` VALUES (22, 'lvshihao', 0, NULL, 'info', 'admin', 0, NULL, '2024-12-01 09:45:53', NULL, '2024-12-01 09:45:53', b'1');
INSERT INTO `sys_dict_type` VALUES (23, 'tag', 4, '[{\"parameter\":\"height\",\"type\":\"0\"},{\"parameter\":\"whide\",\"type\":\"0\"}]', 'tag颜色', 'admin', 0, NULL, '2024-12-07 10:26:59', NULL, '2024-12-07 10:26:59', b'1');
INSERT INTO `sys_dict_type` VALUES (24, 'extrasDefaultTag', 0, '[{\"parameter\":\"type\",\"type\":\"0\"}]', '额外默认配置项标签', 'admin', 0, NULL, '2024-12-11 10:47:07', NULL, '2024-12-11 10:47:07', b'0');
INSERT INTO `sys_dict_type` VALUES (25, 'extrasDefaultStatus', 1, '[]', '扩展项配置状态', 'admin', 0, NULL, '2024-12-12 14:01:04', NULL, '2024-12-12 14:01:04', b'0');
INSERT INTO `sys_dict_type` VALUES (26, 'dataListStatus', 0, '[]', '数据列表状态', 'admin', 0, NULL, '2024-12-12 15:17:15', NULL, '2024-12-12 15:17:15', b'1');
INSERT INTO `sys_dict_type` VALUES (27, 'ceshi', 0, '[{\"parameter\":\"status\",\"type\":\"0\"}]', '测试用', 'admin', 0, NULL, '2024-12-13 16:31:14', 'admin', '2024-12-13 18:56:21', b'1');
INSERT INTO `sys_dict_type` VALUES (28, 'ceshi', 0, '[{\"parameter\":\"status\",\"type\":\"3\"},{\"parameter\":\"color\",\"type\":\"4\"}]', '测试', 'admin', 0, NULL, '2024-12-14 14:58:56', 'admin', '2024-12-14 17:29:49', b'1');
INSERT INTO `sys_dict_type` VALUES (29, 'ceshi2', 0, '[]', '测试2', 'admin', 0, NULL, '2024-12-14 19:16:12', NULL, '2024-12-14 19:16:12', b'1');
INSERT INTO `sys_dict_type` VALUES (35, 'menuType', 0, '[{\"parameter\":\"label\",\"type\":\"0\"}]', '菜单类型', 'admin', 0, NULL, '2024-12-25 10:46:55', NULL, '2024-12-25 10:46:55', b'0');
INSERT INTO `sys_dict_type` VALUES (36, 'RedisCacheKey', 0, '[]', 'Redis缓存所用到的Key', 'admin', 0, NULL, '2024-12-25 16:46:51', 'admin', '2024-12-25 16:48:25', b'0');
INSERT INTO `sys_dict_type` VALUES (38, 'mysqlType', 0, '[]', '表生成器的类型可选项', 'admin', 0, NULL, '2024-12-31 18:14:00', 'admin', '2025-01-01 12:42:27', b'0');
INSERT INTO `sys_dict_type` VALUES (39, 'ces', 0, '[]', 'ces', 'admin', 0, NULL, '2025-01-07 13:42:32', NULL, '2025-01-07 13:42:32', b'1');
INSERT INTO `sys_dict_type` VALUES (40, 'javaType', 0, '[]', 'java类型', 'admin', 0, NULL, '2025-01-08 09:29:50', NULL, '2025-01-08 09:29:50', b'0');
INSERT INTO `sys_dict_type` VALUES (41, 'queryType', 0, '[]', '查询方式', 'admin', 0, NULL, '2025-01-08 09:32:46', NULL, '2025-01-08 09:32:46', b'0');
INSERT INTO `sys_dict_type` VALUES (42, 'htmlType', 0, '[]', '显示类型', 'admin', 0, NULL, '2025-01-08 09:37:31', NULL, '2025-01-08 09:37:31', b'0');
INSERT INTO `sys_dict_type` VALUES (43, 'moduleType', 0, '[]', '模版类型', 'admin', 0, NULL, '2025-01-08 15:09:23', NULL, '2025-01-08 15:09:23', b'0');
INSERT INTO `sys_dict_type` VALUES (44, 'loginStatus', 0, '[]', '登录状态', 'admin', 0, NULL, '2025-01-11 14:56:18', NULL, '2025-01-11 14:56:18', b'0');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识(0未删除，1已经删除)',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-11 18:56:18', NULL, '', '2025-01-11 18:56:18', NULL, '2025-01-11 18:56:18', b'1');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-11 19:01:59', NULL, '', '2025-01-11 19:01:59', NULL, '2025-01-11 19:01:59', b'0');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-11 21:15:11', NULL, '', '2025-01-11 21:15:12', NULL, '2025-01-11 21:15:12', b'0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `sort` int NOT NULL COMMENT '显示顺序',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件',
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '外联地址',
  `is_frame` bit(1) NULL DEFAULT NULL COMMENT '是否为外链（0是 1否）',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `type` tinyint NOT NULL COMMENT '菜单类型(0.目录,1.菜单,2.功能)',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单图标',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '菜单状态(0正常,1禁用)',
  `visible` bit(1) NOT NULL COMMENT '是否可见（0隐藏，1显示）',
  `keep_alive` bit(1) NOT NULL COMMENT '是否缓存（0不缓存，1缓存）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除(0未删除 1已删除)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 200, 'acl', '', b'0', '', 0, '管理', 0, b'1', b'0', NULL, '1', '2024-04-02 08:09:14', 'admin', '2024-12-25 13:52:41', b'0');
INSERT INTO `sys_menu` VALUES (30, '用户管理', 43, 200, 'user', '', b'0', '', 1, 'user-plus', 0, b'1', b'0', NULL, NULL, '2024-04-04 19:25:12', 'admin', '2024-12-23 21:35:44', b'0');
INSERT INTO `sys_menu` VALUES (32, '角色管理', 43, 200, 'role', '', b'0', '', 1, 'role', 0, b'1', b'0', NULL, NULL, '2024-04-05 16:24:52', 'admin', '2024-12-23 21:35:25', b'0');
INSERT INTO `sys_menu` VALUES (33, '菜单管理', 1, 300, 'menu', '', b'0', '', 1, 'menu', 0, b'1', b'0', NULL, NULL, '2024-04-05 16:26:35', 'admin', '2024-10-30 11:24:28', b'0');
INSERT INTO `sys_menu` VALUES (35, '首页', 0, 0, 'home', NULL, b'0', NULL, 1, 'home', 0, b'1', b'0', NULL, '1', '2024-10-20 07:13:01', NULL, '2024-10-20 07:13:08', b'0');
INSERT INTO `sys_menu` VALUES (43, '用户管理', 0, 100, 'user', '', b'0', '', 0, 'user', 0, b'1', b'0', NULL, 'admin', '2024-10-28 14:53:43', 'admin', '2024-12-23 19:19:40', b'0');
INSERT INTO `sys_menu` VALUES (44, '操作日志', 43, 300, 'operationLog', '', b'0', '', 1, 'log', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:09:18', 'admin', '2024-10-30 12:35:26', b'0');
INSERT INTO `sys_menu` VALUES (45, '数据字典项', 1, 500, 'dictType', '', b'0', '', 1, 'dictType', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:36:46', 'admin', '2024-10-31 19:52:54', b'0');
INSERT INTO `sys_menu` VALUES (46, '数据字典值', 1, 600, 'dictData', '', b'0', '', 1, 'dictData', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:37:16', 'admin', '2024-10-30 12:46:05', b'0');
INSERT INTO `sys_menu` VALUES (47, '系统设置', 1, 700, 'setting', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:37:43', 'admin', '2024-10-30 13:59:44', b'0');
INSERT INTO `sys_menu` VALUES (48, 'ceshi', 0, 1000, 'ceshi', '', b'0', '', 0, 'role', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:04:19', 'admin', '2024-12-25 13:49:32', b'0');
INSERT INTO `sys_menu` VALUES (49, 'ceshi1', 48, 100, 'ceshi1', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:04:31', 'admin', '2024-12-14 09:30:35', b'0');
INSERT INTO `sys_menu` VALUES (50, 'ceshi2', 48, 200, 'ceshi2', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:04:44', 'admin', '2024-12-14 10:18:48', b'0');
INSERT INTO `sys_menu` VALUES (51, 'ceshi3', 48, 300, 'ceshi3', '', b'0', '', 1, 'role', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:04:55', 'admin', '2024-12-14 10:11:45', b'0');
INSERT INTO `sys_menu` VALUES (52, 'ceshi4', 48, 400, 'ceshi4', '', b'0', '', 1, 'role', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:05:13', 'admin', '2024-12-14 10:18:50', b'0');
INSERT INTO `sys_menu` VALUES (54, '查询用户', 30, 100, '', '', b'1', 'system:user:list', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 16:41:57', 'admin', '2024-10-31 16:48:33', b'0');
INSERT INTO `sys_menu` VALUES (55, '新增用户', 30, 200, '', '', b'1', 'system:user:add', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 16:47:56', NULL, '2024-10-31 16:47:56', b'0');
INSERT INTO `sys_menu` VALUES (56, '删除用户', 30, 300, '', '', b'1', 'system:user:delete', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 16:48:54', NULL, '2024-10-31 16:48:54', b'0');
INSERT INTO `sys_menu` VALUES (57, '修改用户', 30, 400, '', '', b'1', 'system:user:edit', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 16:49:12', NULL, '2024-10-31 16:49:12', b'0');
INSERT INTO `sys_menu` VALUES (58, '重置用户密码', 30, 500, '', '', b'1', 'system:user:resetPassword', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 16:50:21', 'admin', '2024-10-31 16:53:12', b'0');
INSERT INTO `sys_menu` VALUES (59, '禁用账号', 30, 600, '', '', b'1', 'system:user:disableAccount', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 16:53:51', NULL, '2024-10-31 16:53:51', b'0');
INSERT INTO `sys_menu` VALUES (60, '用户授权角色', 30, 700, '', '', b'1', 'system:user:authRole', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 16:54:24', NULL, '2024-10-31 16:54:24', b'0');
INSERT INTO `sys_menu` VALUES (61, '查询角色', 32, 100, '', '', b'1', 'system:role:list', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 18:01:53', NULL, '2024-10-31 18:01:53', b'0');
INSERT INTO `sys_menu` VALUES (62, '新增角色', 32, 200, '', '', b'1', 'system:role:add', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 18:43:28', NULL, '2024-10-31 18:43:28', b'0');
INSERT INTO `sys_menu` VALUES (63, '删除角色', 32, 300, '', '', b'1', 'system:user:delete', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 18:44:20', NULL, '2024-10-31 18:44:20', b'0');
INSERT INTO `sys_menu` VALUES (64, '修改角色', 32, 400, '', '', b'1', 'system:role:edit', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 18:44:53', NULL, '2024-10-31 18:44:53', b'0');
INSERT INTO `sys_menu` VALUES (65, '修改状态', 32, 500, '', '', b'1', 'system:role:editStatus', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 18:45:34', NULL, '2024-10-31 18:45:34', b'0');
INSERT INTO `sys_menu` VALUES (66, '查询菜单', 33, 100, '', '', b'1', 'system:menu:list', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 19:01:57', NULL, '2024-10-31 19:01:57', b'0');
INSERT INTO `sys_menu` VALUES (67, '新增菜单', 33, 200, '', '', b'1', 'system:menu:add', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 19:02:38', 'admin', '2024-10-31 19:02:54', b'0');
INSERT INTO `sys_menu` VALUES (68, '删除菜单', 33, 300, '', '', b'1', 'system:menu:delete', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 19:03:16', NULL, '2024-10-31 19:03:16', b'0');
INSERT INTO `sys_menu` VALUES (69, '修改菜单', 33, 400, '', '', b'1', 'system:menu:edit', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 19:03:37', NULL, '2024-10-31 19:03:37', b'0');
INSERT INTO `sys_menu` VALUES (70, '角色授权菜单', 32, 600, '', '', b'1', 'system:role:authMenu', 2, '', 0, b'1', b'0', NULL, 'admin', '2024-10-31 19:12:07', NULL, '2024-10-31 19:12:07', b'0');
INSERT INTO `sys_menu` VALUES (71, '项目地址', 0, 450, '', 'https://github.com/202252197/JUNCHENMO-Front', b'1', '', 1, '链接', 1, b'1', b'0', NULL, 'admin', '2024-10-31 19:33:03', 'admin', '2024-12-25 13:49:54', b'0');
INSERT INTO `sys_menu` VALUES (72, '提交bug', 0, 500, '', 'https://github.com/202252197/JUNCHENMO-Front/issues', b'1', '', 1, 'bug', 1, b'1', b'0', NULL, 'admin', '2024-10-31 19:33:56', 'admin', '2024-12-24 14:11:16', b'0');
INSERT INTO `sys_menu` VALUES (73, '点个赞~', 0, 600, '', 'https://github.com/202252197/JUNCHENMO-Front', b'1', '', 1, '点赞', 1, b'1', b'0', NULL, 'admin', '2024-10-31 19:34:29', 'admin', '2024-12-24 14:11:47', b'0');
INSERT INTO `sys_menu` VALUES (74, 'ceshi5', 48, 500, 'ceshi5', '', b'0', '', 1, '点赞', 0, b'1', b'0', NULL, 'admin', '2024-12-14 08:00:10', NULL, '2024-12-14 08:00:10', b'0');
INSERT INTO `sys_menu` VALUES (77, 'ceshi6', 48, 700, 'ceshi6', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-12-18 13:42:08', NULL, '2024-12-18 13:42:08', b'0');
INSERT INTO `sys_menu` VALUES (79, 'ceshi822', 48, 900, 'ceshi8', '', b'0', '', 1, '权限', 0, b'1', b'0', NULL, 'admin', '2024-12-18 13:42:31', 'admin', '2024-12-30 17:02:02', b'0');
INSERT INTO `sys_menu` VALUES (84, 'sss', 74, 100, 'sss', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-12-20 17:06:56', 'admin', '2024-12-20 17:07:30', b'0');
INSERT INTO `sys_menu` VALUES (85, 'ww', 74, 200, 'ww', '', b'0', '', 1, '权限', 0, b'1', b'0', NULL, 'admin', '2024-12-20 17:07:26', NULL, '2024-12-20 17:07:26', b'0');
INSERT INTO `sys_menu` VALUES (87, 'ceshhh', 48, 700, 'ceshhh', '', b'0', '', 1, 'log', 0, b'1', b'0', NULL, 'admin', '2024-12-23 15:59:21', NULL, '2024-12-23 15:59:21', b'0');
INSERT INTO `sys_menu` VALUES (88, 'kkkk', 48, 700, 'kkkk', '', b'0', '', 1, '白天', 0, b'1', b'0', NULL, 'admin', '2024-12-23 18:42:56', NULL, '2024-12-23 18:42:56', b'0');
INSERT INTO `sys_menu` VALUES (91, '系统监控', 0, 400, 'monitor', '', b'0', '', 0, '监控', 0, b'1', b'0', NULL, 'admin', '2024-12-25 13:33:49', 'admin', '2024-12-25 14:18:36', b'0');
INSERT INTO `sys_menu` VALUES (92, '系统工具', 0, 300, 'tool', '', b'0', '', 0, '工具', 0, b'1', b'0', NULL, 'admin', '2024-12-25 13:35:19', 'admin', '2024-12-25 13:49:23', b'0');
INSERT INTO `sys_menu` VALUES (93, '接口文档', 92, 1100, 'swagger', '', b'0', '', 1, '接口文档', 0, b'1', b'1', NULL, 'admin', '2024-12-25 13:38:02', 'admin', '2024-12-30 09:22:25', b'0');
INSERT INTO `sys_menu` VALUES (94, 'AI表结构生成', 92, 1200, 'aiTableGen', '', b'0', '', 1, 'AI', 0, b'1', b'0', NULL, 'admin', '2024-12-25 13:48:29', 'admin', '2024-12-30 21:07:02', b'0');
INSERT INTO `sys_menu` VALUES (95, '数据监控', 91, 100, 'druid', '', b'0', '', 1, '数据库监控', 0, b'1', b'0', NULL, 'admin', '2024-12-25 14:22:05', 'admin', '2025-01-11 10:43:00', b'0');
INSERT INTO `sys_menu` VALUES (96, '前端网页书签', 0, 420, 'berforLink', '', b'0', '', 0, '书签', 0, b'1', b'0', NULL, 'admin', '2024-12-25 16:07:23', 'admin', '2025-01-03 14:16:16', b'0');
INSERT INTO `sys_menu` VALUES (97, '缓存列表', 91, 200, 'cacheList', '', b'0', '', 1, '缓存', 0, b'1', b'0', NULL, 'admin', '2024-12-25 16:34:04', 'admin', '2024-12-25 19:07:09', b'0');
INSERT INTO `sys_menu` VALUES (98, 'element ui plus', 96, 100, '', 'https://element-plus.org/zh-CN/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 20:53:17', 'admin', '2024-12-25 21:55:08', b'0');
INSERT INTO `sys_menu` VALUES (99, 'iconfont', 96, 200, '', 'https://www.iconfont.cn/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 20:54:02', NULL, '2024-12-25 20:54:02', b'0');
INSERT INTO `sys_menu` VALUES (100, 'vxetable', 96, 300, '', 'https://vxetable.cn/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 20:54:30', NULL, '2024-12-25 20:54:30', b'0');
INSERT INTO `sys_menu` VALUES (101, 'animate.style', 96, 400, '', 'https://animate.style/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 21:54:42', NULL, '2024-12-25 21:54:42', b'0');
INSERT INTO `sys_menu` VALUES (102, '表单生成', 92, 1300, 'fromGen', '', b'0', '', 1, '表单', 0, b'1', b'0', NULL, 'admin', '2024-12-26 20:23:28', 'admin', '2024-12-27 11:17:03', b'0');
INSERT INTO `sys_menu` VALUES (103, '缓存监控', 91, 300, 'cacheMonitor', '', b'0', '', 1, '监控', 0, b'1', b'0', NULL, 'admin', '2024-12-27 15:08:52', 'admin', '2024-12-27 15:10:21', b'0');
INSERT INTO `sys_menu` VALUES (104, '服务监控', 91, 400, 'systemMonitor', '', b'0', '', 1, '服务器', 0, b'1', b'0', NULL, 'admin', '2024-12-27 20:55:02', NULL, '2024-12-27 20:55:02', b'0');
INSERT INTO `sys_menu` VALUES (105, '定时任务', 91, 500, 'qrtz', '', b'0', '', 1, '数据', 0, b'1', b'0', NULL, 'admin', '2024-12-28 15:38:37', NULL, '2024-12-28 15:38:37', b'0');
INSERT INTO `sys_menu` VALUES (106, 'navnav', 96, 500, '', 'https://thuvien.org/navnav', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-28 21:23:08', NULL, '2024-12-28 21:23:08', b'0');
INSERT INTO `sys_menu` VALUES (107, 'uiverse', 96, 600, '', 'https://uiverse.io/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-28 21:24:11', NULL, '2024-12-28 21:24:11', b'0');
INSERT INTO `sys_menu` VALUES (115, '后端网页书签', 0, 430, 'afterLink', NULL, b'0', '', 0, '书签', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:11:55', 'admin', '2025-01-03 14:16:38', b'0');
INSERT INTO `sys_menu` VALUES (116, 'swagger文档', 115, 100, '', 'https://swagger.org.cn/docs/specification/v2_0/what-is-swagger/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:13:52', NULL, '2025-01-03 14:13:52', b'0');
INSERT INTO `sys_menu` VALUES (117, 'mybatisPlus', 115, 200, NULL, 'https://baomidou.com/reference/annotation/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:14:36', NULL, '2025-01-03 14:14:36', b'0');
INSERT INTO `sys_menu` VALUES (118, 'Knife4j', 115, 300, NULL, 'https://doc.xiaominfo.com/v2/documentation/description.html', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:15:55', NULL, '2025-01-03 14:15:55', b'0');
INSERT INTO `sys_menu` VALUES (119, '代码生成', 92, 1400, 'genCode', NULL, b'0', '', 1, '代码', 0, b'1', b'0', NULL, 'admin', '2025-01-05 10:01:24', 'admin', '2025-01-07 13:52:43', b'0');
INSERT INTO `sys_menu` VALUES (120, '测试', 119, 100, 'components', NULL, b'0', NULL, 0, '监控', 0, b'1', b'0', NULL, 'admin', '2025-01-07 13:52:10', 'admin', '2025-01-07 13:54:10', b'1');
INSERT INTO `sys_menu` VALUES (121, '测试', 120, 100, 'gen-code-update-from', '', b'0', NULL, 1, 'menu', 0, b'1', b'0', NULL, 'admin', '2025-01-07 13:54:56', NULL, '2025-01-07 13:54:56', b'1');
INSERT INTO `sys_menu` VALUES (122, 'css', 0, 1100, '', NULL, b'0', NULL, 0, 'dictData', 0, b'1', b'0', NULL, 'admin', '2025-01-07 14:50:53', 'admin', '2025-01-07 16:00:10', b'0');
INSERT INTO `sys_menu` VALUES (123, 'abidu', 122, 100, NULL, 'https://www.baidu.com', b'1', NULL, 1, '设置', 0, b'1', b'0', NULL, 'admin', '2025-01-07 14:51:12', 'admin', '2025-01-07 15:00:44', b'0');
INSERT INTO `sys_menu` VALUES (124, '组件', 119, 200, 'components', NULL, b'0', NULL, 0, NULL, 0, b'0', b'0', NULL, 'admin', '2025-01-07 16:19:01', 'admin', '2025-01-07 16:20:28', b'1');
INSERT INTO `sys_menu` VALUES (125, '测试', 0, 100, 'home', NULL, b'0', NULL, 0, 'home', 0, b'1', b'0', NULL, 'admin', '2025-01-07 16:19:30', 'admin', '2025-01-08 15:48:28', b'1');
INSERT INTO `sys_menu` VALUES (126, 'vip', 0, 1200, 'vip', NULL, b'0', NULL, 0, '服务器', 0, b'1', b'0', NULL, 'admin', '2025-01-09 15:01:32', NULL, '2025-01-09 15:01:32', b'0');
INSERT INTO `sys_menu` VALUES (127, 'vip生成测试', 126, 100, 'vip', NULL, b'0', NULL, 1, '表单', 0, b'1', b'0', NULL, 'admin', '2025-01-09 15:01:55', NULL, '2025-01-09 15:01:55', b'0');
INSERT INTO `sys_menu` VALUES (128, 'Admin监控', 91, 600, 'adminMonitor', NULL, b'0', NULL, 1, 'admin监控', 0, b'1', b'0', NULL, 'admin', '2025-01-11 12:19:07', 'admin', '2025-01-11 12:21:29', b'0');
INSERT INTO `sys_menu` VALUES (129, '登录日志', 43, 400, 'logininfor', NULL, b'0', NULL, 1, '登录log', 0, b'1', b'0', NULL, 'admin', '2025-01-11 14:51:04', 'admin', '2025-01-11 20:39:34', b'0');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '业务名称',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作日志',
  `description_html` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作日志html',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `request_time` datetime NULL DEFAULT NULL COMMENT '请求时间',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '错误消息',
  `error_msg_html` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '错误消息html',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识(0未删除，1已经删除)',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 316 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '用户设置', '修改用户设置信息', 2, NULL, NULL, 'com.jcm.system.controller.SysUserSettingController.edit()', 'PUT', '2025-01-11 12:51:04', 'admin', '/sys-user-setting', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"blur\":false,\"breadcrumb\":true,\"contrast\":false,\"copyright\":true,\"dataLoading\":true,\"grayscale\":false,\"hueRotate\":true,\"menu\":true,\"navigationBar\":true,\"saturate\":true,\"size\":40,\"tabs\":true,\"tabsIcon\":true,\"theme\":2,\"themeColor\":\"#ee1871\",\"topMenu\":false,\"updateTime\":\"2025-01-11 12:51:04\",\"updater\":\"admin\",\"userId\":1,\"watermark\":true,\"weakColor\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, 'system:logininfor:add', 'error>system:logininfor:add</span>', 64, NULL, '', '2025-01-11 12:51:05', NULL, '2025-01-11 12:51:05', b'0');
INSERT INTO `sys_oper_log` VALUES (2, '用户设置', '修改用户设置信息', 2, NULL, NULL, 'com.jcm.system.controller.SysUserSettingController.edit()', 'PUT', '2025-01-11 12:51:07', 'admin', '/sys-user-setting', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"blur\":false,\"breadcrumb\":true,\"contrast\":false,\"copyright\":true,\"dataLoading\":true,\"grayscale\":false,\"hueRotate\":true,\"menu\":true,\"navigationBar\":true,\"saturate\":true,\"size\":40,\"tabs\":true,\"tabsIcon\":true,\"theme\":2,\"themeColor\":\"#0052D9\",\"topMenu\":false,\"updateTime\":\"2025-01-11 12:51:07\",\"updater\":\"admin\",\"userId\":1,\"watermark\":true,\"weakColor\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 3, NULL, '', '2025-01-11 12:51:08', NULL, '2025-01-11 12:51:08', b'0');
INSERT INTO `sys_oper_log` VALUES (3, '用户设置', '修改用户设置信息', 2, NULL, NULL, 'com.jcm.system.controller.SysUserSettingController.edit()', 'PUT', '2025-01-11 12:51:10', 'admin', '/sys-user-setting', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"blur\":false,\"breadcrumb\":true,\"contrast\":false,\"copyright\":true,\"dataLoading\":true,\"grayscale\":false,\"hueRotate\":true,\"menu\":true,\"navigationBar\":true,\"saturate\":true,\"size\":40,\"tabs\":true,\"tabsIcon\":true,\"theme\":2,\"themeColor\":\"#dc440d\",\"topMenu\":false,\"updateTime\":\"2025-01-11 12:51:10\",\"updater\":\"admin\",\"userId\":1,\"watermark\":true,\"weakColor\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 6, NULL, '', '2025-01-11 12:51:10', NULL, '2025-01-11 12:51:10', b'0');
INSERT INTO `sys_oper_log` VALUES (4, '', '代码生成', 6, NULL, NULL, 'com.jcm.gen.controller.GenController.importTableSave()', 'POST', '2025-01-11 14:36:19', 'admin', '/genCode/importTable', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"tables\":\"sys_logininfor\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 352, NULL, '', '2025-01-11 14:36:20', NULL, '2025-01-11 14:36:20', b'0');
INSERT INTO `sys_oper_log` VALUES (5, '', '代码生成', 8, NULL, NULL, 'com.jcm.gen.controller.GenController.genCode()', 'GET', '2025-01-11 14:38:14', 'admin', '/genCode/genCode/sys_logininfor', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 70, NULL, '', '2025-01-11 14:38:14', NULL, '2025-01-11 14:38:14', b'0');
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', '新增菜单', 1, '新增菜单<span class=height-light-span>登录日志</span>', NULL, 'com.jcm.system.controller.SysMenuController.add()', 'POST', '2025-01-11 14:51:04', 'admin', '/menu/', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"component\":\"logininfor\",\"createTime\":\"2025-01-11 14:51:04\",\"creator\":\"admin\",\"icon\":\"role\",\"isFrame\":false,\"keepAlive\":false,\"menuId\":129,\"name\":\"登录日志\",\"parentId\":43,\"sort\":400,\"type\":1,\"updateTime\":\"2025-01-11 14:51:04\",\"visible\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 221, NULL, '', '2025-01-11 14:51:05', NULL, '2025-01-11 14:51:05', b'1');
INSERT INTO `sys_oper_log` VALUES (7, '数据字典项', '新增字典项', 1, '新增字典项<span class=height-light-span>loginStatus</span>', NULL, 'com.jcm.system.controller.SysDictTypeController.add()', 'POST', '2025-01-11 14:56:17', 'admin', '/dict-type/', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"createTime\":\"2025-01-11 14:56:17\",\"creator\":\"admin\",\"description\":\"登录状态\",\"dictTypeId\":44,\"extraSchema\":\"[]\",\"name\":\"loginStatus\",\"type\":0,\"updateTime\":\"2025-01-11 14:56:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 60, NULL, '', '2025-01-11 14:56:18', NULL, '2025-01-11 14:56:18', b'1');
INSERT INTO `sys_oper_log` VALUES (8, '数据字典值', '新增字典值', 1, '新增字典值<span class=height-light-span>loginStatus - 登录状态</span>', NULL, 'com.jcm.system.controller.SysDictDataController.add()', 'POST', '2025-01-11 14:56:45', 'admin', '/dict-data', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"createTime\":\"2025-01-11 14:56:45\",\"creator\":\"admin\",\"description\":\"成功\",\"dictDataId\":119,\"dictTypeId\":\"44\",\"extra\":\"{}\",\"name\":\"loginStatus - 登录状态\",\"sort\":0,\"updateTime\":\"2025-01-11 14:56:45\",\"value\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 15, NULL, '', '2025-01-11 14:56:46', NULL, '2025-01-11 14:56:46', b'1');
INSERT INTO `sys_oper_log` VALUES (9, '数据字典值', '新增字典值', 1, '新增字典值<span class=height-light-span>loginStatus - 登录状态</span>', NULL, 'com.jcm.system.controller.SysDictDataController.add()', 'POST', '2025-01-11 14:56:57', 'admin', '/dict-data', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"createTime\":\"2025-01-11 14:56:57\",\"creator\":\"admin\",\"description\":\"失败\",\"dictDataId\":120,\"dictTypeId\":\"44\",\"extra\":\"{}\",\"name\":\"loginStatus - 登录状态\",\"sort\":1,\"updateTime\":\"2025-01-11 14:56:57\",\"value\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 12, NULL, '', '2025-01-11 14:56:58', NULL, '2025-01-11 14:56:58', b'1');
INSERT INTO `sys_oper_log` VALUES (10, '', '代码生成', 8, NULL, NULL, 'com.jcm.gen.controller.GenController.genCode()', 'GET', '2025-01-11 15:03:57', 'admin', '/genCode/genCode/sys_logininfor', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 113, NULL, '', '2025-01-11 15:03:58', NULL, '2025-01-11 15:03:58', b'0');
INSERT INTO `sys_oper_log` VALUES (11, '登录日志', '新增系统访问记录', 1, NULL, NULL, 'com.jcm.system.controller.SysLogininforController.add()', 'POST', '2025-01-11 15:29:10', '', '/logininfor', '192.168.74.1', '中国-江苏省-南京市-(电信)', '{\"ipaddr\":\"127.0.0.1\",\"msg\":\"登录成功\",\"status\":\"0\",\"userName\":\"admin\"}', '', 1, 'system:logininfor:add', 'error>system:logininfor:add</span>', 19, NULL, '', '2025-01-11 15:29:11', NULL, '2025-01-11 15:29:11', b'1');
INSERT INTO `sys_oper_log` VALUES (12, '登录日志', '删除系统访问记录', 3, NULL, NULL, 'com.jcm.system.controller.SysLogininforController.remove()', 'DELETE', '2025-01-11 16:12:33', 'admin', '/logininfor/101,102', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 125, NULL, '', '2025-01-11 16:12:34', NULL, '2025-01-11 16:12:34', b'0');
INSERT INTO `sys_oper_log` VALUES (13, '登录日志', '导出系统访问记录列表', 5, NULL, NULL, 'com.jcm.system.controller.SysLogininforController.export()', 'POST', '2025-01-11 16:33:17', 'admin', '/logininfor/export', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"pageSize\":\"40\",\"pageNum\":\"1\"}', '', 0, '', NULL, 1014, NULL, '', '2025-01-11 16:33:19', NULL, '2025-01-11 16:33:19', b'0');
INSERT INTO `sys_oper_log` VALUES (14, '', '清空系统访问记录', 9, NULL, NULL, 'com.jcm.system.controller.SysLogininforController.clear()', 'DELETE', '2025-01-11 17:14:29', 'admin', '/logininfor/clear', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, '', NULL, 92, NULL, '', '2025-01-11 17:14:30', NULL, '2025-01-11 17:14:30', b'0');
INSERT INTO `sys_oper_log` VALUES (15, '角色管理', '修改角色', 2, '用户ID: 28信息被修改', '用户ID: <span class=height-light-span>28</span>信息被修改', 'com.jcm.system.controller.SysRoleController.edit()', 'PUT', '2025-01-11 17:41:16', 'admin', '/role', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"admin\":false,\"code\":\"ceshi\",\"name\":\"ceshi\",\"roleId\":28,\"updateTime\":\"2025-01-11 17:41:16\",\"updater\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, 'system:logininfor:add', 'error>system:logininfor:add</span>', 49, NULL, '', '2025-01-11 17:41:17', NULL, '2025-01-11 17:41:17', b'0');
INSERT INTO `sys_oper_log` VALUES (16, '角色管理', '新增角色', 1, '新增角色44', '新增角色<span class=height-light-span>44</span>', 'com.jcm.system.controller.SysRoleController.add()', 'POST', '2025-01-11 17:55:46', 'admin', '/role', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"admin\":false,\"code\":\"3333\",\"createTime\":\"2025-01-11 17:55:46\",\"creator\":\"admin\",\"name\":\"44\",\"roleId\":47,\"updateTime\":\"2025-01-11 17:55:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 85, NULL, '', '2025-01-11 17:55:47', NULL, '2025-01-11 17:55:47', b'0');
INSERT INTO `sys_oper_log` VALUES (17, '角色管理', '新增角色', 1, NULL, NULL, 'com.jcm.system.controller.SysRoleController.add()', 'POST', '2025-01-11 17:57:23', 'admin', '/role', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"admin\":false,\"code\":\"33\",\"name\":\"555\"}', '', 1, '/ by zero', '<span class=height-light-span-error>/ by zero</span>', 20, NULL, '', '2025-01-11 17:57:23', NULL, '2025-01-11 17:57:23', b'0');
INSERT INTO `sys_oper_log` VALUES (18, '角色管理', '新增角色', 1, '新增角色33', '新增角色<span class=height-light-span>33</span>', 'com.jcm.system.controller.SysRoleController.add()', 'POST', '2025-01-11 18:20:17', 'admin', '/role', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"admin\":false,\"code\":\"66\",\"name\":\"33\"}', '', 1, '/ by zero', '<span class=height-light-span-error>/ by zero</span>', 35, NULL, '', '2025-01-11 18:20:18', NULL, '2025-01-11 18:20:18', b'0');
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', '修改菜单', 2, '菜单ID: 129信息被修改', '菜单ID: <span class=height-light-span>129</span>信息被修改', 'com.jcm.system.controller.SysMenuController.edit()', 'PUT', '2025-01-11 20:39:34', 'admin', '/menu/', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"component\":\"logininfor\",\"icon\":\"登录log\",\"keepAlive\":false,\"menuId\":129,\"name\":\"登录日志\",\"parentId\":43,\"sort\":400,\"type\":1,\"updateTime\":\"2025-01-11 20:39:34\",\"updater\":\"admin\",\"visible\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 47, NULL, '', '2025-01-11 20:39:34', NULL, '2025-01-11 20:39:34', b'0');
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', '修改菜单', 2, '菜单ID: 129信息被修改', '菜单ID: <span class=height-light-span>129</span>信息被修改', 'com.jcm.system.controller.SysMenuController.edit()', 'PUT', '2025-01-11 20:39:33', 'admin', '/menu/', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"component\":\"logininfor\",\"icon\":\"登录log\",\"keepAlive\":false,\"menuId\":129,\"name\":\"登录日志\",\"parentId\":43,\"sort\":400,\"type\":1,\"updateTime\":\"2025-01-11 20:39:34\",\"updater\":\"admin\",\"visible\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 268, NULL, '', '2025-01-11 20:39:34', NULL, '2025-01-11 20:39:34', b'0');
INSERT INTO `sys_oper_log` VALUES (21, '用户设置', '修改用户设置信息', 2, '新增角色33', '新增角色<span class=height-light-span>33</span>', 'com.jcm.system.controller.SysUserSettingController.edit()', 'PUT', '2025-01-11 21:14:20', 'admin', '/sys-user-setting', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"blur\":false,\"breadcrumb\":true,\"contrast\":true,\"copyright\":true,\"dataLoading\":true,\"grayscale\":false,\"hueRotate\":true,\"menu\":true,\"navigationBar\":true,\"saturate\":true,\"size\":40,\"tabs\":true,\"tabsIcon\":true,\"theme\":1,\"themeColor\":\"#dc440d\",\"topMenu\":false,\"updateTime\":\"2025-01-11 21:14:20\",\"updater\":\"admin\",\"userId\":1,\"watermark\":true,\"weakColor\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 173, NULL, '', '2025-01-11 21:14:21', NULL, '2025-01-11 21:14:21', b'0');
INSERT INTO `sys_oper_log` VALUES (22, '', '删除系统访问记录', 3, '菜单ID: 129信息被修改', '菜单ID: <span class=height-light-span>129</span>信息被修改', 'com.jcm.system.controller.SysLogininforController.remove()', 'DELETE', '2025-01-11 21:17:41', 'admin', '/logininfor/1', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 99, NULL, '', '2025-01-11 21:17:42', NULL, '2025-01-11 21:17:42', b'0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色权限字符串',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '角色状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识(0未删除，1已经删除)',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, 0, '超级管理员角色', NULL, '2023-06-14 09:05:25', NULL, '2023-06-14 09:05:25', b'0');
INSERT INTO `sys_role` VALUES (24, '666666', 'lvxu', NULL, 0, NULL, 'admin', '2024-10-31 16:37:59', 'admin', '2024-12-27 14:34:02', b'0');
INSERT INTO `sys_role` VALUES (28, 'ceshi', 'ceshi', NULL, 1, NULL, 'admin', '2024-12-17 13:27:40', 'admin', '2025-01-11 17:41:16', b'0');
INSERT INTO `sys_role` VALUES (31, 'jhjhjj', 'kkkk', NULL, 1, NULL, 'admin', '2024-12-17 13:44:39', NULL, '2024-12-17 13:44:39', b'0');
INSERT INTO `sys_role` VALUES (32, '2233', '333', NULL, 1, NULL, 'admin', '2024-12-17 20:42:42', 'admin', '2024-12-27 14:33:49', b'0');
INSERT INTO `sys_role` VALUES (33, 'qq', 'qq', NULL, 1, NULL, 'admin', '2024-12-17 20:57:40', NULL, '2024-12-17 20:57:40', b'0');
INSERT INTO `sys_role` VALUES (34, 'ee', 'ee', NULL, 0, NULL, 'admin', '2024-12-17 20:57:44', NULL, '2024-12-17 20:57:44', b'0');
INSERT INTO `sys_role` VALUES (35, 'rr', 'rr', NULL, 0, NULL, 'admin', '2024-12-17 20:57:48', NULL, '2024-12-17 20:57:48', b'0');
INSERT INTO `sys_role` VALUES (37, 'yy', 'yy', NULL, 0, NULL, 'admin', '2024-12-17 20:57:57', NULL, '2024-12-17 20:57:57', b'0');
INSERT INTO `sys_role` VALUES (38, 'uuu', 'uuu', NULL, 0, NULL, 'admin', '2024-12-17 20:58:01', NULL, '2024-12-17 20:58:01', b'0');
INSERT INTO `sys_role` VALUES (40, 'ss', 'ss', NULL, 0, NULL, 'admin', '2024-12-17 20:58:08', NULL, '2024-12-17 20:58:08', b'0');
INSERT INTO `sys_role` VALUES (41, 'dd', 'dd', NULL, 0, NULL, 'admin', '2024-12-17 20:58:12', NULL, '2024-12-17 20:58:12', b'0');
INSERT INTO `sys_role` VALUES (42, 'zz', 'zz', NULL, 0, NULL, 'admin', '2024-12-17 20:58:16', NULL, '2024-12-17 20:58:16', b'0');
INSERT INTO `sys_role` VALUES (43, 'vv', 'vv', NULL, 0, NULL, 'admin', '2024-12-17 20:58:20', NULL, '2024-12-17 20:58:20', b'0');
INSERT INTO `sys_role` VALUES (44, 'bb', 'bb', NULL, 0, NULL, 'admin', '2024-12-17 20:58:24', NULL, '2024-12-17 20:58:24', b'1');
INSERT INTO `sys_role` VALUES (47, '44', '3333', NULL, 0, NULL, 'admin', '2025-01-11 17:55:46', NULL, '2025-01-11 17:55:46', b'0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (24, 35);
INSERT INTO `sys_role_menu` VALUES (24, 43);
INSERT INTO `sys_role_menu` VALUES (24, 30);
INSERT INTO `sys_role_menu` VALUES (24, 54);
INSERT INTO `sys_role_menu` VALUES (24, 32);
INSERT INTO `sys_role_menu` VALUES (24, 57);
INSERT INTO `sys_role_menu` VALUES (31, 30);
INSERT INTO `sys_role_menu` VALUES (31, 54);
INSERT INTO `sys_role_menu` VALUES (31, 55);
INSERT INTO `sys_role_menu` VALUES (31, 56);
INSERT INTO `sys_role_menu` VALUES (31, 57);
INSERT INTO `sys_role_menu` VALUES (31, 58);
INSERT INTO `sys_role_menu` VALUES (31, 59);
INSERT INTO `sys_role_menu` VALUES (31, 60);
INSERT INTO `sys_role_menu` VALUES (28, 84);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` tinyint NULL DEFAULT NULL COMMENT '性别(0男,1女,2未知)',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0正常,1禁用)',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '最后登录IP地址',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否被删除: 0是未删除, 1是已删除',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', '超级管理员', '202252157@qq.com', '1761111111', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 0, '192.168.0.4', '2025-01-11 21:15:11', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'0');
INSERT INTO `sys_user` VALUES (37, 'admin1', '$2a$10$OIcB8m7p5KoKKReuhDU.u.wTKEIj/KnOVBAF297RKY0UUGJzZwu1u', 'Admin222', '', '', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 0, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (38, 'admin2', '$2a$10$xHlfwRnQhXaauSwCjxpysOIigHmw6Rd3D4rj3CKXH5txXsCi2k9zy', 'ceshi2', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (39, 'admin3', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (40, 'admin4', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (41, 'admin5', '$2a$10$gxuaoobtGnIDAgj2Mg8WAeTiUAHETX2CrYWA0CgFACQqFoHzZe4xu', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (42, 'admin6', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (43, 'admin7', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (44, 'admin8', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (45, 'admin9', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (46, 'admin10', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin2', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (47, 'admin11', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (48, 'admin12', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (49, 'admin13', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (50, 'admin14', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 1, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (51, 'admin15', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 0, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (52, 'admin16', '$2a$10$zMQnwoVvUooolpBGiqXUlOlEkYpKUJmAVxxZcOs0f/5phKG0JFeVe', 'Admin', '202252197@qq.com', '17638593874', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 0, '127.0.0.1', '2023-06-14 18:35:37', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'1');
INSERT INTO `sys_user` VALUES (53, '121', '$2a$10$C5EBZtnz1Hpgo.7Kb7q0gusdb1d2SO9WmnQhk5AH1C.oPAoLXVzXG', '121', '1212', '1221', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-04-09 15:26:41', NULL, '2024-04-09 15:26:41', b'1');
INSERT INTO `sys_user` VALUES (55, 'lvshihao', '$2a$10$5jhrkTNvd87cJTPxw5X.Pe51Fk3pjSWcA9KC2nxco6Yk..r7.YI3G', '君尘', '16666', '123456789', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-04-18 22:25:19', NULL, '2024-04-18 22:25:19', b'1');
INSERT INTO `sys_user` VALUES (56, 'lvshihao', '$2a$10$.isfQDdYtbZo3zjY8zrJAeiOuUFM6s6Ic09WgsOft4t7pu6qKiXTi', 'lvshihao', '333', '222', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-04-19 12:43:15', NULL, '2024-04-19 12:43:15', b'1');
INSERT INTO `sys_user` VALUES (57, 'lvshihao2', '$2a$10$16R/2vV.ZNF/NsMLwJa4Ge4kKSmkgT5DJm5BQfmnr/6dIs8kruU6i', 'sss', '', '', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-04-19 15:49:22', NULL, '2024-04-19 15:49:22', b'1');
INSERT INTO `sys_user` VALUES (58, 'lvshihao4', '$2a$10$U3uDTbk9Fdu0qi/OHmnKAOMbSqUJ7tGr4kG0FbNsZaarhEDcA0r4.', 'ces', '', '', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-04-19 15:52:32', NULL, '2024-04-19 15:52:32', b'1');
INSERT INTO `sys_user` VALUES (59, 'admin1', '$2a$10$7LjljYivvVPcVuFqLRr5XO27mhLsrx0WpmfWyZVwFR4CJ7RFts.52', 'lvshihao', '202252195@qq.com', '17638593873', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-04-19 17:11:12', NULL, '2024-04-19 17:11:12', b'1');
INSERT INTO `sys_user` VALUES (60, 'slave', '$2a$10$CtE1AS4kOmrO00lN7m0IQO7Q64YQ4saCTqZYx43hRnUx4iUaqm6uu', '1221', '12', '12', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-04-20 14:41:15', NULL, '2024-04-20 14:41:15', b'1');
INSERT INTO `sys_user` VALUES (61, 'ceshiyonghu', '$2a$10$B.RnAE.q1KvAtbBjRh4MRuRqYWsE2B/OersMIPmrk5KoO4W60e7CC', 'xiaoliuzi ', '2311223', '1223', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-05-04 10:02:29', NULL, '2024-05-04 10:02:29', b'1');
INSERT INTO `sys_user` VALUES (62, 'kkk', '$2a$10$5HRw/xZhT4mKYmyjTpBR2.fr2y8FaGleN.1XY5tvKUX1x9DOAU2lK', '12345', '1232323', '1213', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-05-04 10:11:38', NULL, '2024-05-04 10:11:38', b'1');
INSERT INTO `sys_user` VALUES (63, 'www', '$2a$10$IFOZZ2u3NoLNBXKEQCO9TeWVmiea/PBlsB8Q1iY2Ksoax.A8dO6PG', '123411', '123213', '12323', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-05-04 10:16:43', NULL, '2024-05-04 10:16:43', b'1');
INSERT INTO `sys_user` VALUES (64, 'uuuu', '$2a$10$LNFTDOlBGgcpEeT462OxW.ABG6ZMq1cqUPWm364vpUIAVKLJLm8qC', 'ssss', '22323322', '22121', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-05-04 10:25:40', NULL, '2024-05-04 10:25:40', b'1');
INSERT INTO `sys_user` VALUES (65, 'assa', '$2a$10$omDoHIO/V.DD1JV.RMHDoeNv3pwi9WwapAW7Uof2YQKIWpdg3281.', 'qwqewe', '23213351', '1232', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-05-04 10:26:43', NULL, '2024-05-04 10:26:43', b'1');
INSERT INTO `sys_user` VALUES (66, '231', '$2a$10$I4qPX43EUAZFaxoyELJmauee/DryEj5hBRWs/lJHB6hHx38VaBeoW', '2131', '21332', '1232321332', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-05-04 10:27:55', NULL, '2024-05-04 10:27:55', b'1');
INSERT INTO `sys_user` VALUES (67, 'slave', '$2a$10$oDSrqa//zAUaxjd.sx6mL.CBAXBeR8ZcELa5JfxfGCl.tipZOXAsu', 'slavee', '330628396@qq.com', '13613968112', NULL, NULL, 0, '192.168.0.2', '2024-10-31 17:51:15', NULL, 'admin', '2024-10-31 16:33:31', NULL, '2024-10-31 16:33:31', b'0');
INSERT INTO `sys_user` VALUES (68, 'lvshxxss', '$2a$10$FUOUnrAFCIlU02cGsi5iTuFKGyw/kM7XenzNnzsIMCwpcm1VkmJ4e', 'lvshxx', '202252137@qq.com', '17812063350', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-12 17:07:45', NULL, '2024-12-12 17:07:45', b'1');
INSERT INTO `sys_user` VALUES (69, 'sssse', '$2a$10$T6pWPUcCvQvzLbFuQpCPL.c4esUunrqUkuyLWQJhwJT4nB7k1Tau.', 'sssse', '202252127@qq.com', '17812063353', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-12 17:10:30', NULL, '2024-12-12 17:10:30', b'1');
INSERT INTO `sys_user` VALUES (70, 'ceshi22', '$2a$10$0WV1wGLZ.qnwR03SP0ufzODTlyH4R/iLkVckyG59/uad5AIg7JxzG', 'ceshi22', '202252227@qq.com', '17812063351', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-12 17:12:36', NULL, '2024-12-12 17:12:36', b'1');
INSERT INTO `sys_user` VALUES (71, 'saasas', '$2a$10$gpsS.NSmVDG3x65RY8ddhekxu7.lRaPGUToLBo4Jdm74T7k3XWcZ6', 'assasa', '222252127@qq.com', '17812063311', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-12 17:16:20', NULL, '2024-12-12 17:16:20', b'1');
INSERT INTO `sys_user` VALUES (72, 'wwqwqw', '$2a$10$XoWhIA0tcEM8idpzDV5.4uE5MslTX6bhTHWhpN73rfcb7PwMUoTru', 'wwqwqw', '202252427@qq.com', '17638593879', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-12 17:30:48', NULL, '2024-12-12 17:30:48', b'1');
INSERT INTO `sys_user` VALUES (73, 'wqwwq', '$2a$10$2MelS.ikFpkiGl/FJcXtSOZPqISIaSIApMnxOEv9Ru6h1H3lF9kXy', 'wqwwq', '202252131@qq.com', '17812063357', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-12 17:31:40', NULL, '2024-12-12 17:31:40', b'1');
INSERT INTO `sys_user` VALUES (74, 'lvshihao212', '$2a$10$7MI6RXMOBaH765mofN415eAF6oTYE8KlHhde9HijdGda.2Azo0HmS', 'lvshihao212', '202252123@qq.com', '17810163350', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-12 17:33:17', NULL, '2024-12-12 17:33:17', b'1');
INSERT INTO `sys_user` VALUES (75, 'eeeewwq', '$2a$10$HTr2jX5u9yDlgci44l7fsuAgVlcgjWKwjytXiBLVx3K3a/X16Wwsm', 'eeeewwq', '202252627@qq.com', '13613968477', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-12 17:39:48', NULL, '2024-12-12 17:39:48', b'1');
INSERT INTO `sys_user` VALUES (76, 'ss', '$2a$10$3dVGjraJE4tk2gZu1HEAsOzZAVcHgBend5uOT3Ck7AW8YAfuM3LN.', 'ss', 's', 's', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-13 10:36:54', NULL, '2024-12-13 10:36:54', b'1');
INSERT INTO `sys_user` VALUES (77, 'ee', '$2a$10$ES1BKXKuf3mfmahqOkFaHegahBwAL51KBd6/B6nuOPgnVQAkRZ5SK', 'ee', '12', '121321', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-13 10:38:41', NULL, '2024-12-13 10:38:41', b'1');
INSERT INTO `sys_user` VALUES (78, '33', '$2a$10$V2JOxOxtRvnSChmtJ/ArMeToDzmI1lsk1uvw..0rRCWAyDShUlsFy', '3', NULL, '44', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-13 10:39:08', NULL, '2024-12-13 10:39:08', b'1');
INSERT INTO `sys_user` VALUES (79, 'wwq', '$2a$10$LfqbHU8PkBwnsrKSyfuuxOt2I2j69uq33Z0SHsM30rV7STqQjEdIm', 'wqe', 'wwq', '21', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-13 11:10:50', NULL, '2024-12-13 11:10:50', b'1');
INSERT INTO `sys_user` VALUES (80, 'wwq33', '$2a$10$9DooMYngwTA7/EQxHWsTLes0r0/Jo/.2cA/tzfNwCd9Jp8RDoaZmy', '32', '212', 'weew', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-13 11:12:33', NULL, '2024-12-13 11:12:33', b'1');
INSERT INTO `sys_user` VALUES (81, 'wq', '$2a$10$83/7q7yF932VD/DlKVVZPO9j0HoDLb59iqRlx8uztKdvv5dgKa1nC', 'wq', 'wq', 'qw', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-13 11:15:49', NULL, '2024-12-13 11:15:49', b'1');
INSERT INTO `sys_user` VALUES (82, 'wqe', '$2a$10$/q55AYpRCOB5Wc5bRBh8.eBADKqla/duzGJ29DbYuUheqFCyKg0Iu', 'wqe', 'wqee', '', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-13 11:16:05', NULL, '2024-12-13 11:16:05', b'1');
INSERT INTO `sys_user` VALUES (83, 'wwwe', '$2a$10$3yFqRw2sH3mz3KZv4m2UT.9CtOMW1Pb.q6I6FkqbGpO.eRCGT0Kj6', 'wwwwee', '2022521972@qq.com', '17812063355', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-17 14:19:30', NULL, '2024-12-17 14:19:30', b'1');
INSERT INTO `sys_user` VALUES (84, 'wwee', '$2a$10$EXrhYBkNPe7nEut9zqg3juhTU5UVUzg1zkpnWxiMB9LxyBrP5.Cc.', 'wwee', '202252199@qq.com', '17812063350', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-17 15:50:48', NULL, '2024-12-17 15:50:48', b'1');
INSERT INTO `sys_user` VALUES (85, 'ces', '$2a$10$J3vlNCAC.OAdxVTrfnCgF.IqcoyyDZLYvZ/Hf.5O2/pK6Q39E4vCu', 'ces', '202252191@qq.com', '27812063350', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-17 16:18:21', NULL, '2024-12-17 16:18:21', b'0');
INSERT INTO `sys_user` VALUES (86, 'cccc', '$2a$10$LeftvuWbm0Ofp8/OcPvTLOwenVbF6GDqof1b56DZfAKt.YXVDc4.W', 'cccc', '22@qq.com', '17812063355', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-23 15:50:28', NULL, '2024-12-23 15:50:28', b'1');
INSERT INTO `sys_user` VALUES (87, 'ceshi', '$2a$10$TGwM3nbvjiy9zVJ3hZMvyeMgrQhf87ul.wMFCJaIBSBsccCbrJiXa', 'ceshi13', '222@qq.com', '13613968471', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-24 19:38:08', NULL, '2024-12-24 19:38:08', b'0');
INSERT INTO `sys_user` VALUES (88, 'lvshihao', '$2a$10$FQeOZrzDCuG3TscGoZhTROvxfkdI5f1QL6d6fPUcfADi.ymNB9MHy', '222', '2022521977@qq.com', '17812061350', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-29 18:12:14', NULL, '2024-12-29 18:12:14', b'0');
INSERT INTO `sys_user` VALUES (89, '555', '$2a$10$b/8JWv8s8TnorPifLHDZ2uPjQlLOY/NaDEHibIFyz/AdiOfRvg2/S', '555', '2022521917@qq.com', '13613696877', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-29 18:46:53', NULL, '2024-12-29 18:46:53', b'0');
INSERT INTO `sys_user` VALUES (90, '8888', '$2a$10$/oz/CRarsZqJ49B0fQvIUeUECEZiZoRHbjFHaZE5GkPIC5MZfZmFC', '8888', '2253422@qq.com', '13613968499', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-29 18:48:49', NULL, '2024-12-29 18:48:49', b'0');
INSERT INTO `sys_user` VALUES (91, 'lvshiha', '$2a$10$IKKX4bV.A1ISWt0Ixn4gDOzP5hARQQt6Migbwp0GifXgtg4JkcnVu', 'lvshiha', '33@qq.com', '13613952147', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-29 18:51:29', NULL, '2024-12-29 18:51:29', b'1');
INSERT INTO `sys_user` VALUES (92, 'kkk', '$2a$10$xjM4o0xnA3Sw3Fp1ra98nuGT9rujdVmQuap5P3DNE9qKlffcwNb3O', 'kkk333', '3@qq.com', '13613968456', NULL, NULL, 0, NULL, NULL, NULL, 'admin', '2024-12-30 13:40:14', NULL, '2024-12-30 13:40:14', b'1');
INSERT INTO `sys_user` VALUES (93, 'test_user', '$2a$10$aRi2TGX6p9tisEyhqfFplumD0vMwfIYagaCUl0jdTzos2SU4vscjC', '测试昵称', 'test@example.com', '13812345678', 0, NULL, 0, NULL, NULL, NULL, 'admin', '2025-01-03 18:09:22', NULL, '2025-01-03 18:09:22', b'0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (67, 24);
INSERT INTO `sys_user_role` VALUES (85, 24);

-- ----------------------------
-- Table structure for sys_user_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_setting`;
CREATE TABLE `sys_user_setting`  (
  `setting_id` bigint NOT NULL AUTO_INCREMENT COMMENT '界面设置ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `theme` tinyint(1) NULL DEFAULT NULL COMMENT '界面主题(0浅色,1深色,3系统)',
  `theme_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '界面主题颜色',
  `navigation_bar` bit(1) NULL DEFAULT NULL COMMENT '导航栏',
  `tabs` bit(1) NULL DEFAULT NULL COMMENT '多页签',
  `tabs_icon` bit(1) NULL DEFAULT NULL COMMENT '多页签图标',
  `breadcrumb` bit(1) NULL DEFAULT NULL COMMENT '面包屑',
  `menu` bit(1) NULL DEFAULT NULL COMMENT '菜单栏',
  `top_menu` bit(1) NULL DEFAULT NULL COMMENT '顶部菜单栏',
  `copyright` bit(1) NULL DEFAULT NULL COMMENT '版权内容(0隐藏,1不隐藏)',
  `watermark` bit(1) NULL DEFAULT NULL COMMENT '用户水印',
  `weak_color` bit(1) NULL DEFAULT NULL COMMENT '弱色模式',
  `grayscale` bit(1) NULL DEFAULT NULL COMMENT '黑白模式',
  `blur` bit(1) NULL DEFAULT NULL COMMENT '高斯模式',
  `contrast` bit(1) NULL DEFAULT NULL COMMENT '对比度',
  `hue_rotate` bit(1) NULL DEFAULT NULL COMMENT '色相旋转',
  `saturate` bit(1) NULL DEFAULT NULL COMMENT '饱和度',
  `data_loading` bit(1) NULL DEFAULT NULL COMMENT '数据加载动画',
  `size` int NULL DEFAULT NULL COMMENT '表格默认页数',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否被删除: 0是未删除, 1是已删除',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户前端样式设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_setting
-- ----------------------------
INSERT INTO `sys_user_setting` VALUES (1, 1, 1, '#dc440d', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'1', b'1', b'1', b'1', 40, '测试', 'admin', '2024-11-26 16:54:34', 'admin', '2025-01-11 21:14:21', b'0');
INSERT INTO `sys_user_setting` VALUES (2, 87, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, 'admin', '2024-12-24 19:38:08', NULL, '2024-12-24 19:38:08', b'0');
INSERT INTO `sys_user_setting` VALUES (3, 88, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, 'admin', '2024-12-29 18:12:14', NULL, '2024-12-29 18:12:14', b'0');
INSERT INTO `sys_user_setting` VALUES (4, 89, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, 'admin', '2024-12-29 18:46:53', NULL, '2024-12-29 18:46:53', b'0');
INSERT INTO `sys_user_setting` VALUES (5, 90, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, 'admin', '2024-12-29 18:48:49', NULL, '2024-12-29 18:48:49', b'0');
INSERT INTO `sys_user_setting` VALUES (6, 91, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, 'admin', '2024-12-29 18:51:29', NULL, '2024-12-29 18:51:29', b'0');
INSERT INTO `sys_user_setting` VALUES (7, 92, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, 'admin', '2024-12-30 13:40:14', NULL, '2024-12-30 13:40:14', b'0');
INSERT INTO `sys_user_setting` VALUES (8, 93, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, 'admin', '2025-01-03 18:09:22', NULL, '2025-01-03 18:09:22', b'0');
INSERT INTO `sys_user_setting` VALUES (9, 94, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, '', '2025-01-04 11:38:24', NULL, '2025-01-04 11:38:24', b'0');
INSERT INTO `sys_user_setting` VALUES (10, 95, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, '', '2025-01-04 11:40:21', NULL, '2025-01-04 11:40:21', b'0');
INSERT INTO `sys_user_setting` VALUES (11, 96, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, '', '2025-01-04 11:41:29', NULL, '2025-01-04 11:41:29', b'0');
INSERT INTO `sys_user_setting` VALUES (12, 97, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, '', '2025-01-04 11:44:23', NULL, '2025-01-04 11:44:23', b'0');
INSERT INTO `sys_user_setting` VALUES (13, 98, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, '', '2025-01-04 11:44:47', NULL, '2025-01-04 11:44:47', b'0');
INSERT INTO `sys_user_setting` VALUES (14, 99, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, '', '2025-01-04 13:27:52', NULL, '2025-01-04 13:27:52', b'0');
INSERT INTO `sys_user_setting` VALUES (15, 100, 0, '#2174FF', b'1', b'1', b'1', b'1', b'1', NULL, b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, NULL, '', '2025-01-04 13:28:47', NULL, '2025-01-04 13:28:47', b'0');

-- ----------------------------
-- Table structure for tx_vip
-- ----------------------------
DROP TABLE IF EXISTS `tx_vip`;
CREATE TABLE `tx_vip`  (
  `vip_id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `xy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '咸鱼名称',
  `starting_time` datetime NULL DEFAULT NULL COMMENT '起始时间',
  `stoping_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `purchase_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '开通天数',
  `unit_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '设备名称',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态(0在用，1下线)',
  `login_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录方式（QQ或微信）',
  `login_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录账号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识(0未删除，1已经删除)',
  PRIMARY KEY (`vip_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'vip表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_vip
-- ----------------------------
INSERT INTO `tx_vip` VALUES (1, 'x***8', '2024-06-10 00:00:00', '2024-06-11 00:00:00', '3', 'MRR-W29', b'1', 'QQ', '202252197', NULL, NULL, 'admin', '2025-01-10 19:42:13', NULL, b'1');
INSERT INTO `tx_vip` VALUES (2, '小兑、', '2024-06-10 10:52:08', '2024-06-17 10:52:08', '7', 'iPad Air2', b'0', 'QQ', '202252197', NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `tx_vip` VALUES (3, 'MK_MK_', '2024-06-10 11:23:57', '2024-06-11 11:23:57', '1', 'Ipad 8th Gen', b'1', 'QQ', '202252197', NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `tx_vip` VALUES (4, '子车氏族', '2024-06-10 00:00:00', '2024-06-11 00:00:00', '19', 'E392G', b'1', '微信', 'LVSHIHAO66', NULL, NULL, 'admin', '2025-01-11 09:58:15', NULL, b'0');
INSERT INTO `tx_vip` VALUES (5, 'Bonnie', '2024-06-10 14:59:02', '2024-06-11 14:59:02', '1', '2201123C', b'1', 'QQ', '3306208396', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (6, '李信扒拉扒拉', '2024-06-10 16:06:09', '2024-06-17 16:06:09', '7', 'ASK-AL00x', b'0', 'QQ', '3306208396', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (7, '阿华哦嗷', '2024-06-10 17:24:47', '2024-06-11 17:24:47', '1', 'iPad 1G', b'1', '微信', 'LVSHIHAO66', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (8, 'SyoKun', '2024-06-10 18:17:07', '2024-06-11 18:17:07', '1', '小米 MiTV-ASTP0', b'1', '微信', 'LVSHIHAO66', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (9, 'x***0', '2024-06-10 18:06:00', '2024-06-11 18:06:44', '1', '23013RK75C', b'1', 'QQ', '3306208396', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (10, '寻找一片五叶草', '2024-06-11 00:00:00', '2024-06-12 00:00:00', '1', 'PC客户端2', b'0', '微信', '3650125341', NULL, NULL, 'admin', '2025-01-11 10:20:00', NULL, b'1');
INSERT INTO `tx_vip` VALUES (11, '30412281', '2024-06-11 11:03:45', '2024-06-12 11:03:53', '1', '长虹848_Q6K', b'1', 'QQ', '202252197', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (12, '吹又生生', '2024-06-11 11:24:42', '2024-06-12 11:24:50', '1', '22041211AC', b'1', 'QQ', '202252197', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (13, '泠泠雾_', '2024-06-11 13:17:38', '2024-06-12 13:17:42', '1', '网页端设备', b'1', 'QQ', '3650125341', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (14, 'zzzzbyh', '2024-06-11 15:32:53', '2024-06-12 15:32:01', '1', 'PC客户端1', b'1', 'QQ', '3650125341', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (15, '爱吃黑叶荔枝的吉吉', '2024-06-11 14:46:28', '2024-06-12 14:46:36', '1', 'iphome 14', b'0', 'QQ', '3650125341', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (16, '玖月空晴', '2024-06-11 22:18:16', '2024-06-12 22:18:45', '1', NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (17, 'x***8', '2024-06-12 10:04:14', '2024-06-13 10:04:21', '1', 'PC客户端', b'1', '微信', 'LVSHIHAO66', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (18, 'Yolanda', '2024-06-12 12:29:02', '2024-06-19 12:29:05', '7', 'V2279A', b'0', 'QQ', '202252197', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (19, 'piconico', '2024-06-12 11:29:02', '2024-06-13 11:29:37', '1', '乐视X4-50', b'1', '微信', 'LVSHIHAO66', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (20, '琥珀色的九华', '2024-06-12 10:31:47', '2024-07-12 10:31:57', '30', '创维G6B', b'0', 'QQ', '202252197', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `tx_vip` VALUES (21, '我是凯峰', '2024-06-12 12:47:10', '2024-06-13 12:37:36', '1', NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `tx_vip` VALUES (22, '三天皇帝YA', '2024-06-13 21:48:06', '2024-06-15 21:48:20', '2', 'Ipad 9th Gen', b'0', '微信', 'LVSHIHAO66', NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `tx_vip` VALUES (23, '222', '2025-01-08 00:00:00', '2024-12-31 00:00:00', '1', NULL, NULL, '55', '888888', 'admin', '2025-01-10 10:24:03', NULL, '2025-01-10 10:24:03', NULL, b'1');
INSERT INTO `tx_vip` VALUES (24, '999', '2025-01-07 00:00:00', '2025-01-07 00:00:00', NULL, 'String', NULL, '52', '55', 'admin', '2025-01-10 11:45:34', NULL, '2025-01-10 11:45:34', NULL, b'1');
INSERT INTO `tx_vip` VALUES (25, 's', '2025-01-08 00:00:00', '2025-01-01 00:00:00', '2', NULL, NULL, 'x', 'a', 'admin', '2025-01-10 20:21:51', NULL, '2025-01-10 20:21:51', NULL, b'1');
INSERT INTO `tx_vip` VALUES (26, 'ceshi', '2025-01-09 00:00:00', '2025-01-16 00:00:00', '1', NULL, NULL, 'qq', NULL, 'admin', '2025-01-10 20:41:22', NULL, '2025-01-10 20:41:22', NULL, b'0');
INSERT INTO `tx_vip` VALUES (27, '222', '2025-01-02 00:00:00', '2025-01-07 00:00:00', '2', '114', NULL, 'qq', NULL, 'admin', '2025-01-11 09:58:06', NULL, '2025-01-11 09:58:06', NULL, b'1');

SET FOREIGN_KEY_CHECKS = 1;
