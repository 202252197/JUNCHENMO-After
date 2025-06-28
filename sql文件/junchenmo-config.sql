/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3306
 Source Schema         : junchenmo-config

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 28/06/2025 20:12:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 255 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (19, 'jcm-system-dev.yml', 'DEFAULT_GROUP', 'spring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  redis:\n    host: localhost\n    port: 6379\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      url: jdbc:mysql://${MYSQL_HOST:localhost}:${MYSQL_PORT:3306}/${MYSQL_DATABASE:junchenmo}?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=GMT%2B8\n      username: ${MYSQL_USERNAME:root}\n      password: ${MYSQL_PASSWORD:lvshihao}\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      initial-size: 5\n      max-active: 30\n      min-idle: 5\n      max-wait: 60000\n      time-between-eviction-runs-millis: 60000\n      min-evictable-idle-time-millis: 30000\n      validation-query: SELECT 1 FROM DUAL\n      test-while-idle: true\n      test-on-borrow: false\n      test-on-return: false\n      pool-prepared-statements: true\n      filter:\n        slf4j:\n          enabled: true\n        stat:\n          enabled: true\n          merge-sql: true\n          slow-sql-millis: 300\n        wall:\n          enabled: true\n      stat-view-servlet:\n        enabled: true\n        login-username: admin\n        login-password: 123456\n        reset-enable: false\n      web-stat-filter:\n        enabled: true\nknife4j:\n  enable: true\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n  type-aliases-package: com.jcm.system.domain,com.jcm.system.api.domain\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n  global-config:\n    db-config:\n      logic-delete-field: deleted\n      id-type: auto\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n', '7cba81abb7ea0ab73966967c812ef63b', '2024-04-01 01:57:59', '2025-02-11 06:51:22', 'nacos', '0:0:0:0:0:0:0:1', '', '', '系统模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (22, 'jcm-auth-dev.yml', 'DEFAULT_GROUP', 'spring:\n  #knife4j文档需要配置，不配置文档无法正常显示接口\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  redis:\n    host: localhost\n    port: 6379\nknife4j:\n  enable: true', '44e1758dccc9c949b6fbce1d3641e535', '2024-04-01 13:43:10', '2025-05-11 13:08:28', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (28, 'jcm-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        - id: jcm-auth\n          uri: lb://jcm-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            - ValidateCodeFilter\n            - StripPrefix=1\n        - id: jcm-system\n          uri: lb://jcm-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        - id: jcm-system-websocket\n          uri: lb:ws//jcm-system\n          predicates:\n            - Path=/system/websocket/**\n          filters:\n            - StripPrefix=1\n        - id: jcm-gen\n          uri: lb://jcm-gen\n          predicates:\n            - Path=/gen/**\n          filters:\n            - StripPrefix=1\n        - id: jcm-job\n          uri: lb://jcm-job\n          predicates:\n            - Path=/job/**\n          filters:\n            - StripPrefix=1\nsecurity:\n  captcha:\n    enabled: true\n    type: math\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /csrf\n      - /system/websocket/**\nspringdoc:\n  swagger-ui:\n    urls:\n      - name: auth\n        url: /auth/v3/api-docs\n      - name: system\n        url: /system/v3/api-docs\n', '548c9d02d7565d9731c07a440ce907f9', '2024-04-03 02:51:45', '2025-02-11 06:54:26', 'nacos', '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (221, 'jcm-gen-dev.yml', 'DEFAULT_GROUP', 'spring:\n  #knife4j文档需要配置，不配置文档无法正常显示接口\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n# spring配置\n  redis:\n    host: localhost\n    port: 6379\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      url: jdbc:mysql://${MYSQL_HOST:localhost}:${MYSQL_PORT:3306}/${MYSQL_DATABASE:junchenmo}?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=GMT%2B8\n      username: ${MYSQL_USERNAME:root}\n      password: ${MYSQL_PASSWORD:lvshihao}\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      # 初始化物理链接的个数\n      initial-size: 5\n      # 最大连接池数量\n      max-active: 30\n      # 最小 连接池数量\n      min-idle: 5\n      # 获取连接时最大等待时间，单位毫秒 timeout链接超时\n      max-wait: 60000\n      # 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒  检测非核心链接的时间\n      #既作为检测的间隔时间又作为testWhileIdel执行的依据\n      time-between-eviction-runs-millis: 60000\n      # 连接保持空闲而不被驱逐的最小时间\n      min-evictable-idle-time-millis: 30000\n      # 用来检测连接是否有效的sql，要求是一个查询语句  8小时问题 8个小时没跟mysql通信mysql会主动关闭该链接\n      validation-query: SELECT 1 FROM DUAL\n      # 建议配置为true，不影响性能，并且保证安全性。申请连接的时候检测，\n      # 如果空闲时间大于min-evictable-idle-time-millis，执行validationQuery检测连接是否有效。\n      test-while-idle: true\n      # 申请连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。\n      test-on-borrow: false\n      # 归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。\n      test-on-return: false\n      # 是否缓存preparedStatement，也就是PSCache。PSCache对支持游标的数据库性能提升巨大，\n      # 比如说oracle。在mysql下建议关闭。不是mysql端，链接端，select * from student 查询缓存\n      pool-prepared-statements: true\n      #调优相关：基本上任何一个项目的性能瓶颈 1.io 2.cpu计算量\n      # 配置监控统计拦截的filters，去掉后监控界面sql无法统计\n      filter:\n        slf4j:\n          enabled: true\n        stat:\n          enabled: true\n          merge-sql: true\n          slow-sql-millis: 300\n        wall:\n          enabled: true\n      #配置stat-view-servlet\n      stat-view-servlet:\n        enabled: true\n        login-username: admin\n        login-password: 123456\n        reset-enable: false\n      #配置web-stat-filter\n      web-stat-filter:\n        enabled: true\nknife4j:\n  enable: true\n#mybatis-plus配置\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n  global-config:\n    db-config:\n      logic-delete-field: deleted #默认deleted\n      id-type: auto # Set ID type strategy according to your database\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n#mybatis配置\nmybatis:\n  mapper-locations: classpath:mapper/*.xml', 'b3e255ed2e7ede5f16d37ce65304319e', '2024-12-31 11:21:12', '2025-02-07 06:04:54', 'nacos', '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (233, 'jcm-job-dev.yml', 'DEFAULT_GROUP', 'spring:\n  #knife4j文档需要配置，不配置文档无法正常显示接口\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n# spring配置\n  redis:\n    host: localhost\n    port: 6379\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      url: jdbc:mysql://${MYSQL_HOST:localhost}:${MYSQL_PORT:3306}/${MYSQL_DATABASE:junchenmo}?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=GMT%2B8\n      username: ${MYSQL_USERNAME:root}\n      password: ${MYSQL_PASSWORD:lvshihao}\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      # 初始化物理链接的个数\n      initial-size: 5\n      # 最大连接池数量\n      max-active: 30\n      # 最小 连接池数量\n      min-idle: 5\n      # 获取连接时最大等待时间，单位毫秒 timeout链接超时\n      max-wait: 60000\n      # 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒  检测非核心链接的时间\n      #既作为检测的间隔时间又作为testWhileIdel执行的依据\n      time-between-eviction-runs-millis: 60000\n      # 连接保持空闲而不被驱逐的最小时间\n      min-evictable-idle-time-millis: 30000\n      # 用来检测连接是否有效的sql，要求是一个查询语句  8小时问题 8个小时没跟mysql通信mysql会主动关闭该链接\n      validation-query: SELECT 1 FROM DUAL\n      # 建议配置为true，不影响性能，并且保证安全性。申请连接的时候检测，\n      # 如果空闲时间大于min-evictable-idle-time-millis，执行validationQuery检测连接是否有效。\n      test-while-idle: true\n      # 申请连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。\n      test-on-borrow: false\n      # 归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。\n      test-on-return: false\n      # 是否缓存preparedStatement，也就是PSCache。PSCache对支持游标的数据库性能提升巨大，\n      # 比如说oracle。在mysql下建议关闭。不是mysql端，链接端，select * from student 查询缓存\n      pool-prepared-statements: true\n      #调优相关：基本上任何一个项目的性能瓶颈 1.io 2.cpu计算量\n      # 配置监控统计拦截的filters，去掉后监控界面sql无法统计\n      filter:\n        slf4j:\n          enabled: true\n        stat:\n          enabled: true\n          merge-sql: true\n          slow-sql-millis: 300\n        wall:\n          enabled: true\n      #配置stat-view-servlet\n      stat-view-servlet:\n        enabled: true\n        login-username: admin\n        login-password: 123456\n        reset-enable: false\n      #配置web-stat-filter\n      web-stat-filter:\n        enabled: true\nknife4j:\n  enable: true\n#mybatis-plus配置\nmybatis-plus:\n  mapper-locations: classpath:mapper/*.xml\n  type-aliases-package: com.jcm.job.domain,com.jcm.system.api.domain\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n  global-config:\n    db-config:\n      logic-delete-field: deleted #默认deleted\n      id-type: auto # Set ID type strategy according to your database\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n', '51abbdad3c193b6d9108d675c48bacdd', '2025-01-14 03:46:54', '2025-02-11 07:16:48', 'nacos', '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_gray
-- ----------------------------
DROP TABLE IF EXISTS `config_info_gray`;
CREATE TABLE `config_info_gray`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'group_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'md5',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'src_user',
  `src_ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'src_ip',
  `gmt_create` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'gmt_create',
  `gmt_modified` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'gmt_modified',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'tenant_id',
  `gray_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'gray_name',
  `gray_rule` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'gray_rule',
  `encrypted_data_key` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'encrypted_data_key',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfogray_datagrouptenantgray`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `gray_name` ASC) USING BTREE,
  INDEX `idx_dataid_gmt_modified`(`data_id` ASC, `gmt_modified` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'config_info_gray' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_gray
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增标识',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'operation type',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT '密钥',
  `publish_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT 'formal' COMMENT 'publish type gray or formal',
  `gray_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'gray name',
  `ext_info` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'ext info',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
