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

 Date: 06/02/2025 21:34:21
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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (21, 'tx_vip', 'vip表', 'TxVip', 'crud', 'com.jcm.system', 'system', 'vip', 'vip', 'lvshihao', '1', 'D:\\lvshihao\\Jcm\\jcm-modules\\jcm-system\\src\\', 'null', 'admin', '2025-01-07 11:50:09', 'admin', '2025-01-11 10:30:04', 'ceshi', b'0');
INSERT INTO `gen_table` VALUES (22, 'sys_oper_log', '操作日志记录', 'SysOperLog', 'crud', 'com.jcm.system', 'system', 'log', '操作日志记录', 'lvshihao', '0', '/', NULL, 'admin', '2025-01-08 17:21:59', '', NULL, NULL, b'0');
INSERT INTO `gen_table` VALUES (23, 'sys_logininfor', '系统访问记录', 'SysLogininfor', 'crud', 'com.jcm.system', 'system', 'logininfor', '系统访问记录', 'lvshihao', '1', 'D:\\lvshihao\\Jcm\\jcm-modules\\jcm-system\\src\\', 'null', 'admin', '2025-01-11 14:36:19', 'admin', '2025-01-11 15:02:08', NULL, b'0');
INSERT INTO `gen_table` VALUES (24, 'sys_user_task', '用户任务表', 'SysUserTask', 'crud', 'com.jcm.system', 'system', 'task', '用户任务', 'lvshihao', '1', 'D:\\lvshihao\\Jcm\\jcm-modules\\jcm-system\\src\\', 'null', 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table` VALUES (25, 'sys_job', '定时任务调度表', 'SysJob', 'crud', 'com.jcm.job', 'job', 'job', '定时任务调度', 'lvshihao', '1', 'D:\\lvshihao\\Jcm\\jcm-modules\\jcm-job\\src\\', 'null', 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table` VALUES (26, 'sys_job_log', '定时任务调度日志表', 'SysJobLog', 'crud', 'com.jcm.job', 'job', 'log', '定时任务调度日志', 'lvshihao', '1', 'D:\\lvshihao\\Jcm\\jcm-modules\\jcm-job\\src\\', 'null', 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 369 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

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
INSERT INTO `gen_table_column` VALUES (328, 24, 'task_id', '任务ID，主键', 'int', 'Long', 'taskId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (329, 24, 'title', '任务标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (330, 24, 'description', '任务描述', 'text', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (331, 24, 'start_date', '任务开始日期', 'datetime', 'Date', 'startDate', '0', '0', '1', '1', '1', '1', '1', 'GTE', 'datetime', '', 4, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (332, 24, 'end_date', '任务结束日期', 'datetime', 'Date', 'endDate', '0', '0', '1', '1', '1', '1', '1', 'LTE', 'datetime', '', 5, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (333, 24, 'priority', '任务优先级（0:一般、1:中等、2:加急）', 'tinyint', 'Long', 'priority', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'taskPriority', 6, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (334, 24, 'status', '任务状态（0:未开始、1:进行中、2:已完成）', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'taskStatus', 7, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (335, 24, 'type', '任务类型（0:修复bug，1：新增功能）', 'tinyint', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'taskType', 8, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (336, 24, 'user_id', '执行任务的用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (337, 24, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 10, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (338, 24, 'creator', '创建人', 'varchar(255)', 'String', 'creator', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (339, 24, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (340, 24, 'updater', '修改人', 'varchar(255)', 'String', 'updater', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (341, 24, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (342, 24, 'deleted', '删除标记（0: 未删除, 1: 已删除）', 'bit(1)', 'String', 'deleted', '0', '0', '1', '0', NULL, NULL, NULL, 'EQ', NULL, '', 15, 'admin', '2025-01-13 17:18:43', 'admin', '2025-01-13 17:28:20', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (343, 25, 'job_id', '任务ID', 'bigint', 'Long', 'jobId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (344, 25, 'job_name', '任务名称', 'varchar(64)', 'String', 'jobName', '1', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (345, 25, 'job_group', '任务组名', 'varchar(64)', 'String', 'jobGroup', '1', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'jobTaskGroup', 3, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (346, 25, 'invoke_target', '调用目标字符串', 'varchar(500)', 'String', 'invokeTarget', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (347, 25, 'cron_expression', 'cron执行表达式', 'varchar(255)', 'String', 'cronExpression', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (348, 25, 'misfire_policy', '计划执行错误策略（1立即执行 2执行一次 3放弃执行）', 'varchar(20)', 'String', 'misfirePolicy', '0', '0', NULL, '1', '1', '0', '1', 'EQ', 'input', '', 6, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (349, 25, 'concurrent', '是否并发执行（0允许 1禁止）', 'char(1)', 'String', 'concurrent', '0', '0', NULL, '1', '1', '0', '1', 'EQ', 'input', '', 7, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (350, 25, 'status', '状态（0正常 1暂停）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (351, 25, 'remark', '备注信息', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 9, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (352, 25, 'creator', '创建者', 'varchar(64)', 'String', 'creator', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (353, 25, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (354, 25, 'updater', '更新者', 'varchar(64)', 'String', 'updater', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (355, 25, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (356, 25, 'deleted', '是否被删除: 0是未删除, 1是已删除', 'bit(1)', 'String', 'deleted', '0', '0', '1', '0', NULL, NULL, NULL, 'EQ', NULL, '', 14, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:03:56', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (357, 26, 'job_log_id', '任务日志ID', 'bigint', 'Long', 'jobLogId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (358, 26, 'job_name', '任务名称', 'varchar(64)', 'String', 'jobName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (359, 26, 'job_group', '任务组名', 'varchar(64)', 'String', 'jobGroup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'jobTaskGroup', 3, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (360, 26, 'invoke_target', '调用目标字符串', 'varchar(500)', 'String', 'invokeTarget', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (361, 26, 'job_message', '日志信息', 'varchar(500)', 'String', 'jobMessage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (362, 26, 'status', '执行状态（0正常 1失败）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (363, 26, 'exception_info', '异常信息', 'varchar(2000)', 'String', 'exceptionInfo', '0', '0', NULL, '1', '1', '0', '1', 'EQ', 'textarea', '', 7, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (364, 26, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 8, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (365, 26, 'creator', '创建人', 'varchar(64)', 'String', 'creator', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (366, 26, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '0', NULL, '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (367, 26, 'updater', '更新人', 'varchar(64)', 'String', 'updater', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (368, 26, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');
INSERT INTO `gen_table_column` VALUES (369, 26, 'deleted', '是否被删除: 0是未删除, 1是已删除', 'bit(1)', 'String', 'deleted', '0', '0', '1', '0', NULL, NULL, NULL, 'EQ', NULL, '', 13, 'admin', '2025-01-14 10:47:32', 'admin', '2025-01-14 11:09:36', NULL, b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典配置值' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_data` VALUES (121, '45', '0', '一般', 0, '{}', 0, NULL, 'admin', '2025-01-13 17:22:06', NULL, '2025-01-13 17:22:06', b'0');
INSERT INTO `sys_dict_data` VALUES (122, '45', '1', '中等', 1, '{}', 0, NULL, 'admin', '2025-01-13 17:22:18', NULL, '2025-01-13 17:22:18', b'0');
INSERT INTO `sys_dict_data` VALUES (123, '45', '2', '紧急', 2, '{}', 0, NULL, 'admin', '2025-01-13 17:22:32', NULL, '2025-01-13 17:22:32', b'0');
INSERT INTO `sys_dict_data` VALUES (124, '46', '0', '未开始', 0, '{}', 0, NULL, 'admin', '2025-01-13 17:23:36', NULL, '2025-01-13 17:23:36', b'0');
INSERT INTO `sys_dict_data` VALUES (125, '46', '1', '进行中', 1, '{}', 0, NULL, 'admin', '2025-01-13 17:23:46', NULL, '2025-01-13 17:23:46', b'0');
INSERT INTO `sys_dict_data` VALUES (126, '46', '2', '已完成', 2, '{}', 0, NULL, 'admin', '2025-01-13 17:23:56', NULL, '2025-01-13 17:23:56', b'0');
INSERT INTO `sys_dict_data` VALUES (127, '47', '0', 'BUG修复', 0, '{}', 0, NULL, 'admin', '2025-01-13 17:25:03', NULL, '2025-01-13 17:25:03', b'0');
INSERT INTO `sys_dict_data` VALUES (128, '47', '1', '新增功能', 1, '{}', 0, NULL, 'admin', '2025-01-13 17:25:21', NULL, '2025-01-13 17:25:21', b'0');
INSERT INTO `sys_dict_data` VALUES (131, '49', '0', '默认', 0, '{}', 0, NULL, 'admin', '2025-01-14 10:56:42', NULL, '2025-01-14 10:56:42', b'0');
INSERT INTO `sys_dict_data` VALUES (132, '49', '1', '系统', 1, '{}', 0, NULL, 'admin', '2025-01-14 10:57:13', NULL, '2025-01-14 10:57:13', b'0');
INSERT INTO `sys_dict_data` VALUES (133, '48', '0', '正常', 0, '{}', 0, NULL, 'admin', '2025-01-14 12:18:15', NULL, '2025-01-14 12:18:15', b'0');
INSERT INTO `sys_dict_data` VALUES (134, '48', '1', '暂停', 1, '{}', 0, NULL, 'admin', '2025-01-14 12:18:59', NULL, '2025-01-14 12:18:59', b'0');
INSERT INTO `sys_dict_data` VALUES (135, '50', '1', '立即执行', 0, '{}', 0, NULL, 'admin', '2025-01-14 14:20:11', NULL, '2025-01-14 14:20:11', b'0');
INSERT INTO `sys_dict_data` VALUES (136, '50', '2', '执行一次', 1, '{}', 0, NULL, 'admin', '2025-01-14 14:20:23', NULL, '2025-01-14 14:20:23', b'0');
INSERT INTO `sys_dict_data` VALUES (137, '50', '3', '放弃执行', 2, '{}', 0, NULL, 'admin', '2025-01-14 14:20:41', NULL, '2025-01-14 14:20:41', b'0');
INSERT INTO `sys_dict_data` VALUES (138, '51', '0', '允许', 0, '{}', 0, NULL, 'admin', '2025-01-14 14:21:33', NULL, '2025-01-14 14:21:33', b'0');
INSERT INTO `sys_dict_data` VALUES (139, '51', '1', '禁止', 1, '{}', 0, NULL, 'admin', '2025-01-14 14:21:44', NULL, '2025-01-14 14:21:44', b'0');
INSERT INTO `sys_dict_data` VALUES (140, '52', '0', '正常', 0, '{}', 0, NULL, 'admin', '2025-01-14 17:34:54', NULL, '2025-01-14 17:34:54', b'0');
INSERT INTO `sys_dict_data` VALUES (141, '52', '1', '失败', 1, '{}', 0, NULL, 'admin', '2025-01-14 17:35:03', NULL, '2025-01-14 17:35:03', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典配置项' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_type` VALUES (45, 'taskPriority', 1, '[]', '任务优先级', 'admin', 0, NULL, '2025-01-13 17:21:34', NULL, '2025-01-13 17:21:34', b'0');
INSERT INTO `sys_dict_type` VALUES (46, 'taskStatus', 1, '[]', '任务状态', 'admin', 0, NULL, '2025-01-13 17:23:13', NULL, '2025-01-13 17:23:13', b'0');
INSERT INTO `sys_dict_type` VALUES (47, 'taskType', 1, '[]', '任务类型', 'admin', 0, NULL, '2025-01-13 17:24:33', NULL, '2025-01-13 17:24:33', b'0');
INSERT INTO `sys_dict_type` VALUES (48, 'jobTaskStatus', 1, '[]', '定时任务状态', 'admin', 0, NULL, '2025-01-14 10:49:31', NULL, '2025-01-14 10:49:31', b'0');
INSERT INTO `sys_dict_type` VALUES (49, 'jobTaskGroup', 0, '[]', '定时任务组名', 'admin', 0, NULL, '2025-01-14 10:56:09', NULL, '2025-01-14 10:56:09', b'0');
INSERT INTO `sys_dict_type` VALUES (50, 'jobTaskMisfirePolicy', 1, '[]', '定时任务执行策略', 'admin', 0, NULL, '2025-01-14 14:19:41', NULL, '2025-01-14 14:19:42', b'0');
INSERT INTO `sys_dict_type` VALUES (51, 'jobTaskConcurrent', 1, '[]', '是否并发', 'admin', 0, NULL, '2025-01-14 14:21:13', NULL, '2025-01-14 14:21:13', b'0');
INSERT INTO `sys_dict_type` VALUES (52, 'jobTaskLogStatus', 1, '[]', '定时任务日志状态', 'admin', 0, NULL, '2025-01-14 17:34:31', NULL, '2025-01-14 17:34:31', b'0');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` tinyint NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(1) NULL DEFAULT 3 COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` tinyint(1) NULL DEFAULT 1 COMMENT '是否并发执行（0允许 1禁止）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0正常 1暂停）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注信息',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否被删除: 0是未删除, 1是已删除',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (100, '测试', 0, 'jcmTask.jcmNoParams', '0/10 * * * * ?', 1, 1, 0, NULL, 'admin', '2025-01-14 14:36:02', 'admin', '2025-01-18 15:15:53', b'0');
INSERT INTO `sys_job` VALUES (101, '测试', 1, 'user.age', '1 2 3 4 5 6', 2, 0, 0, NULL, 'admin', '2025-01-14 14:36:02', NULL, '2025-01-14 14:36:02', b'1');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `execute_time` datetime NULL DEFAULT NULL COMMENT '任务执行时间',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否被删除: 0是未删除, 1是已删除',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:18:20', '', NULL, '', '2025-01-18 15:18:20', NULL, '2025-01-18 15:18:20', b'0');
INSERT INTO `sys_job_log` VALUES (2, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:18:30', '', NULL, '', '2025-01-18 15:18:30', NULL, '2025-01-18 15:18:30', b'0');
INSERT INTO `sys_job_log` VALUES (3, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:18:40', '', NULL, '', '2025-01-18 15:18:40', NULL, '2025-01-18 15:18:40', b'0');
INSERT INTO `sys_job_log` VALUES (4, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:18:50', '', NULL, '', '2025-01-18 15:18:50', NULL, '2025-01-18 15:18:50', b'0');
INSERT INTO `sys_job_log` VALUES (5, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:19:00', '', NULL, '', '2025-01-18 15:19:00', NULL, '2025-01-18 15:19:00', b'0');
INSERT INTO `sys_job_log` VALUES (6, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:19:10', '', NULL, '', '2025-01-18 15:19:10', NULL, '2025-01-18 15:19:10', b'0');
INSERT INTO `sys_job_log` VALUES (7, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:19:20', '', NULL, '', '2025-01-18 15:19:20', NULL, '2025-01-18 15:19:20', b'0');
INSERT INTO `sys_job_log` VALUES (8, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:19:30', '', NULL, '', '2025-01-18 15:19:30', NULL, '2025-01-18 15:19:30', b'0');
INSERT INTO `sys_job_log` VALUES (9, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:19:40', '', NULL, '', '2025-01-18 15:19:40', NULL, '2025-01-18 15:19:40', b'0');
INSERT INTO `sys_job_log` VALUES (10, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:19:50', '', NULL, '', '2025-01-18 15:19:50', NULL, '2025-01-18 15:19:50', b'0');
INSERT INTO `sys_job_log` VALUES (11, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:20:00', '', NULL, '', '2025-01-18 15:20:00', NULL, '2025-01-18 15:20:00', b'0');
INSERT INTO `sys_job_log` VALUES (12, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:20:10', '', NULL, '', '2025-01-18 15:20:10', NULL, '2025-01-18 15:20:10', b'0');
INSERT INTO `sys_job_log` VALUES (13, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:20:20', '', NULL, '', '2025-01-18 15:20:20', NULL, '2025-01-18 15:20:20', b'0');
INSERT INTO `sys_job_log` VALUES (14, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:20:30', '', NULL, '', '2025-01-18 15:20:30', NULL, '2025-01-18 15:20:30', b'0');
INSERT INTO `sys_job_log` VALUES (15, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:20:40', '', NULL, '', '2025-01-18 15:20:40', NULL, '2025-01-18 15:20:40', b'0');
INSERT INTO `sys_job_log` VALUES (16, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:20:50', '', NULL, '', '2025-01-18 15:20:50', NULL, '2025-01-18 15:20:50', b'0');
INSERT INTO `sys_job_log` VALUES (17, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:21:00', '', NULL, '', '2025-01-18 15:21:00', NULL, '2025-01-18 15:21:00', b'0');
INSERT INTO `sys_job_log` VALUES (18, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:21:10', '', NULL, '', '2025-01-18 15:21:10', NULL, '2025-01-18 15:21:10', b'0');
INSERT INTO `sys_job_log` VALUES (19, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:21:20', '', NULL, '', '2025-01-18 15:21:20', NULL, '2025-01-18 15:21:20', b'0');
INSERT INTO `sys_job_log` VALUES (20, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:21:30', '', NULL, '', '2025-01-18 15:21:30', NULL, '2025-01-18 15:21:30', b'0');
INSERT INTO `sys_job_log` VALUES (21, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:21:40', '', NULL, '', '2025-01-18 15:21:40', NULL, '2025-01-18 15:21:40', b'0');
INSERT INTO `sys_job_log` VALUES (22, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:21:50', '', NULL, '', '2025-01-18 15:21:50', NULL, '2025-01-18 15:21:50', b'0');
INSERT INTO `sys_job_log` VALUES (23, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:22:00', '', NULL, '', '2025-01-18 15:22:00', NULL, '2025-01-18 15:22:00', b'0');
INSERT INTO `sys_job_log` VALUES (24, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:22:10', '', NULL, '', '2025-01-18 15:22:10', NULL, '2025-01-18 15:22:10', b'0');
INSERT INTO `sys_job_log` VALUES (25, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:22:20', '', NULL, '', '2025-01-18 15:22:20', NULL, '2025-01-18 15:22:20', b'0');
INSERT INTO `sys_job_log` VALUES (26, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:22:30', '', NULL, '', '2025-01-18 15:22:30', NULL, '2025-01-18 15:22:30', b'0');
INSERT INTO `sys_job_log` VALUES (27, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:22:40', '', NULL, '', '2025-01-18 15:22:40', NULL, '2025-01-18 15:22:40', b'0');
INSERT INTO `sys_job_log` VALUES (28, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:22:50', '', NULL, '', '2025-01-18 15:22:50', NULL, '2025-01-18 15:22:50', b'0');
INSERT INTO `sys_job_log` VALUES (29, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:23:00', '', NULL, '', '2025-01-18 15:23:00', NULL, '2025-01-18 15:23:00', b'0');
INSERT INTO `sys_job_log` VALUES (30, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:23:10', '', NULL, '', '2025-01-18 15:23:10', NULL, '2025-01-18 15:23:10', b'0');
INSERT INTO `sys_job_log` VALUES (31, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:23:20', '', NULL, '', '2025-01-18 15:23:20', NULL, '2025-01-18 15:23:20', b'0');
INSERT INTO `sys_job_log` VALUES (32, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:23:30', '', NULL, '', '2025-01-18 15:23:30', NULL, '2025-01-18 15:23:30', b'0');
INSERT INTO `sys_job_log` VALUES (33, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:23:40', '', NULL, '', '2025-01-18 15:23:40', NULL, '2025-01-18 15:23:40', b'0');
INSERT INTO `sys_job_log` VALUES (34, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:23:50', '', NULL, '', '2025-01-18 15:23:50', NULL, '2025-01-18 15:23:50', b'0');
INSERT INTO `sys_job_log` VALUES (35, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:24:00', '', NULL, '', '2025-01-18 15:24:00', NULL, '2025-01-18 15:24:00', b'0');
INSERT INTO `sys_job_log` VALUES (36, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:24:10', '', NULL, '', '2025-01-18 15:24:10', NULL, '2025-01-18 15:24:10', b'0');
INSERT INTO `sys_job_log` VALUES (37, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:24:20', '', NULL, '', '2025-01-18 15:24:20', NULL, '2025-01-18 15:24:20', b'0');
INSERT INTO `sys_job_log` VALUES (38, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:24:30', '', NULL, '', '2025-01-18 15:24:30', NULL, '2025-01-18 15:24:30', b'0');
INSERT INTO `sys_job_log` VALUES (39, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:24:40', '', NULL, '', '2025-01-18 15:24:40', NULL, '2025-01-18 15:24:40', b'0');
INSERT INTO `sys_job_log` VALUES (40, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:24:50', '', NULL, '', '2025-01-18 15:24:50', NULL, '2025-01-18 15:24:50', b'0');
INSERT INTO `sys_job_log` VALUES (41, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:25:00', '', NULL, '', '2025-01-18 15:25:00', NULL, '2025-01-18 15:25:00', b'0');
INSERT INTO `sys_job_log` VALUES (42, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:25:10', '', NULL, '', '2025-01-18 15:25:10', NULL, '2025-01-18 15:25:10', b'0');
INSERT INTO `sys_job_log` VALUES (43, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:25:20', '', NULL, '', '2025-01-18 15:25:20', NULL, '2025-01-18 15:25:20', b'0');
INSERT INTO `sys_job_log` VALUES (44, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:25:30', '', NULL, '', '2025-01-18 15:25:30', NULL, '2025-01-18 15:25:30', b'0');
INSERT INTO `sys_job_log` VALUES (45, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:25:40', '', NULL, '', '2025-01-18 15:25:40', NULL, '2025-01-18 15:25:40', b'0');
INSERT INTO `sys_job_log` VALUES (46, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:25:50', '', NULL, '', '2025-01-18 15:25:50', NULL, '2025-01-18 15:25:50', b'0');
INSERT INTO `sys_job_log` VALUES (47, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:26:00', '', NULL, '', '2025-01-18 15:26:00', NULL, '2025-01-18 15:26:00', b'0');
INSERT INTO `sys_job_log` VALUES (48, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:26:10', '', NULL, '', '2025-01-18 15:26:10', NULL, '2025-01-18 15:26:10', b'0');
INSERT INTO `sys_job_log` VALUES (49, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:26:20', '', NULL, '', '2025-01-18 15:26:20', NULL, '2025-01-18 15:26:20', b'0');
INSERT INTO `sys_job_log` VALUES (50, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:26:30', '', NULL, '', '2025-01-18 15:26:30', NULL, '2025-01-18 15:26:30', b'0');
INSERT INTO `sys_job_log` VALUES (51, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:26:40', '', NULL, '', '2025-01-18 15:26:40', NULL, '2025-01-18 15:26:40', b'0');
INSERT INTO `sys_job_log` VALUES (52, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:26:50', '', NULL, '', '2025-01-18 15:26:50', NULL, '2025-01-18 15:26:50', b'0');
INSERT INTO `sys_job_log` VALUES (53, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:27:00', '', NULL, '', '2025-01-18 15:27:00', NULL, '2025-01-18 15:27:00', b'0');
INSERT INTO `sys_job_log` VALUES (54, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:27:10', '', NULL, '', '2025-01-18 15:27:10', NULL, '2025-01-18 15:27:10', b'0');
INSERT INTO `sys_job_log` VALUES (55, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:27:20', '', NULL, '', '2025-01-18 15:27:20', NULL, '2025-01-18 15:27:20', b'0');
INSERT INTO `sys_job_log` VALUES (56, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:27:30', '', NULL, '', '2025-01-18 15:27:30', NULL, '2025-01-18 15:27:30', b'0');
INSERT INTO `sys_job_log` VALUES (57, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:27:40', '', NULL, '', '2025-01-18 15:27:40', NULL, '2025-01-18 15:27:40', b'0');
INSERT INTO `sys_job_log` VALUES (58, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:27:50', '', NULL, '', '2025-01-18 15:27:50', NULL, '2025-01-18 15:27:50', b'0');
INSERT INTO `sys_job_log` VALUES (59, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:28:00', '', NULL, '', '2025-01-18 15:28:00', NULL, '2025-01-18 15:28:00', b'0');
INSERT INTO `sys_job_log` VALUES (60, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:28:10', '', NULL, '', '2025-01-18 15:28:10', NULL, '2025-01-18 15:28:10', b'0');
INSERT INTO `sys_job_log` VALUES (61, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:28:20', '', NULL, '', '2025-01-18 15:28:20', NULL, '2025-01-18 15:28:20', b'0');
INSERT INTO `sys_job_log` VALUES (62, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:28:30', '', NULL, '', '2025-01-18 15:28:30', NULL, '2025-01-18 15:28:30', b'0');
INSERT INTO `sys_job_log` VALUES (63, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:28:40', '', NULL, '', '2025-01-18 15:28:40', NULL, '2025-01-18 15:28:40', b'0');
INSERT INTO `sys_job_log` VALUES (64, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:28:50', '', NULL, '', '2025-01-18 15:28:50', NULL, '2025-01-18 15:28:50', b'0');
INSERT INTO `sys_job_log` VALUES (65, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:29:00', '', NULL, '', '2025-01-18 15:29:00', NULL, '2025-01-18 15:29:00', b'0');
INSERT INTO `sys_job_log` VALUES (66, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:29:10', '', NULL, '', '2025-01-18 15:29:10', NULL, '2025-01-18 15:29:10', b'0');
INSERT INTO `sys_job_log` VALUES (67, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:29:20', '', NULL, '', '2025-01-18 15:29:20', NULL, '2025-01-18 15:29:20', b'0');
INSERT INTO `sys_job_log` VALUES (68, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:29:30', '', NULL, '', '2025-01-18 15:29:30', NULL, '2025-01-18 15:29:30', b'0');
INSERT INTO `sys_job_log` VALUES (69, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:29:40', '', NULL, '', '2025-01-18 15:29:40', NULL, '2025-01-18 15:29:40', b'0');
INSERT INTO `sys_job_log` VALUES (70, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:29:50', '', NULL, '', '2025-01-18 15:29:50', NULL, '2025-01-18 15:29:50', b'0');
INSERT INTO `sys_job_log` VALUES (71, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:30:00', '', NULL, '', '2025-01-18 15:30:00', NULL, '2025-01-18 15:30:00', b'0');
INSERT INTO `sys_job_log` VALUES (72, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:30:10', '', NULL, '', '2025-01-18 15:30:10', NULL, '2025-01-18 15:30:10', b'0');
INSERT INTO `sys_job_log` VALUES (73, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:30:20', '', NULL, '', '2025-01-18 15:30:20', NULL, '2025-01-18 15:30:20', b'0');
INSERT INTO `sys_job_log` VALUES (74, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:30:30', '', NULL, '', '2025-01-18 15:30:30', NULL, '2025-01-18 15:30:30', b'0');
INSERT INTO `sys_job_log` VALUES (75, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:30:40', '', NULL, '', '2025-01-18 15:30:40', NULL, '2025-01-18 15:30:40', b'0');
INSERT INTO `sys_job_log` VALUES (76, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:30:50', '', NULL, '', '2025-01-18 15:30:50', NULL, '2025-01-18 15:30:50', b'0');
INSERT INTO `sys_job_log` VALUES (77, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:31:00', '', NULL, '', '2025-01-18 15:31:00', NULL, '2025-01-18 15:31:00', b'0');
INSERT INTO `sys_job_log` VALUES (78, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:31:10', '', NULL, '', '2025-01-18 15:31:10', NULL, '2025-01-18 15:31:10', b'0');
INSERT INTO `sys_job_log` VALUES (79, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:31:20', '', NULL, '', '2025-01-18 15:31:20', NULL, '2025-01-18 15:31:20', b'0');
INSERT INTO `sys_job_log` VALUES (80, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:31:30', '', NULL, '', '2025-01-18 15:31:30', NULL, '2025-01-18 15:31:30', b'0');
INSERT INTO `sys_job_log` VALUES (81, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:31:40', '', NULL, '', '2025-01-18 15:31:40', NULL, '2025-01-18 15:31:40', b'0');
INSERT INTO `sys_job_log` VALUES (82, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:31:50', '', NULL, '', '2025-01-18 15:31:50', NULL, '2025-01-18 15:31:50', b'0');
INSERT INTO `sys_job_log` VALUES (83, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:32:00', '', NULL, '', '2025-01-18 15:32:00', NULL, '2025-01-18 15:32:00', b'0');
INSERT INTO `sys_job_log` VALUES (84, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:32:10', '', NULL, '', '2025-01-18 15:32:10', NULL, '2025-01-18 15:32:10', b'0');
INSERT INTO `sys_job_log` VALUES (85, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:32:20', '', NULL, '', '2025-01-18 15:32:20', NULL, '2025-01-18 15:32:20', b'0');
INSERT INTO `sys_job_log` VALUES (86, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:32:30', '', NULL, '', '2025-01-18 15:32:30', NULL, '2025-01-18 15:32:30', b'0');
INSERT INTO `sys_job_log` VALUES (87, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:32:40', '', NULL, '', '2025-01-18 15:32:40', NULL, '2025-01-18 15:32:40', b'0');
INSERT INTO `sys_job_log` VALUES (88, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:32:50', '', NULL, '', '2025-01-18 15:32:50', NULL, '2025-01-18 15:32:50', b'0');
INSERT INTO `sys_job_log` VALUES (89, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:33:00', '', NULL, '', '2025-01-18 15:33:00', NULL, '2025-01-18 15:33:00', b'0');
INSERT INTO `sys_job_log` VALUES (90, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:33:10', '', NULL, '', '2025-01-18 15:33:10', NULL, '2025-01-18 15:33:10', b'0');
INSERT INTO `sys_job_log` VALUES (91, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:33:20', '', NULL, '', '2025-01-18 15:33:20', NULL, '2025-01-18 15:33:20', b'0');
INSERT INTO `sys_job_log` VALUES (92, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:33:30', '', NULL, '', '2025-01-18 15:33:30', NULL, '2025-01-18 15:33:30', b'0');
INSERT INTO `sys_job_log` VALUES (93, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:33:40', '', NULL, '', '2025-01-18 15:33:40', NULL, '2025-01-18 15:33:40', b'0');
INSERT INTO `sys_job_log` VALUES (94, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:33:50', '', NULL, '', '2025-01-18 15:33:50', NULL, '2025-01-18 15:33:50', b'0');
INSERT INTO `sys_job_log` VALUES (95, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:34:00', '', NULL, '', '2025-01-18 15:34:00', NULL, '2025-01-18 15:34:00', b'0');
INSERT INTO `sys_job_log` VALUES (96, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:34:10', '', NULL, '', '2025-01-18 15:34:10', NULL, '2025-01-18 15:34:10', b'0');
INSERT INTO `sys_job_log` VALUES (97, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:34:20', '', NULL, '', '2025-01-18 15:34:20', NULL, '2025-01-18 15:34:20', b'0');
INSERT INTO `sys_job_log` VALUES (98, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:34:30', '', NULL, '', '2025-01-18 15:34:30', NULL, '2025-01-18 15:34:30', b'0');
INSERT INTO `sys_job_log` VALUES (99, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:34:40', '', NULL, '', '2025-01-18 15:34:40', NULL, '2025-01-18 15:34:40', b'0');
INSERT INTO `sys_job_log` VALUES (100, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:34:50', '', NULL, '', '2025-01-18 15:34:50', NULL, '2025-01-18 15:34:50', b'0');
INSERT INTO `sys_job_log` VALUES (101, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:35:00', '', NULL, '', '2025-01-18 15:35:00', NULL, '2025-01-18 15:35:00', b'0');
INSERT INTO `sys_job_log` VALUES (102, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:35:10', '', NULL, '', '2025-01-18 15:35:10', NULL, '2025-01-18 15:35:10', b'0');
INSERT INTO `sys_job_log` VALUES (103, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:35:20', '', NULL, '', '2025-01-18 15:35:20', NULL, '2025-01-18 15:35:20', b'0');
INSERT INTO `sys_job_log` VALUES (104, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:35:30', '', NULL, '', '2025-01-18 15:35:30', NULL, '2025-01-18 15:35:30', b'0');
INSERT INTO `sys_job_log` VALUES (105, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:35:40', '', NULL, '', '2025-01-18 15:35:40', NULL, '2025-01-18 15:35:40', b'0');
INSERT INTO `sys_job_log` VALUES (106, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:35:50', '', NULL, '', '2025-01-18 15:35:50', NULL, '2025-01-18 15:35:50', b'0');
INSERT INTO `sys_job_log` VALUES (107, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:36:00', '', NULL, '', '2025-01-18 15:36:00', NULL, '2025-01-18 15:36:00', b'0');
INSERT INTO `sys_job_log` VALUES (108, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:36:10', '', NULL, '', '2025-01-18 15:36:10', NULL, '2025-01-18 15:36:10', b'0');
INSERT INTO `sys_job_log` VALUES (109, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:36:20', '', NULL, '', '2025-01-18 15:36:20', NULL, '2025-01-18 15:36:20', b'0');
INSERT INTO `sys_job_log` VALUES (110, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:36:30', '', NULL, '', '2025-01-18 15:36:30', NULL, '2025-01-18 15:36:30', b'0');
INSERT INTO `sys_job_log` VALUES (111, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:36:40', '', NULL, '', '2025-01-18 15:36:40', NULL, '2025-01-18 15:36:40', b'0');
INSERT INTO `sys_job_log` VALUES (112, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:36:50', '', NULL, '', '2025-01-18 15:36:50', NULL, '2025-01-18 15:36:50', b'0');
INSERT INTO `sys_job_log` VALUES (113, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:37:00', '', NULL, '', '2025-01-18 15:37:00', NULL, '2025-01-18 15:37:00', b'0');
INSERT INTO `sys_job_log` VALUES (114, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:37:10', '', NULL, '', '2025-01-18 15:37:10', NULL, '2025-01-18 15:37:10', b'0');
INSERT INTO `sys_job_log` VALUES (115, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:37:20', '', NULL, '', '2025-01-18 15:37:20', NULL, '2025-01-18 15:37:20', b'0');
INSERT INTO `sys_job_log` VALUES (116, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:37:30', '', NULL, '', '2025-01-18 15:37:30', NULL, '2025-01-18 15:37:30', b'0');
INSERT INTO `sys_job_log` VALUES (117, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:37:40', '', NULL, '', '2025-01-18 15:37:40', NULL, '2025-01-18 15:37:40', b'0');
INSERT INTO `sys_job_log` VALUES (118, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:37:50', '', NULL, '', '2025-01-18 15:37:50', NULL, '2025-01-18 15:37:50', b'0');
INSERT INTO `sys_job_log` VALUES (119, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:38:00', '', NULL, '', '2025-01-18 15:38:00', NULL, '2025-01-18 15:38:00', b'0');
INSERT INTO `sys_job_log` VALUES (120, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:38:10', '', NULL, '', '2025-01-18 15:38:10', NULL, '2025-01-18 15:38:10', b'0');
INSERT INTO `sys_job_log` VALUES (121, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:38:20', '', NULL, '', '2025-01-18 15:38:20', NULL, '2025-01-18 15:38:20', b'0');
INSERT INTO `sys_job_log` VALUES (122, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:38:30', '', NULL, '', '2025-01-18 15:38:30', NULL, '2025-01-18 15:38:30', b'0');
INSERT INTO `sys_job_log` VALUES (123, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:38:40', '', NULL, '', '2025-01-18 15:38:40', NULL, '2025-01-18 15:38:40', b'0');
INSERT INTO `sys_job_log` VALUES (124, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:38:50', '', NULL, '', '2025-01-18 15:38:50', NULL, '2025-01-18 15:38:50', b'0');
INSERT INTO `sys_job_log` VALUES (125, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:39:00', '', NULL, '', '2025-01-18 15:39:00', NULL, '2025-01-18 15:39:00', b'0');
INSERT INTO `sys_job_log` VALUES (126, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:39:10', '', NULL, '', '2025-01-18 15:39:10', NULL, '2025-01-18 15:39:10', b'0');
INSERT INTO `sys_job_log` VALUES (127, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:39:20', '', NULL, '', '2025-01-18 15:39:20', NULL, '2025-01-18 15:39:20', b'0');
INSERT INTO `sys_job_log` VALUES (128, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:39:30', '', NULL, '', '2025-01-18 15:39:30', NULL, '2025-01-18 15:39:30', b'0');
INSERT INTO `sys_job_log` VALUES (129, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:39:40', '', NULL, '', '2025-01-18 15:39:40', NULL, '2025-01-18 15:39:40', b'0');
INSERT INTO `sys_job_log` VALUES (130, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:39:50', '', NULL, '', '2025-01-18 15:39:50', NULL, '2025-01-18 15:39:50', b'0');
INSERT INTO `sys_job_log` VALUES (131, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:40:00', '', NULL, '', '2025-01-18 15:40:00', NULL, '2025-01-18 15:40:00', b'0');
INSERT INTO `sys_job_log` VALUES (132, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:40:10', '', NULL, '', '2025-01-18 15:40:10', NULL, '2025-01-18 15:40:10', b'0');
INSERT INTO `sys_job_log` VALUES (133, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:40:20', '', NULL, '', '2025-01-18 15:40:20', NULL, '2025-01-18 15:40:20', b'0');
INSERT INTO `sys_job_log` VALUES (134, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:40:30', '', NULL, '', '2025-01-18 15:40:30', NULL, '2025-01-18 15:40:30', b'0');
INSERT INTO `sys_job_log` VALUES (135, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:40:40', '', NULL, '', '2025-01-18 15:40:40', NULL, '2025-01-18 15:40:40', b'0');
INSERT INTO `sys_job_log` VALUES (136, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:40:50', '', NULL, '', '2025-01-18 15:40:50', NULL, '2025-01-18 15:40:50', b'0');
INSERT INTO `sys_job_log` VALUES (137, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:41:00', '', NULL, '', '2025-01-18 15:41:00', NULL, '2025-01-18 15:41:00', b'0');
INSERT INTO `sys_job_log` VALUES (138, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:41:10', '', NULL, '', '2025-01-18 15:41:10', NULL, '2025-01-18 15:41:10', b'0');
INSERT INTO `sys_job_log` VALUES (139, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:41:20', '', NULL, '', '2025-01-18 15:41:20', NULL, '2025-01-18 15:41:20', b'0');
INSERT INTO `sys_job_log` VALUES (140, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:41:30', '', NULL, '', '2025-01-18 15:41:30', NULL, '2025-01-18 15:41:30', b'0');
INSERT INTO `sys_job_log` VALUES (141, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:41:40', '', NULL, '', '2025-01-18 15:41:40', NULL, '2025-01-18 15:41:40', b'0');
INSERT INTO `sys_job_log` VALUES (142, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:41:50', '', NULL, '', '2025-01-18 15:41:50', NULL, '2025-01-18 15:41:50', b'0');
INSERT INTO `sys_job_log` VALUES (143, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:42:00', '', NULL, '', '2025-01-18 15:42:00', NULL, '2025-01-18 15:42:00', b'0');
INSERT INTO `sys_job_log` VALUES (144, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:42:10', '', NULL, '', '2025-01-18 15:42:10', NULL, '2025-01-18 15:42:10', b'0');
INSERT INTO `sys_job_log` VALUES (145, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:42:20', '', NULL, '', '2025-01-18 15:42:20', NULL, '2025-01-18 15:42:20', b'0');
INSERT INTO `sys_job_log` VALUES (146, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:42:30', '', NULL, '', '2025-01-18 15:42:30', NULL, '2025-01-18 15:42:30', b'0');
INSERT INTO `sys_job_log` VALUES (147, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:42:40', '', NULL, '', '2025-01-18 15:42:40', NULL, '2025-01-18 15:42:40', b'0');
INSERT INTO `sys_job_log` VALUES (148, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:42:50', '', NULL, '', '2025-01-18 15:42:50', NULL, '2025-01-18 15:42:50', b'0');
INSERT INTO `sys_job_log` VALUES (149, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:43:00', '', NULL, '', '2025-01-18 15:43:00', NULL, '2025-01-18 15:43:00', b'0');
INSERT INTO `sys_job_log` VALUES (150, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:43:10', '', NULL, '', '2025-01-18 15:43:10', NULL, '2025-01-18 15:43:10', b'0');
INSERT INTO `sys_job_log` VALUES (151, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:43:20', '', NULL, '', '2025-01-18 15:43:20', NULL, '2025-01-18 15:43:20', b'0');
INSERT INTO `sys_job_log` VALUES (152, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:43:30', '', NULL, '', '2025-01-18 15:43:30', NULL, '2025-01-18 15:43:30', b'0');
INSERT INTO `sys_job_log` VALUES (153, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:43:40', '', NULL, '', '2025-01-18 15:43:40', NULL, '2025-01-18 15:43:40', b'0');
INSERT INTO `sys_job_log` VALUES (154, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:43:50', '', NULL, '', '2025-01-18 15:43:50', NULL, '2025-01-18 15:43:50', b'0');
INSERT INTO `sys_job_log` VALUES (155, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:44:00', '', NULL, '', '2025-01-18 15:44:00', NULL, '2025-01-18 15:44:00', b'0');
INSERT INTO `sys_job_log` VALUES (156, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:44:10', '', NULL, '', '2025-01-18 15:44:10', NULL, '2025-01-18 15:44:10', b'0');
INSERT INTO `sys_job_log` VALUES (157, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:44:20', '', NULL, '', '2025-01-18 15:44:20', NULL, '2025-01-18 15:44:20', b'0');
INSERT INTO `sys_job_log` VALUES (158, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:44:30', '', NULL, '', '2025-01-18 15:44:30', NULL, '2025-01-18 15:44:30', b'0');
INSERT INTO `sys_job_log` VALUES (159, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:44:40', '', NULL, '', '2025-01-18 15:44:40', NULL, '2025-01-18 15:44:40', b'0');
INSERT INTO `sys_job_log` VALUES (160, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:44:50', '', NULL, '', '2025-01-18 15:44:50', NULL, '2025-01-18 15:44:50', b'0');
INSERT INTO `sys_job_log` VALUES (161, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:45:00', '', NULL, '', '2025-01-18 15:45:00', NULL, '2025-01-18 15:45:00', b'0');
INSERT INTO `sys_job_log` VALUES (162, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:45:10', '', NULL, '', '2025-01-18 15:45:10', NULL, '2025-01-18 15:45:10', b'0');
INSERT INTO `sys_job_log` VALUES (163, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:45:20', '', NULL, '', '2025-01-18 15:45:20', NULL, '2025-01-18 15:45:20', b'0');
INSERT INTO `sys_job_log` VALUES (164, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:45:30', '', NULL, '', '2025-01-18 15:45:30', NULL, '2025-01-18 15:45:30', b'0');
INSERT INTO `sys_job_log` VALUES (165, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:45:40', '', NULL, '', '2025-01-18 15:45:40', NULL, '2025-01-18 15:45:40', b'0');
INSERT INTO `sys_job_log` VALUES (166, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:45:50', '', NULL, '', '2025-01-18 15:45:50', NULL, '2025-01-18 15:45:50', b'0');
INSERT INTO `sys_job_log` VALUES (167, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:46:00', '', NULL, '', '2025-01-18 15:46:00', NULL, '2025-01-18 15:46:00', b'0');
INSERT INTO `sys_job_log` VALUES (168, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:46:10', '', NULL, '', '2025-01-18 15:46:10', NULL, '2025-01-18 15:46:10', b'0');
INSERT INTO `sys_job_log` VALUES (169, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:46:20', '', NULL, '', '2025-01-18 15:46:20', NULL, '2025-01-18 15:46:20', b'0');
INSERT INTO `sys_job_log` VALUES (170, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:46:30', '', NULL, '', '2025-01-18 15:46:30', NULL, '2025-01-18 15:46:30', b'0');
INSERT INTO `sys_job_log` VALUES (171, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:46:40', '', NULL, '', '2025-01-18 15:46:40', NULL, '2025-01-18 15:46:40', b'0');
INSERT INTO `sys_job_log` VALUES (172, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:46:50', '', NULL, '', '2025-01-18 15:46:50', NULL, '2025-01-18 15:46:50', b'0');
INSERT INTO `sys_job_log` VALUES (173, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:47:00', '', NULL, '', '2025-01-18 15:47:00', NULL, '2025-01-18 15:47:00', b'0');
INSERT INTO `sys_job_log` VALUES (174, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:47:10', '', NULL, '', '2025-01-18 15:47:10', NULL, '2025-01-18 15:47:10', b'0');
INSERT INTO `sys_job_log` VALUES (175, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:47:20', '', NULL, '', '2025-01-18 15:47:20', NULL, '2025-01-18 15:47:20', b'0');
INSERT INTO `sys_job_log` VALUES (176, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:47:30', '', NULL, '', '2025-01-18 15:47:30', NULL, '2025-01-18 15:47:30', b'0');
INSERT INTO `sys_job_log` VALUES (177, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:47:40', '', NULL, '', '2025-01-18 15:47:40', NULL, '2025-01-18 15:47:40', b'0');
INSERT INTO `sys_job_log` VALUES (178, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:47:50', '', NULL, '', '2025-01-18 15:47:50', NULL, '2025-01-18 15:47:50', b'0');
INSERT INTO `sys_job_log` VALUES (179, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:48:00', '', NULL, '', '2025-01-18 15:48:00', NULL, '2025-01-18 15:48:00', b'0');
INSERT INTO `sys_job_log` VALUES (180, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:48:10', '', NULL, '', '2025-01-18 15:48:10', NULL, '2025-01-18 15:48:10', b'0');
INSERT INTO `sys_job_log` VALUES (181, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:48:20', '', NULL, '', '2025-01-18 15:48:20', NULL, '2025-01-18 15:48:20', b'0');
INSERT INTO `sys_job_log` VALUES (182, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:48:30', '', NULL, '', '2025-01-18 15:48:30', NULL, '2025-01-18 15:48:30', b'0');
INSERT INTO `sys_job_log` VALUES (183, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:48:40', '', NULL, '', '2025-01-18 15:48:40', NULL, '2025-01-18 15:48:40', b'0');
INSERT INTO `sys_job_log` VALUES (184, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:48:50', '', NULL, '', '2025-01-18 15:48:50', NULL, '2025-01-18 15:48:50', b'0');
INSERT INTO `sys_job_log` VALUES (185, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:49:00', '', NULL, '', '2025-01-18 15:49:00', NULL, '2025-01-18 15:49:00', b'0');
INSERT INTO `sys_job_log` VALUES (186, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:49:10', '', NULL, '', '2025-01-18 15:49:10', NULL, '2025-01-18 15:49:10', b'0');
INSERT INTO `sys_job_log` VALUES (187, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:49:20', '', NULL, '', '2025-01-18 15:49:20', NULL, '2025-01-18 15:49:20', b'0');
INSERT INTO `sys_job_log` VALUES (188, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:49:30', '', NULL, '', '2025-01-18 15:49:30', NULL, '2025-01-18 15:49:30', b'0');
INSERT INTO `sys_job_log` VALUES (189, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:49:40', '', NULL, '', '2025-01-18 15:49:40', NULL, '2025-01-18 15:49:40', b'0');
INSERT INTO `sys_job_log` VALUES (190, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:49:50', '', NULL, '', '2025-01-18 15:49:50', NULL, '2025-01-18 15:49:50', b'0');
INSERT INTO `sys_job_log` VALUES (191, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:50:00', '', NULL, '', '2025-01-18 15:50:00', NULL, '2025-01-18 15:50:00', b'0');
INSERT INTO `sys_job_log` VALUES (192, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:50:10', '', NULL, '', '2025-01-18 15:50:10', NULL, '2025-01-18 15:50:10', b'0');
INSERT INTO `sys_job_log` VALUES (193, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:50:20', '', NULL, '', '2025-01-18 15:50:20', NULL, '2025-01-18 15:50:20', b'0');
INSERT INTO `sys_job_log` VALUES (194, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:50:30', '', NULL, '', '2025-01-18 15:50:30', NULL, '2025-01-18 15:50:30', b'0');
INSERT INTO `sys_job_log` VALUES (195, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:50:40', '', NULL, '', '2025-01-18 15:50:40', NULL, '2025-01-18 15:50:40', b'0');
INSERT INTO `sys_job_log` VALUES (196, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:50:50', '', NULL, '', '2025-01-18 15:50:50', NULL, '2025-01-18 15:50:50', b'0');
INSERT INTO `sys_job_log` VALUES (197, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:51:00', '', NULL, '', '2025-01-18 15:51:00', NULL, '2025-01-18 15:51:00', b'0');
INSERT INTO `sys_job_log` VALUES (198, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:51:10', '', NULL, '', '2025-01-18 15:51:10', NULL, '2025-01-18 15:51:10', b'0');
INSERT INTO `sys_job_log` VALUES (199, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:51:20', '', NULL, '', '2025-01-18 15:51:20', NULL, '2025-01-18 15:51:20', b'0');
INSERT INTO `sys_job_log` VALUES (200, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:51:30', '', NULL, '', '2025-01-18 15:51:30', NULL, '2025-01-18 15:51:30', b'0');
INSERT INTO `sys_job_log` VALUES (201, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:51:40', '', NULL, '', '2025-01-18 15:51:40', NULL, '2025-01-18 15:51:40', b'0');
INSERT INTO `sys_job_log` VALUES (202, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:51:50', '', NULL, '', '2025-01-18 15:51:50', NULL, '2025-01-18 15:51:50', b'0');
INSERT INTO `sys_job_log` VALUES (203, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:52:00', '', NULL, '', '2025-01-18 15:52:00', NULL, '2025-01-18 15:52:00', b'0');
INSERT INTO `sys_job_log` VALUES (204, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:52:10', '', NULL, '', '2025-01-18 15:52:10', NULL, '2025-01-18 15:52:10', b'0');
INSERT INTO `sys_job_log` VALUES (205, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:52:20', '', NULL, '', '2025-01-18 15:52:20', NULL, '2025-01-18 15:52:20', b'0');
INSERT INTO `sys_job_log` VALUES (206, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:52:30', '', NULL, '', '2025-01-18 15:52:30', NULL, '2025-01-18 15:52:30', b'0');
INSERT INTO `sys_job_log` VALUES (207, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:52:40', '', NULL, '', '2025-01-18 15:52:40', NULL, '2025-01-18 15:52:40', b'0');
INSERT INTO `sys_job_log` VALUES (208, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:52:50', '', NULL, '', '2025-01-18 15:52:50', NULL, '2025-01-18 15:52:50', b'0');
INSERT INTO `sys_job_log` VALUES (209, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:53:00', '', NULL, '', '2025-01-18 15:53:00', NULL, '2025-01-18 15:53:00', b'0');
INSERT INTO `sys_job_log` VALUES (210, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:53:10', '', NULL, '', '2025-01-18 15:53:10', NULL, '2025-01-18 15:53:10', b'0');
INSERT INTO `sys_job_log` VALUES (211, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:53:20', '', NULL, '', '2025-01-18 15:53:20', NULL, '2025-01-18 15:53:20', b'0');
INSERT INTO `sys_job_log` VALUES (212, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:53:30', '', NULL, '', '2025-01-18 15:53:30', NULL, '2025-01-18 15:53:30', b'0');
INSERT INTO `sys_job_log` VALUES (213, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:53:40', '', NULL, '', '2025-01-18 15:53:40', NULL, '2025-01-18 15:53:40', b'0');
INSERT INTO `sys_job_log` VALUES (214, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:53:50', '', NULL, '', '2025-01-18 15:53:50', NULL, '2025-01-18 15:53:50', b'0');
INSERT INTO `sys_job_log` VALUES (215, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:54:00', '', NULL, '', '2025-01-18 15:54:00', NULL, '2025-01-18 15:54:00', b'0');
INSERT INTO `sys_job_log` VALUES (216, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:54:10', '', NULL, '', '2025-01-18 15:54:10', NULL, '2025-01-18 15:54:10', b'0');
INSERT INTO `sys_job_log` VALUES (217, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:54:20', '', NULL, '', '2025-01-18 15:54:20', NULL, '2025-01-18 15:54:20', b'0');
INSERT INTO `sys_job_log` VALUES (218, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:54:30', '', NULL, '', '2025-01-18 15:54:30', NULL, '2025-01-18 15:54:30', b'0');
INSERT INTO `sys_job_log` VALUES (219, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:54:40', '', NULL, '', '2025-01-18 15:54:40', NULL, '2025-01-18 15:54:40', b'0');
INSERT INTO `sys_job_log` VALUES (220, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:54:50', '', NULL, '', '2025-01-18 15:54:50', NULL, '2025-01-18 15:54:50', b'0');
INSERT INTO `sys_job_log` VALUES (221, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:55:00', '', NULL, '', '2025-01-18 15:55:00', NULL, '2025-01-18 15:55:00', b'0');
INSERT INTO `sys_job_log` VALUES (222, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:55:10', '', NULL, '', '2025-01-18 15:55:10', NULL, '2025-01-18 15:55:10', b'0');
INSERT INTO `sys_job_log` VALUES (223, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:55:20', '', NULL, '', '2025-01-18 15:55:20', NULL, '2025-01-18 15:55:20', b'0');
INSERT INTO `sys_job_log` VALUES (224, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:55:30', '', NULL, '', '2025-01-18 15:55:30', NULL, '2025-01-18 15:55:30', b'0');
INSERT INTO `sys_job_log` VALUES (225, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:55:40', '', NULL, '', '2025-01-18 15:55:40', NULL, '2025-01-18 15:55:40', b'0');
INSERT INTO `sys_job_log` VALUES (226, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:55:50', '', NULL, '', '2025-01-18 15:55:50', NULL, '2025-01-18 15:55:50', b'0');
INSERT INTO `sys_job_log` VALUES (227, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:56:00', '', NULL, '', '2025-01-18 15:56:00', NULL, '2025-01-18 15:56:00', b'0');
INSERT INTO `sys_job_log` VALUES (228, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:56:10', '', NULL, '', '2025-01-18 15:56:10', NULL, '2025-01-18 15:56:10', b'0');
INSERT INTO `sys_job_log` VALUES (229, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:56:20', '', NULL, '', '2025-01-18 15:56:20', NULL, '2025-01-18 15:56:20', b'0');
INSERT INTO `sys_job_log` VALUES (230, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:56:30', '', NULL, '', '2025-01-18 15:56:30', NULL, '2025-01-18 15:56:30', b'0');
INSERT INTO `sys_job_log` VALUES (231, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:56:40', '', NULL, '', '2025-01-18 15:56:40', NULL, '2025-01-18 15:56:40', b'0');
INSERT INTO `sys_job_log` VALUES (232, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:56:50', '', NULL, '', '2025-01-18 15:56:50', NULL, '2025-01-18 15:56:50', b'0');
INSERT INTO `sys_job_log` VALUES (233, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:57:00', '', NULL, '', '2025-01-18 15:57:00', NULL, '2025-01-18 15:57:00', b'0');
INSERT INTO `sys_job_log` VALUES (234, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:57:10', '', NULL, '', '2025-01-18 15:57:10', NULL, '2025-01-18 15:57:10', b'0');
INSERT INTO `sys_job_log` VALUES (235, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:57:20', '', NULL, '', '2025-01-18 15:57:20', NULL, '2025-01-18 15:57:20', b'0');
INSERT INTO `sys_job_log` VALUES (236, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:57:30', '', NULL, '', '2025-01-18 15:57:30', NULL, '2025-01-18 15:57:30', b'0');
INSERT INTO `sys_job_log` VALUES (237, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:57:40', '', NULL, '', '2025-01-18 15:57:40', NULL, '2025-01-18 15:57:40', b'0');
INSERT INTO `sys_job_log` VALUES (238, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:57:50', '', NULL, '', '2025-01-18 15:57:50', NULL, '2025-01-18 15:57:50', b'0');
INSERT INTO `sys_job_log` VALUES (239, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:58:00', '', NULL, '', '2025-01-18 15:58:00', NULL, '2025-01-18 15:58:00', b'0');
INSERT INTO `sys_job_log` VALUES (240, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:58:10', '', NULL, '', '2025-01-18 15:58:10', NULL, '2025-01-18 15:58:10', b'0');
INSERT INTO `sys_job_log` VALUES (241, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:58:20', '', NULL, '', '2025-01-18 15:58:20', NULL, '2025-01-18 15:58:20', b'0');
INSERT INTO `sys_job_log` VALUES (242, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:58:30', '', NULL, '', '2025-01-18 15:58:30', NULL, '2025-01-18 15:58:30', b'0');
INSERT INTO `sys_job_log` VALUES (243, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:58:40', '', NULL, '', '2025-01-18 15:58:40', NULL, '2025-01-18 15:58:40', b'0');
INSERT INTO `sys_job_log` VALUES (244, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:58:50', '', NULL, '', '2025-01-18 15:58:50', NULL, '2025-01-18 15:58:50', b'0');
INSERT INTO `sys_job_log` VALUES (245, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:59:00', '', NULL, '', '2025-01-18 15:59:00', NULL, '2025-01-18 15:59:00', b'0');
INSERT INTO `sys_job_log` VALUES (246, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:59:10', '', NULL, '', '2025-01-18 15:59:10', NULL, '2025-01-18 15:59:10', b'0');
INSERT INTO `sys_job_log` VALUES (247, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:59:20', '', NULL, '', '2025-01-18 15:59:20', NULL, '2025-01-18 15:59:20', b'0');
INSERT INTO `sys_job_log` VALUES (248, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 15:59:30', '', NULL, '', '2025-01-18 15:59:30', NULL, '2025-01-18 15:59:30', b'0');
INSERT INTO `sys_job_log` VALUES (249, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:59:40', '', NULL, '', '2025-01-18 15:59:40', NULL, '2025-01-18 15:59:40', b'0');
INSERT INTO `sys_job_log` VALUES (250, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 15:59:50', '', NULL, '', '2025-01-18 15:59:50', NULL, '2025-01-18 15:59:50', b'0');
INSERT INTO `sys_job_log` VALUES (251, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:00:00', '', NULL, '', '2025-01-18 16:00:00', NULL, '2025-01-18 16:00:00', b'0');
INSERT INTO `sys_job_log` VALUES (252, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:00:10', '', NULL, '', '2025-01-18 16:00:10', NULL, '2025-01-18 16:00:10', b'0');
INSERT INTO `sys_job_log` VALUES (253, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:00:20', '', NULL, '', '2025-01-18 16:00:20', NULL, '2025-01-18 16:00:20', b'0');
INSERT INTO `sys_job_log` VALUES (254, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:00:30', '', NULL, '', '2025-01-18 16:00:30', NULL, '2025-01-18 16:00:30', b'0');
INSERT INTO `sys_job_log` VALUES (255, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:00:40', '', NULL, '', '2025-01-18 16:00:40', NULL, '2025-01-18 16:00:40', b'0');
INSERT INTO `sys_job_log` VALUES (256, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:00:50', '', NULL, '', '2025-01-18 16:00:50', NULL, '2025-01-18 16:00:50', b'0');
INSERT INTO `sys_job_log` VALUES (257, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:01:00', '', NULL, '', '2025-01-18 16:01:00', NULL, '2025-01-18 16:01:00', b'0');
INSERT INTO `sys_job_log` VALUES (258, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:01:10', '', NULL, '', '2025-01-18 16:01:10', NULL, '2025-01-18 16:01:10', b'0');
INSERT INTO `sys_job_log` VALUES (259, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:01:20', '', NULL, '', '2025-01-18 16:01:20', NULL, '2025-01-18 16:01:20', b'0');
INSERT INTO `sys_job_log` VALUES (260, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:01:30', '', NULL, '', '2025-01-18 16:01:30', NULL, '2025-01-18 16:01:30', b'0');
INSERT INTO `sys_job_log` VALUES (261, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:01:40', '', NULL, '', '2025-01-18 16:01:40', NULL, '2025-01-18 16:01:40', b'0');
INSERT INTO `sys_job_log` VALUES (262, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:01:50', '', NULL, '', '2025-01-18 16:01:50', NULL, '2025-01-18 16:01:50', b'0');
INSERT INTO `sys_job_log` VALUES (263, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:02:00', '', NULL, '', '2025-01-18 16:02:00', NULL, '2025-01-18 16:02:00', b'0');
INSERT INTO `sys_job_log` VALUES (264, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:02:10', '', NULL, '', '2025-01-18 16:02:10', NULL, '2025-01-18 16:02:10', b'0');
INSERT INTO `sys_job_log` VALUES (265, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:02:20', '', NULL, '', '2025-01-18 16:02:20', NULL, '2025-01-18 16:02:20', b'0');
INSERT INTO `sys_job_log` VALUES (266, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:02:30', '', NULL, '', '2025-01-18 16:02:30', NULL, '2025-01-18 16:02:30', b'0');
INSERT INTO `sys_job_log` VALUES (267, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:02:40', '', NULL, '', '2025-01-18 16:02:40', NULL, '2025-01-18 16:02:40', b'0');
INSERT INTO `sys_job_log` VALUES (268, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:02:50', '', NULL, '', '2025-01-18 16:02:50', NULL, '2025-01-18 16:02:50', b'0');
INSERT INTO `sys_job_log` VALUES (269, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:03:00', '', NULL, '', '2025-01-18 16:03:00', NULL, '2025-01-18 16:03:00', b'0');
INSERT INTO `sys_job_log` VALUES (270, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:03:10', '', NULL, '', '2025-01-18 16:03:10', NULL, '2025-01-18 16:03:10', b'0');
INSERT INTO `sys_job_log` VALUES (271, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:03:20', '', NULL, '', '2025-01-18 16:03:20', NULL, '2025-01-18 16:03:20', b'0');
INSERT INTO `sys_job_log` VALUES (272, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:03:30', '', NULL, '', '2025-01-18 16:03:30', NULL, '2025-01-18 16:03:30', b'0');
INSERT INTO `sys_job_log` VALUES (273, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:03:40', '', NULL, '', '2025-01-18 16:03:40', NULL, '2025-01-18 16:03:40', b'0');
INSERT INTO `sys_job_log` VALUES (274, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:03:50', '', NULL, '', '2025-01-18 16:03:50', NULL, '2025-01-18 16:03:50', b'0');
INSERT INTO `sys_job_log` VALUES (275, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:04:00', '', NULL, '', '2025-01-18 16:04:00', NULL, '2025-01-18 16:04:00', b'0');
INSERT INTO `sys_job_log` VALUES (276, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:04:10', '', NULL, '', '2025-01-18 16:04:10', NULL, '2025-01-18 16:04:10', b'0');
INSERT INTO `sys_job_log` VALUES (277, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:04:20', '', NULL, '', '2025-01-18 16:04:20', NULL, '2025-01-18 16:04:20', b'0');
INSERT INTO `sys_job_log` VALUES (278, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:04:30', '', NULL, '', '2025-01-18 16:04:30', NULL, '2025-01-18 16:04:30', b'0');
INSERT INTO `sys_job_log` VALUES (279, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:04:40', '', NULL, '', '2025-01-18 16:04:40', NULL, '2025-01-18 16:04:40', b'0');
INSERT INTO `sys_job_log` VALUES (280, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:04:50', '', NULL, '', '2025-01-18 16:04:50', NULL, '2025-01-18 16:04:50', b'0');
INSERT INTO `sys_job_log` VALUES (281, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:05:00', '', NULL, '', '2025-01-18 16:05:00', NULL, '2025-01-18 16:05:00', b'0');
INSERT INTO `sys_job_log` VALUES (282, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:05:10', '', NULL, '', '2025-01-18 16:05:10', NULL, '2025-01-18 16:05:10', b'0');
INSERT INTO `sys_job_log` VALUES (283, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:05:20', '', NULL, '', '2025-01-18 16:05:20', NULL, '2025-01-18 16:05:20', b'0');
INSERT INTO `sys_job_log` VALUES (284, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:05:30', '', NULL, '', '2025-01-18 16:05:30', NULL, '2025-01-18 16:05:30', b'0');
INSERT INTO `sys_job_log` VALUES (285, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:05:40', '', NULL, '', '2025-01-18 16:05:40', NULL, '2025-01-18 16:05:40', b'0');
INSERT INTO `sys_job_log` VALUES (286, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:05:50', '', NULL, '', '2025-01-18 16:05:50', NULL, '2025-01-18 16:05:50', b'0');
INSERT INTO `sys_job_log` VALUES (287, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:06:00', '', NULL, '', '2025-01-18 16:06:00', NULL, '2025-01-18 16:06:00', b'0');
INSERT INTO `sys_job_log` VALUES (288, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:06:10', '', NULL, '', '2025-01-18 16:06:10', NULL, '2025-01-18 16:06:10', b'0');
INSERT INTO `sys_job_log` VALUES (289, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:06:20', '', NULL, '', '2025-01-18 16:06:20', NULL, '2025-01-18 16:06:20', b'0');
INSERT INTO `sys_job_log` VALUES (290, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:06:30', '', NULL, '', '2025-01-18 16:06:30', NULL, '2025-01-18 16:06:30', b'0');
INSERT INTO `sys_job_log` VALUES (291, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:06:40', '', NULL, '', '2025-01-18 16:06:40', NULL, '2025-01-18 16:06:40', b'0');
INSERT INTO `sys_job_log` VALUES (292, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:06:50', '', NULL, '', '2025-01-18 16:06:50', NULL, '2025-01-18 16:06:50', b'0');
INSERT INTO `sys_job_log` VALUES (293, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:07:00', '', NULL, '', '2025-01-18 16:07:00', NULL, '2025-01-18 16:07:00', b'0');
INSERT INTO `sys_job_log` VALUES (294, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:07:10', '', NULL, '', '2025-01-18 16:07:10', NULL, '2025-01-18 16:07:10', b'0');
INSERT INTO `sys_job_log` VALUES (295, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:07:20', '', NULL, '', '2025-01-18 16:07:20', NULL, '2025-01-18 16:07:20', b'0');
INSERT INTO `sys_job_log` VALUES (296, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:07:30', '', NULL, '', '2025-01-18 16:07:30', NULL, '2025-01-18 16:07:30', b'0');
INSERT INTO `sys_job_log` VALUES (297, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:07:40', '', NULL, '', '2025-01-18 16:07:40', NULL, '2025-01-18 16:07:40', b'0');
INSERT INTO `sys_job_log` VALUES (298, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:07:50', '', NULL, '', '2025-01-18 16:07:50', NULL, '2025-01-18 16:07:50', b'0');
INSERT INTO `sys_job_log` VALUES (299, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:08:00', '', NULL, '', '2025-01-18 16:08:00', NULL, '2025-01-18 16:08:00', b'0');
INSERT INTO `sys_job_log` VALUES (300, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:08:10', '', NULL, '', '2025-01-18 16:08:10', NULL, '2025-01-18 16:08:10', b'0');
INSERT INTO `sys_job_log` VALUES (301, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:08:20', '', NULL, '', '2025-01-18 16:08:20', NULL, '2025-01-18 16:08:20', b'0');
INSERT INTO `sys_job_log` VALUES (302, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:08:30', '', NULL, '', '2025-01-18 16:08:30', NULL, '2025-01-18 16:08:30', b'0');
INSERT INTO `sys_job_log` VALUES (303, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:08:40', '', NULL, '', '2025-01-18 16:08:40', NULL, '2025-01-18 16:08:40', b'0');
INSERT INTO `sys_job_log` VALUES (304, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:08:50', '', NULL, '', '2025-01-18 16:08:50', NULL, '2025-01-18 16:08:50', b'0');
INSERT INTO `sys_job_log` VALUES (305, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:09:00', '', NULL, '', '2025-01-18 16:09:00', NULL, '2025-01-18 16:09:00', b'0');
INSERT INTO `sys_job_log` VALUES (306, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:09:10', '', NULL, '', '2025-01-18 16:09:10', NULL, '2025-01-18 16:09:10', b'0');
INSERT INTO `sys_job_log` VALUES (307, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:09:20', '', NULL, '', '2025-01-18 16:09:20', NULL, '2025-01-18 16:09:20', b'0');
INSERT INTO `sys_job_log` VALUES (308, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:09:30', '', NULL, '', '2025-01-18 16:09:30', NULL, '2025-01-18 16:09:30', b'0');
INSERT INTO `sys_job_log` VALUES (309, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:09:40', '', NULL, '', '2025-01-18 16:09:40', NULL, '2025-01-18 16:09:40', b'0');
INSERT INTO `sys_job_log` VALUES (310, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:09:50', '', NULL, '', '2025-01-18 16:09:50', NULL, '2025-01-18 16:09:50', b'0');
INSERT INTO `sys_job_log` VALUES (311, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:10:00', '', NULL, '', '2025-01-18 16:10:00', NULL, '2025-01-18 16:10:00', b'0');
INSERT INTO `sys_job_log` VALUES (312, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:10:10', '', NULL, '', '2025-01-18 16:10:10', NULL, '2025-01-18 16:10:10', b'0');
INSERT INTO `sys_job_log` VALUES (313, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:10:20', '', NULL, '', '2025-01-18 16:10:20', NULL, '2025-01-18 16:10:20', b'0');
INSERT INTO `sys_job_log` VALUES (314, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:10:30', '', NULL, '', '2025-01-18 16:10:30', NULL, '2025-01-18 16:10:30', b'0');
INSERT INTO `sys_job_log` VALUES (315, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:10:40', '', NULL, '', '2025-01-18 16:10:40', NULL, '2025-01-18 16:10:40', b'0');
INSERT INTO `sys_job_log` VALUES (316, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:10:50', '', NULL, '', '2025-01-18 16:10:50', NULL, '2025-01-18 16:10:50', b'0');
INSERT INTO `sys_job_log` VALUES (317, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：3毫秒', '0', '2025-01-18 16:11:00', '', NULL, '', '2025-01-18 16:11:00', NULL, '2025-01-18 16:11:00', b'0');
INSERT INTO `sys_job_log` VALUES (318, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:11:10', '', NULL, '', '2025-01-18 16:11:10', NULL, '2025-01-18 16:11:10', b'0');
INSERT INTO `sys_job_log` VALUES (319, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:11:20', '', NULL, '', '2025-01-18 16:11:20', NULL, '2025-01-18 16:11:20', b'0');
INSERT INTO `sys_job_log` VALUES (320, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:11:30', '', NULL, '', '2025-01-18 16:11:30', NULL, '2025-01-18 16:11:30', b'0');
INSERT INTO `sys_job_log` VALUES (321, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:11:40', '', NULL, '', '2025-01-18 16:11:40', NULL, '2025-01-18 16:11:40', b'0');
INSERT INTO `sys_job_log` VALUES (322, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:11:50', '', NULL, '', '2025-01-18 16:11:50', NULL, '2025-01-18 16:11:50', b'0');
INSERT INTO `sys_job_log` VALUES (323, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:12:00', '', NULL, '', '2025-01-18 16:12:00', NULL, '2025-01-18 16:12:00', b'0');
INSERT INTO `sys_job_log` VALUES (324, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:12:10', '', NULL, '', '2025-01-18 16:12:10', NULL, '2025-01-18 16:12:10', b'0');
INSERT INTO `sys_job_log` VALUES (325, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:12:20', '', NULL, '', '2025-01-18 16:12:20', NULL, '2025-01-18 16:12:20', b'0');
INSERT INTO `sys_job_log` VALUES (326, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:12:30', '', NULL, '', '2025-01-18 16:12:30', NULL, '2025-01-18 16:12:30', b'0');
INSERT INTO `sys_job_log` VALUES (327, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:12:40', '', NULL, '', '2025-01-18 16:12:40', NULL, '2025-01-18 16:12:40', b'0');
INSERT INTO `sys_job_log` VALUES (328, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:12:50', '', NULL, '', '2025-01-18 16:12:50', NULL, '2025-01-18 16:12:50', b'0');
INSERT INTO `sys_job_log` VALUES (329, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:13:00', '', NULL, '', '2025-01-18 16:13:00', NULL, '2025-01-18 16:13:00', b'0');
INSERT INTO `sys_job_log` VALUES (330, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:13:10', '', NULL, '', '2025-01-18 16:13:10', NULL, '2025-01-18 16:13:10', b'0');
INSERT INTO `sys_job_log` VALUES (331, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:13:20', '', NULL, '', '2025-01-18 16:13:20', NULL, '2025-01-18 16:13:20', b'0');
INSERT INTO `sys_job_log` VALUES (332, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:13:30', '', NULL, '', '2025-01-18 16:13:30', NULL, '2025-01-18 16:13:30', b'0');
INSERT INTO `sys_job_log` VALUES (333, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:13:40', '', NULL, '', '2025-01-18 16:13:40', NULL, '2025-01-18 16:13:40', b'0');
INSERT INTO `sys_job_log` VALUES (334, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:13:50', '', NULL, '', '2025-01-18 16:13:50', NULL, '2025-01-18 16:13:50', b'0');
INSERT INTO `sys_job_log` VALUES (335, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-18 16:14:00', '', NULL, '', '2025-01-18 16:14:00', NULL, '2025-01-18 16:14:00', b'0');
INSERT INTO `sys_job_log` VALUES (336, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:14:10', '', NULL, '', '2025-01-18 16:14:10', NULL, '2025-01-18 16:14:10', b'0');
INSERT INTO `sys_job_log` VALUES (337, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:14:20', '', NULL, '', '2025-01-18 16:14:20', NULL, '2025-01-18 16:14:20', b'0');
INSERT INTO `sys_job_log` VALUES (338, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:14:30', '', NULL, '', '2025-01-18 16:14:30', NULL, '2025-01-18 16:14:30', b'0');
INSERT INTO `sys_job_log` VALUES (339, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:14:40', '', NULL, '', '2025-01-18 16:14:40', NULL, '2025-01-18 16:14:40', b'0');
INSERT INTO `sys_job_log` VALUES (340, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:14:50', '', NULL, '', '2025-01-18 16:14:50', NULL, '2025-01-18 16:14:50', b'0');
INSERT INTO `sys_job_log` VALUES (341, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:15:00', '', NULL, '', '2025-01-18 16:15:00', NULL, '2025-01-18 16:15:00', b'0');
INSERT INTO `sys_job_log` VALUES (342, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:15:10', '', NULL, '', '2025-01-18 16:15:10', NULL, '2025-01-18 16:15:10', b'0');
INSERT INTO `sys_job_log` VALUES (343, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:15:20', '', NULL, '', '2025-01-18 16:15:20', NULL, '2025-01-18 16:15:20', b'0');
INSERT INTO `sys_job_log` VALUES (344, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:15:30', '', NULL, '', '2025-01-18 16:15:30', NULL, '2025-01-18 16:15:30', b'0');
INSERT INTO `sys_job_log` VALUES (345, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:15:40', '', NULL, '', '2025-01-18 16:15:40', NULL, '2025-01-18 16:15:40', b'0');
INSERT INTO `sys_job_log` VALUES (346, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:15:50', '', NULL, '', '2025-01-18 16:15:50', NULL, '2025-01-18 16:15:50', b'0');
INSERT INTO `sys_job_log` VALUES (347, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:16:00', '', NULL, '', '2025-01-18 16:16:00', NULL, '2025-01-18 16:16:00', b'0');
INSERT INTO `sys_job_log` VALUES (348, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:16:10', '', NULL, '', '2025-01-18 16:16:10', NULL, '2025-01-18 16:16:10', b'0');
INSERT INTO `sys_job_log` VALUES (349, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:16:20', '', NULL, '', '2025-01-18 16:16:20', NULL, '2025-01-18 16:16:20', b'0');
INSERT INTO `sys_job_log` VALUES (350, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:16:30', '', NULL, '', '2025-01-18 16:16:30', NULL, '2025-01-18 16:16:30', b'0');
INSERT INTO `sys_job_log` VALUES (351, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:16:40', '', NULL, '', '2025-01-18 16:16:40', NULL, '2025-01-18 16:16:40', b'0');
INSERT INTO `sys_job_log` VALUES (352, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:16:50', '', NULL, '', '2025-01-18 16:16:50', NULL, '2025-01-18 16:16:50', b'0');
INSERT INTO `sys_job_log` VALUES (353, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:17:00', '', NULL, '', '2025-01-18 16:17:00', NULL, '2025-01-18 16:17:00', b'0');
INSERT INTO `sys_job_log` VALUES (354, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:17:10', '', NULL, '', '2025-01-18 16:17:10', NULL, '2025-01-18 16:17:10', b'0');
INSERT INTO `sys_job_log` VALUES (355, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:17:20', '', NULL, '', '2025-01-18 16:17:20', NULL, '2025-01-18 16:17:20', b'0');
INSERT INTO `sys_job_log` VALUES (356, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:17:30', '', NULL, '', '2025-01-18 16:17:30', NULL, '2025-01-18 16:17:30', b'0');
INSERT INTO `sys_job_log` VALUES (357, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:17:40', '', NULL, '', '2025-01-18 16:17:40', NULL, '2025-01-18 16:17:40', b'0');
INSERT INTO `sys_job_log` VALUES (358, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:17:50', '', NULL, '', '2025-01-18 16:17:50', NULL, '2025-01-18 16:17:50', b'0');
INSERT INTO `sys_job_log` VALUES (359, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:18:00', '', NULL, '', '2025-01-18 16:18:00', NULL, '2025-01-18 16:18:00', b'0');
INSERT INTO `sys_job_log` VALUES (360, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:18:10', '', NULL, '', '2025-01-18 16:18:10', NULL, '2025-01-18 16:18:10', b'0');
INSERT INTO `sys_job_log` VALUES (361, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:18:20', '', NULL, '', '2025-01-18 16:18:20', NULL, '2025-01-18 16:18:20', b'0');
INSERT INTO `sys_job_log` VALUES (362, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:18:30', '', NULL, '', '2025-01-18 16:18:30', NULL, '2025-01-18 16:18:30', b'0');
INSERT INTO `sys_job_log` VALUES (363, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:18:40', '', NULL, '', '2025-01-18 16:18:40', NULL, '2025-01-18 16:18:40', b'0');
INSERT INTO `sys_job_log` VALUES (364, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:18:50', '', NULL, '', '2025-01-18 16:18:50', NULL, '2025-01-18 16:18:50', b'0');
INSERT INTO `sys_job_log` VALUES (365, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:19:00', '', NULL, '', '2025-01-18 16:19:00', NULL, '2025-01-18 16:19:00', b'0');
INSERT INTO `sys_job_log` VALUES (366, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:19:10', '', NULL, '', '2025-01-18 16:19:10', NULL, '2025-01-18 16:19:10', b'0');
INSERT INTO `sys_job_log` VALUES (367, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:19:20', '', NULL, '', '2025-01-18 16:19:20', NULL, '2025-01-18 16:19:20', b'0');
INSERT INTO `sys_job_log` VALUES (368, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:19:30', '', NULL, '', '2025-01-18 16:19:30', NULL, '2025-01-18 16:19:30', b'0');
INSERT INTO `sys_job_log` VALUES (369, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:19:40', '', NULL, '', '2025-01-18 16:19:40', NULL, '2025-01-18 16:19:40', b'0');
INSERT INTO `sys_job_log` VALUES (370, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:19:50', '', NULL, '', '2025-01-18 16:19:50', NULL, '2025-01-18 16:19:50', b'0');
INSERT INTO `sys_job_log` VALUES (371, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:20:00', '', NULL, '', '2025-01-18 16:20:00', NULL, '2025-01-18 16:20:00', b'0');
INSERT INTO `sys_job_log` VALUES (372, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:20:10', '', NULL, '', '2025-01-18 16:20:10', NULL, '2025-01-18 16:20:10', b'0');
INSERT INTO `sys_job_log` VALUES (373, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:20:20', '', NULL, '', '2025-01-18 16:20:20', NULL, '2025-01-18 16:20:20', b'0');
INSERT INTO `sys_job_log` VALUES (374, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:20:30', '', NULL, '', '2025-01-18 16:20:30', NULL, '2025-01-18 16:20:30', b'0');
INSERT INTO `sys_job_log` VALUES (375, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:20:40', '', NULL, '', '2025-01-18 16:20:40', NULL, '2025-01-18 16:20:40', b'0');
INSERT INTO `sys_job_log` VALUES (376, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:20:50', '', NULL, '', '2025-01-18 16:20:50', NULL, '2025-01-18 16:20:50', b'0');
INSERT INTO `sys_job_log` VALUES (377, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:21:00', '', NULL, '', '2025-01-18 16:21:00', NULL, '2025-01-18 16:21:00', b'0');
INSERT INTO `sys_job_log` VALUES (378, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:21:10', '', NULL, '', '2025-01-18 16:21:10', NULL, '2025-01-18 16:21:10', b'0');
INSERT INTO `sys_job_log` VALUES (379, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:21:20', '', NULL, '', '2025-01-18 16:21:20', NULL, '2025-01-18 16:21:20', b'0');
INSERT INTO `sys_job_log` VALUES (380, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:21:30', '', NULL, '', '2025-01-18 16:21:30', NULL, '2025-01-18 16:21:30', b'0');
INSERT INTO `sys_job_log` VALUES (381, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:21:40', '', NULL, '', '2025-01-18 16:21:40', NULL, '2025-01-18 16:21:40', b'0');
INSERT INTO `sys_job_log` VALUES (382, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:21:50', '', NULL, '', '2025-01-18 16:21:50', NULL, '2025-01-18 16:21:50', b'0');
INSERT INTO `sys_job_log` VALUES (383, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:22:00', '', NULL, '', '2025-01-18 16:22:00', NULL, '2025-01-18 16:22:00', b'0');
INSERT INTO `sys_job_log` VALUES (384, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:22:10', '', NULL, '', '2025-01-18 16:22:10', NULL, '2025-01-18 16:22:10', b'0');
INSERT INTO `sys_job_log` VALUES (385, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:22:20', '', NULL, '', '2025-01-18 16:22:20', NULL, '2025-01-18 16:22:20', b'0');
INSERT INTO `sys_job_log` VALUES (386, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:22:30', '', NULL, '', '2025-01-18 16:22:30', NULL, '2025-01-18 16:22:30', b'0');
INSERT INTO `sys_job_log` VALUES (387, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:22:40', '', NULL, '', '2025-01-18 16:22:40', NULL, '2025-01-18 16:22:40', b'0');
INSERT INTO `sys_job_log` VALUES (388, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:22:50', '', NULL, '', '2025-01-18 16:22:50', NULL, '2025-01-18 16:22:50', b'0');
INSERT INTO `sys_job_log` VALUES (389, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:23:00', '', NULL, '', '2025-01-18 16:23:00', NULL, '2025-01-18 16:23:00', b'0');
INSERT INTO `sys_job_log` VALUES (390, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:23:10', '', NULL, '', '2025-01-18 16:23:10', NULL, '2025-01-18 16:23:10', b'0');
INSERT INTO `sys_job_log` VALUES (391, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:23:20', '', NULL, '', '2025-01-18 16:23:20', NULL, '2025-01-18 16:23:20', b'0');
INSERT INTO `sys_job_log` VALUES (392, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:23:30', '', NULL, '', '2025-01-18 16:23:30', NULL, '2025-01-18 16:23:30', b'0');
INSERT INTO `sys_job_log` VALUES (393, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:23:40', '', NULL, '', '2025-01-18 16:23:40', NULL, '2025-01-18 16:23:40', b'0');
INSERT INTO `sys_job_log` VALUES (394, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:23:50', '', NULL, '', '2025-01-18 16:23:50', NULL, '2025-01-18 16:23:50', b'0');
INSERT INTO `sys_job_log` VALUES (395, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:24:00', '', NULL, '', '2025-01-18 16:24:00', NULL, '2025-01-18 16:24:00', b'0');
INSERT INTO `sys_job_log` VALUES (396, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:24:10', '', NULL, '', '2025-01-18 16:24:10', NULL, '2025-01-18 16:24:10', b'0');
INSERT INTO `sys_job_log` VALUES (397, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:24:20', '', NULL, '', '2025-01-18 16:24:20', NULL, '2025-01-18 16:24:20', b'0');
INSERT INTO `sys_job_log` VALUES (398, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:24:30', '', NULL, '', '2025-01-18 16:24:30', NULL, '2025-01-18 16:24:30', b'0');
INSERT INTO `sys_job_log` VALUES (399, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:24:40', '', NULL, '', '2025-01-18 16:24:40', NULL, '2025-01-18 16:24:40', b'0');
INSERT INTO `sys_job_log` VALUES (400, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:24:50', '', NULL, '', '2025-01-18 16:24:50', NULL, '2025-01-18 16:24:50', b'0');
INSERT INTO `sys_job_log` VALUES (401, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:25:00', '', NULL, '', '2025-01-18 16:25:00', NULL, '2025-01-18 16:25:00', b'0');
INSERT INTO `sys_job_log` VALUES (402, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:25:10', '', NULL, '', '2025-01-18 16:25:10', NULL, '2025-01-18 16:25:10', b'0');
INSERT INTO `sys_job_log` VALUES (403, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:25:20', '', NULL, '', '2025-01-18 16:25:20', NULL, '2025-01-18 16:25:20', b'0');
INSERT INTO `sys_job_log` VALUES (404, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:25:30', '', NULL, '', '2025-01-18 16:25:30', NULL, '2025-01-18 16:25:30', b'0');
INSERT INTO `sys_job_log` VALUES (405, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:25:40', '', NULL, '', '2025-01-18 16:25:40', NULL, '2025-01-18 16:25:40', b'0');
INSERT INTO `sys_job_log` VALUES (406, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:25:50', '', NULL, '', '2025-01-18 16:25:50', NULL, '2025-01-18 16:25:50', b'0');
INSERT INTO `sys_job_log` VALUES (407, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:26:00', '', NULL, '', '2025-01-18 16:26:00', NULL, '2025-01-18 16:26:00', b'0');
INSERT INTO `sys_job_log` VALUES (408, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:26:10', '', NULL, '', '2025-01-18 16:26:10', NULL, '2025-01-18 16:26:10', b'0');
INSERT INTO `sys_job_log` VALUES (409, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:26:20', '', NULL, '', '2025-01-18 16:26:20', NULL, '2025-01-18 16:26:20', b'0');
INSERT INTO `sys_job_log` VALUES (410, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:26:30', '', NULL, '', '2025-01-18 16:26:30', NULL, '2025-01-18 16:26:30', b'0');
INSERT INTO `sys_job_log` VALUES (411, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:26:40', '', NULL, '', '2025-01-18 16:26:40', NULL, '2025-01-18 16:26:40', b'0');
INSERT INTO `sys_job_log` VALUES (412, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:26:50', '', NULL, '', '2025-01-18 16:26:50', NULL, '2025-01-18 16:26:50', b'0');
INSERT INTO `sys_job_log` VALUES (413, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:27:00', '', NULL, '', '2025-01-18 16:27:00', NULL, '2025-01-18 16:27:00', b'0');
INSERT INTO `sys_job_log` VALUES (414, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:27:10', '', NULL, '', '2025-01-18 16:27:10', NULL, '2025-01-18 16:27:10', b'0');
INSERT INTO `sys_job_log` VALUES (415, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:27:20', '', NULL, '', '2025-01-18 16:27:20', NULL, '2025-01-18 16:27:20', b'0');
INSERT INTO `sys_job_log` VALUES (416, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:27:30', '', NULL, '', '2025-01-18 16:27:30', NULL, '2025-01-18 16:27:30', b'0');
INSERT INTO `sys_job_log` VALUES (417, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:27:40', '', NULL, '', '2025-01-18 16:27:40', NULL, '2025-01-18 16:27:40', b'0');
INSERT INTO `sys_job_log` VALUES (418, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:27:50', '', NULL, '', '2025-01-18 16:27:50', NULL, '2025-01-18 16:27:50', b'0');
INSERT INTO `sys_job_log` VALUES (419, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:28:00', '', NULL, '', '2025-01-18 16:28:00', NULL, '2025-01-18 16:28:00', b'0');
INSERT INTO `sys_job_log` VALUES (420, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:28:10', '', NULL, '', '2025-01-18 16:28:10', NULL, '2025-01-18 16:28:10', b'0');
INSERT INTO `sys_job_log` VALUES (421, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:28:20', '', NULL, '', '2025-01-18 16:28:20', NULL, '2025-01-18 16:28:20', b'0');
INSERT INTO `sys_job_log` VALUES (422, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:28:30', '', NULL, '', '2025-01-18 16:28:30', NULL, '2025-01-18 16:28:30', b'0');
INSERT INTO `sys_job_log` VALUES (423, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:28:40', '', NULL, '', '2025-01-18 16:28:40', NULL, '2025-01-18 16:28:40', b'0');
INSERT INTO `sys_job_log` VALUES (424, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:28:50', '', NULL, '', '2025-01-18 16:28:50', NULL, '2025-01-18 16:28:50', b'0');
INSERT INTO `sys_job_log` VALUES (425, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:29:00', '', NULL, '', '2025-01-18 16:29:00', NULL, '2025-01-18 16:29:00', b'0');
INSERT INTO `sys_job_log` VALUES (426, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:29:10', '', NULL, '', '2025-01-18 16:29:10', NULL, '2025-01-18 16:29:10', b'0');
INSERT INTO `sys_job_log` VALUES (427, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:29:20', '', NULL, '', '2025-01-18 16:29:20', NULL, '2025-01-18 16:29:20', b'0');
INSERT INTO `sys_job_log` VALUES (428, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:29:30', '', NULL, '', '2025-01-18 16:29:30', NULL, '2025-01-18 16:29:30', b'0');
INSERT INTO `sys_job_log` VALUES (429, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:29:40', '', NULL, '', '2025-01-18 16:29:40', NULL, '2025-01-18 16:29:40', b'0');
INSERT INTO `sys_job_log` VALUES (430, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:29:50', '', NULL, '', '2025-01-18 16:29:50', NULL, '2025-01-18 16:29:50', b'0');
INSERT INTO `sys_job_log` VALUES (431, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:30:00', '', NULL, '', '2025-01-18 16:30:00', NULL, '2025-01-18 16:30:00', b'0');
INSERT INTO `sys_job_log` VALUES (432, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:30:10', '', NULL, '', '2025-01-18 16:30:10', NULL, '2025-01-18 16:30:10', b'0');
INSERT INTO `sys_job_log` VALUES (433, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:30:20', '', NULL, '', '2025-01-18 16:30:20', NULL, '2025-01-18 16:30:20', b'0');
INSERT INTO `sys_job_log` VALUES (434, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:30:30', '', NULL, '', '2025-01-18 16:30:30', NULL, '2025-01-18 16:30:30', b'0');
INSERT INTO `sys_job_log` VALUES (435, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:30:40', '', NULL, '', '2025-01-18 16:30:40', NULL, '2025-01-18 16:30:40', b'0');
INSERT INTO `sys_job_log` VALUES (436, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:30:50', '', NULL, '', '2025-01-18 16:30:50', NULL, '2025-01-18 16:30:50', b'0');
INSERT INTO `sys_job_log` VALUES (437, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:31:00', '', NULL, '', '2025-01-18 16:31:00', NULL, '2025-01-18 16:31:00', b'0');
INSERT INTO `sys_job_log` VALUES (438, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:31:10', '', NULL, '', '2025-01-18 16:31:10', NULL, '2025-01-18 16:31:10', b'0');
INSERT INTO `sys_job_log` VALUES (439, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 16:31:20', '', NULL, '', '2025-01-18 16:31:20', NULL, '2025-01-18 16:31:20', b'0');
INSERT INTO `sys_job_log` VALUES (440, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:31:30', '', NULL, '', '2025-01-18 16:31:30', NULL, '2025-01-18 16:31:30', b'0');
INSERT INTO `sys_job_log` VALUES (441, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:31:40', '', NULL, '', '2025-01-18 16:31:40', NULL, '2025-01-18 16:31:40', b'0');
INSERT INTO `sys_job_log` VALUES (442, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:31:50', '', NULL, '', '2025-01-18 16:31:50', NULL, '2025-01-18 16:31:50', b'0');
INSERT INTO `sys_job_log` VALUES (443, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:32:00', '', NULL, '', '2025-01-18 16:32:00', NULL, '2025-01-18 16:32:00', b'0');
INSERT INTO `sys_job_log` VALUES (444, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:32:10', '', NULL, '', '2025-01-18 16:32:10', NULL, '2025-01-18 16:32:10', b'0');
INSERT INTO `sys_job_log` VALUES (445, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:32:20', '', NULL, '', '2025-01-18 16:32:20', NULL, '2025-01-18 16:32:20', b'0');
INSERT INTO `sys_job_log` VALUES (446, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:32:30', '', NULL, '', '2025-01-18 16:32:30', NULL, '2025-01-18 16:32:30', b'0');
INSERT INTO `sys_job_log` VALUES (447, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:32:40', '', NULL, '', '2025-01-18 16:32:40', NULL, '2025-01-18 16:32:40', b'0');
INSERT INTO `sys_job_log` VALUES (448, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:32:50', '', NULL, '', '2025-01-18 16:32:50', NULL, '2025-01-18 16:32:50', b'0');
INSERT INTO `sys_job_log` VALUES (449, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:33:00', '', NULL, '', '2025-01-18 16:33:00', NULL, '2025-01-18 16:33:00', b'0');
INSERT INTO `sys_job_log` VALUES (450, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:33:10', '', NULL, '', '2025-01-18 16:33:10', NULL, '2025-01-18 16:33:10', b'0');
INSERT INTO `sys_job_log` VALUES (451, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:33:20', '', NULL, '', '2025-01-18 16:33:20', NULL, '2025-01-18 16:33:20', b'0');
INSERT INTO `sys_job_log` VALUES (452, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:33:30', '', NULL, '', '2025-01-18 16:33:30', NULL, '2025-01-18 16:33:30', b'0');
INSERT INTO `sys_job_log` VALUES (453, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:33:40', '', NULL, '', '2025-01-18 16:33:40', NULL, '2025-01-18 16:33:40', b'0');
INSERT INTO `sys_job_log` VALUES (454, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:33:50', '', NULL, '', '2025-01-18 16:33:50', NULL, '2025-01-18 16:33:50', b'0');
INSERT INTO `sys_job_log` VALUES (455, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:34:00', '', NULL, '', '2025-01-18 16:34:00', NULL, '2025-01-18 16:34:00', b'0');
INSERT INTO `sys_job_log` VALUES (456, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:34:10', '', NULL, '', '2025-01-18 16:34:10', NULL, '2025-01-18 16:34:10', b'0');
INSERT INTO `sys_job_log` VALUES (457, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:34:20', '', NULL, '', '2025-01-18 16:34:20', NULL, '2025-01-18 16:34:20', b'0');
INSERT INTO `sys_job_log` VALUES (458, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:34:30', '', NULL, '', '2025-01-18 16:34:30', NULL, '2025-01-18 16:34:30', b'0');
INSERT INTO `sys_job_log` VALUES (459, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:34:40', '', NULL, '', '2025-01-18 16:34:40', NULL, '2025-01-18 16:34:40', b'0');
INSERT INTO `sys_job_log` VALUES (460, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:34:50', '', NULL, '', '2025-01-18 16:34:50', NULL, '2025-01-18 16:34:50', b'0');
INSERT INTO `sys_job_log` VALUES (461, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:35:00', '', NULL, '', '2025-01-18 16:35:00', NULL, '2025-01-18 16:35:00', b'0');
INSERT INTO `sys_job_log` VALUES (462, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:35:10', '', NULL, '', '2025-01-18 16:35:10', NULL, '2025-01-18 16:35:10', b'0');
INSERT INTO `sys_job_log` VALUES (463, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:35:20', '', NULL, '', '2025-01-18 16:35:20', NULL, '2025-01-18 16:35:20', b'0');
INSERT INTO `sys_job_log` VALUES (464, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:35:30', '', NULL, '', '2025-01-18 16:35:30', NULL, '2025-01-18 16:35:30', b'0');
INSERT INTO `sys_job_log` VALUES (465, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:35:40', '', NULL, '', '2025-01-18 16:35:40', NULL, '2025-01-18 16:35:40', b'0');
INSERT INTO `sys_job_log` VALUES (466, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:35:50', '', NULL, '', '2025-01-18 16:35:50', NULL, '2025-01-18 16:35:50', b'0');
INSERT INTO `sys_job_log` VALUES (467, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:36:00', '', NULL, '', '2025-01-18 16:36:00', NULL, '2025-01-18 16:36:00', b'0');
INSERT INTO `sys_job_log` VALUES (468, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:36:10', '', NULL, '', '2025-01-18 16:36:10', NULL, '2025-01-18 16:36:10', b'0');
INSERT INTO `sys_job_log` VALUES (469, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:36:20', '', NULL, '', '2025-01-18 16:36:20', NULL, '2025-01-18 16:36:20', b'0');
INSERT INTO `sys_job_log` VALUES (470, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:36:30', '', NULL, '', '2025-01-18 16:36:30', NULL, '2025-01-18 16:36:30', b'0');
INSERT INTO `sys_job_log` VALUES (471, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:36:40', '', NULL, '', '2025-01-18 16:36:40', NULL, '2025-01-18 16:36:40', b'0');
INSERT INTO `sys_job_log` VALUES (472, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:36:50', '', NULL, '', '2025-01-18 16:36:50', NULL, '2025-01-18 16:36:50', b'0');
INSERT INTO `sys_job_log` VALUES (473, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:37:00', '', NULL, '', '2025-01-18 16:37:00', NULL, '2025-01-18 16:37:00', b'0');
INSERT INTO `sys_job_log` VALUES (474, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:37:10', '', NULL, '', '2025-01-18 16:37:10', NULL, '2025-01-18 16:37:10', b'0');
INSERT INTO `sys_job_log` VALUES (475, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:37:20', '', NULL, '', '2025-01-18 16:37:20', NULL, '2025-01-18 16:37:20', b'0');
INSERT INTO `sys_job_log` VALUES (476, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:37:30', '', NULL, '', '2025-01-18 16:37:30', NULL, '2025-01-18 16:37:30', b'0');
INSERT INTO `sys_job_log` VALUES (477, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:37:40', '', NULL, '', '2025-01-18 16:37:40', NULL, '2025-01-18 16:37:40', b'0');
INSERT INTO `sys_job_log` VALUES (478, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:37:50', '', NULL, '', '2025-01-18 16:37:50', NULL, '2025-01-18 16:37:50', b'0');
INSERT INTO `sys_job_log` VALUES (479, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:38:00', '', NULL, '', '2025-01-18 16:38:00', NULL, '2025-01-18 16:38:00', b'0');
INSERT INTO `sys_job_log` VALUES (480, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:38:10', '', NULL, '', '2025-01-18 16:38:10', NULL, '2025-01-18 16:38:10', b'0');
INSERT INTO `sys_job_log` VALUES (481, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:38:20', '', NULL, '', '2025-01-18 16:38:20', NULL, '2025-01-18 16:38:20', b'0');
INSERT INTO `sys_job_log` VALUES (482, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:38:30', '', NULL, '', '2025-01-18 16:38:30', NULL, '2025-01-18 16:38:30', b'0');
INSERT INTO `sys_job_log` VALUES (483, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:38:40', '', NULL, '', '2025-01-18 16:38:40', NULL, '2025-01-18 16:38:40', b'0');
INSERT INTO `sys_job_log` VALUES (484, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:38:50', '', NULL, '', '2025-01-18 16:38:50', NULL, '2025-01-18 16:38:50', b'0');
INSERT INTO `sys_job_log` VALUES (485, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:39:00', '', NULL, '', '2025-01-18 16:39:00', NULL, '2025-01-18 16:39:00', b'0');
INSERT INTO `sys_job_log` VALUES (486, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:39:10', '', NULL, '', '2025-01-18 16:39:10', NULL, '2025-01-18 16:39:10', b'0');
INSERT INTO `sys_job_log` VALUES (487, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:39:20', '', NULL, '', '2025-01-18 16:39:20', NULL, '2025-01-18 16:39:20', b'0');
INSERT INTO `sys_job_log` VALUES (488, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:39:30', '', NULL, '', '2025-01-18 16:39:30', NULL, '2025-01-18 16:39:30', b'0');
INSERT INTO `sys_job_log` VALUES (489, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:39:40', '', NULL, '', '2025-01-18 16:39:40', NULL, '2025-01-18 16:39:40', b'0');
INSERT INTO `sys_job_log` VALUES (490, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:39:50', '', NULL, '', '2025-01-18 16:39:50', NULL, '2025-01-18 16:39:50', b'0');
INSERT INTO `sys_job_log` VALUES (491, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:40:00', '', NULL, '', '2025-01-18 16:40:00', NULL, '2025-01-18 16:40:00', b'0');
INSERT INTO `sys_job_log` VALUES (492, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:40:10', '', NULL, '', '2025-01-18 16:40:10', NULL, '2025-01-18 16:40:10', b'0');
INSERT INTO `sys_job_log` VALUES (493, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:40:20', '', NULL, '', '2025-01-18 16:40:20', NULL, '2025-01-18 16:40:20', b'0');
INSERT INTO `sys_job_log` VALUES (494, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:40:30', '', NULL, '', '2025-01-18 16:40:30', NULL, '2025-01-18 16:40:30', b'0');
INSERT INTO `sys_job_log` VALUES (495, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:40:40', '', NULL, '', '2025-01-18 16:40:40', NULL, '2025-01-18 16:40:40', b'0');
INSERT INTO `sys_job_log` VALUES (496, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:40:50', '', NULL, '', '2025-01-18 16:40:50', NULL, '2025-01-18 16:40:50', b'0');
INSERT INTO `sys_job_log` VALUES (497, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:41:00', '', NULL, '', '2025-01-18 16:41:00', NULL, '2025-01-18 16:41:00', b'0');
INSERT INTO `sys_job_log` VALUES (498, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:41:10', '', NULL, '', '2025-01-18 16:41:10', NULL, '2025-01-18 16:41:10', b'0');
INSERT INTO `sys_job_log` VALUES (499, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:41:20', '', NULL, '', '2025-01-18 16:41:20', NULL, '2025-01-18 16:41:20', b'0');
INSERT INTO `sys_job_log` VALUES (500, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:41:30', '', NULL, '', '2025-01-18 16:41:30', NULL, '2025-01-18 16:41:30', b'0');
INSERT INTO `sys_job_log` VALUES (501, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:41:40', '', NULL, '', '2025-01-18 16:41:40', NULL, '2025-01-18 16:41:40', b'0');
INSERT INTO `sys_job_log` VALUES (502, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:41:50', '', NULL, '', '2025-01-18 16:41:50', NULL, '2025-01-18 16:41:50', b'0');
INSERT INTO `sys_job_log` VALUES (503, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:42:00', '', NULL, '', '2025-01-18 16:42:00', NULL, '2025-01-18 16:42:00', b'0');
INSERT INTO `sys_job_log` VALUES (504, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:42:10', '', NULL, '', '2025-01-18 16:42:10', NULL, '2025-01-18 16:42:10', b'0');
INSERT INTO `sys_job_log` VALUES (505, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:42:20', '', NULL, '', '2025-01-18 16:42:20', NULL, '2025-01-18 16:42:20', b'0');
INSERT INTO `sys_job_log` VALUES (506, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:42:30', '', NULL, '', '2025-01-18 16:42:30', NULL, '2025-01-18 16:42:30', b'0');
INSERT INTO `sys_job_log` VALUES (507, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:42:40', '', NULL, '', '2025-01-18 16:42:40', NULL, '2025-01-18 16:42:40', b'0');
INSERT INTO `sys_job_log` VALUES (508, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:42:50', '', NULL, '', '2025-01-18 16:42:50', NULL, '2025-01-18 16:42:50', b'0');
INSERT INTO `sys_job_log` VALUES (509, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:43:00', '', NULL, '', '2025-01-18 16:43:00', NULL, '2025-01-18 16:43:00', b'0');
INSERT INTO `sys_job_log` VALUES (510, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:43:10', '', NULL, '', '2025-01-18 16:43:10', NULL, '2025-01-18 16:43:10', b'0');
INSERT INTO `sys_job_log` VALUES (511, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:43:20', '', NULL, '', '2025-01-18 16:43:20', NULL, '2025-01-18 16:43:20', b'0');
INSERT INTO `sys_job_log` VALUES (512, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:43:30', '', NULL, '', '2025-01-18 16:43:30', NULL, '2025-01-18 16:43:30', b'0');
INSERT INTO `sys_job_log` VALUES (513, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:43:40', '', NULL, '', '2025-01-18 16:43:40', NULL, '2025-01-18 16:43:40', b'0');
INSERT INTO `sys_job_log` VALUES (514, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:43:50', '', NULL, '', '2025-01-18 16:43:50', NULL, '2025-01-18 16:43:50', b'0');
INSERT INTO `sys_job_log` VALUES (515, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:44:00', '', NULL, '', '2025-01-18 16:44:00', NULL, '2025-01-18 16:44:00', b'0');
INSERT INTO `sys_job_log` VALUES (516, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:44:10', '', NULL, '', '2025-01-18 16:44:10', NULL, '2025-01-18 16:44:10', b'0');
INSERT INTO `sys_job_log` VALUES (517, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:44:20', '', NULL, '', '2025-01-18 16:44:20', NULL, '2025-01-18 16:44:20', b'0');
INSERT INTO `sys_job_log` VALUES (518, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:44:30', '', NULL, '', '2025-01-18 16:44:30', NULL, '2025-01-18 16:44:30', b'0');
INSERT INTO `sys_job_log` VALUES (519, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:44:40', '', NULL, '', '2025-01-18 16:44:40', NULL, '2025-01-18 16:44:40', b'0');
INSERT INTO `sys_job_log` VALUES (520, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:44:50', '', NULL, '', '2025-01-18 16:44:50', NULL, '2025-01-18 16:44:50', b'0');
INSERT INTO `sys_job_log` VALUES (521, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:45:00', '', NULL, '', '2025-01-18 16:45:00', NULL, '2025-01-18 16:45:00', b'0');
INSERT INTO `sys_job_log` VALUES (522, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:45:10', '', NULL, '', '2025-01-18 16:45:10', NULL, '2025-01-18 16:45:10', b'0');
INSERT INTO `sys_job_log` VALUES (523, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:45:20', '', NULL, '', '2025-01-18 16:45:20', NULL, '2025-01-18 16:45:20', b'0');
INSERT INTO `sys_job_log` VALUES (524, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:45:30', '', NULL, '', '2025-01-18 16:45:30', NULL, '2025-01-18 16:45:30', b'0');
INSERT INTO `sys_job_log` VALUES (525, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:45:40', '', NULL, '', '2025-01-18 16:45:40', NULL, '2025-01-18 16:45:40', b'0');
INSERT INTO `sys_job_log` VALUES (526, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:45:50', '', NULL, '', '2025-01-18 16:45:50', NULL, '2025-01-18 16:45:50', b'0');
INSERT INTO `sys_job_log` VALUES (527, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:46:00', '', NULL, '', '2025-01-18 16:46:00', NULL, '2025-01-18 16:46:00', b'0');
INSERT INTO `sys_job_log` VALUES (528, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:46:10', '', NULL, '', '2025-01-18 16:46:10', NULL, '2025-01-18 16:46:10', b'0');
INSERT INTO `sys_job_log` VALUES (529, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:46:20', '', NULL, '', '2025-01-18 16:46:20', NULL, '2025-01-18 16:46:20', b'0');
INSERT INTO `sys_job_log` VALUES (530, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:46:30', '', NULL, '', '2025-01-18 16:46:30', NULL, '2025-01-18 16:46:30', b'0');
INSERT INTO `sys_job_log` VALUES (531, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:46:40', '', NULL, '', '2025-01-18 16:46:40', NULL, '2025-01-18 16:46:40', b'0');
INSERT INTO `sys_job_log` VALUES (532, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:46:50', '', NULL, '', '2025-01-18 16:46:50', NULL, '2025-01-18 16:46:50', b'0');
INSERT INTO `sys_job_log` VALUES (533, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:47:00', '', NULL, '', '2025-01-18 16:47:00', NULL, '2025-01-18 16:47:00', b'0');
INSERT INTO `sys_job_log` VALUES (534, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:47:10', '', NULL, '', '2025-01-18 16:47:10', NULL, '2025-01-18 16:47:10', b'0');
INSERT INTO `sys_job_log` VALUES (535, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:47:20', '', NULL, '', '2025-01-18 16:47:20', NULL, '2025-01-18 16:47:20', b'0');
INSERT INTO `sys_job_log` VALUES (536, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:47:30', '', NULL, '', '2025-01-18 16:47:30', NULL, '2025-01-18 16:47:30', b'0');
INSERT INTO `sys_job_log` VALUES (537, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:47:40', '', NULL, '', '2025-01-18 16:47:40', NULL, '2025-01-18 16:47:40', b'0');
INSERT INTO `sys_job_log` VALUES (538, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:47:50', '', NULL, '', '2025-01-18 16:47:50', NULL, '2025-01-18 16:47:50', b'0');
INSERT INTO `sys_job_log` VALUES (539, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:48:00', '', NULL, '', '2025-01-18 16:48:00', NULL, '2025-01-18 16:48:00', b'0');
INSERT INTO `sys_job_log` VALUES (540, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 16:48:10', '', NULL, '', '2025-01-18 16:48:10', NULL, '2025-01-18 16:48:10', b'0');
INSERT INTO `sys_job_log` VALUES (541, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:48:20', '', NULL, '', '2025-01-18 16:48:20', NULL, '2025-01-18 16:48:20', b'0');
INSERT INTO `sys_job_log` VALUES (542, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:48:30', '', NULL, '', '2025-01-18 16:48:30', NULL, '2025-01-18 16:48:30', b'0');
INSERT INTO `sys_job_log` VALUES (543, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:48:40', '', NULL, '', '2025-01-18 16:48:40', NULL, '2025-01-18 16:48:40', b'0');
INSERT INTO `sys_job_log` VALUES (544, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:48:50', '', NULL, '', '2025-01-18 16:48:50', NULL, '2025-01-18 16:48:50', b'0');
INSERT INTO `sys_job_log` VALUES (545, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:49:00', '', NULL, '', '2025-01-18 16:49:00', NULL, '2025-01-18 16:49:00', b'0');
INSERT INTO `sys_job_log` VALUES (546, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:49:10', '', NULL, '', '2025-01-18 16:49:10', NULL, '2025-01-18 16:49:10', b'0');
INSERT INTO `sys_job_log` VALUES (547, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:49:20', '', NULL, '', '2025-01-18 16:49:20', NULL, '2025-01-18 16:49:20', b'0');
INSERT INTO `sys_job_log` VALUES (548, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：3毫秒', '0', '2025-01-18 16:49:30', '', NULL, '', '2025-01-18 16:49:30', NULL, '2025-01-18 16:49:30', b'0');
INSERT INTO `sys_job_log` VALUES (549, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:49:40', '', NULL, '', '2025-01-18 16:49:40', NULL, '2025-01-18 16:49:40', b'0');
INSERT INTO `sys_job_log` VALUES (550, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:49:50', '', NULL, '', '2025-01-18 16:49:50', NULL, '2025-01-18 16:49:50', b'0');
INSERT INTO `sys_job_log` VALUES (551, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:50:00', '', NULL, '', '2025-01-18 16:50:00', NULL, '2025-01-18 16:50:00', b'0');
INSERT INTO `sys_job_log` VALUES (552, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:50:10', '', NULL, '', '2025-01-18 16:50:10', NULL, '2025-01-18 16:50:10', b'0');
INSERT INTO `sys_job_log` VALUES (553, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:50:20', '', NULL, '', '2025-01-18 16:50:20', NULL, '2025-01-18 16:50:20', b'0');
INSERT INTO `sys_job_log` VALUES (554, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:50:30', '', NULL, '', '2025-01-18 16:50:30', NULL, '2025-01-18 16:50:30', b'0');
INSERT INTO `sys_job_log` VALUES (555, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:50:40', '', NULL, '', '2025-01-18 16:50:40', NULL, '2025-01-18 16:50:40', b'0');
INSERT INTO `sys_job_log` VALUES (556, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:50:50', '', NULL, '', '2025-01-18 16:50:50', NULL, '2025-01-18 16:50:50', b'0');
INSERT INTO `sys_job_log` VALUES (557, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:51:00', '', NULL, '', '2025-01-18 16:51:00', NULL, '2025-01-18 16:51:00', b'0');
INSERT INTO `sys_job_log` VALUES (558, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:51:10', '', NULL, '', '2025-01-18 16:51:10', NULL, '2025-01-18 16:51:10', b'0');
INSERT INTO `sys_job_log` VALUES (559, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:51:20', '', NULL, '', '2025-01-18 16:51:20', NULL, '2025-01-18 16:51:20', b'0');
INSERT INTO `sys_job_log` VALUES (560, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:51:30', '', NULL, '', '2025-01-18 16:51:30', NULL, '2025-01-18 16:51:30', b'0');
INSERT INTO `sys_job_log` VALUES (561, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:51:40', '', NULL, '', '2025-01-18 16:51:40', NULL, '2025-01-18 16:51:40', b'0');
INSERT INTO `sys_job_log` VALUES (562, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:51:50', '', NULL, '', '2025-01-18 16:51:50', NULL, '2025-01-18 16:51:50', b'0');
INSERT INTO `sys_job_log` VALUES (563, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:52:00', '', NULL, '', '2025-01-18 16:52:00', NULL, '2025-01-18 16:52:00', b'0');
INSERT INTO `sys_job_log` VALUES (564, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:52:10', '', NULL, '', '2025-01-18 16:52:10', NULL, '2025-01-18 16:52:10', b'0');
INSERT INTO `sys_job_log` VALUES (565, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:52:20', '', NULL, '', '2025-01-18 16:52:20', NULL, '2025-01-18 16:52:20', b'0');
INSERT INTO `sys_job_log` VALUES (566, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:52:30', '', NULL, '', '2025-01-18 16:52:30', NULL, '2025-01-18 16:52:30', b'0');
INSERT INTO `sys_job_log` VALUES (567, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:52:40', '', NULL, '', '2025-01-18 16:52:40', NULL, '2025-01-18 16:52:40', b'0');
INSERT INTO `sys_job_log` VALUES (568, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:52:50', '', NULL, '', '2025-01-18 16:52:50', NULL, '2025-01-18 16:52:50', b'0');
INSERT INTO `sys_job_log` VALUES (569, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:53:00', '', NULL, '', '2025-01-18 16:53:00', NULL, '2025-01-18 16:53:00', b'0');
INSERT INTO `sys_job_log` VALUES (570, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:53:10', '', NULL, '', '2025-01-18 16:53:10', NULL, '2025-01-18 16:53:10', b'0');
INSERT INTO `sys_job_log` VALUES (571, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:53:20', '', NULL, '', '2025-01-18 16:53:20', NULL, '2025-01-18 16:53:20', b'0');
INSERT INTO `sys_job_log` VALUES (572, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:53:30', '', NULL, '', '2025-01-18 16:53:30', NULL, '2025-01-18 16:53:30', b'0');
INSERT INTO `sys_job_log` VALUES (573, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:53:40', '', NULL, '', '2025-01-18 16:53:40', NULL, '2025-01-18 16:53:40', b'0');
INSERT INTO `sys_job_log` VALUES (574, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:53:50', '', NULL, '', '2025-01-18 16:53:50', NULL, '2025-01-18 16:53:50', b'0');
INSERT INTO `sys_job_log` VALUES (575, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:54:00', '', NULL, '', '2025-01-18 16:54:00', NULL, '2025-01-18 16:54:00', b'0');
INSERT INTO `sys_job_log` VALUES (576, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:54:10', '', NULL, '', '2025-01-18 16:54:10', NULL, '2025-01-18 16:54:10', b'0');
INSERT INTO `sys_job_log` VALUES (577, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:54:20', '', NULL, '', '2025-01-18 16:54:20', NULL, '2025-01-18 16:54:20', b'0');
INSERT INTO `sys_job_log` VALUES (578, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:54:30', '', NULL, '', '2025-01-18 16:54:30', NULL, '2025-01-18 16:54:30', b'0');
INSERT INTO `sys_job_log` VALUES (579, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:54:40', '', NULL, '', '2025-01-18 16:54:40', NULL, '2025-01-18 16:54:40', b'0');
INSERT INTO `sys_job_log` VALUES (580, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:54:50', '', NULL, '', '2025-01-18 16:54:50', NULL, '2025-01-18 16:54:50', b'0');
INSERT INTO `sys_job_log` VALUES (581, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:55:00', '', NULL, '', '2025-01-18 16:55:00', NULL, '2025-01-18 16:55:00', b'0');
INSERT INTO `sys_job_log` VALUES (582, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:55:10', '', NULL, '', '2025-01-18 16:55:10', NULL, '2025-01-18 16:55:10', b'0');
INSERT INTO `sys_job_log` VALUES (583, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:55:20', '', NULL, '', '2025-01-18 16:55:20', NULL, '2025-01-18 16:55:20', b'0');
INSERT INTO `sys_job_log` VALUES (584, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:55:30', '', NULL, '', '2025-01-18 16:55:30', NULL, '2025-01-18 16:55:30', b'0');
INSERT INTO `sys_job_log` VALUES (585, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:55:40', '', NULL, '', '2025-01-18 16:55:40', NULL, '2025-01-18 16:55:40', b'0');
INSERT INTO `sys_job_log` VALUES (586, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:55:50', '', NULL, '', '2025-01-18 16:55:50', NULL, '2025-01-18 16:55:50', b'0');
INSERT INTO `sys_job_log` VALUES (587, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:56:00', '', NULL, '', '2025-01-18 16:56:00', NULL, '2025-01-18 16:56:00', b'0');
INSERT INTO `sys_job_log` VALUES (588, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:56:10', '', NULL, '', '2025-01-18 16:56:10', NULL, '2025-01-18 16:56:10', b'0');
INSERT INTO `sys_job_log` VALUES (589, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:56:20', '', NULL, '', '2025-01-18 16:56:20', NULL, '2025-01-18 16:56:20', b'0');
INSERT INTO `sys_job_log` VALUES (590, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:56:30', '', NULL, '', '2025-01-18 16:56:30', NULL, '2025-01-18 16:56:30', b'0');
INSERT INTO `sys_job_log` VALUES (591, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:56:40', '', NULL, '', '2025-01-18 16:56:40', NULL, '2025-01-18 16:56:40', b'0');
INSERT INTO `sys_job_log` VALUES (592, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:56:50', '', NULL, '', '2025-01-18 16:56:50', NULL, '2025-01-18 16:56:50', b'0');
INSERT INTO `sys_job_log` VALUES (593, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:57:00', '', NULL, '', '2025-01-18 16:57:00', NULL, '2025-01-18 16:57:00', b'0');
INSERT INTO `sys_job_log` VALUES (594, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:57:10', '', NULL, '', '2025-01-18 16:57:10', NULL, '2025-01-18 16:57:10', b'0');
INSERT INTO `sys_job_log` VALUES (595, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:57:20', '', NULL, '', '2025-01-18 16:57:20', NULL, '2025-01-18 16:57:20', b'0');
INSERT INTO `sys_job_log` VALUES (596, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:57:30', '', NULL, '', '2025-01-18 16:57:30', NULL, '2025-01-18 16:57:30', b'0');
INSERT INTO `sys_job_log` VALUES (597, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:57:40', '', NULL, '', '2025-01-18 16:57:40', NULL, '2025-01-18 16:57:40', b'0');
INSERT INTO `sys_job_log` VALUES (598, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:57:50', '', NULL, '', '2025-01-18 16:57:50', NULL, '2025-01-18 16:57:50', b'0');
INSERT INTO `sys_job_log` VALUES (599, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:58:00', '', NULL, '', '2025-01-18 16:58:00', NULL, '2025-01-18 16:58:00', b'0');
INSERT INTO `sys_job_log` VALUES (600, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:58:10', '', NULL, '', '2025-01-18 16:58:10', NULL, '2025-01-18 16:58:10', b'0');
INSERT INTO `sys_job_log` VALUES (601, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:58:20', '', NULL, '', '2025-01-18 16:58:20', NULL, '2025-01-18 16:58:20', b'0');
INSERT INTO `sys_job_log` VALUES (602, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:58:30', '', NULL, '', '2025-01-18 16:58:30', NULL, '2025-01-18 16:58:30', b'0');
INSERT INTO `sys_job_log` VALUES (603, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:58:40', '', NULL, '', '2025-01-18 16:58:40', NULL, '2025-01-18 16:58:40', b'0');
INSERT INTO `sys_job_log` VALUES (604, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:58:50', '', NULL, '', '2025-01-18 16:58:50', NULL, '2025-01-18 16:58:50', b'0');
INSERT INTO `sys_job_log` VALUES (605, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:59:00', '', NULL, '', '2025-01-18 16:59:00', NULL, '2025-01-18 16:59:00', b'0');
INSERT INTO `sys_job_log` VALUES (606, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:59:10', '', NULL, '', '2025-01-18 16:59:10', NULL, '2025-01-18 16:59:10', b'0');
INSERT INTO `sys_job_log` VALUES (607, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:59:20', '', NULL, '', '2025-01-18 16:59:20', NULL, '2025-01-18 16:59:20', b'0');
INSERT INTO `sys_job_log` VALUES (608, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:59:30', '', NULL, '', '2025-01-18 16:59:30', NULL, '2025-01-18 16:59:30', b'0');
INSERT INTO `sys_job_log` VALUES (609, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:59:40', '', NULL, '', '2025-01-18 16:59:40', NULL, '2025-01-18 16:59:40', b'0');
INSERT INTO `sys_job_log` VALUES (610, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 16:59:50', '', NULL, '', '2025-01-18 16:59:50', NULL, '2025-01-18 16:59:50', b'0');
INSERT INTO `sys_job_log` VALUES (611, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:00:00', '', NULL, '', '2025-01-18 17:00:00', NULL, '2025-01-18 17:00:00', b'0');
INSERT INTO `sys_job_log` VALUES (612, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:00:10', '', NULL, '', '2025-01-18 17:00:10', NULL, '2025-01-18 17:00:10', b'0');
INSERT INTO `sys_job_log` VALUES (613, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:00:20', '', NULL, '', '2025-01-18 17:00:20', NULL, '2025-01-18 17:00:20', b'0');
INSERT INTO `sys_job_log` VALUES (614, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:00:30', '', NULL, '', '2025-01-18 17:00:30', NULL, '2025-01-18 17:00:30', b'0');
INSERT INTO `sys_job_log` VALUES (615, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:00:40', '', NULL, '', '2025-01-18 17:00:40', NULL, '2025-01-18 17:00:40', b'0');
INSERT INTO `sys_job_log` VALUES (616, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:00:50', '', NULL, '', '2025-01-18 17:00:50', NULL, '2025-01-18 17:00:50', b'0');
INSERT INTO `sys_job_log` VALUES (617, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:01:00', '', NULL, '', '2025-01-18 17:01:00', NULL, '2025-01-18 17:01:00', b'0');
INSERT INTO `sys_job_log` VALUES (618, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:01:06', '', NULL, '', '2025-01-18 17:01:06', NULL, '2025-01-18 17:01:06', b'0');
INSERT INTO `sys_job_log` VALUES (619, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:01:10', '', NULL, '', '2025-01-18 17:01:10', NULL, '2025-01-18 17:01:10', b'0');
INSERT INTO `sys_job_log` VALUES (620, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:01:20', '', NULL, '', '2025-01-18 17:01:20', NULL, '2025-01-18 17:01:20', b'0');
INSERT INTO `sys_job_log` VALUES (621, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:01:30', '', NULL, '', '2025-01-18 17:01:30', NULL, '2025-01-18 17:01:30', b'0');
INSERT INTO `sys_job_log` VALUES (622, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:01:40', '', NULL, '', '2025-01-18 17:01:40', NULL, '2025-01-18 17:01:40', b'0');
INSERT INTO `sys_job_log` VALUES (623, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:01:50', '', NULL, '', '2025-01-18 17:01:50', NULL, '2025-01-18 17:01:50', b'0');
INSERT INTO `sys_job_log` VALUES (624, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:02:00', '', NULL, '', '2025-01-18 17:02:00', NULL, '2025-01-18 17:02:00', b'0');
INSERT INTO `sys_job_log` VALUES (625, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 17:02:10', '', NULL, '', '2025-01-18 17:02:10', NULL, '2025-01-18 17:02:10', b'0');
INSERT INTO `sys_job_log` VALUES (626, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:02:20', '', NULL, '', '2025-01-18 17:02:20', NULL, '2025-01-18 17:02:20', b'0');
INSERT INTO `sys_job_log` VALUES (627, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:02:30', '', NULL, '', '2025-01-18 17:02:30', NULL, '2025-01-18 17:02:30', b'0');
INSERT INTO `sys_job_log` VALUES (628, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:02:40', '', NULL, '', '2025-01-18 17:02:40', NULL, '2025-01-18 17:02:40', b'0');
INSERT INTO `sys_job_log` VALUES (629, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:02:50', '', NULL, '', '2025-01-18 17:02:50', NULL, '2025-01-18 17:02:50', b'0');
INSERT INTO `sys_job_log` VALUES (630, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:03:00', '', NULL, '', '2025-01-18 17:03:00', NULL, '2025-01-18 17:03:00', b'0');
INSERT INTO `sys_job_log` VALUES (631, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:03:10', '', NULL, '', '2025-01-18 17:03:10', NULL, '2025-01-18 17:03:10', b'0');
INSERT INTO `sys_job_log` VALUES (632, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:03:20', '', NULL, '', '2025-01-18 17:03:20', NULL, '2025-01-18 17:03:20', b'0');
INSERT INTO `sys_job_log` VALUES (633, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:03:30', '', NULL, '', '2025-01-18 17:03:30', NULL, '2025-01-18 17:03:30', b'0');
INSERT INTO `sys_job_log` VALUES (634, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:03:40', '', NULL, '', '2025-01-18 17:03:40', NULL, '2025-01-18 17:03:40', b'0');
INSERT INTO `sys_job_log` VALUES (635, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:03:50', '', NULL, '', '2025-01-18 17:03:50', NULL, '2025-01-18 17:03:50', b'0');
INSERT INTO `sys_job_log` VALUES (636, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:04:00', '', NULL, '', '2025-01-18 17:04:00', NULL, '2025-01-18 17:04:00', b'0');
INSERT INTO `sys_job_log` VALUES (637, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:04:10', '', NULL, '', '2025-01-18 17:04:10', NULL, '2025-01-18 17:04:10', b'0');
INSERT INTO `sys_job_log` VALUES (638, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:04:20', '', NULL, '', '2025-01-18 17:04:20', NULL, '2025-01-18 17:04:20', b'0');
INSERT INTO `sys_job_log` VALUES (639, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:04:30', '', NULL, '', '2025-01-18 17:04:30', NULL, '2025-01-18 17:04:30', b'0');
INSERT INTO `sys_job_log` VALUES (640, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:04:40', '', NULL, '', '2025-01-18 17:04:40', NULL, '2025-01-18 17:04:40', b'0');
INSERT INTO `sys_job_log` VALUES (641, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:04:50', '', NULL, '', '2025-01-18 17:04:50', NULL, '2025-01-18 17:04:50', b'0');
INSERT INTO `sys_job_log` VALUES (642, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:05:00', '', NULL, '', '2025-01-18 17:05:00', NULL, '2025-01-18 17:05:00', b'0');
INSERT INTO `sys_job_log` VALUES (643, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:05:10', '', NULL, '', '2025-01-18 17:05:10', NULL, '2025-01-18 17:05:10', b'0');
INSERT INTO `sys_job_log` VALUES (644, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:05:20', '', NULL, '', '2025-01-18 17:05:20', NULL, '2025-01-18 17:05:20', b'0');
INSERT INTO `sys_job_log` VALUES (645, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:05:30', '', NULL, '', '2025-01-18 17:05:30', NULL, '2025-01-18 17:05:30', b'0');
INSERT INTO `sys_job_log` VALUES (646, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:05:40', '', NULL, '', '2025-01-18 17:05:40', NULL, '2025-01-18 17:05:40', b'0');
INSERT INTO `sys_job_log` VALUES (647, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:05:50', '', NULL, '', '2025-01-18 17:05:50', NULL, '2025-01-18 17:05:50', b'0');
INSERT INTO `sys_job_log` VALUES (648, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:06:00', '', NULL, '', '2025-01-18 17:06:00', NULL, '2025-01-18 17:06:00', b'0');
INSERT INTO `sys_job_log` VALUES (649, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:06:10', '', NULL, '', '2025-01-18 17:06:10', NULL, '2025-01-18 17:06:10', b'0');
INSERT INTO `sys_job_log` VALUES (650, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:06:20', '', NULL, '', '2025-01-18 17:06:20', NULL, '2025-01-18 17:06:20', b'0');
INSERT INTO `sys_job_log` VALUES (651, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:06:30', '', NULL, '', '2025-01-18 17:06:30', NULL, '2025-01-18 17:06:30', b'0');
INSERT INTO `sys_job_log` VALUES (652, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:06:40', '', NULL, '', '2025-01-18 17:06:40', NULL, '2025-01-18 17:06:40', b'0');
INSERT INTO `sys_job_log` VALUES (653, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:06:50', '', NULL, '', '2025-01-18 17:06:50', NULL, '2025-01-18 17:06:50', b'0');
INSERT INTO `sys_job_log` VALUES (654, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:07:00', '', NULL, '', '2025-01-18 17:07:00', NULL, '2025-01-18 17:07:00', b'0');
INSERT INTO `sys_job_log` VALUES (655, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:07:10', '', NULL, '', '2025-01-18 17:07:10', NULL, '2025-01-18 17:07:10', b'0');
INSERT INTO `sys_job_log` VALUES (656, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:07:20', '', NULL, '', '2025-01-18 17:07:20', NULL, '2025-01-18 17:07:20', b'0');
INSERT INTO `sys_job_log` VALUES (657, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:07:30', '', NULL, '', '2025-01-18 17:07:30', NULL, '2025-01-18 17:07:30', b'0');
INSERT INTO `sys_job_log` VALUES (658, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:07:40', '', NULL, '', '2025-01-18 17:07:40', NULL, '2025-01-18 17:07:40', b'0');
INSERT INTO `sys_job_log` VALUES (659, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:07:50', '', NULL, '', '2025-01-18 17:07:50', NULL, '2025-01-18 17:07:50', b'0');
INSERT INTO `sys_job_log` VALUES (660, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:08:00', '', NULL, '', '2025-01-18 17:08:00', NULL, '2025-01-18 17:08:00', b'0');
INSERT INTO `sys_job_log` VALUES (661, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:08:10', '', NULL, '', '2025-01-18 17:08:10', NULL, '2025-01-18 17:08:10', b'0');
INSERT INTO `sys_job_log` VALUES (662, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:08:20', '', NULL, '', '2025-01-18 17:08:20', NULL, '2025-01-18 17:08:20', b'0');
INSERT INTO `sys_job_log` VALUES (663, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:08:30', '', NULL, '', '2025-01-18 17:08:30', NULL, '2025-01-18 17:08:30', b'0');
INSERT INTO `sys_job_log` VALUES (664, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:08:40', '', NULL, '', '2025-01-18 17:08:40', NULL, '2025-01-18 17:08:40', b'0');
INSERT INTO `sys_job_log` VALUES (665, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:08:50', '', NULL, '', '2025-01-18 17:08:50', NULL, '2025-01-18 17:08:50', b'0');
INSERT INTO `sys_job_log` VALUES (666, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:09:00', '', NULL, '', '2025-01-18 17:09:00', NULL, '2025-01-18 17:09:00', b'0');
INSERT INTO `sys_job_log` VALUES (667, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:09:10', '', NULL, '', '2025-01-18 17:09:10', NULL, '2025-01-18 17:09:10', b'0');
INSERT INTO `sys_job_log` VALUES (668, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:09:20', '', NULL, '', '2025-01-18 17:09:20', NULL, '2025-01-18 17:09:20', b'0');
INSERT INTO `sys_job_log` VALUES (669, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:09:30', '', NULL, '', '2025-01-18 17:09:30', NULL, '2025-01-18 17:09:30', b'0');
INSERT INTO `sys_job_log` VALUES (670, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:09:40', '', NULL, '', '2025-01-18 17:09:40', NULL, '2025-01-18 17:09:40', b'0');
INSERT INTO `sys_job_log` VALUES (671, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：3毫秒', '0', '2025-01-18 17:09:50', '', NULL, '', '2025-01-18 17:09:50', NULL, '2025-01-18 17:09:50', b'0');
INSERT INTO `sys_job_log` VALUES (672, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:10:00', '', NULL, '', '2025-01-18 17:10:00', NULL, '2025-01-18 17:10:00', b'0');
INSERT INTO `sys_job_log` VALUES (673, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:10:10', '', NULL, '', '2025-01-18 17:10:10', NULL, '2025-01-18 17:10:10', b'0');
INSERT INTO `sys_job_log` VALUES (674, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:10:20', '', NULL, '', '2025-01-18 17:10:20', NULL, '2025-01-18 17:10:20', b'0');
INSERT INTO `sys_job_log` VALUES (675, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:10:30', '', NULL, '', '2025-01-18 17:10:30', NULL, '2025-01-18 17:10:30', b'0');
INSERT INTO `sys_job_log` VALUES (676, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:10:40', '', NULL, '', '2025-01-18 17:10:40', NULL, '2025-01-18 17:10:40', b'0');
INSERT INTO `sys_job_log` VALUES (677, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:10:50', '', NULL, '', '2025-01-18 17:10:50', NULL, '2025-01-18 17:10:50', b'0');
INSERT INTO `sys_job_log` VALUES (678, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:11:00', '', NULL, '', '2025-01-18 17:11:00', NULL, '2025-01-18 17:11:00', b'0');
INSERT INTO `sys_job_log` VALUES (679, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:11:10', '', NULL, '', '2025-01-18 17:11:10', NULL, '2025-01-18 17:11:10', b'0');
INSERT INTO `sys_job_log` VALUES (680, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:11:20', '', NULL, '', '2025-01-18 17:11:20', NULL, '2025-01-18 17:11:20', b'0');
INSERT INTO `sys_job_log` VALUES (681, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:11:30', '', NULL, '', '2025-01-18 17:11:30', NULL, '2025-01-18 17:11:30', b'0');
INSERT INTO `sys_job_log` VALUES (682, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:11:40', '', NULL, '', '2025-01-18 17:11:40', NULL, '2025-01-18 17:11:40', b'0');
INSERT INTO `sys_job_log` VALUES (683, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:11:50', '', NULL, '', '2025-01-18 17:11:50', NULL, '2025-01-18 17:11:50', b'0');
INSERT INTO `sys_job_log` VALUES (684, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:12:00', '', NULL, '', '2025-01-18 17:12:00', NULL, '2025-01-18 17:12:00', b'0');
INSERT INTO `sys_job_log` VALUES (685, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 17:12:10', '', NULL, '', '2025-01-18 17:12:10', NULL, '2025-01-18 17:12:10', b'0');
INSERT INTO `sys_job_log` VALUES (686, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:12:20', '', NULL, '', '2025-01-18 17:12:20', NULL, '2025-01-18 17:12:20', b'0');
INSERT INTO `sys_job_log` VALUES (687, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:12:30', '', NULL, '', '2025-01-18 17:12:30', NULL, '2025-01-18 17:12:30', b'0');
INSERT INTO `sys_job_log` VALUES (688, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：3毫秒', '0', '2025-01-18 17:12:40', '', NULL, '', '2025-01-18 17:12:40', NULL, '2025-01-18 17:12:40', b'0');
INSERT INTO `sys_job_log` VALUES (689, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:12:50', '', NULL, '', '2025-01-18 17:12:50', NULL, '2025-01-18 17:12:50', b'0');
INSERT INTO `sys_job_log` VALUES (690, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:13:00', '', NULL, '', '2025-01-18 17:13:00', NULL, '2025-01-18 17:13:00', b'0');
INSERT INTO `sys_job_log` VALUES (691, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:13:10', '', NULL, '', '2025-01-18 17:13:10', NULL, '2025-01-18 17:13:10', b'0');
INSERT INTO `sys_job_log` VALUES (692, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:13:20', '', NULL, '', '2025-01-18 17:13:20', NULL, '2025-01-18 17:13:20', b'0');
INSERT INTO `sys_job_log` VALUES (693, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:13:30', '', NULL, '', '2025-01-18 17:13:30', NULL, '2025-01-18 17:13:30', b'0');
INSERT INTO `sys_job_log` VALUES (694, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:13:40', '', NULL, '', '2025-01-18 17:13:40', NULL, '2025-01-18 17:13:40', b'0');
INSERT INTO `sys_job_log` VALUES (695, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:13:50', '', NULL, '', '2025-01-18 17:13:50', NULL, '2025-01-18 17:13:50', b'0');
INSERT INTO `sys_job_log` VALUES (696, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:14:00', '', NULL, '', '2025-01-18 17:14:00', NULL, '2025-01-18 17:14:00', b'0');
INSERT INTO `sys_job_log` VALUES (697, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:14:10', '', NULL, '', '2025-01-18 17:14:10', NULL, '2025-01-18 17:14:10', b'0');
INSERT INTO `sys_job_log` VALUES (698, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 17:14:20', '', NULL, '', '2025-01-18 17:14:20', NULL, '2025-01-18 17:14:20', b'0');
INSERT INTO `sys_job_log` VALUES (699, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:14:30', '', NULL, '', '2025-01-18 17:14:30', NULL, '2025-01-18 17:14:30', b'0');
INSERT INTO `sys_job_log` VALUES (700, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:14:40', '', NULL, '', '2025-01-18 17:14:40', NULL, '2025-01-18 17:14:40', b'0');
INSERT INTO `sys_job_log` VALUES (701, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:14:50', '', NULL, '', '2025-01-18 17:14:50', NULL, '2025-01-18 17:14:50', b'0');
INSERT INTO `sys_job_log` VALUES (702, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:15:00', '', NULL, '', '2025-01-18 17:15:00', NULL, '2025-01-18 17:15:00', b'0');
INSERT INTO `sys_job_log` VALUES (703, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:15:10', '', NULL, '', '2025-01-18 17:15:10', NULL, '2025-01-18 17:15:10', b'0');
INSERT INTO `sys_job_log` VALUES (704, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:15:20', '', NULL, '', '2025-01-18 17:15:20', NULL, '2025-01-18 17:15:20', b'0');
INSERT INTO `sys_job_log` VALUES (705, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:15:30', '', NULL, '', '2025-01-18 17:15:30', NULL, '2025-01-18 17:15:30', b'0');
INSERT INTO `sys_job_log` VALUES (706, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:15:40', '', NULL, '', '2025-01-18 17:15:40', NULL, '2025-01-18 17:15:40', b'0');
INSERT INTO `sys_job_log` VALUES (707, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:15:50', '', NULL, '', '2025-01-18 17:15:50', NULL, '2025-01-18 17:15:50', b'0');
INSERT INTO `sys_job_log` VALUES (708, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:16:00', '', NULL, '', '2025-01-18 17:16:00', NULL, '2025-01-18 17:16:00', b'0');
INSERT INTO `sys_job_log` VALUES (709, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:16:10', '', NULL, '', '2025-01-18 17:16:10', NULL, '2025-01-18 17:16:10', b'0');
INSERT INTO `sys_job_log` VALUES (710, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:16:20', '', NULL, '', '2025-01-18 17:16:20', NULL, '2025-01-18 17:16:20', b'0');
INSERT INTO `sys_job_log` VALUES (711, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：3毫秒', '0', '2025-01-18 17:16:30', '', NULL, '', '2025-01-18 17:16:30', NULL, '2025-01-18 17:16:30', b'0');
INSERT INTO `sys_job_log` VALUES (712, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:16:40', '', NULL, '', '2025-01-18 17:16:40', NULL, '2025-01-18 17:16:40', b'0');
INSERT INTO `sys_job_log` VALUES (713, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:16:50', '', NULL, '', '2025-01-18 17:16:50', NULL, '2025-01-18 17:16:50', b'0');
INSERT INTO `sys_job_log` VALUES (714, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:17:00', '', NULL, '', '2025-01-18 17:17:00', NULL, '2025-01-18 17:17:00', b'0');
INSERT INTO `sys_job_log` VALUES (715, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:17:10', '', NULL, '', '2025-01-18 17:17:10', NULL, '2025-01-18 17:17:10', b'0');
INSERT INTO `sys_job_log` VALUES (716, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:17:20', '', NULL, '', '2025-01-18 17:17:20', NULL, '2025-01-18 17:17:20', b'0');
INSERT INTO `sys_job_log` VALUES (717, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:17:30', '', NULL, '', '2025-01-18 17:17:30', NULL, '2025-01-18 17:17:30', b'0');
INSERT INTO `sys_job_log` VALUES (718, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:17:40', '', NULL, '', '2025-01-18 17:17:40', NULL, '2025-01-18 17:17:40', b'0');
INSERT INTO `sys_job_log` VALUES (719, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:17:50', '', NULL, '', '2025-01-18 17:17:50', NULL, '2025-01-18 17:17:50', b'0');
INSERT INTO `sys_job_log` VALUES (720, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:18:00', '', NULL, '', '2025-01-18 17:18:00', NULL, '2025-01-18 17:18:00', b'0');
INSERT INTO `sys_job_log` VALUES (721, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:18:10', '', NULL, '', '2025-01-18 17:18:10', NULL, '2025-01-18 17:18:10', b'0');
INSERT INTO `sys_job_log` VALUES (722, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:18:20', '', NULL, '', '2025-01-18 17:18:20', NULL, '2025-01-18 17:18:20', b'0');
INSERT INTO `sys_job_log` VALUES (723, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:18:30', '', NULL, '', '2025-01-18 17:18:30', NULL, '2025-01-18 17:18:30', b'0');
INSERT INTO `sys_job_log` VALUES (724, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:18:40', '', NULL, '', '2025-01-18 17:18:40', NULL, '2025-01-18 17:18:40', b'0');
INSERT INTO `sys_job_log` VALUES (725, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:18:50', '', NULL, '', '2025-01-18 17:18:50', NULL, '2025-01-18 17:18:50', b'0');
INSERT INTO `sys_job_log` VALUES (726, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:19:00', '', NULL, '', '2025-01-18 17:19:00', NULL, '2025-01-18 17:19:00', b'0');
INSERT INTO `sys_job_log` VALUES (727, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:19:10', '', NULL, '', '2025-01-18 17:19:10', NULL, '2025-01-18 17:19:10', b'0');
INSERT INTO `sys_job_log` VALUES (728, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:19:20', '', NULL, '', '2025-01-18 17:19:20', NULL, '2025-01-18 17:19:20', b'0');
INSERT INTO `sys_job_log` VALUES (729, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:19:30', '', NULL, '', '2025-01-18 17:19:30', NULL, '2025-01-18 17:19:30', b'0');
INSERT INTO `sys_job_log` VALUES (730, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:19:40', '', NULL, '', '2025-01-18 17:19:40', NULL, '2025-01-18 17:19:40', b'0');
INSERT INTO `sys_job_log` VALUES (731, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:19:50', '', NULL, '', '2025-01-18 17:19:50', NULL, '2025-01-18 17:19:50', b'0');
INSERT INTO `sys_job_log` VALUES (732, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:20:00', '', NULL, '', '2025-01-18 17:20:00', NULL, '2025-01-18 17:20:00', b'0');
INSERT INTO `sys_job_log` VALUES (733, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:20:10', '', NULL, '', '2025-01-18 17:20:10', NULL, '2025-01-18 17:20:10', b'0');
INSERT INTO `sys_job_log` VALUES (734, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:20:20', '', NULL, '', '2025-01-18 17:20:20', NULL, '2025-01-18 17:20:20', b'0');
INSERT INTO `sys_job_log` VALUES (735, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:20:30', '', NULL, '', '2025-01-18 17:20:30', NULL, '2025-01-18 17:20:30', b'0');
INSERT INTO `sys_job_log` VALUES (736, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:20:40', '', NULL, '', '2025-01-18 17:20:40', NULL, '2025-01-18 17:20:40', b'0');
INSERT INTO `sys_job_log` VALUES (737, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:20:50', '', NULL, '', '2025-01-18 17:20:50', NULL, '2025-01-18 17:20:50', b'0');
INSERT INTO `sys_job_log` VALUES (738, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:21:00', '', NULL, '', '2025-01-18 17:21:00', NULL, '2025-01-18 17:21:00', b'0');
INSERT INTO `sys_job_log` VALUES (739, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:21:10', '', NULL, '', '2025-01-18 17:21:10', NULL, '2025-01-18 17:21:10', b'0');
INSERT INTO `sys_job_log` VALUES (740, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:21:20', '', NULL, '', '2025-01-18 17:21:20', NULL, '2025-01-18 17:21:20', b'0');
INSERT INTO `sys_job_log` VALUES (741, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:21:30', '', NULL, '', '2025-01-18 17:21:30', NULL, '2025-01-18 17:21:30', b'0');
INSERT INTO `sys_job_log` VALUES (742, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:21:40', '', NULL, '', '2025-01-18 17:21:40', NULL, '2025-01-18 17:21:40', b'0');
INSERT INTO `sys_job_log` VALUES (743, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 17:21:50', '', NULL, '', '2025-01-18 17:21:50', NULL, '2025-01-18 17:21:50', b'0');
INSERT INTO `sys_job_log` VALUES (744, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 17:22:00', '', NULL, '', '2025-01-18 17:22:00', NULL, '2025-01-18 17:22:00', b'0');
INSERT INTO `sys_job_log` VALUES (745, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:22:10', '', NULL, '', '2025-01-18 17:22:10', NULL, '2025-01-18 17:22:10', b'0');
INSERT INTO `sys_job_log` VALUES (746, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:22:20', '', NULL, '', '2025-01-18 17:22:20', NULL, '2025-01-18 17:22:20', b'0');
INSERT INTO `sys_job_log` VALUES (747, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:22:30', '', NULL, '', '2025-01-18 17:22:30', NULL, '2025-01-18 17:22:30', b'0');
INSERT INTO `sys_job_log` VALUES (748, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:22:40', '', NULL, '', '2025-01-18 17:22:40', NULL, '2025-01-18 17:22:40', b'0');
INSERT INTO `sys_job_log` VALUES (749, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:22:50', '', NULL, '', '2025-01-18 17:22:50', NULL, '2025-01-18 17:22:50', b'0');
INSERT INTO `sys_job_log` VALUES (750, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:23:00', '', NULL, '', '2025-01-18 17:23:00', NULL, '2025-01-18 17:23:00', b'0');
INSERT INTO `sys_job_log` VALUES (751, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:23:10', '', NULL, '', '2025-01-18 17:23:10', NULL, '2025-01-18 17:23:10', b'0');
INSERT INTO `sys_job_log` VALUES (752, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:23:20', '', NULL, '', '2025-01-18 17:23:20', NULL, '2025-01-18 17:23:20', b'0');
INSERT INTO `sys_job_log` VALUES (753, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:23:30', '', NULL, '', '2025-01-18 17:23:30', NULL, '2025-01-18 17:23:30', b'0');
INSERT INTO `sys_job_log` VALUES (754, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:23:40', '', NULL, '', '2025-01-18 17:23:40', NULL, '2025-01-18 17:23:40', b'0');
INSERT INTO `sys_job_log` VALUES (755, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:23:50', '', NULL, '', '2025-01-18 17:23:50', NULL, '2025-01-18 17:23:50', b'0');
INSERT INTO `sys_job_log` VALUES (756, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:24:00', '', NULL, '', '2025-01-18 17:24:00', NULL, '2025-01-18 17:24:00', b'0');
INSERT INTO `sys_job_log` VALUES (757, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:24:10', '', NULL, '', '2025-01-18 17:24:10', NULL, '2025-01-18 17:24:10', b'0');
INSERT INTO `sys_job_log` VALUES (758, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:24:20', '', NULL, '', '2025-01-18 17:24:20', NULL, '2025-01-18 17:24:20', b'0');
INSERT INTO `sys_job_log` VALUES (759, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:24:30', '', NULL, '', '2025-01-18 17:24:30', NULL, '2025-01-18 17:24:30', b'0');
INSERT INTO `sys_job_log` VALUES (760, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:24:40', '', NULL, '', '2025-01-18 17:24:40', NULL, '2025-01-18 17:24:40', b'0');
INSERT INTO `sys_job_log` VALUES (761, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:24:50', '', NULL, '', '2025-01-18 17:24:50', NULL, '2025-01-18 17:24:50', b'0');
INSERT INTO `sys_job_log` VALUES (762, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:25:00', '', NULL, '', '2025-01-18 17:25:00', NULL, '2025-01-18 17:25:00', b'0');
INSERT INTO `sys_job_log` VALUES (763, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:25:10', '', NULL, '', '2025-01-18 17:25:10', NULL, '2025-01-18 17:25:10', b'0');
INSERT INTO `sys_job_log` VALUES (764, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:25:20', '', NULL, '', '2025-01-18 17:25:20', NULL, '2025-01-18 17:25:20', b'0');
INSERT INTO `sys_job_log` VALUES (765, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:25:30', '', NULL, '', '2025-01-18 17:25:30', NULL, '2025-01-18 17:25:30', b'0');
INSERT INTO `sys_job_log` VALUES (766, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:25:40', '', NULL, '', '2025-01-18 17:25:40', NULL, '2025-01-18 17:25:40', b'0');
INSERT INTO `sys_job_log` VALUES (767, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:25:50', '', NULL, '', '2025-01-18 17:25:50', NULL, '2025-01-18 17:25:50', b'0');
INSERT INTO `sys_job_log` VALUES (768, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:26:00', '', NULL, '', '2025-01-18 17:26:00', NULL, '2025-01-18 17:26:00', b'0');
INSERT INTO `sys_job_log` VALUES (769, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:26:10', '', NULL, '', '2025-01-18 17:26:10', NULL, '2025-01-18 17:26:10', b'0');
INSERT INTO `sys_job_log` VALUES (770, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:26:20', '', NULL, '', '2025-01-18 17:26:20', NULL, '2025-01-18 17:26:20', b'0');
INSERT INTO `sys_job_log` VALUES (771, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:26:30', '', NULL, '', '2025-01-18 17:26:30', NULL, '2025-01-18 17:26:30', b'0');
INSERT INTO `sys_job_log` VALUES (772, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-18 17:26:40', '', NULL, '', '2025-01-18 17:26:40', NULL, '2025-01-18 17:26:40', b'0');
INSERT INTO `sys_job_log` VALUES (773, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:26:50', '', NULL, '', '2025-01-18 17:26:50', NULL, '2025-01-18 17:26:50', b'0');
INSERT INTO `sys_job_log` VALUES (774, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 17:27:00', '', NULL, '', '2025-01-18 17:27:00', NULL, '2025-01-18 17:27:00', b'0');
INSERT INTO `sys_job_log` VALUES (775, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:27:10', '', NULL, '', '2025-01-18 17:27:10', NULL, '2025-01-18 17:27:10', b'0');
INSERT INTO `sys_job_log` VALUES (776, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:27:20', '', NULL, '', '2025-01-18 17:27:20', NULL, '2025-01-18 17:27:20', b'0');
INSERT INTO `sys_job_log` VALUES (777, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:27:30', '', NULL, '', '2025-01-18 17:27:30', NULL, '2025-01-18 17:27:30', b'0');
INSERT INTO `sys_job_log` VALUES (778, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:27:40', '', NULL, '', '2025-01-18 17:27:40', NULL, '2025-01-18 17:27:40', b'0');
INSERT INTO `sys_job_log` VALUES (779, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:27:50', '', NULL, '', '2025-01-18 17:27:50', NULL, '2025-01-18 17:27:50', b'0');
INSERT INTO `sys_job_log` VALUES (780, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:28:00', '', NULL, '', '2025-01-18 17:28:00', NULL, '2025-01-18 17:28:00', b'0');
INSERT INTO `sys_job_log` VALUES (781, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:28:10', '', NULL, '', '2025-01-18 17:28:10', NULL, '2025-01-18 17:28:10', b'0');
INSERT INTO `sys_job_log` VALUES (782, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:28:20', '', NULL, '', '2025-01-18 17:28:20', NULL, '2025-01-18 17:28:20', b'0');
INSERT INTO `sys_job_log` VALUES (783, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:28:30', '', NULL, '', '2025-01-18 17:28:30', NULL, '2025-01-18 17:28:30', b'0');
INSERT INTO `sys_job_log` VALUES (784, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:28:40', '', NULL, '', '2025-01-18 17:28:40', NULL, '2025-01-18 17:28:40', b'0');
INSERT INTO `sys_job_log` VALUES (785, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:28:50', '', NULL, '', '2025-01-18 17:28:50', NULL, '2025-01-18 17:28:50', b'0');
INSERT INTO `sys_job_log` VALUES (786, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:29:00', '', NULL, '', '2025-01-18 17:29:00', NULL, '2025-01-18 17:29:00', b'0');
INSERT INTO `sys_job_log` VALUES (787, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:29:10', '', NULL, '', '2025-01-18 17:29:10', NULL, '2025-01-18 17:29:10', b'0');
INSERT INTO `sys_job_log` VALUES (788, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:29:20', '', NULL, '', '2025-01-18 17:29:20', NULL, '2025-01-18 17:29:20', b'0');
INSERT INTO `sys_job_log` VALUES (789, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:29:30', '', NULL, '', '2025-01-18 17:29:30', NULL, '2025-01-18 17:29:30', b'0');
INSERT INTO `sys_job_log` VALUES (790, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:29:40', '', NULL, '', '2025-01-18 17:29:40', NULL, '2025-01-18 17:29:40', b'0');
INSERT INTO `sys_job_log` VALUES (791, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:29:50', '', NULL, '', '2025-01-18 17:29:50', NULL, '2025-01-18 17:29:50', b'0');
INSERT INTO `sys_job_log` VALUES (792, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:30:00', '', NULL, '', '2025-01-18 17:30:00', NULL, '2025-01-18 17:30:00', b'0');
INSERT INTO `sys_job_log` VALUES (793, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:30:10', '', NULL, '', '2025-01-18 17:30:10', NULL, '2025-01-18 17:30:10', b'0');
INSERT INTO `sys_job_log` VALUES (794, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:30:20', '', NULL, '', '2025-01-18 17:30:20', NULL, '2025-01-18 17:30:20', b'0');
INSERT INTO `sys_job_log` VALUES (795, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:30:30', '', NULL, '', '2025-01-18 17:30:30', NULL, '2025-01-18 17:30:30', b'0');
INSERT INTO `sys_job_log` VALUES (796, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:30:40', '', NULL, '', '2025-01-18 17:30:40', NULL, '2025-01-18 17:30:40', b'0');
INSERT INTO `sys_job_log` VALUES (797, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:30:50', '', NULL, '', '2025-01-18 17:30:50', NULL, '2025-01-18 17:30:50', b'0');
INSERT INTO `sys_job_log` VALUES (798, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:31:00', '', NULL, '', '2025-01-18 17:31:00', NULL, '2025-01-18 17:31:00', b'0');
INSERT INTO `sys_job_log` VALUES (799, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:31:10', '', NULL, '', '2025-01-18 17:31:10', NULL, '2025-01-18 17:31:10', b'0');
INSERT INTO `sys_job_log` VALUES (800, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:31:20', '', NULL, '', '2025-01-18 17:31:20', NULL, '2025-01-18 17:31:20', b'0');
INSERT INTO `sys_job_log` VALUES (801, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:31:30', '', NULL, '', '2025-01-18 17:31:30', NULL, '2025-01-18 17:31:30', b'0');
INSERT INTO `sys_job_log` VALUES (802, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:31:40', '', NULL, '', '2025-01-18 17:31:40', NULL, '2025-01-18 17:31:40', b'0');
INSERT INTO `sys_job_log` VALUES (803, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:31:50', '', NULL, '', '2025-01-18 17:31:50', NULL, '2025-01-18 17:31:50', b'0');
INSERT INTO `sys_job_log` VALUES (804, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:32:00', '', NULL, '', '2025-01-18 17:32:00', NULL, '2025-01-18 17:32:00', b'0');
INSERT INTO `sys_job_log` VALUES (805, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:32:10', '', NULL, '', '2025-01-18 17:32:10', NULL, '2025-01-18 17:32:10', b'0');
INSERT INTO `sys_job_log` VALUES (806, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:32:20', '', NULL, '', '2025-01-18 17:32:20', NULL, '2025-01-18 17:32:20', b'0');
INSERT INTO `sys_job_log` VALUES (807, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:32:30', '', NULL, '', '2025-01-18 17:32:30', NULL, '2025-01-18 17:32:30', b'0');
INSERT INTO `sys_job_log` VALUES (808, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:32:40', '', NULL, '', '2025-01-18 17:32:40', NULL, '2025-01-18 17:32:40', b'0');
INSERT INTO `sys_job_log` VALUES (809, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:32:50', '', NULL, '', '2025-01-18 17:32:50', NULL, '2025-01-18 17:32:50', b'0');
INSERT INTO `sys_job_log` VALUES (810, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:33:00', '', NULL, '', '2025-01-18 17:33:00', NULL, '2025-01-18 17:33:00', b'0');
INSERT INTO `sys_job_log` VALUES (811, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:33:10', '', NULL, '', '2025-01-18 17:33:10', NULL, '2025-01-18 17:33:10', b'0');
INSERT INTO `sys_job_log` VALUES (812, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:33:20', '', NULL, '', '2025-01-18 17:33:20', NULL, '2025-01-18 17:33:20', b'0');
INSERT INTO `sys_job_log` VALUES (813, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:33:30', '', NULL, '', '2025-01-18 17:33:30', NULL, '2025-01-18 17:33:30', b'0');
INSERT INTO `sys_job_log` VALUES (814, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:33:40', '', NULL, '', '2025-01-18 17:33:40', NULL, '2025-01-18 17:33:40', b'0');
INSERT INTO `sys_job_log` VALUES (815, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:33:50', '', NULL, '', '2025-01-18 17:33:50', NULL, '2025-01-18 17:33:50', b'0');
INSERT INTO `sys_job_log` VALUES (816, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:34:00', '', NULL, '', '2025-01-18 17:34:00', NULL, '2025-01-18 17:34:00', b'0');
INSERT INTO `sys_job_log` VALUES (817, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-18 17:34:10', '', NULL, '', '2025-01-18 17:34:10', NULL, '2025-01-18 17:34:10', b'0');
INSERT INTO `sys_job_log` VALUES (818, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:34:20', '', NULL, '', '2025-01-18 17:34:20', NULL, '2025-01-18 17:34:20', b'0');
INSERT INTO `sys_job_log` VALUES (819, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:34:30', '', NULL, '', '2025-01-18 17:34:30', NULL, '2025-01-18 17:34:30', b'0');
INSERT INTO `sys_job_log` VALUES (820, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:34:40', '', NULL, '', '2025-01-18 17:34:40', NULL, '2025-01-18 17:34:40', b'0');
INSERT INTO `sys_job_log` VALUES (821, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:34:50', '', NULL, '', '2025-01-18 17:34:50', NULL, '2025-01-18 17:34:50', b'0');
INSERT INTO `sys_job_log` VALUES (822, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:35:00', '', NULL, '', '2025-01-18 17:35:00', NULL, '2025-01-18 17:35:00', b'0');
INSERT INTO `sys_job_log` VALUES (823, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:35:10', '', NULL, '', '2025-01-18 17:35:10', NULL, '2025-01-18 17:35:10', b'0');
INSERT INTO `sys_job_log` VALUES (824, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:35:20', '', NULL, '', '2025-01-18 17:35:20', NULL, '2025-01-18 17:35:20', b'0');
INSERT INTO `sys_job_log` VALUES (825, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:35:30', '', NULL, '', '2025-01-18 17:35:30', NULL, '2025-01-18 17:35:30', b'0');
INSERT INTO `sys_job_log` VALUES (826, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:35:40', '', NULL, '', '2025-01-18 17:35:40', NULL, '2025-01-18 17:35:40', b'0');
INSERT INTO `sys_job_log` VALUES (827, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:35:50', '', NULL, '', '2025-01-18 17:35:50', NULL, '2025-01-18 17:35:50', b'0');
INSERT INTO `sys_job_log` VALUES (828, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:36:00', '', NULL, '', '2025-01-18 17:36:00', NULL, '2025-01-18 17:36:00', b'0');
INSERT INTO `sys_job_log` VALUES (829, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:36:10', '', NULL, '', '2025-01-18 17:36:10', NULL, '2025-01-18 17:36:10', b'0');
INSERT INTO `sys_job_log` VALUES (830, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:36:20', '', NULL, '', '2025-01-18 17:36:20', NULL, '2025-01-18 17:36:20', b'0');
INSERT INTO `sys_job_log` VALUES (831, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:36:30', '', NULL, '', '2025-01-18 17:36:30', NULL, '2025-01-18 17:36:30', b'0');
INSERT INTO `sys_job_log` VALUES (832, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:36:40', '', NULL, '', '2025-01-18 17:36:40', NULL, '2025-01-18 17:36:40', b'0');
INSERT INTO `sys_job_log` VALUES (833, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-18 17:36:50', '', NULL, '', '2025-01-18 17:36:50', NULL, '2025-01-18 17:36:50', b'0');
INSERT INTO `sys_job_log` VALUES (834, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-18 17:37:00', '', NULL, '', '2025-01-18 17:37:00', NULL, '2025-01-18 17:37:00', b'0');
INSERT INTO `sys_job_log` VALUES (835, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-18 17:37:10', '', NULL, '', '2025-01-18 17:37:10', NULL, '2025-01-18 17:37:10', b'0');
INSERT INTO `sys_job_log` VALUES (836, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：4毫秒', '0', '2025-01-19 16:06:13', '', NULL, '', '2025-01-19 16:06:13', NULL, '2025-01-19 16:06:13', b'0');
INSERT INTO `sys_job_log` VALUES (837, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-19 16:06:20', '', NULL, '', '2025-01-19 16:06:20', NULL, '2025-01-19 16:06:20', b'0');
INSERT INTO `sys_job_log` VALUES (838, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:06:30', '', NULL, '', '2025-01-19 16:06:30', NULL, '2025-01-19 16:06:30', b'0');
INSERT INTO `sys_job_log` VALUES (839, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:06:40', '', NULL, '', '2025-01-19 16:06:40', NULL, '2025-01-19 16:06:40', b'0');
INSERT INTO `sys_job_log` VALUES (840, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:06:50', '', NULL, '', '2025-01-19 16:06:50', NULL, '2025-01-19 16:06:50', b'0');
INSERT INTO `sys_job_log` VALUES (841, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:07:00', '', NULL, '', '2025-01-19 16:07:00', NULL, '2025-01-19 16:07:00', b'0');
INSERT INTO `sys_job_log` VALUES (842, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:07:10', '', NULL, '', '2025-01-19 16:07:10', NULL, '2025-01-19 16:07:10', b'0');
INSERT INTO `sys_job_log` VALUES (843, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:07:20', '', NULL, '', '2025-01-19 16:07:20', NULL, '2025-01-19 16:07:20', b'0');
INSERT INTO `sys_job_log` VALUES (844, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:07:30', '', NULL, '', '2025-01-19 16:07:30', NULL, '2025-01-19 16:07:30', b'0');
INSERT INTO `sys_job_log` VALUES (845, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:07:40', '', NULL, '', '2025-01-19 16:07:40', NULL, '2025-01-19 16:07:40', b'0');
INSERT INTO `sys_job_log` VALUES (846, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:07:50', '', NULL, '', '2025-01-19 16:07:50', NULL, '2025-01-19 16:07:50', b'0');
INSERT INTO `sys_job_log` VALUES (847, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:08:00', '', NULL, '', '2025-01-19 16:08:00', NULL, '2025-01-19 16:08:00', b'0');
INSERT INTO `sys_job_log` VALUES (848, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:08:10', '', NULL, '', '2025-01-19 16:08:10', NULL, '2025-01-19 16:08:10', b'0');
INSERT INTO `sys_job_log` VALUES (849, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:08:20', '', NULL, '', '2025-01-19 16:08:20', NULL, '2025-01-19 16:08:20', b'0');
INSERT INTO `sys_job_log` VALUES (850, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:08:30', '', NULL, '', '2025-01-19 16:08:30', NULL, '2025-01-19 16:08:30', b'0');
INSERT INTO `sys_job_log` VALUES (851, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:08:40', '', NULL, '', '2025-01-19 16:08:40', NULL, '2025-01-19 16:08:40', b'0');
INSERT INTO `sys_job_log` VALUES (852, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:08:50', '', NULL, '', '2025-01-19 16:08:50', NULL, '2025-01-19 16:08:50', b'0');
INSERT INTO `sys_job_log` VALUES (853, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:09:00', '', NULL, '', '2025-01-19 16:09:00', NULL, '2025-01-19 16:09:00', b'0');
INSERT INTO `sys_job_log` VALUES (854, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:09:10', '', NULL, '', '2025-01-19 16:09:10', NULL, '2025-01-19 16:09:10', b'0');
INSERT INTO `sys_job_log` VALUES (855, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:09:20', '', NULL, '', '2025-01-19 16:09:20', NULL, '2025-01-19 16:09:20', b'0');
INSERT INTO `sys_job_log` VALUES (856, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:09:30', '', NULL, '', '2025-01-19 16:09:30', NULL, '2025-01-19 16:09:30', b'0');
INSERT INTO `sys_job_log` VALUES (857, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:09:40', '', NULL, '', '2025-01-19 16:09:40', NULL, '2025-01-19 16:09:40', b'0');
INSERT INTO `sys_job_log` VALUES (858, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:09:50', '', NULL, '', '2025-01-19 16:09:50', NULL, '2025-01-19 16:09:50', b'0');
INSERT INTO `sys_job_log` VALUES (859, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:10:00', '', NULL, '', '2025-01-19 16:10:00', NULL, '2025-01-19 16:10:00', b'0');
INSERT INTO `sys_job_log` VALUES (860, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:10:10', '', NULL, '', '2025-01-19 16:10:10', NULL, '2025-01-19 16:10:10', b'0');
INSERT INTO `sys_job_log` VALUES (861, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:10:20', '', NULL, '', '2025-01-19 16:10:20', NULL, '2025-01-19 16:10:20', b'0');
INSERT INTO `sys_job_log` VALUES (862, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-19 16:10:28', '', NULL, '', '2025-01-19 16:10:28', NULL, '2025-01-19 16:10:28', b'0');
INSERT INTO `sys_job_log` VALUES (863, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-21 16:15:00', '', NULL, '', '2025-01-21 16:15:00', NULL, '2025-01-21 16:15:00', b'0');
INSERT INTO `sys_job_log` VALUES (864, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:15:10', '', NULL, '', '2025-01-21 16:15:10', NULL, '2025-01-21 16:15:10', b'0');
INSERT INTO `sys_job_log` VALUES (865, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:15:20', '', NULL, '', '2025-01-21 16:15:20', NULL, '2025-01-21 16:15:20', b'0');
INSERT INTO `sys_job_log` VALUES (866, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:15:30', '', NULL, '', '2025-01-21 16:15:30', NULL, '2025-01-21 16:15:30', b'0');
INSERT INTO `sys_job_log` VALUES (867, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:15:40', '', NULL, '', '2025-01-21 16:15:40', NULL, '2025-01-21 16:15:40', b'0');
INSERT INTO `sys_job_log` VALUES (868, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:15:50', '', NULL, '', '2025-01-21 16:15:50', NULL, '2025-01-21 16:15:50', b'0');
INSERT INTO `sys_job_log` VALUES (869, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:16:00', '', NULL, '', '2025-01-21 16:16:00', NULL, '2025-01-21 16:16:00', b'0');
INSERT INTO `sys_job_log` VALUES (870, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:16:10', '', NULL, '', '2025-01-21 16:16:10', NULL, '2025-01-21 16:16:10', b'0');
INSERT INTO `sys_job_log` VALUES (871, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:16:20', '', NULL, '', '2025-01-21 16:16:20', NULL, '2025-01-21 16:16:20', b'0');
INSERT INTO `sys_job_log` VALUES (872, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:16:30', '', NULL, '', '2025-01-21 16:16:30', NULL, '2025-01-21 16:16:30', b'0');
INSERT INTO `sys_job_log` VALUES (873, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:16:40', '', NULL, '', '2025-01-21 16:16:40', NULL, '2025-01-21 16:16:40', b'0');
INSERT INTO `sys_job_log` VALUES (874, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:16:50', '', NULL, '', '2025-01-21 16:16:50', NULL, '2025-01-21 16:16:50', b'0');
INSERT INTO `sys_job_log` VALUES (875, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:17:00', '', NULL, '', '2025-01-21 16:17:00', NULL, '2025-01-21 16:17:00', b'0');
INSERT INTO `sys_job_log` VALUES (876, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:17:10', '', NULL, '', '2025-01-21 16:17:10', NULL, '2025-01-21 16:17:10', b'0');
INSERT INTO `sys_job_log` VALUES (877, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:17:20', '', NULL, '', '2025-01-21 16:17:20', NULL, '2025-01-21 16:17:20', b'0');
INSERT INTO `sys_job_log` VALUES (878, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:17:30', '', NULL, '', '2025-01-21 16:17:30', NULL, '2025-01-21 16:17:30', b'0');
INSERT INTO `sys_job_log` VALUES (879, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:17:40', '', NULL, '', '2025-01-21 16:17:40', NULL, '2025-01-21 16:17:40', b'0');
INSERT INTO `sys_job_log` VALUES (880, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:17:50', '', NULL, '', '2025-01-21 16:17:50', NULL, '2025-01-21 16:17:50', b'0');
INSERT INTO `sys_job_log` VALUES (881, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:18:00', '', NULL, '', '2025-01-21 16:18:00', NULL, '2025-01-21 16:18:00', b'0');
INSERT INTO `sys_job_log` VALUES (882, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:18:10', '', NULL, '', '2025-01-21 16:18:10', NULL, '2025-01-21 16:18:10', b'0');
INSERT INTO `sys_job_log` VALUES (883, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:18:20', '', NULL, '', '2025-01-21 16:18:20', NULL, '2025-01-21 16:18:20', b'0');
INSERT INTO `sys_job_log` VALUES (884, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:18:30', '', NULL, '', '2025-01-21 16:18:30', NULL, '2025-01-21 16:18:30', b'0');
INSERT INTO `sys_job_log` VALUES (885, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:18:40', '', NULL, '', '2025-01-21 16:18:40', NULL, '2025-01-21 16:18:40', b'0');
INSERT INTO `sys_job_log` VALUES (886, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:18:50', '', NULL, '', '2025-01-21 16:18:50', NULL, '2025-01-21 16:18:50', b'0');
INSERT INTO `sys_job_log` VALUES (887, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:19:00', '', NULL, '', '2025-01-21 16:19:00', NULL, '2025-01-21 16:19:00', b'0');
INSERT INTO `sys_job_log` VALUES (888, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:19:10', '', NULL, '', '2025-01-21 16:19:10', NULL, '2025-01-21 16:19:10', b'0');
INSERT INTO `sys_job_log` VALUES (889, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:19:20', '', NULL, '', '2025-01-21 16:19:20', NULL, '2025-01-21 16:19:20', b'0');
INSERT INTO `sys_job_log` VALUES (890, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:19:30', '', NULL, '', '2025-01-21 16:19:30', NULL, '2025-01-21 16:19:30', b'0');
INSERT INTO `sys_job_log` VALUES (891, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:19:40', '', NULL, '', '2025-01-21 16:19:40', NULL, '2025-01-21 16:19:40', b'0');
INSERT INTO `sys_job_log` VALUES (892, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:19:50', '', NULL, '', '2025-01-21 16:19:50', NULL, '2025-01-21 16:19:50', b'0');
INSERT INTO `sys_job_log` VALUES (893, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:20:00', '', NULL, '', '2025-01-21 16:20:00', NULL, '2025-01-21 16:20:00', b'0');
INSERT INTO `sys_job_log` VALUES (894, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:20:10', '', NULL, '', '2025-01-21 16:20:10', NULL, '2025-01-21 16:20:10', b'0');
INSERT INTO `sys_job_log` VALUES (895, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:20:20', '', NULL, '', '2025-01-21 16:20:20', NULL, '2025-01-21 16:20:20', b'0');
INSERT INTO `sys_job_log` VALUES (896, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:20:30', '', NULL, '', '2025-01-21 16:20:30', NULL, '2025-01-21 16:20:30', b'0');
INSERT INTO `sys_job_log` VALUES (897, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:20:40', '', NULL, '', '2025-01-21 16:20:40', NULL, '2025-01-21 16:20:40', b'0');
INSERT INTO `sys_job_log` VALUES (898, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:20:50', '', NULL, '', '2025-01-21 16:20:50', NULL, '2025-01-21 16:20:50', b'0');
INSERT INTO `sys_job_log` VALUES (899, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:21:00', '', NULL, '', '2025-01-21 16:21:00', NULL, '2025-01-21 16:21:00', b'0');
INSERT INTO `sys_job_log` VALUES (900, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:21:10', '', NULL, '', '2025-01-21 16:21:10', NULL, '2025-01-21 16:21:10', b'0');
INSERT INTO `sys_job_log` VALUES (901, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:21:20', '', NULL, '', '2025-01-21 16:21:20', NULL, '2025-01-21 16:21:20', b'0');
INSERT INTO `sys_job_log` VALUES (902, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:21:30', '', NULL, '', '2025-01-21 16:21:30', NULL, '2025-01-21 16:21:30', b'0');
INSERT INTO `sys_job_log` VALUES (903, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:21:40', '', NULL, '', '2025-01-21 16:21:40', NULL, '2025-01-21 16:21:40', b'0');
INSERT INTO `sys_job_log` VALUES (904, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:21:50', '', NULL, '', '2025-01-21 16:21:50', NULL, '2025-01-21 16:21:50', b'0');
INSERT INTO `sys_job_log` VALUES (905, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:22:00', '', NULL, '', '2025-01-21 16:22:00', NULL, '2025-01-21 16:22:00', b'0');
INSERT INTO `sys_job_log` VALUES (906, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:22:10', '', NULL, '', '2025-01-21 16:22:10', NULL, '2025-01-21 16:22:10', b'0');
INSERT INTO `sys_job_log` VALUES (907, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:22:20', '', NULL, '', '2025-01-21 16:22:20', NULL, '2025-01-21 16:22:20', b'0');
INSERT INTO `sys_job_log` VALUES (908, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:22:30', '', NULL, '', '2025-01-21 16:22:30', NULL, '2025-01-21 16:22:30', b'0');
INSERT INTO `sys_job_log` VALUES (909, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:22:40', '', NULL, '', '2025-01-21 16:22:40', NULL, '2025-01-21 16:22:40', b'0');
INSERT INTO `sys_job_log` VALUES (910, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:22:50', '', NULL, '', '2025-01-21 16:22:50', NULL, '2025-01-21 16:22:50', b'0');
INSERT INTO `sys_job_log` VALUES (911, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:23:00', '', NULL, '', '2025-01-21 16:23:00', NULL, '2025-01-21 16:23:00', b'0');
INSERT INTO `sys_job_log` VALUES (912, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:23:10', '', NULL, '', '2025-01-21 16:23:10', NULL, '2025-01-21 16:23:10', b'0');
INSERT INTO `sys_job_log` VALUES (913, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:23:20', '', NULL, '', '2025-01-21 16:23:20', NULL, '2025-01-21 16:23:20', b'0');
INSERT INTO `sys_job_log` VALUES (914, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:23:30', '', NULL, '', '2025-01-21 16:23:30', NULL, '2025-01-21 16:23:30', b'0');
INSERT INTO `sys_job_log` VALUES (915, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:23:40', '', NULL, '', '2025-01-21 16:23:40', NULL, '2025-01-21 16:23:40', b'0');
INSERT INTO `sys_job_log` VALUES (916, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:23:50', '', NULL, '', '2025-01-21 16:23:50', NULL, '2025-01-21 16:23:50', b'0');
INSERT INTO `sys_job_log` VALUES (917, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:24:00', '', NULL, '', '2025-01-21 16:24:00', NULL, '2025-01-21 16:24:00', b'0');
INSERT INTO `sys_job_log` VALUES (918, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:24:10', '', NULL, '', '2025-01-21 16:24:10', NULL, '2025-01-21 16:24:10', b'0');
INSERT INTO `sys_job_log` VALUES (919, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:24:20', '', NULL, '', '2025-01-21 16:24:20', NULL, '2025-01-21 16:24:20', b'0');
INSERT INTO `sys_job_log` VALUES (920, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:24:30', '', NULL, '', '2025-01-21 16:24:30', NULL, '2025-01-21 16:24:30', b'0');
INSERT INTO `sys_job_log` VALUES (921, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:24:40', '', NULL, '', '2025-01-21 16:24:40', NULL, '2025-01-21 16:24:40', b'0');
INSERT INTO `sys_job_log` VALUES (922, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:24:50', '', NULL, '', '2025-01-21 16:24:50', NULL, '2025-01-21 16:24:50', b'0');
INSERT INTO `sys_job_log` VALUES (923, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:25:00', '', NULL, '', '2025-01-21 16:25:00', NULL, '2025-01-21 16:25:00', b'0');
INSERT INTO `sys_job_log` VALUES (924, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:25:10', '', NULL, '', '2025-01-21 16:25:10', NULL, '2025-01-21 16:25:10', b'0');
INSERT INTO `sys_job_log` VALUES (925, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:25:20', '', NULL, '', '2025-01-21 16:25:20', NULL, '2025-01-21 16:25:20', b'0');
INSERT INTO `sys_job_log` VALUES (926, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:25:30', '', NULL, '', '2025-01-21 16:25:30', NULL, '2025-01-21 16:25:30', b'0');
INSERT INTO `sys_job_log` VALUES (927, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:25:40', '', NULL, '', '2025-01-21 16:25:40', NULL, '2025-01-21 16:25:40', b'0');
INSERT INTO `sys_job_log` VALUES (928, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:25:50', '', NULL, '', '2025-01-21 16:25:50', NULL, '2025-01-21 16:25:50', b'0');
INSERT INTO `sys_job_log` VALUES (929, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:26:00', '', NULL, '', '2025-01-21 16:26:00', NULL, '2025-01-21 16:26:00', b'0');
INSERT INTO `sys_job_log` VALUES (930, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:26:10', '', NULL, '', '2025-01-21 16:26:10', NULL, '2025-01-21 16:26:10', b'0');
INSERT INTO `sys_job_log` VALUES (931, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:26:20', '', NULL, '', '2025-01-21 16:26:20', NULL, '2025-01-21 16:26:20', b'0');
INSERT INTO `sys_job_log` VALUES (932, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:26:30', '', NULL, '', '2025-01-21 16:26:30', NULL, '2025-01-21 16:26:30', b'0');
INSERT INTO `sys_job_log` VALUES (933, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:26:40', '', NULL, '', '2025-01-21 16:26:40', NULL, '2025-01-21 16:26:40', b'0');
INSERT INTO `sys_job_log` VALUES (934, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:26:50', '', NULL, '', '2025-01-21 16:26:50', NULL, '2025-01-21 16:26:50', b'0');
INSERT INTO `sys_job_log` VALUES (935, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:27:00', '', NULL, '', '2025-01-21 16:27:00', NULL, '2025-01-21 16:27:00', b'0');
INSERT INTO `sys_job_log` VALUES (936, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:27:10', '', NULL, '', '2025-01-21 16:27:10', NULL, '2025-01-21 16:27:10', b'0');
INSERT INTO `sys_job_log` VALUES (937, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:27:20', '', NULL, '', '2025-01-21 16:27:20', NULL, '2025-01-21 16:27:20', b'0');
INSERT INTO `sys_job_log` VALUES (938, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:27:30', '', NULL, '', '2025-01-21 16:27:30', NULL, '2025-01-21 16:27:30', b'0');
INSERT INTO `sys_job_log` VALUES (939, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:27:40', '', NULL, '', '2025-01-21 16:27:40', NULL, '2025-01-21 16:27:40', b'0');
INSERT INTO `sys_job_log` VALUES (940, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:27:50', '', NULL, '', '2025-01-21 16:27:50', NULL, '2025-01-21 16:27:50', b'0');
INSERT INTO `sys_job_log` VALUES (941, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:28:00', '', NULL, '', '2025-01-21 16:28:00', NULL, '2025-01-21 16:28:00', b'0');
INSERT INTO `sys_job_log` VALUES (942, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:28:10', '', NULL, '', '2025-01-21 16:28:10', NULL, '2025-01-21 16:28:10', b'0');
INSERT INTO `sys_job_log` VALUES (943, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:28:20', '', NULL, '', '2025-01-21 16:28:20', NULL, '2025-01-21 16:28:20', b'0');
INSERT INTO `sys_job_log` VALUES (944, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:28:30', '', NULL, '', '2025-01-21 16:28:30', NULL, '2025-01-21 16:28:30', b'0');
INSERT INTO `sys_job_log` VALUES (945, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:28:40', '', NULL, '', '2025-01-21 16:28:40', NULL, '2025-01-21 16:28:40', b'0');
INSERT INTO `sys_job_log` VALUES (946, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:28:50', '', NULL, '', '2025-01-21 16:28:50', NULL, '2025-01-21 16:28:50', b'0');
INSERT INTO `sys_job_log` VALUES (947, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:29:00', '', NULL, '', '2025-01-21 16:29:00', NULL, '2025-01-21 16:29:00', b'0');
INSERT INTO `sys_job_log` VALUES (948, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:29:10', '', NULL, '', '2025-01-21 16:29:10', NULL, '2025-01-21 16:29:10', b'0');
INSERT INTO `sys_job_log` VALUES (949, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:29:20', '', NULL, '', '2025-01-21 16:29:20', NULL, '2025-01-21 16:29:20', b'0');
INSERT INTO `sys_job_log` VALUES (950, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:29:30', '', NULL, '', '2025-01-21 16:29:30', NULL, '2025-01-21 16:29:30', b'0');
INSERT INTO `sys_job_log` VALUES (951, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:29:40', '', NULL, '', '2025-01-21 16:29:40', NULL, '2025-01-21 16:29:40', b'0');
INSERT INTO `sys_job_log` VALUES (952, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:29:50', '', NULL, '', '2025-01-21 16:29:50', NULL, '2025-01-21 16:29:50', b'0');
INSERT INTO `sys_job_log` VALUES (953, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:30:00', '', NULL, '', '2025-01-21 16:30:00', NULL, '2025-01-21 16:30:00', b'0');
INSERT INTO `sys_job_log` VALUES (954, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:30:10', '', NULL, '', '2025-01-21 16:30:10', NULL, '2025-01-21 16:30:10', b'0');
INSERT INTO `sys_job_log` VALUES (955, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:30:20', '', NULL, '', '2025-01-21 16:30:20', NULL, '2025-01-21 16:30:20', b'0');
INSERT INTO `sys_job_log` VALUES (956, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:30:30', '', NULL, '', '2025-01-21 16:30:30', NULL, '2025-01-21 16:30:30', b'0');
INSERT INTO `sys_job_log` VALUES (957, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:30:40', '', NULL, '', '2025-01-21 16:30:40', NULL, '2025-01-21 16:30:40', b'0');
INSERT INTO `sys_job_log` VALUES (958, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:30:50', '', NULL, '', '2025-01-21 16:30:50', NULL, '2025-01-21 16:30:50', b'0');
INSERT INTO `sys_job_log` VALUES (959, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:31:00', '', NULL, '', '2025-01-21 16:31:00', NULL, '2025-01-21 16:31:00', b'0');
INSERT INTO `sys_job_log` VALUES (960, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:31:10', '', NULL, '', '2025-01-21 16:31:10', NULL, '2025-01-21 16:31:10', b'0');
INSERT INTO `sys_job_log` VALUES (961, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:31:20', '', NULL, '', '2025-01-21 16:31:20', NULL, '2025-01-21 16:31:20', b'0');
INSERT INTO `sys_job_log` VALUES (962, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:31:30', '', NULL, '', '2025-01-21 16:31:30', NULL, '2025-01-21 16:31:30', b'0');
INSERT INTO `sys_job_log` VALUES (963, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:31:40', '', NULL, '', '2025-01-21 16:31:40', NULL, '2025-01-21 16:31:40', b'0');
INSERT INTO `sys_job_log` VALUES (964, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:31:50', '', NULL, '', '2025-01-21 16:31:50', NULL, '2025-01-21 16:31:50', b'0');
INSERT INTO `sys_job_log` VALUES (965, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:32:00', '', NULL, '', '2025-01-21 16:32:00', NULL, '2025-01-21 16:32:00', b'0');
INSERT INTO `sys_job_log` VALUES (966, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:32:10', '', NULL, '', '2025-01-21 16:32:10', NULL, '2025-01-21 16:32:10', b'0');
INSERT INTO `sys_job_log` VALUES (967, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:32:20', '', NULL, '', '2025-01-21 16:32:20', NULL, '2025-01-21 16:32:20', b'0');
INSERT INTO `sys_job_log` VALUES (968, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:32:30', '', NULL, '', '2025-01-21 16:32:30', NULL, '2025-01-21 16:32:30', b'0');
INSERT INTO `sys_job_log` VALUES (969, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:32:40', '', NULL, '', '2025-01-21 16:32:40', NULL, '2025-01-21 16:32:40', b'0');
INSERT INTO `sys_job_log` VALUES (970, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:32:50', '', NULL, '', '2025-01-21 16:32:50', NULL, '2025-01-21 16:32:50', b'0');
INSERT INTO `sys_job_log` VALUES (971, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:33:00', '', NULL, '', '2025-01-21 16:33:00', NULL, '2025-01-21 16:33:00', b'0');
INSERT INTO `sys_job_log` VALUES (972, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:33:10', '', NULL, '', '2025-01-21 16:33:10', NULL, '2025-01-21 16:33:10', b'0');
INSERT INTO `sys_job_log` VALUES (973, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:33:20', '', NULL, '', '2025-01-21 16:33:20', NULL, '2025-01-21 16:33:20', b'0');
INSERT INTO `sys_job_log` VALUES (974, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:33:30', '', NULL, '', '2025-01-21 16:33:30', NULL, '2025-01-21 16:33:30', b'0');
INSERT INTO `sys_job_log` VALUES (975, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:33:40', '', NULL, '', '2025-01-21 16:33:40', NULL, '2025-01-21 16:33:40', b'0');
INSERT INTO `sys_job_log` VALUES (976, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:33:50', '', NULL, '', '2025-01-21 16:33:50', NULL, '2025-01-21 16:33:50', b'0');
INSERT INTO `sys_job_log` VALUES (977, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:34:00', '', NULL, '', '2025-01-21 16:34:00', NULL, '2025-01-21 16:34:00', b'0');
INSERT INTO `sys_job_log` VALUES (978, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:34:10', '', NULL, '', '2025-01-21 16:34:10', NULL, '2025-01-21 16:34:10', b'0');
INSERT INTO `sys_job_log` VALUES (979, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:34:20', '', NULL, '', '2025-01-21 16:34:20', NULL, '2025-01-21 16:34:20', b'0');
INSERT INTO `sys_job_log` VALUES (980, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:34:30', '', NULL, '', '2025-01-21 16:34:30', NULL, '2025-01-21 16:34:30', b'0');
INSERT INTO `sys_job_log` VALUES (981, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:34:40', '', NULL, '', '2025-01-21 16:34:40', NULL, '2025-01-21 16:34:40', b'0');
INSERT INTO `sys_job_log` VALUES (982, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:34:50', '', NULL, '', '2025-01-21 16:34:50', NULL, '2025-01-21 16:34:50', b'0');
INSERT INTO `sys_job_log` VALUES (983, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:35:00', '', NULL, '', '2025-01-21 16:35:00', NULL, '2025-01-21 16:35:00', b'0');
INSERT INTO `sys_job_log` VALUES (984, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:35:10', '', NULL, '', '2025-01-21 16:35:10', NULL, '2025-01-21 16:35:10', b'0');
INSERT INTO `sys_job_log` VALUES (985, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:35:20', '', NULL, '', '2025-01-21 16:35:20', NULL, '2025-01-21 16:35:20', b'0');
INSERT INTO `sys_job_log` VALUES (986, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:35:30', '', NULL, '', '2025-01-21 16:35:30', NULL, '2025-01-21 16:35:30', b'0');
INSERT INTO `sys_job_log` VALUES (987, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:35:40', '', NULL, '', '2025-01-21 16:35:40', NULL, '2025-01-21 16:35:40', b'0');
INSERT INTO `sys_job_log` VALUES (988, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:35:50', '', NULL, '', '2025-01-21 16:35:50', NULL, '2025-01-21 16:35:50', b'0');
INSERT INTO `sys_job_log` VALUES (989, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:36:00', '', NULL, '', '2025-01-21 16:36:00', NULL, '2025-01-21 16:36:00', b'0');
INSERT INTO `sys_job_log` VALUES (990, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:36:10', '', NULL, '', '2025-01-21 16:36:10', NULL, '2025-01-21 16:36:10', b'0');
INSERT INTO `sys_job_log` VALUES (991, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:36:20', '', NULL, '', '2025-01-21 16:36:20', NULL, '2025-01-21 16:36:20', b'0');
INSERT INTO `sys_job_log` VALUES (992, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:36:30', '', NULL, '', '2025-01-21 16:36:30', NULL, '2025-01-21 16:36:30', b'0');
INSERT INTO `sys_job_log` VALUES (993, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:36:40', '', NULL, '', '2025-01-21 16:36:40', NULL, '2025-01-21 16:36:40', b'0');
INSERT INTO `sys_job_log` VALUES (994, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:36:50', '', NULL, '', '2025-01-21 16:36:50', NULL, '2025-01-21 16:36:50', b'0');
INSERT INTO `sys_job_log` VALUES (995, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:37:00', '', NULL, '', '2025-01-21 16:37:00', NULL, '2025-01-21 16:37:00', b'0');
INSERT INTO `sys_job_log` VALUES (996, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:37:10', '', NULL, '', '2025-01-21 16:37:10', NULL, '2025-01-21 16:37:10', b'0');
INSERT INTO `sys_job_log` VALUES (997, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:37:20', '', NULL, '', '2025-01-21 16:37:20', NULL, '2025-01-21 16:37:20', b'0');
INSERT INTO `sys_job_log` VALUES (998, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:37:30', '', NULL, '', '2025-01-21 16:37:30', NULL, '2025-01-21 16:37:30', b'0');
INSERT INTO `sys_job_log` VALUES (999, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:37:40', '', NULL, '', '2025-01-21 16:37:40', NULL, '2025-01-21 16:37:40', b'0');
INSERT INTO `sys_job_log` VALUES (1000, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:37:50', '', NULL, '', '2025-01-21 16:37:50', NULL, '2025-01-21 16:37:50', b'0');
INSERT INTO `sys_job_log` VALUES (1001, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-21 16:38:00', '', NULL, '', '2025-01-21 16:38:00', NULL, '2025-01-21 16:38:00', b'0');
INSERT INTO `sys_job_log` VALUES (1002, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:38:10', '', NULL, '', '2025-01-21 16:38:10', NULL, '2025-01-21 16:38:10', b'0');
INSERT INTO `sys_job_log` VALUES (1003, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:38:20', '', NULL, '', '2025-01-21 16:38:20', NULL, '2025-01-21 16:38:20', b'0');
INSERT INTO `sys_job_log` VALUES (1004, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:38:30', '', NULL, '', '2025-01-21 16:38:30', NULL, '2025-01-21 16:38:30', b'0');
INSERT INTO `sys_job_log` VALUES (1005, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:38:40', '', NULL, '', '2025-01-21 16:38:40', NULL, '2025-01-21 16:38:40', b'0');
INSERT INTO `sys_job_log` VALUES (1006, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:38:50', '', NULL, '', '2025-01-21 16:38:50', NULL, '2025-01-21 16:38:50', b'0');
INSERT INTO `sys_job_log` VALUES (1007, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:39:00', '', NULL, '', '2025-01-21 16:39:00', NULL, '2025-01-21 16:39:00', b'0');
INSERT INTO `sys_job_log` VALUES (1008, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:39:10', '', NULL, '', '2025-01-21 16:39:10', NULL, '2025-01-21 16:39:10', b'0');
INSERT INTO `sys_job_log` VALUES (1009, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:39:20', '', NULL, '', '2025-01-21 16:39:20', NULL, '2025-01-21 16:39:20', b'0');
INSERT INTO `sys_job_log` VALUES (1010, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:39:30', '', NULL, '', '2025-01-21 16:39:30', NULL, '2025-01-21 16:39:30', b'0');
INSERT INTO `sys_job_log` VALUES (1011, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:39:40', '', NULL, '', '2025-01-21 16:39:40', NULL, '2025-01-21 16:39:40', b'0');
INSERT INTO `sys_job_log` VALUES (1012, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:39:50', '', NULL, '', '2025-01-21 16:39:50', NULL, '2025-01-21 16:39:50', b'0');
INSERT INTO `sys_job_log` VALUES (1013, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:40:00', '', NULL, '', '2025-01-21 16:40:00', NULL, '2025-01-21 16:40:00', b'0');
INSERT INTO `sys_job_log` VALUES (1014, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:40:10', '', NULL, '', '2025-01-21 16:40:10', NULL, '2025-01-21 16:40:10', b'0');
INSERT INTO `sys_job_log` VALUES (1015, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:40:20', '', NULL, '', '2025-01-21 16:40:20', NULL, '2025-01-21 16:40:20', b'0');
INSERT INTO `sys_job_log` VALUES (1016, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:40:30', '', NULL, '', '2025-01-21 16:40:30', NULL, '2025-01-21 16:40:30', b'0');
INSERT INTO `sys_job_log` VALUES (1017, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:40:40', '', NULL, '', '2025-01-21 16:40:40', NULL, '2025-01-21 16:40:40', b'0');
INSERT INTO `sys_job_log` VALUES (1018, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:40:50', '', NULL, '', '2025-01-21 16:40:50', NULL, '2025-01-21 16:40:50', b'0');
INSERT INTO `sys_job_log` VALUES (1019, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:41:00', '', NULL, '', '2025-01-21 16:41:00', NULL, '2025-01-21 16:41:00', b'0');
INSERT INTO `sys_job_log` VALUES (1020, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:41:10', '', NULL, '', '2025-01-21 16:41:10', NULL, '2025-01-21 16:41:10', b'0');
INSERT INTO `sys_job_log` VALUES (1021, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:41:20', '', NULL, '', '2025-01-21 16:41:20', NULL, '2025-01-21 16:41:20', b'0');
INSERT INTO `sys_job_log` VALUES (1022, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:41:30', '', NULL, '', '2025-01-21 16:41:30', NULL, '2025-01-21 16:41:30', b'0');
INSERT INTO `sys_job_log` VALUES (1023, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:41:40', '', NULL, '', '2025-01-21 16:41:40', NULL, '2025-01-21 16:41:40', b'0');
INSERT INTO `sys_job_log` VALUES (1024, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:41:50', '', NULL, '', '2025-01-21 16:41:50', NULL, '2025-01-21 16:41:50', b'0');
INSERT INTO `sys_job_log` VALUES (1025, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:42:00', '', NULL, '', '2025-01-21 16:42:00', NULL, '2025-01-21 16:42:00', b'0');
INSERT INTO `sys_job_log` VALUES (1026, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:42:10', '', NULL, '', '2025-01-21 16:42:10', NULL, '2025-01-21 16:42:10', b'0');
INSERT INTO `sys_job_log` VALUES (1027, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:42:20', '', NULL, '', '2025-01-21 16:42:20', NULL, '2025-01-21 16:42:20', b'0');
INSERT INTO `sys_job_log` VALUES (1028, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:42:30', '', NULL, '', '2025-01-21 16:42:30', NULL, '2025-01-21 16:42:30', b'0');
INSERT INTO `sys_job_log` VALUES (1029, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:42:40', '', NULL, '', '2025-01-21 16:42:40', NULL, '2025-01-21 16:42:40', b'0');
INSERT INTO `sys_job_log` VALUES (1030, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:42:50', '', NULL, '', '2025-01-21 16:42:50', NULL, '2025-01-21 16:42:50', b'0');
INSERT INTO `sys_job_log` VALUES (1031, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:43:00', '', NULL, '', '2025-01-21 16:43:00', NULL, '2025-01-21 16:43:00', b'0');
INSERT INTO `sys_job_log` VALUES (1032, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:43:10', '', NULL, '', '2025-01-21 16:43:10', NULL, '2025-01-21 16:43:10', b'0');
INSERT INTO `sys_job_log` VALUES (1033, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:43:20', '', NULL, '', '2025-01-21 16:43:20', NULL, '2025-01-21 16:43:20', b'0');
INSERT INTO `sys_job_log` VALUES (1034, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:43:30', '', NULL, '', '2025-01-21 16:43:30', NULL, '2025-01-21 16:43:30', b'0');
INSERT INTO `sys_job_log` VALUES (1035, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:43:40', '', NULL, '', '2025-01-21 16:43:40', NULL, '2025-01-21 16:43:40', b'0');
INSERT INTO `sys_job_log` VALUES (1036, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:43:50', '', NULL, '', '2025-01-21 16:43:50', NULL, '2025-01-21 16:43:50', b'0');
INSERT INTO `sys_job_log` VALUES (1037, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:44:00', '', NULL, '', '2025-01-21 16:44:00', NULL, '2025-01-21 16:44:00', b'0');
INSERT INTO `sys_job_log` VALUES (1038, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:44:10', '', NULL, '', '2025-01-21 16:44:10', NULL, '2025-01-21 16:44:10', b'0');
INSERT INTO `sys_job_log` VALUES (1039, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:44:20', '', NULL, '', '2025-01-21 16:44:20', NULL, '2025-01-21 16:44:20', b'0');
INSERT INTO `sys_job_log` VALUES (1040, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:44:30', '', NULL, '', '2025-01-21 16:44:30', NULL, '2025-01-21 16:44:30', b'0');
INSERT INTO `sys_job_log` VALUES (1041, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:44:40', '', NULL, '', '2025-01-21 16:44:40', NULL, '2025-01-21 16:44:40', b'0');
INSERT INTO `sys_job_log` VALUES (1042, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:44:50', '', NULL, '', '2025-01-21 16:44:50', NULL, '2025-01-21 16:44:50', b'0');
INSERT INTO `sys_job_log` VALUES (1043, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:45:00', '', NULL, '', '2025-01-21 16:45:00', NULL, '2025-01-21 16:45:00', b'0');
INSERT INTO `sys_job_log` VALUES (1044, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:45:10', '', NULL, '', '2025-01-21 16:45:10', NULL, '2025-01-21 16:45:10', b'0');
INSERT INTO `sys_job_log` VALUES (1045, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:45:20', '', NULL, '', '2025-01-21 16:45:20', NULL, '2025-01-21 16:45:20', b'0');
INSERT INTO `sys_job_log` VALUES (1046, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:45:30', '', NULL, '', '2025-01-21 16:45:30', NULL, '2025-01-21 16:45:30', b'0');
INSERT INTO `sys_job_log` VALUES (1047, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:45:40', '', NULL, '', '2025-01-21 16:45:40', NULL, '2025-01-21 16:45:40', b'0');
INSERT INTO `sys_job_log` VALUES (1048, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:45:50', '', NULL, '', '2025-01-21 16:45:50', NULL, '2025-01-21 16:45:50', b'0');
INSERT INTO `sys_job_log` VALUES (1049, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:46:00', '', NULL, '', '2025-01-21 16:46:00', NULL, '2025-01-21 16:46:00', b'0');
INSERT INTO `sys_job_log` VALUES (1050, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:46:10', '', NULL, '', '2025-01-21 16:46:10', NULL, '2025-01-21 16:46:10', b'0');
INSERT INTO `sys_job_log` VALUES (1051, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:46:20', '', NULL, '', '2025-01-21 16:46:20', NULL, '2025-01-21 16:46:20', b'0');
INSERT INTO `sys_job_log` VALUES (1052, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:46:30', '', NULL, '', '2025-01-21 16:46:30', NULL, '2025-01-21 16:46:30', b'0');
INSERT INTO `sys_job_log` VALUES (1053, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:46:40', '', NULL, '', '2025-01-21 16:46:40', NULL, '2025-01-21 16:46:40', b'0');
INSERT INTO `sys_job_log` VALUES (1054, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:46:50', '', NULL, '', '2025-01-21 16:46:50', NULL, '2025-01-21 16:46:50', b'0');
INSERT INTO `sys_job_log` VALUES (1055, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:47:00', '', NULL, '', '2025-01-21 16:47:00', NULL, '2025-01-21 16:47:00', b'0');
INSERT INTO `sys_job_log` VALUES (1056, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:47:10', '', NULL, '', '2025-01-21 16:47:10', NULL, '2025-01-21 16:47:10', b'0');
INSERT INTO `sys_job_log` VALUES (1057, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:47:20', '', NULL, '', '2025-01-21 16:47:20', NULL, '2025-01-21 16:47:20', b'0');
INSERT INTO `sys_job_log` VALUES (1058, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:47:30', '', NULL, '', '2025-01-21 16:47:30', NULL, '2025-01-21 16:47:30', b'0');
INSERT INTO `sys_job_log` VALUES (1059, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:47:40', '', NULL, '', '2025-01-21 16:47:40', NULL, '2025-01-21 16:47:40', b'0');
INSERT INTO `sys_job_log` VALUES (1060, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:47:50', '', NULL, '', '2025-01-21 16:47:50', NULL, '2025-01-21 16:47:50', b'0');
INSERT INTO `sys_job_log` VALUES (1061, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:48:00', '', NULL, '', '2025-01-21 16:48:00', NULL, '2025-01-21 16:48:00', b'0');
INSERT INTO `sys_job_log` VALUES (1062, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:48:10', '', NULL, '', '2025-01-21 16:48:10', NULL, '2025-01-21 16:48:10', b'0');
INSERT INTO `sys_job_log` VALUES (1063, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:48:20', '', NULL, '', '2025-01-21 16:48:20', NULL, '2025-01-21 16:48:20', b'0');
INSERT INTO `sys_job_log` VALUES (1064, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:48:30', '', NULL, '', '2025-01-21 16:48:30', NULL, '2025-01-21 16:48:30', b'0');
INSERT INTO `sys_job_log` VALUES (1065, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:48:40', '', NULL, '', '2025-01-21 16:48:40', NULL, '2025-01-21 16:48:40', b'0');
INSERT INTO `sys_job_log` VALUES (1066, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:48:50', '', NULL, '', '2025-01-21 16:48:50', NULL, '2025-01-21 16:48:50', b'0');
INSERT INTO `sys_job_log` VALUES (1067, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:49:00', '', NULL, '', '2025-01-21 16:49:00', NULL, '2025-01-21 16:49:00', b'0');
INSERT INTO `sys_job_log` VALUES (1068, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:49:10', '', NULL, '', '2025-01-21 16:49:10', NULL, '2025-01-21 16:49:10', b'0');
INSERT INTO `sys_job_log` VALUES (1069, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:49:20', '', NULL, '', '2025-01-21 16:49:20', NULL, '2025-01-21 16:49:20', b'0');
INSERT INTO `sys_job_log` VALUES (1070, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:49:30', '', NULL, '', '2025-01-21 16:49:30', NULL, '2025-01-21 16:49:30', b'0');
INSERT INTO `sys_job_log` VALUES (1071, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:49:40', '', NULL, '', '2025-01-21 16:49:40', NULL, '2025-01-21 16:49:40', b'0');
INSERT INTO `sys_job_log` VALUES (1072, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:49:50', '', NULL, '', '2025-01-21 16:49:50', NULL, '2025-01-21 16:49:50', b'0');
INSERT INTO `sys_job_log` VALUES (1073, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:50:00', '', NULL, '', '2025-01-21 16:50:00', NULL, '2025-01-21 16:50:00', b'0');
INSERT INTO `sys_job_log` VALUES (1074, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:50:10', '', NULL, '', '2025-01-21 16:50:10', NULL, '2025-01-21 16:50:10', b'0');
INSERT INTO `sys_job_log` VALUES (1075, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:50:20', '', NULL, '', '2025-01-21 16:50:20', NULL, '2025-01-21 16:50:20', b'0');
INSERT INTO `sys_job_log` VALUES (1076, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:50:30', '', NULL, '', '2025-01-21 16:50:30', NULL, '2025-01-21 16:50:30', b'0');
INSERT INTO `sys_job_log` VALUES (1077, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:50:40', '', NULL, '', '2025-01-21 16:50:40', NULL, '2025-01-21 16:50:40', b'0');
INSERT INTO `sys_job_log` VALUES (1078, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:50:50', '', NULL, '', '2025-01-21 16:50:50', NULL, '2025-01-21 16:50:50', b'0');
INSERT INTO `sys_job_log` VALUES (1079, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:51:00', '', NULL, '', '2025-01-21 16:51:00', NULL, '2025-01-21 16:51:00', b'0');
INSERT INTO `sys_job_log` VALUES (1080, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:51:10', '', NULL, '', '2025-01-21 16:51:10', NULL, '2025-01-21 16:51:10', b'0');
INSERT INTO `sys_job_log` VALUES (1081, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:51:20', '', NULL, '', '2025-01-21 16:51:20', NULL, '2025-01-21 16:51:20', b'0');
INSERT INTO `sys_job_log` VALUES (1082, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:51:30', '', NULL, '', '2025-01-21 16:51:30', NULL, '2025-01-21 16:51:30', b'0');
INSERT INTO `sys_job_log` VALUES (1083, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:51:40', '', NULL, '', '2025-01-21 16:51:40', NULL, '2025-01-21 16:51:40', b'0');
INSERT INTO `sys_job_log` VALUES (1084, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:51:50', '', NULL, '', '2025-01-21 16:51:50', NULL, '2025-01-21 16:51:50', b'0');
INSERT INTO `sys_job_log` VALUES (1085, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:52:00', '', NULL, '', '2025-01-21 16:52:00', NULL, '2025-01-21 16:52:00', b'0');
INSERT INTO `sys_job_log` VALUES (1086, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:52:10', '', NULL, '', '2025-01-21 16:52:10', NULL, '2025-01-21 16:52:10', b'0');
INSERT INTO `sys_job_log` VALUES (1087, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:52:20', '', NULL, '', '2025-01-21 16:52:20', NULL, '2025-01-21 16:52:20', b'0');
INSERT INTO `sys_job_log` VALUES (1088, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:52:30', '', NULL, '', '2025-01-21 16:52:30', NULL, '2025-01-21 16:52:30', b'0');
INSERT INTO `sys_job_log` VALUES (1089, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:52:40', '', NULL, '', '2025-01-21 16:52:40', NULL, '2025-01-21 16:52:40', b'0');
INSERT INTO `sys_job_log` VALUES (1090, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:52:50', '', NULL, '', '2025-01-21 16:52:50', NULL, '2025-01-21 16:52:50', b'0');
INSERT INTO `sys_job_log` VALUES (1091, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:53:00', '', NULL, '', '2025-01-21 16:53:00', NULL, '2025-01-21 16:53:00', b'0');
INSERT INTO `sys_job_log` VALUES (1092, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:53:10', '', NULL, '', '2025-01-21 16:53:10', NULL, '2025-01-21 16:53:10', b'0');
INSERT INTO `sys_job_log` VALUES (1093, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:53:20', '', NULL, '', '2025-01-21 16:53:20', NULL, '2025-01-21 16:53:20', b'0');
INSERT INTO `sys_job_log` VALUES (1094, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:53:30', '', NULL, '', '2025-01-21 16:53:30', NULL, '2025-01-21 16:53:30', b'0');
INSERT INTO `sys_job_log` VALUES (1095, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:53:40', '', NULL, '', '2025-01-21 16:53:40', NULL, '2025-01-21 16:53:40', b'0');
INSERT INTO `sys_job_log` VALUES (1096, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:53:50', '', NULL, '', '2025-01-21 16:53:50', NULL, '2025-01-21 16:53:50', b'0');
INSERT INTO `sys_job_log` VALUES (1097, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:54:00', '', NULL, '', '2025-01-21 16:54:00', NULL, '2025-01-21 16:54:00', b'0');
INSERT INTO `sys_job_log` VALUES (1098, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:54:10', '', NULL, '', '2025-01-21 16:54:10', NULL, '2025-01-21 16:54:10', b'0');
INSERT INTO `sys_job_log` VALUES (1099, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:54:20', '', NULL, '', '2025-01-21 16:54:20', NULL, '2025-01-21 16:54:20', b'0');
INSERT INTO `sys_job_log` VALUES (1100, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:54:30', '', NULL, '', '2025-01-21 16:54:30', NULL, '2025-01-21 16:54:30', b'0');
INSERT INTO `sys_job_log` VALUES (1101, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:54:40', '', NULL, '', '2025-01-21 16:54:40', NULL, '2025-01-21 16:54:40', b'0');
INSERT INTO `sys_job_log` VALUES (1102, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:54:50', '', NULL, '', '2025-01-21 16:54:50', NULL, '2025-01-21 16:54:50', b'0');
INSERT INTO `sys_job_log` VALUES (1103, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:55:00', '', NULL, '', '2025-01-21 16:55:00', NULL, '2025-01-21 16:55:00', b'0');
INSERT INTO `sys_job_log` VALUES (1104, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:55:10', '', NULL, '', '2025-01-21 16:55:10', NULL, '2025-01-21 16:55:10', b'0');
INSERT INTO `sys_job_log` VALUES (1105, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:55:20', '', NULL, '', '2025-01-21 16:55:20', NULL, '2025-01-21 16:55:20', b'0');
INSERT INTO `sys_job_log` VALUES (1106, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:55:30', '', NULL, '', '2025-01-21 16:55:30', NULL, '2025-01-21 16:55:30', b'0');
INSERT INTO `sys_job_log` VALUES (1107, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:55:40', '', NULL, '', '2025-01-21 16:55:40', NULL, '2025-01-21 16:55:40', b'0');
INSERT INTO `sys_job_log` VALUES (1108, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:55:50', '', NULL, '', '2025-01-21 16:55:50', NULL, '2025-01-21 16:55:50', b'0');
INSERT INTO `sys_job_log` VALUES (1109, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:56:00', '', NULL, '', '2025-01-21 16:56:00', NULL, '2025-01-21 16:56:00', b'0');
INSERT INTO `sys_job_log` VALUES (1110, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:56:10', '', NULL, '', '2025-01-21 16:56:10', NULL, '2025-01-21 16:56:10', b'0');
INSERT INTO `sys_job_log` VALUES (1111, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:56:20', '', NULL, '', '2025-01-21 16:56:20', NULL, '2025-01-21 16:56:20', b'0');
INSERT INTO `sys_job_log` VALUES (1112, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:56:30', '', NULL, '', '2025-01-21 16:56:30', NULL, '2025-01-21 16:56:30', b'0');
INSERT INTO `sys_job_log` VALUES (1113, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:56:40', '', NULL, '', '2025-01-21 16:56:40', NULL, '2025-01-21 16:56:40', b'0');
INSERT INTO `sys_job_log` VALUES (1114, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:56:50', '', NULL, '', '2025-01-21 16:56:50', NULL, '2025-01-21 16:56:50', b'0');
INSERT INTO `sys_job_log` VALUES (1115, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:57:00', '', NULL, '', '2025-01-21 16:57:00', NULL, '2025-01-21 16:57:00', b'0');
INSERT INTO `sys_job_log` VALUES (1116, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:57:10', '', NULL, '', '2025-01-21 16:57:10', NULL, '2025-01-21 16:57:10', b'0');
INSERT INTO `sys_job_log` VALUES (1117, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:57:20', '', NULL, '', '2025-01-21 16:57:20', NULL, '2025-01-21 16:57:20', b'0');
INSERT INTO `sys_job_log` VALUES (1118, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：3毫秒', '0', '2025-01-21 16:57:30', '', NULL, '', '2025-01-21 16:57:30', NULL, '2025-01-21 16:57:30', b'0');
INSERT INTO `sys_job_log` VALUES (1119, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:57:40', '', NULL, '', '2025-01-21 16:57:40', NULL, '2025-01-21 16:57:40', b'0');
INSERT INTO `sys_job_log` VALUES (1120, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:57:50', '', NULL, '', '2025-01-21 16:57:50', NULL, '2025-01-21 16:57:50', b'0');
INSERT INTO `sys_job_log` VALUES (1121, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:58:00', '', NULL, '', '2025-01-21 16:58:00', NULL, '2025-01-21 16:58:00', b'0');
INSERT INTO `sys_job_log` VALUES (1122, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:58:10', '', NULL, '', '2025-01-21 16:58:10', NULL, '2025-01-21 16:58:10', b'0');
INSERT INTO `sys_job_log` VALUES (1123, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-21 16:58:20', '', NULL, '', '2025-01-21 16:58:20', NULL, '2025-01-21 16:58:20', b'0');
INSERT INTO `sys_job_log` VALUES (1124, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:58:30', '', NULL, '', '2025-01-21 16:58:30', NULL, '2025-01-21 16:58:30', b'0');
INSERT INTO `sys_job_log` VALUES (1125, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:58:40', '', NULL, '', '2025-01-21 16:58:40', NULL, '2025-01-21 16:58:40', b'0');
INSERT INTO `sys_job_log` VALUES (1126, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:58:50', '', NULL, '', '2025-01-21 16:58:50', NULL, '2025-01-21 16:58:50', b'0');
INSERT INTO `sys_job_log` VALUES (1127, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:59:00', '', NULL, '', '2025-01-21 16:59:00', NULL, '2025-01-21 16:59:00', b'0');
INSERT INTO `sys_job_log` VALUES (1128, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:59:10', '', NULL, '', '2025-01-21 16:59:10', NULL, '2025-01-21 16:59:10', b'0');
INSERT INTO `sys_job_log` VALUES (1129, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 16:59:20', '', NULL, '', '2025-01-21 16:59:20', NULL, '2025-01-21 16:59:20', b'0');
INSERT INTO `sys_job_log` VALUES (1130, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:59:30', '', NULL, '', '2025-01-21 16:59:30', NULL, '2025-01-21 16:59:30', b'0');
INSERT INTO `sys_job_log` VALUES (1131, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:59:40', '', NULL, '', '2025-01-21 16:59:40', NULL, '2025-01-21 16:59:40', b'0');
INSERT INTO `sys_job_log` VALUES (1132, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 16:59:50', '', NULL, '', '2025-01-21 16:59:50', NULL, '2025-01-21 16:59:50', b'0');
INSERT INTO `sys_job_log` VALUES (1133, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:00:00', '', NULL, '', '2025-01-21 17:00:00', NULL, '2025-01-21 17:00:00', b'0');
INSERT INTO `sys_job_log` VALUES (1134, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:00:10', '', NULL, '', '2025-01-21 17:00:10', NULL, '2025-01-21 17:00:10', b'0');
INSERT INTO `sys_job_log` VALUES (1135, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:00:20', '', NULL, '', '2025-01-21 17:00:20', NULL, '2025-01-21 17:00:20', b'0');
INSERT INTO `sys_job_log` VALUES (1136, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:00:30', '', NULL, '', '2025-01-21 17:00:30', NULL, '2025-01-21 17:00:30', b'0');
INSERT INTO `sys_job_log` VALUES (1137, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:00:40', '', NULL, '', '2025-01-21 17:00:40', NULL, '2025-01-21 17:00:40', b'0');
INSERT INTO `sys_job_log` VALUES (1138, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:00:50', '', NULL, '', '2025-01-21 17:00:50', NULL, '2025-01-21 17:00:50', b'0');
INSERT INTO `sys_job_log` VALUES (1139, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:01:00', '', NULL, '', '2025-01-21 17:01:00', NULL, '2025-01-21 17:01:00', b'0');
INSERT INTO `sys_job_log` VALUES (1140, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:01:10', '', NULL, '', '2025-01-21 17:01:10', NULL, '2025-01-21 17:01:10', b'0');
INSERT INTO `sys_job_log` VALUES (1141, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:01:20', '', NULL, '', '2025-01-21 17:01:20', NULL, '2025-01-21 17:01:20', b'0');
INSERT INTO `sys_job_log` VALUES (1142, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:01:30', '', NULL, '', '2025-01-21 17:01:30', NULL, '2025-01-21 17:01:30', b'0');
INSERT INTO `sys_job_log` VALUES (1143, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:01:40', '', NULL, '', '2025-01-21 17:01:40', NULL, '2025-01-21 17:01:40', b'0');
INSERT INTO `sys_job_log` VALUES (1144, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:01:50', '', NULL, '', '2025-01-21 17:01:50', NULL, '2025-01-21 17:01:50', b'0');
INSERT INTO `sys_job_log` VALUES (1145, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:02:00', '', NULL, '', '2025-01-21 17:02:00', NULL, '2025-01-21 17:02:00', b'0');
INSERT INTO `sys_job_log` VALUES (1146, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:02:10', '', NULL, '', '2025-01-21 17:02:10', NULL, '2025-01-21 17:02:10', b'0');
INSERT INTO `sys_job_log` VALUES (1147, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:02:20', '', NULL, '', '2025-01-21 17:02:20', NULL, '2025-01-21 17:02:20', b'0');
INSERT INTO `sys_job_log` VALUES (1148, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:02:30', '', NULL, '', '2025-01-21 17:02:30', NULL, '2025-01-21 17:02:30', b'0');
INSERT INTO `sys_job_log` VALUES (1149, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:02:40', '', NULL, '', '2025-01-21 17:02:40', NULL, '2025-01-21 17:02:40', b'0');
INSERT INTO `sys_job_log` VALUES (1150, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:02:50', '', NULL, '', '2025-01-21 17:02:50', NULL, '2025-01-21 17:02:50', b'0');
INSERT INTO `sys_job_log` VALUES (1151, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:03:00', '', NULL, '', '2025-01-21 17:03:00', NULL, '2025-01-21 17:03:00', b'0');
INSERT INTO `sys_job_log` VALUES (1152, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:03:10', '', NULL, '', '2025-01-21 17:03:10', NULL, '2025-01-21 17:03:10', b'0');
INSERT INTO `sys_job_log` VALUES (1153, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：12毫秒', '0', '2025-01-21 17:03:20', '', NULL, '', '2025-01-21 17:03:20', NULL, '2025-01-21 17:03:20', b'0');
INSERT INTO `sys_job_log` VALUES (1154, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:03:30', '', NULL, '', '2025-01-21 17:03:30', NULL, '2025-01-21 17:03:30', b'0');
INSERT INTO `sys_job_log` VALUES (1155, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:03:40', '', NULL, '', '2025-01-21 17:03:40', NULL, '2025-01-21 17:03:40', b'0');
INSERT INTO `sys_job_log` VALUES (1156, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:03:50', '', NULL, '', '2025-01-21 17:03:50', NULL, '2025-01-21 17:03:50', b'0');
INSERT INTO `sys_job_log` VALUES (1157, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:04:00', '', NULL, '', '2025-01-21 17:04:00', NULL, '2025-01-21 17:04:00', b'0');
INSERT INTO `sys_job_log` VALUES (1158, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:04:10', '', NULL, '', '2025-01-21 17:04:10', NULL, '2025-01-21 17:04:10', b'0');
INSERT INTO `sys_job_log` VALUES (1159, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:04:20', '', NULL, '', '2025-01-21 17:04:20', NULL, '2025-01-21 17:04:20', b'0');
INSERT INTO `sys_job_log` VALUES (1160, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:04:30', '', NULL, '', '2025-01-21 17:04:30', NULL, '2025-01-21 17:04:30', b'0');
INSERT INTO `sys_job_log` VALUES (1161, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:04:40', '', NULL, '', '2025-01-21 17:04:40', NULL, '2025-01-21 17:04:40', b'0');
INSERT INTO `sys_job_log` VALUES (1162, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:04:50', '', NULL, '', '2025-01-21 17:04:50', NULL, '2025-01-21 17:04:50', b'0');
INSERT INTO `sys_job_log` VALUES (1163, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:05:00', '', NULL, '', '2025-01-21 17:05:00', NULL, '2025-01-21 17:05:00', b'0');
INSERT INTO `sys_job_log` VALUES (1164, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:05:10', '', NULL, '', '2025-01-21 17:05:10', NULL, '2025-01-21 17:05:10', b'0');
INSERT INTO `sys_job_log` VALUES (1165, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:05:20', '', NULL, '', '2025-01-21 17:05:20', NULL, '2025-01-21 17:05:20', b'0');
INSERT INTO `sys_job_log` VALUES (1166, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:05:30', '', NULL, '', '2025-01-21 17:05:30', NULL, '2025-01-21 17:05:30', b'0');
INSERT INTO `sys_job_log` VALUES (1167, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:05:40', '', NULL, '', '2025-01-21 17:05:40', NULL, '2025-01-21 17:05:40', b'0');
INSERT INTO `sys_job_log` VALUES (1168, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:05:50', '', NULL, '', '2025-01-21 17:05:50', NULL, '2025-01-21 17:05:50', b'0');
INSERT INTO `sys_job_log` VALUES (1169, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:06:00', '', NULL, '', '2025-01-21 17:06:00', NULL, '2025-01-21 17:06:00', b'0');
INSERT INTO `sys_job_log` VALUES (1170, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 17:06:10', '', NULL, '', '2025-01-21 17:06:10', NULL, '2025-01-21 17:06:10', b'0');
INSERT INTO `sys_job_log` VALUES (1171, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:06:20', '', NULL, '', '2025-01-21 17:06:20', NULL, '2025-01-21 17:06:20', b'0');
INSERT INTO `sys_job_log` VALUES (1172, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:06:30', '', NULL, '', '2025-01-21 17:06:30', NULL, '2025-01-21 17:06:30', b'0');
INSERT INTO `sys_job_log` VALUES (1173, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:06:40', '', NULL, '', '2025-01-21 17:06:40', NULL, '2025-01-21 17:06:40', b'0');
INSERT INTO `sys_job_log` VALUES (1174, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:06:50', '', NULL, '', '2025-01-21 17:06:50', NULL, '2025-01-21 17:06:50', b'0');
INSERT INTO `sys_job_log` VALUES (1175, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:07:00', '', NULL, '', '2025-01-21 17:07:00', NULL, '2025-01-21 17:07:00', b'0');
INSERT INTO `sys_job_log` VALUES (1176, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:07:10', '', NULL, '', '2025-01-21 17:07:10', NULL, '2025-01-21 17:07:10', b'0');
INSERT INTO `sys_job_log` VALUES (1177, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：2毫秒', '0', '2025-01-21 17:07:20', '', NULL, '', '2025-01-21 17:07:20', NULL, '2025-01-21 17:07:20', b'0');
INSERT INTO `sys_job_log` VALUES (1178, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:07:30', '', NULL, '', '2025-01-21 17:07:30', NULL, '2025-01-21 17:07:30', b'0');
INSERT INTO `sys_job_log` VALUES (1179, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:07:40', '', NULL, '', '2025-01-21 17:07:40', NULL, '2025-01-21 17:07:40', b'0');
INSERT INTO `sys_job_log` VALUES (1180, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:07:50', '', NULL, '', '2025-01-21 17:07:50', NULL, '2025-01-21 17:07:50', b'0');
INSERT INTO `sys_job_log` VALUES (1181, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:08:00', '', NULL, '', '2025-01-21 17:08:00', NULL, '2025-01-21 17:08:00', b'0');
INSERT INTO `sys_job_log` VALUES (1182, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:08:10', '', NULL, '', '2025-01-21 17:08:10', NULL, '2025-01-21 17:08:10', b'0');
INSERT INTO `sys_job_log` VALUES (1183, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:08:20', '', NULL, '', '2025-01-21 17:08:20', NULL, '2025-01-21 17:08:20', b'0');
INSERT INTO `sys_job_log` VALUES (1184, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:08:30', '', NULL, '', '2025-01-21 17:08:30', NULL, '2025-01-21 17:08:30', b'0');
INSERT INTO `sys_job_log` VALUES (1185, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:08:40', '', NULL, '', '2025-01-21 17:08:40', NULL, '2025-01-21 17:08:40', b'0');
INSERT INTO `sys_job_log` VALUES (1186, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:08:50', '', NULL, '', '2025-01-21 17:08:50', NULL, '2025-01-21 17:08:50', b'0');
INSERT INTO `sys_job_log` VALUES (1187, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:09:00', '', NULL, '', '2025-01-21 17:09:00', NULL, '2025-01-21 17:09:00', b'0');
INSERT INTO `sys_job_log` VALUES (1188, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:09:10', '', NULL, '', '2025-01-21 17:09:10', NULL, '2025-01-21 17:09:10', b'0');
INSERT INTO `sys_job_log` VALUES (1189, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:09:20', '', NULL, '', '2025-01-21 17:09:20', NULL, '2025-01-21 17:09:20', b'0');
INSERT INTO `sys_job_log` VALUES (1190, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:09:30', '', NULL, '', '2025-01-21 17:09:30', NULL, '2025-01-21 17:09:30', b'0');
INSERT INTO `sys_job_log` VALUES (1191, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:09:40', '', NULL, '', '2025-01-21 17:09:40', NULL, '2025-01-21 17:09:40', b'0');
INSERT INTO `sys_job_log` VALUES (1192, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:09:50', '', NULL, '', '2025-01-21 17:09:50', NULL, '2025-01-21 17:09:50', b'0');
INSERT INTO `sys_job_log` VALUES (1193, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:10:00', '', NULL, '', '2025-01-21 17:10:00', NULL, '2025-01-21 17:10:00', b'0');
INSERT INTO `sys_job_log` VALUES (1194, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:10:10', '', NULL, '', '2025-01-21 17:10:10', NULL, '2025-01-21 17:10:10', b'0');
INSERT INTO `sys_job_log` VALUES (1195, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:10:20', '', NULL, '', '2025-01-21 17:10:20', NULL, '2025-01-21 17:10:20', b'0');
INSERT INTO `sys_job_log` VALUES (1196, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:10:30', '', NULL, '', '2025-01-21 17:10:30', NULL, '2025-01-21 17:10:30', b'0');
INSERT INTO `sys_job_log` VALUES (1197, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:10:40', '', NULL, '', '2025-01-21 17:10:40', NULL, '2025-01-21 17:10:40', b'0');
INSERT INTO `sys_job_log` VALUES (1198, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:10:50', '', NULL, '', '2025-01-21 17:10:50', NULL, '2025-01-21 17:10:50', b'0');
INSERT INTO `sys_job_log` VALUES (1199, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:11:00', '', NULL, '', '2025-01-21 17:11:00', NULL, '2025-01-21 17:11:00', b'0');
INSERT INTO `sys_job_log` VALUES (1200, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:11:10', '', NULL, '', '2025-01-21 17:11:10', NULL, '2025-01-21 17:11:10', b'0');
INSERT INTO `sys_job_log` VALUES (1201, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:11:20', '', NULL, '', '2025-01-21 17:11:20', NULL, '2025-01-21 17:11:20', b'0');
INSERT INTO `sys_job_log` VALUES (1202, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:11:30', '', NULL, '', '2025-01-21 17:11:30', NULL, '2025-01-21 17:11:30', b'0');
INSERT INTO `sys_job_log` VALUES (1203, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:11:40', '', NULL, '', '2025-01-21 17:11:40', NULL, '2025-01-21 17:11:40', b'0');
INSERT INTO `sys_job_log` VALUES (1204, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:11:50', '', NULL, '', '2025-01-21 17:11:50', NULL, '2025-01-21 17:11:50', b'0');
INSERT INTO `sys_job_log` VALUES (1205, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:12:00', '', NULL, '', '2025-01-21 17:12:00', NULL, '2025-01-21 17:12:00', b'0');
INSERT INTO `sys_job_log` VALUES (1206, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 17:12:10', '', NULL, '', '2025-01-21 17:12:10', NULL, '2025-01-21 17:12:10', b'0');
INSERT INTO `sys_job_log` VALUES (1207, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 17:12:20', '', NULL, '', '2025-01-21 17:12:20', NULL, '2025-01-21 17:12:20', b'0');
INSERT INTO `sys_job_log` VALUES (1208, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:12:30', '', NULL, '', '2025-01-21 17:12:30', NULL, '2025-01-21 17:12:30', b'0');
INSERT INTO `sys_job_log` VALUES (1209, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:12:40', '', NULL, '', '2025-01-21 17:12:40', NULL, '2025-01-21 17:12:40', b'0');
INSERT INTO `sys_job_log` VALUES (1210, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:12:50', '', NULL, '', '2025-01-21 17:12:50', NULL, '2025-01-21 17:12:50', b'0');
INSERT INTO `sys_job_log` VALUES (1211, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:13:00', '', NULL, '', '2025-01-21 17:13:00', NULL, '2025-01-21 17:13:00', b'0');
INSERT INTO `sys_job_log` VALUES (1212, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:13:10', '', NULL, '', '2025-01-21 17:13:10', NULL, '2025-01-21 17:13:10', b'0');
INSERT INTO `sys_job_log` VALUES (1213, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:13:20', '', NULL, '', '2025-01-21 17:13:20', NULL, '2025-01-21 17:13:20', b'0');
INSERT INTO `sys_job_log` VALUES (1214, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:13:30', '', NULL, '', '2025-01-21 17:13:30', NULL, '2025-01-21 17:13:30', b'0');
INSERT INTO `sys_job_log` VALUES (1215, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:13:40', '', NULL, '', '2025-01-21 17:13:40', NULL, '2025-01-21 17:13:40', b'0');
INSERT INTO `sys_job_log` VALUES (1216, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:13:50', '', NULL, '', '2025-01-21 17:13:50', NULL, '2025-01-21 17:13:50', b'0');
INSERT INTO `sys_job_log` VALUES (1217, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:14:00', '', NULL, '', '2025-01-21 17:14:00', NULL, '2025-01-21 17:14:00', b'0');
INSERT INTO `sys_job_log` VALUES (1218, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 17:14:10', '', NULL, '', '2025-01-21 17:14:10', NULL, '2025-01-21 17:14:10', b'0');
INSERT INTO `sys_job_log` VALUES (1219, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:14:20', '', NULL, '', '2025-01-21 17:14:20', NULL, '2025-01-21 17:14:20', b'0');
INSERT INTO `sys_job_log` VALUES (1220, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:14:30', '', NULL, '', '2025-01-21 17:14:30', NULL, '2025-01-21 17:14:30', b'0');
INSERT INTO `sys_job_log` VALUES (1221, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:14:40', '', NULL, '', '2025-01-21 17:14:40', NULL, '2025-01-21 17:14:40', b'0');
INSERT INTO `sys_job_log` VALUES (1222, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:14:50', '', NULL, '', '2025-01-21 17:14:50', NULL, '2025-01-21 17:14:50', b'0');
INSERT INTO `sys_job_log` VALUES (1223, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:15:00', '', NULL, '', '2025-01-21 17:15:00', NULL, '2025-01-21 17:15:00', b'0');
INSERT INTO `sys_job_log` VALUES (1224, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:15:10', '', NULL, '', '2025-01-21 17:15:10', NULL, '2025-01-21 17:15:10', b'0');
INSERT INTO `sys_job_log` VALUES (1225, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:15:20', '', NULL, '', '2025-01-21 17:15:20', NULL, '2025-01-21 17:15:20', b'0');
INSERT INTO `sys_job_log` VALUES (1226, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:15:30', '', NULL, '', '2025-01-21 17:15:30', NULL, '2025-01-21 17:15:30', b'0');
INSERT INTO `sys_job_log` VALUES (1227, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:15:40', '', NULL, '', '2025-01-21 17:15:40', NULL, '2025-01-21 17:15:40', b'0');
INSERT INTO `sys_job_log` VALUES (1228, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:15:50', '', NULL, '', '2025-01-21 17:15:50', NULL, '2025-01-21 17:15:50', b'0');
INSERT INTO `sys_job_log` VALUES (1229, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:16:00', '', NULL, '', '2025-01-21 17:16:00', NULL, '2025-01-21 17:16:00', b'0');
INSERT INTO `sys_job_log` VALUES (1230, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:16:10', '', NULL, '', '2025-01-21 17:16:10', NULL, '2025-01-21 17:16:10', b'0');
INSERT INTO `sys_job_log` VALUES (1231, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:16:20', '', NULL, '', '2025-01-21 17:16:20', NULL, '2025-01-21 17:16:20', b'0');
INSERT INTO `sys_job_log` VALUES (1232, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:16:30', '', NULL, '', '2025-01-21 17:16:30', NULL, '2025-01-21 17:16:30', b'0');
INSERT INTO `sys_job_log` VALUES (1233, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:16:40', '', NULL, '', '2025-01-21 17:16:40', NULL, '2025-01-21 17:16:40', b'0');
INSERT INTO `sys_job_log` VALUES (1234, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:16:50', '', NULL, '', '2025-01-21 17:16:50', NULL, '2025-01-21 17:16:50', b'0');
INSERT INTO `sys_job_log` VALUES (1235, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:17:00', '', NULL, '', '2025-01-21 17:17:00', NULL, '2025-01-21 17:17:00', b'0');
INSERT INTO `sys_job_log` VALUES (1236, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：4毫秒', '0', '2025-01-21 17:17:10', '', NULL, '', '2025-01-21 17:17:10', NULL, '2025-01-21 17:17:10', b'0');
INSERT INTO `sys_job_log` VALUES (1237, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:17:20', '', NULL, '', '2025-01-21 17:17:20', NULL, '2025-01-21 17:17:20', b'0');
INSERT INTO `sys_job_log` VALUES (1238, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:17:30', '', NULL, '', '2025-01-21 17:17:30', NULL, '2025-01-21 17:17:30', b'0');
INSERT INTO `sys_job_log` VALUES (1239, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:17:40', '', NULL, '', '2025-01-21 17:17:40', NULL, '2025-01-21 17:17:40', b'0');
INSERT INTO `sys_job_log` VALUES (1240, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:17:50', '', NULL, '', '2025-01-21 17:17:50', NULL, '2025-01-21 17:17:50', b'0');
INSERT INTO `sys_job_log` VALUES (1241, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:18:00', '', NULL, '', '2025-01-21 17:18:00', NULL, '2025-01-21 17:18:00', b'0');
INSERT INTO `sys_job_log` VALUES (1242, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 17:18:10', '', NULL, '', '2025-01-21 17:18:10', NULL, '2025-01-21 17:18:10', b'0');
INSERT INTO `sys_job_log` VALUES (1243, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:18:20', '', NULL, '', '2025-01-21 17:18:20', NULL, '2025-01-21 17:18:20', b'0');
INSERT INTO `sys_job_log` VALUES (1244, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:18:30', '', NULL, '', '2025-01-21 17:18:30', NULL, '2025-01-21 17:18:30', b'0');
INSERT INTO `sys_job_log` VALUES (1245, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：1毫秒', '0', '2025-01-21 17:18:40', '', NULL, '', '2025-01-21 17:18:40', NULL, '2025-01-21 17:18:40', b'0');
INSERT INTO `sys_job_log` VALUES (1246, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:18:50', '', NULL, '', '2025-01-21 17:18:50', NULL, '2025-01-21 17:18:50', b'0');
INSERT INTO `sys_job_log` VALUES (1247, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:19:00', '', NULL, '', '2025-01-21 17:19:00', NULL, '2025-01-21 17:19:00', b'0');
INSERT INTO `sys_job_log` VALUES (1248, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:19:10', '', NULL, '', '2025-01-21 17:19:10', NULL, '2025-01-21 17:19:10', b'0');
INSERT INTO `sys_job_log` VALUES (1249, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:19:20', '', NULL, '', '2025-01-21 17:19:20', NULL, '2025-01-21 17:19:20', b'0');
INSERT INTO `sys_job_log` VALUES (1250, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:19:30', '', NULL, '', '2025-01-21 17:19:30', NULL, '2025-01-21 17:19:30', b'0');
INSERT INTO `sys_job_log` VALUES (1251, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:19:40', '', NULL, '', '2025-01-21 17:19:40', NULL, '2025-01-21 17:19:40', b'0');
INSERT INTO `sys_job_log` VALUES (1252, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:19:50', '', NULL, '', '2025-01-21 17:19:50', NULL, '2025-01-21 17:19:50', b'0');
INSERT INTO `sys_job_log` VALUES (1253, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:20:00', '', NULL, '', '2025-01-21 17:20:00', NULL, '2025-01-21 17:20:00', b'0');
INSERT INTO `sys_job_log` VALUES (1254, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:20:10', '', NULL, '', '2025-01-21 17:20:10', NULL, '2025-01-21 17:20:10', b'0');
INSERT INTO `sys_job_log` VALUES (1255, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:20:20', '', NULL, '', '2025-01-21 17:20:20', NULL, '2025-01-21 17:20:20', b'0');
INSERT INTO `sys_job_log` VALUES (1256, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:20:30', '', NULL, '', '2025-01-21 17:20:30', NULL, '2025-01-21 17:20:30', b'0');
INSERT INTO `sys_job_log` VALUES (1257, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:20:40', '', NULL, '', '2025-01-21 17:20:40', NULL, '2025-01-21 17:20:40', b'0');
INSERT INTO `sys_job_log` VALUES (1258, '测试', '0', 'jcmTask.jcmNoParams', '测试 总共耗时：0毫秒', '0', '2025-01-21 17:20:50', '', NULL, '', '2025-01-21 17:20:50', NULL, '2025-01-21 17:20:50', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-11 18:56:18', NULL, '', '2025-01-11 18:56:18', NULL, '2025-01-11 18:56:18', b'1');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-11 19:01:59', NULL, '', '2025-01-11 19:01:59', NULL, '2025-01-11 19:01:59', b'1');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-11 21:15:11', NULL, '', '2025-01-11 21:15:12', NULL, '2025-01-11 21:15:12', b'1');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-12 08:22:47', NULL, '', '2025-01-12 08:22:48', NULL, '2025-01-12 08:22:48', b'1');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-12 20:55:18', NULL, '', '2025-01-12 20:55:18', NULL, '2025-01-12 20:55:18', b'1');
INSERT INTO `sys_logininfor` VALUES (6, 'admin5', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '1', '登录用户不存在', '2025-01-13 11:29:56', NULL, '', '2025-01-13 11:29:57', NULL, '2025-01-13 11:29:57', b'1');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-13 12:43:18', NULL, '', '2025-01-13 12:43:19', NULL, '2025-01-13 12:43:19', b'1');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-13 13:43:38', NULL, '', '2025-01-13 13:43:39', NULL, '2025-01-13 13:43:39', b'1');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-13 17:38:04', NULL, '', '2025-01-13 17:38:05', NULL, '2025-01-13 17:38:05', b'0');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-13 17:42:19', NULL, '', '2025-01-13 17:42:19', NULL, '2025-01-13 17:42:19', b'0');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-13 19:56:06', NULL, '', '2025-01-13 19:56:07', NULL, '2025-01-13 19:56:07', b'0');
INSERT INTO `sys_logininfor` VALUES (12, 'admin5', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '1', '登录用户不存在', '2025-01-14 09:43:30', NULL, '', '2025-01-14 09:43:31', NULL, '2025-01-14 09:43:31', b'0');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-14 09:43:50', NULL, '', '2025-01-14 09:43:50', NULL, '2025-01-14 09:43:50', b'0');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-14 21:12:45', NULL, '', '2025-01-14 21:12:45', NULL, '2025-01-14 21:12:45', b'0');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-15 09:04:49', NULL, '', '2025-01-15 09:04:49', NULL, '2025-01-15 09:04:49', b'0');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-15 09:30:17', NULL, '', '2025-01-15 09:30:17', NULL, '2025-01-15 09:30:17', b'0');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-15 17:11:54', NULL, '', '2025-01-15 17:11:55', NULL, '2025-01-15 17:11:55', b'0');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-16 09:21:49', NULL, '', '2025-01-16 09:21:49', NULL, '2025-01-16 09:21:49', b'0');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-16 11:59:23', NULL, '', '2025-01-16 11:59:23', NULL, '2025-01-16 11:59:23', b'0');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-16 14:27:50', NULL, '', '2025-01-16 14:27:50', NULL, '2025-01-16 14:27:50', b'0');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-17 10:09:57', NULL, '', '2025-01-17 10:09:58', NULL, '2025-01-17 10:09:58', b'0');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-18 14:55:54', NULL, '', '2025-01-18 14:55:55', NULL, '2025-01-18 14:55:55', b'0');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-18 17:25:31', NULL, '', '2025-01-18 17:25:31', NULL, '2025-01-18 17:25:31', b'0');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-19 10:10:32', NULL, '', '2025-01-19 10:10:33', NULL, '2025-01-19 10:10:33', b'0');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-19 16:19:45', NULL, '', '2025-01-19 16:19:45', NULL, '2025-01-19 16:19:45', b'0');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-19 18:16:05', NULL, '', '2025-01-19 18:16:05', NULL, '2025-01-19 18:16:05', b'0');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-19 18:18:51', NULL, '', '2025-01-19 18:18:51', NULL, '2025-01-19 18:18:51', b'0');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-20 08:42:55', NULL, '', '2025-01-20 08:42:56', NULL, '2025-01-20 08:42:56', b'0');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-20 12:18:18', NULL, '', '2025-01-20 12:18:19', NULL, '2025-01-20 12:18:19', b'0');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 08:51:10', NULL, '', '2025-01-21 08:51:10', NULL, '2025-01-21 08:51:10', b'0');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 09:56:08', NULL, '', '2025-01-21 09:56:09', NULL, '2025-01-21 09:56:09', b'0');
INSERT INTO `sys_logininfor` VALUES (32, 'salves', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '1', '登录用户不存在', '2025-01-21 16:18:49', NULL, '', '2025-01-21 16:18:49', NULL, '2025-01-21 16:18:49', b'0');
INSERT INTO `sys_logininfor` VALUES (33, 'salve', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '1', '登录用户不存在', '2025-01-21 16:18:57', NULL, '', '2025-01-21 16:18:57', NULL, '2025-01-21 16:18:57', b'0');
INSERT INTO `sys_logininfor` VALUES (34, 'slave', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 16:19:09', NULL, '', '2025-01-21 16:19:09', NULL, '2025-01-21 16:19:09', b'0');
INSERT INTO `sys_logininfor` VALUES (35, 'slave', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 16:19:20', NULL, '', '2025-01-21 16:19:20', NULL, '2025-01-21 16:19:20', b'0');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 19:37:35', NULL, '', '2025-01-21 19:37:35', NULL, '2025-01-21 19:37:35', b'0');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 19:59:38', NULL, '', '2025-01-21 19:59:39', NULL, '2025-01-21 19:59:39', b'0');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 21:11:06', NULL, '', '2025-01-21 21:11:07', NULL, '2025-01-21 21:11:07', b'0');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-21 21:18:17', NULL, '', '2025-01-21 21:18:18', NULL, '2025-01-21 21:18:18', b'0');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-22 11:01:03', NULL, '', '2025-01-22 11:01:04', NULL, '2025-01-22 11:01:04', b'0');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-23 09:06:19', NULL, '', '2025-01-23 09:06:20', NULL, '2025-01-23 09:06:20', b'0');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-23 21:15:19', NULL, '', '2025-01-23 21:15:20', NULL, '2025-01-23 21:15:20', b'0');
INSERT INTO `sys_logininfor` VALUES (43, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-24 09:50:33', NULL, '', '2025-01-24 09:50:34', NULL, '2025-01-24 09:50:34', b'0');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-24 16:21:30', NULL, '', '2025-01-24 16:21:31', NULL, '2025-01-24 16:21:31', b'0');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-24 17:29:27', NULL, '', '2025-01-24 17:29:28', NULL, '2025-01-24 17:29:28', b'0');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-24 17:29:44', NULL, '', '2025-01-24 17:29:44', NULL, '2025-01-24 17:29:44', b'0');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-25 10:35:06', NULL, '', '2025-01-25 10:35:07', NULL, '2025-01-25 10:35:07', b'0');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-25 17:35:27', NULL, '', '2025-01-25 17:35:27', NULL, '2025-01-25 17:35:27', b'0');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-25 20:42:01', NULL, '', '2025-01-25 20:42:02', NULL, '2025-01-25 20:42:02', b'0');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-25 23:21:39', NULL, '', '2025-01-25 23:21:40', NULL, '2025-01-25 23:21:40', b'0');
INSERT INTO `sys_logininfor` VALUES (51, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-27 16:58:57', NULL, '', '2025-01-27 16:58:57', NULL, '2025-01-27 16:58:57', b'0');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '0-0-内网IP-(内网IP)', 'Chrome浏览器', 'Windows操作系统', '0', '登录成功', '2025-01-28 18:58:55', NULL, '', '2025-01-28 18:58:55', NULL, '2025-01-28 18:58:55', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 200, 'acl', '', b'0', '', 0, '管理', 0, b'1', b'0', NULL, '1', '2024-04-02 08:09:14', 'admin', '2024-12-25 13:52:41', b'0');
INSERT INTO `sys_menu` VALUES (30, '用户管理', 43, 200, 'user', '', b'0', '', 1, 'user-plus', 0, b'1', b'0', NULL, NULL, '2024-04-04 19:25:12', 'admin', '2024-12-23 21:35:44', b'0');
INSERT INTO `sys_menu` VALUES (32, '角色管理', 43, 200, 'role', '', b'0', '', 1, 'role', 0, b'1', b'0', NULL, NULL, '2024-04-05 16:24:52', 'admin', '2024-12-23 21:35:25', b'0');
INSERT INTO `sys_menu` VALUES (33, '菜单管理', 1, 300, 'menu', '', b'0', '', 1, 'menu', 0, b'1', b'0', NULL, NULL, '2024-04-05 16:26:35', 'admin', '2024-10-30 11:24:28', b'0');
INSERT INTO `sys_menu` VALUES (35, '首页', 0, 0, 'home', NULL, b'0', NULL, 1, 'home', 0, b'1', b'0', NULL, '1', '2024-10-20 07:13:01', NULL, '2024-10-20 07:13:08', b'0');
INSERT INTO `sys_menu` VALUES (43, '用户管理', 0, 100, 'user', '', b'0', '', 0, 'user', 0, b'1', b'0', NULL, 'admin', '2024-10-28 14:53:43', 'admin', '2024-12-23 19:19:40', b'0');
INSERT INTO `sys_menu` VALUES (44, '操作日志', 133, 300, 'operationLog', '', b'0', '', 1, 'log', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:09:18', 'admin', '2025-01-14 19:24:18', b'0');
INSERT INTO `sys_menu` VALUES (45, '数据字典项', 1, 500, 'dictType', '', b'0', '', 1, 'dictType', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:36:46', 'admin', '2024-10-31 19:52:54', b'0');
INSERT INTO `sys_menu` VALUES (46, '数据字典值', 1, 600, 'dictData', '', b'0', '', 1, 'dictData', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:37:16', 'admin', '2024-10-30 12:46:05', b'0');
INSERT INTO `sys_menu` VALUES (47, '系统设置', 1, 700, 'setting', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-10-30 12:37:43', 'admin', '2024-10-30 13:59:44', b'0');
INSERT INTO `sys_menu` VALUES (48, '测试', 0, 1000, 'ceshi', '', b'0', '', 0, 'role', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:04:19', 'admin', '2025-01-19 15:32:25', b'0');
INSERT INTO `sys_menu` VALUES (49, '测试1', 48, 100, 'ceshi1', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:04:31', 'admin', '2025-01-19 15:32:31', b'0');
INSERT INTO `sys_menu` VALUES (50, '测试2', 48, 200, 'ceshi2', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:04:44', 'admin', '2025-01-19 15:32:34', b'0');
INSERT INTO `sys_menu` VALUES (51, '测试3', 48, 300, 'ceshi3', '', b'0', '', 1, 'role', 0, b'1', b'1', NULL, 'admin', '2024-10-30 15:04:55', 'admin', '2025-01-20 16:30:20', b'0');
INSERT INTO `sys_menu` VALUES (52, '测试4', 48, 400, 'ceshi4', '', b'0', '', 1, 'role', 0, b'1', b'0', NULL, 'admin', '2024-10-30 15:05:13', 'admin', '2025-01-19 15:32:43', b'0');
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
INSERT INTO `sys_menu` VALUES (74, '测试5', 48, 500, 'ceshi5', '', b'0', '', 1, '点赞', 0, b'1', b'0', NULL, 'admin', '2024-12-14 08:00:10', 'admin', '2025-01-19 15:32:49', b'0');
INSERT INTO `sys_menu` VALUES (77, '测试6', 48, 700, 'ceshi6', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-12-18 13:42:08', 'admin', '2025-01-19 15:32:54', b'0');
INSERT INTO `sys_menu` VALUES (79, '测试8', 48, 900, 'ceshi8', '', b'0', '', 1, '权限', 0, b'1', b'0', NULL, 'admin', '2024-12-18 13:42:31', 'admin', '2025-01-19 15:33:03', b'0');
INSERT INTO `sys_menu` VALUES (84, 'sss', 74, 100, 'sss', '', b'0', '', 1, '设置', 0, b'1', b'0', NULL, 'admin', '2024-12-20 17:06:56', 'admin', '2024-12-20 17:07:30', b'0');
INSERT INTO `sys_menu` VALUES (85, 'ww', 74, 200, 'ww', '', b'0', '', 1, '权限', 0, b'1', b'0', NULL, 'admin', '2024-12-20 17:07:26', NULL, '2024-12-20 17:07:26', b'0');
INSERT INTO `sys_menu` VALUES (87, '测试7', 48, 700, 'ceshhh', '', b'0', '', 1, 'log', 0, b'1', b'0', NULL, 'admin', '2024-12-23 15:59:21', 'admin', '2025-01-19 15:32:59', b'0');
INSERT INTO `sys_menu` VALUES (88, 'kkkk', 48, 700, 'kkkk', '', b'0', '', 1, '白天', 0, b'1', b'0', NULL, 'admin', '2024-12-23 18:42:56', NULL, '2024-12-23 18:42:56', b'0');
INSERT INTO `sys_menu` VALUES (91, '系统监控', 0, 400, 'monitor', '', b'0', '', 0, '监控', 0, b'1', b'0', NULL, 'admin', '2024-12-25 13:33:49', 'admin', '2024-12-25 14:18:36', b'0');
INSERT INTO `sys_menu` VALUES (92, '系统工具', 0, 300, 'tool', '', b'0', '', 0, '工具', 0, b'1', b'0', NULL, 'admin', '2024-12-25 13:35:19', 'admin', '2024-12-25 13:49:23', b'0');
INSERT INTO `sys_menu` VALUES (93, '接口文档', 92, 1100, 'swagger', '', b'0', '', 1, '接口文档', 0, b'1', b'1', NULL, 'admin', '2024-12-25 13:38:02', 'admin', '2024-12-30 09:22:25', b'0');
INSERT INTO `sys_menu` VALUES (94, 'AI表结构生成', 92, 1200, 'aiTableGen', '', b'0', '', 1, 'AI', 0, b'1', b'0', NULL, 'admin', '2024-12-25 13:48:29', 'admin', '2024-12-30 21:07:02', b'0');
INSERT INTO `sys_menu` VALUES (95, '数据监控', 91, 100, 'druid', '', b'0', '', 1, '数据库监控', 0, b'1', b'0', NULL, 'admin', '2024-12-25 14:22:05', 'admin', '2025-01-11 10:43:00', b'0');
INSERT INTO `sys_menu` VALUES (96, '前端书签', 0, 420, 'berforLink', '', b'0', '', 0, '书签', 0, b'1', b'0', NULL, 'admin', '2024-12-25 16:07:23', 'admin', '2025-01-12 13:28:29', b'0');
INSERT INTO `sys_menu` VALUES (97, '缓存列表', 91, 200, 'cacheList', '', b'0', '', 1, '缓存', 0, b'1', b'0', NULL, 'admin', '2024-12-25 16:34:04', 'admin', '2024-12-25 19:07:09', b'0');
INSERT INTO `sys_menu` VALUES (98, 'element ui plus', 96, 100, '', 'https://element-plus.org/zh-CN/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 20:53:17', 'admin', '2024-12-25 21:55:08', b'0');
INSERT INTO `sys_menu` VALUES (99, 'iconfont', 96, 200, '', 'https://www.iconfont.cn/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 20:54:02', NULL, '2024-12-25 20:54:02', b'0');
INSERT INTO `sys_menu` VALUES (100, 'vxetable', 96, 300, '', 'https://vxetable.cn/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 20:54:30', NULL, '2024-12-25 20:54:30', b'0');
INSERT INTO `sys_menu` VALUES (101, 'animate.style', 96, 400, '', 'https://animate.style/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-25 21:54:42', NULL, '2024-12-25 21:54:42', b'0');
INSERT INTO `sys_menu` VALUES (102, '表单生成', 92, 1300, 'fromGen', '', b'0', '', 1, '表单', 0, b'1', b'0', NULL, 'admin', '2024-12-26 20:23:28', 'admin', '2024-12-27 11:17:03', b'1');
INSERT INTO `sys_menu` VALUES (103, '缓存监控', 91, 300, 'cacheMonitor', '', b'0', '', 1, '监控', 0, b'1', b'0', NULL, 'admin', '2024-12-27 15:08:52', 'admin', '2024-12-27 15:10:21', b'0');
INSERT INTO `sys_menu` VALUES (104, '服务监控', 91, 400, 'systemMonitor', '', b'0', '', 1, '服务器', 0, b'1', b'0', NULL, 'admin', '2024-12-27 20:55:02', NULL, '2024-12-27 20:55:02', b'0');
INSERT INTO `sys_menu` VALUES (105, '定时任务', 1, 610, 'jobTask', '', b'0', '', 1, '数据', 0, b'1', b'0', NULL, 'admin', '2024-12-28 15:38:37', 'admin', '2025-01-14 19:38:31', b'0');
INSERT INTO `sys_menu` VALUES (106, 'navnav', 96, 500, '', 'https://thuvien.org/navnav', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-28 21:23:08', NULL, '2024-12-28 21:23:08', b'0');
INSERT INTO `sys_menu` VALUES (107, 'uiverse', 96, 600, '', 'https://uiverse.io/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2024-12-28 21:24:11', NULL, '2024-12-28 21:24:11', b'0');
INSERT INTO `sys_menu` VALUES (115, '后端书签', 0, 430, 'afterLink', NULL, b'0', '', 0, '书签', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:11:55', 'admin', '2025-01-12 13:28:33', b'0');
INSERT INTO `sys_menu` VALUES (116, 'swagger文档', 115, 100, '', 'https://swagger.org.cn/docs/specification/v2_0/what-is-swagger/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:13:52', NULL, '2025-01-03 14:13:52', b'0');
INSERT INTO `sys_menu` VALUES (117, 'mybatisPlus', 115, 200, NULL, 'https://baomidou.com/reference/annotation/', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:14:36', NULL, '2025-01-03 14:14:36', b'0');
INSERT INTO `sys_menu` VALUES (118, 'Knife4j', 115, 300, NULL, 'https://doc.xiaominfo.com/v2/documentation/description.html', b'1', '', 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2025-01-03 14:15:55', NULL, '2025-01-03 14:15:55', b'0');
INSERT INTO `sys_menu` VALUES (119, '代码生成', 92, 1400, 'genCode', NULL, b'0', '', 1, '代码', 0, b'1', b'0', NULL, 'admin', '2025-01-05 10:01:24', 'admin', '2025-01-07 13:52:43', b'0');
INSERT INTO `sys_menu` VALUES (120, '测试', 119, 100, 'components', NULL, b'0', NULL, 0, '监控', 0, b'1', b'0', NULL, 'admin', '2025-01-07 13:52:10', 'admin', '2025-01-07 13:54:10', b'1');
INSERT INTO `sys_menu` VALUES (121, '测试', 120, 100, 'gen-code-update-from', '', b'0', NULL, 1, 'menu', 0, b'1', b'0', NULL, 'admin', '2025-01-07 13:54:56', NULL, '2025-01-07 13:54:56', b'1');
INSERT INTO `sys_menu` VALUES (122, 'css', 0, 1100, '', NULL, b'0', NULL, 0, 'dictData', 1, b'1', b'0', NULL, 'admin', '2025-01-07 14:50:53', 'admin', '2025-01-07 16:00:10', b'0');
INSERT INTO `sys_menu` VALUES (123, 'abidu', 122, 100, NULL, 'https://www.baidu.com', b'1', NULL, 1, '设置', 1, b'1', b'0', NULL, 'admin', '2025-01-07 14:51:12', 'admin', '2025-01-07 15:00:44', b'0');
INSERT INTO `sys_menu` VALUES (124, '组件', 119, 200, 'components', NULL, b'0', NULL, 0, NULL, 0, b'0', b'0', NULL, 'admin', '2025-01-07 16:19:01', 'admin', '2025-01-07 16:20:28', b'1');
INSERT INTO `sys_menu` VALUES (125, '测试', 0, 100, 'home', NULL, b'0', NULL, 0, 'home', 0, b'1', b'0', NULL, 'admin', '2025-01-07 16:19:30', 'admin', '2025-01-08 15:48:28', b'1');
INSERT INTO `sys_menu` VALUES (126, 'vip', 0, 1200, 'vip', NULL, b'0', NULL, 0, '服务器', 0, b'1', b'0', NULL, 'admin', '2025-01-09 15:01:32', NULL, '2025-01-09 15:01:32', b'0');
INSERT INTO `sys_menu` VALUES (127, 'vip生成测试', 126, 100, 'vip', NULL, b'0', NULL, 1, '表单', 0, b'1', b'0', NULL, 'admin', '2025-01-09 15:01:55', NULL, '2025-01-09 15:01:55', b'0');
INSERT INTO `sys_menu` VALUES (128, 'Admin监控', 91, 600, 'adminMonitor', NULL, b'0', NULL, 1, 'admin监控', 0, b'1', b'0', NULL, 'admin', '2025-01-11 12:19:07', 'admin', '2025-01-11 12:21:29', b'0');
INSERT INTO `sys_menu` VALUES (129, '登录日志', 133, 400, 'logininfor', NULL, b'0', NULL, 1, '登录log', 0, b'1', b'0', NULL, 'admin', '2025-01-11 14:51:04', 'admin', '2025-01-14 19:24:25', b'0');
INSERT INTO `sys_menu` VALUES (130, 'makeapie', 96, 700, NULL, 'https://www.makeapie.cn/echarts', b'1', NULL, 1, '收藏', 0, b'1', b'0', NULL, 'admin', '2025-01-12 17:42:52', 'admin', '2025-01-12 17:43:03', b'0');
INSERT INTO `sys_menu` VALUES (131, '系统任务', 1, 650, 'task', NULL, b'0', NULL, 1, '任务', 0, b'1', b'0', NULL, 'admin', '2025-01-13 17:38:41', 'admin', '2025-01-14 19:33:11', b'0');
INSERT INTO `sys_menu` VALUES (132, '定时任务日志', 133, 450, 'jobTaskLog', NULL, b'0', NULL, 1, '数据', 0, b'1', b'0', NULL, 'admin', '2025-01-14 11:33:49', 'admin', '2025-01-14 19:22:55', b'0');
INSERT INTO `sys_menu` VALUES (133, '日志管理', 0, 350, 'log', NULL, b'0', NULL, 0, '登录log', 0, b'1', b'0', NULL, 'admin', '2025-01-14 19:21:26', 'admin', '2025-01-14 19:21:39', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '菜单管理', '修改菜单', 2, '菜单ID: 51信息被修改', '菜单ID: <span class=height-light-span>51</span>信息被修改', 'com.jcm.system.controller.SysMenuController.edit()', 'PUT', '2025-01-20 16:30:19', 'admin', '/menu/', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"component\":\"ceshi3\",\"icon\":\"role\",\"keepAlive\":true,\"link\":\"\",\"menuId\":51,\"name\":\"测试3\",\"parentId\":48,\"permission\":\"\",\"sort\":300,\"type\":1,\"updateTime\":\"2025-01-20 16:30:19\",\"updater\":\"admin\",\"visible\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 556, NULL, '', '2025-01-20 16:30:21', NULL, '2025-01-20 16:30:21', b'0');
INSERT INTO `sys_oper_log` VALUES (2, '用户管理', '重置用户密码', 2, NULL, NULL, 'com.jcm.system.controller.SysUserController.resetPassword()', 'PUT', '2025-01-21 16:18:27', 'admin', '/user/changePassword', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"admin\":false,\"email\":\"330628396@qq.com\",\"mobile\":\"13613968112\",\"nickname\":\"slavee\",\"userId\":67,\"username\":\"slave\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 514, NULL, '', '2025-01-21 16:18:29', NULL, '2025-01-21 16:18:29', b'0');
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', '删除用户', 3, NULL, NULL, 'com.jcm.system.controller.SysUserController.remove()', 'DELETE', '2025-01-21 16:20:21', 'slave', '/user/90', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '', 1, 'system:user:remove', '<span class=height-light-span-error>system:user:remove</span>', 18, NULL, '', '2025-01-21 16:20:22', NULL, '2025-01-21 16:20:22', b'0');
INSERT INTO `sys_oper_log` VALUES (4, '用户管理', '删除用户', 3, NULL, NULL, 'com.jcm.system.controller.SysUserController.remove()', 'DELETE', '2025-01-21 16:20:22', 'slave', '/user/90', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '', 1, 'system:user:remove', '<span class=height-light-span-error>system:user:remove</span>', 1, NULL, '', '2025-01-21 16:20:23', NULL, '2025-01-21 16:20:23', b'0');
INSERT INTO `sys_oper_log` VALUES (5, '用户管理', '删除用户', 3, NULL, NULL, 'com.jcm.system.controller.SysUserController.remove()', 'DELETE', '2025-01-21 16:20:23', 'slave', '/user/90', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '', 1, 'system:user:remove', '<span class=height-light-span-error>system:user:remove</span>', 1, NULL, '', '2025-01-21 16:20:23', NULL, '2025-01-21 16:20:23', b'0');
INSERT INTO `sys_oper_log` VALUES (6, '用户管理', '删除用户', 3, NULL, NULL, 'com.jcm.system.controller.SysUserController.remove()', 'DELETE', '2025-01-21 16:20:23', 'slave', '/user/90', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '', 1, 'system:user:remove', '<span class=height-light-span-error>system:user:remove</span>', 0, NULL, '', '2025-01-21 16:20:23', NULL, '2025-01-21 16:20:23', b'0');
INSERT INTO `sys_oper_log` VALUES (7, '用户管理', '删除用户', 3, NULL, NULL, 'com.jcm.system.controller.SysUserController.remove()', 'DELETE', '2025-01-21 16:20:23', 'slave', '/user/90', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{}', '', 1, 'system:user:remove', '<span class=height-light-span-error>system:user:remove</span>', 2, NULL, '', '2025-01-21 16:20:24', NULL, '2025-01-21 16:20:24', b'0');
INSERT INTO `sys_oper_log` VALUES (8, '用户任务', '新增用户任务', 1, NULL, NULL, 'com.jcm.system.controller.SysUserTaskController.add()', 'POST', '2025-01-27 18:28:55', 'admin', '/task/', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"createTime\":\"2025-01-27 18:28:55.665199400\",\"creator\":\"admin\",\"description\":\"测试\",\"endDate\":\"2025-02-13 00:01:00\",\"priority\":0,\"startDate\":\"2025-01-16 00:00:00\",\"status\":0,\"taskId\":4,\"title\":\"6666666666666\",\"type\":0,\"updateTime\":\"2025-01-27 18:28:55.665199400\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 53, NULL, '', '2025-01-27 18:28:56', NULL, '2025-01-27 18:28:56', b'0');
INSERT INTO `sys_oper_log` VALUES (9, '用户任务', '修改用户任务', 2, NULL, NULL, 'com.jcm.system.controller.SysUserTaskController.edit()', 'PUT', '2025-01-27 18:29:06', 'admin', '/task/', '127.0.0.1', '中国-江苏省-南京市-(电信)', '{\"description\":\"测试\",\"endDate\":\"2025-02-13 00:01:00\",\"priority\":0,\"startDate\":\"2025-01-16 02:00:00\",\"status\":0,\"taskId\":4,\"title\":\"6666666666666\",\"type\":0,\"updateTime\":\"2025-01-27 18:29:06.840931300\",\"updater\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, NULL, 18, NULL, '', '2025-01-27 18:29:07', NULL, '2025-01-27 18:29:07', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$LmfN18FinXMDPnQpKcBf0uDPO5dR80oqKbA3iTH260Y5WJQ1/c9yq', '超级管理员', '202252157@qq.com', '1761111111', 2, 'https://images.pexels.com/photos/19561749/pexels-photo-19561749.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 0, '192.168.0.5', '2025-01-28 18:58:55', '超级管理员', NULL, '2024-03-31 20:28:40', NULL, '2023-06-14 23:27:57', b'0');
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
INSERT INTO `sys_user` VALUES (67, 'slave', '$2a$10$vpn0IltX4.B1BSfr3Kiqv.rNBCQ9GuB6iJl7X.hiRJ4vHDrH9Ee2O', 'slavee', '330628396@qq.com', '13613968112', NULL, NULL, 0, '192.168.0.3', '2025-01-21 16:19:20', NULL, 'admin', '2024-10-31 16:33:31', NULL, '2024-10-31 16:33:31', b'0');
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
INSERT INTO `sys_user` VALUES (88, 'lvshihao', '$2a$10$FQeOZrzDCuG3TscGoZhTROvxfkdI5f1QL6d6fPUcfADi.ymNB9MHy', '222', '2022521977@qq.com', '17812061350', NULL, NULL, 1, NULL, NULL, NULL, 'admin', '2024-12-29 18:12:14', NULL, '2024-12-29 18:12:14', b'0');
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户前端样式设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_setting
-- ----------------------------
INSERT INTO `sys_user_setting` VALUES (1, 1, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, '测试', 'admin', '2024-11-26 16:54:34', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (2, 87, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, 'admin', '2024-12-24 19:38:08', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (3, 88, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, 'admin', '2024-12-29 18:12:14', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (4, 89, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, 'admin', '2024-12-29 18:46:53', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (5, 90, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, 'admin', '2024-12-29 18:48:49', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (6, 91, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, 'admin', '2024-12-29 18:51:29', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (7, 92, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, 'admin', '2024-12-30 13:40:14', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (8, 93, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, 'admin', '2025-01-03 18:09:22', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (9, 94, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, '', '2025-01-04 11:38:24', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (10, 95, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, '', '2025-01-04 11:40:21', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (11, 96, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, '', '2025-01-04 11:41:29', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (12, 97, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, '', '2025-01-04 11:44:23', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (13, 98, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, '', '2025-01-04 11:44:47', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (14, 99, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, '', '2025-01-04 13:27:52', 'admin', '2025-01-26 21:24:46', b'0');
INSERT INTO `sys_user_setting` VALUES (15, 100, 0, '#0052D9', b'1', b'1', b'1', b'1', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'1', 10, NULL, '', '2025-01-04 13:28:47', 'admin', '2025-01-26 21:24:46', b'0');

-- ----------------------------
-- Table structure for sys_user_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_task`;
CREATE TABLE `sys_user_task`  (
  `task_id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID，主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务描述',
  `start_date` datetime NOT NULL COMMENT '任务开始日期',
  `end_date` datetime NOT NULL COMMENT '任务结束日期',
  `priority` tinyint NOT NULL COMMENT '任务优先级（0:一般、1:中等、2:加急）',
  `status` tinyint NOT NULL COMMENT '任务状态（0:未开始、1:进行中、2:已完成）',
  `type` tinyint NOT NULL COMMENT '任务类型（0:修复bug，1：新增功能）',
  `user_id` bigint NOT NULL COMMENT '执行任务的用户ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标记（0: 未删除, 1: 已删除）',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_task
-- ----------------------------
INSERT INTO `sys_user_task` VALUES (1, '不能自动定位到新增tab页签的位置', '', '2025-01-24 00:00:00', '2025-02-03 00:00:00', 1, 0, 1, 1, NULL, 'admin', '2025-01-13 18:06:27', 'admin', '2025-01-18 15:18:43', b'0');
INSERT INTO `sys_user_task` VALUES (2, '测试', '1111111111111111', '2025-01-09 00:00:00', '2025-02-02 00:00:00', 1, 0, 0, 1, NULL, 'admin', '2025-01-13 19:23:01', 'admin', '2025-01-13 20:26:45', b'1');
INSERT INTO `sys_user_task` VALUES (3, '二级标签未选择变色', NULL, '2025-01-15 00:00:00', '2025-02-13 00:00:00', 1, 0, 0, 1, NULL, 'admin', '2025-01-14 21:46:17', NULL, '2025-01-14 21:46:17', b'0');
INSERT INTO `sys_user_task` VALUES (4, '6666666666666', '测试', '2025-01-16 02:00:00', '2025-02-13 00:01:00', 0, 0, 0, 1, NULL, 'admin', '2025-01-27 18:28:56', 'admin', '2025-01-27 18:29:07', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'vip表' ROW_FORMAT = Dynamic;

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
