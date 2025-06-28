/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3306
 Source Schema         : junchenmoai

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 28/06/2025 19:21:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_ai_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_ai_role`;
CREATE TABLE `sys_ai_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色名称',
  `role_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色形象图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色关键词描述',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'SD,MJ,上传',
  `lora_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'lora名称',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_ai_role
-- ----------------------------
INSERT INTO `sys_ai_role` VALUES (2, '测试', 'http://lvshihao.oss-cn-beijing.aliyuncs.com/tw/8a8e6009-210e-418a-83a3-e972ab4858789eefb105f52f31a583a04596dd021d2421410b14c010e658ac220b404d35acb3.png?Expires=4863205333&OSSAccessKeyId=LTAI5tS6Rww8o4U4WRmh4RaH&Signature=SrqyxWfl7sEGvgRsiA2tcXTjyXo%3D', '测试2', 'SD', '鬼故事', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_ai_role` VALUES (4, '吕世昊', 'http://lvshihao.oss-cn-beijing.aliyuncs.com/tw/0a448fd9-e15c-4071-ab46-10cf9809e9aeMJ_20250228_201625.png?Expires=4863297066&OSSAccessKeyId=LTAI5tS6Rww8o4U4WRmh4RaH&Signature=ZvZtOYvrBVKboVOu18zarGUFzz8%3D', 'blue face', NULL, NULL, '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_lens
-- ----------------------------
DROP TABLE IF EXISTS `sys_lens`;
CREATE TABLE `sys_lens`  (
  `lens_id` bigint NOT NULL AUTO_INCREMENT COMMENT '镜头ID',
  `project_id` bigint NOT NULL COMMENT '关联的项目ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '镜头的原文内容',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '画面关键词（智能推理）',
  `roles_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '画面中的角色描述',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`lens_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1854 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_lens
-- ----------------------------
INSERT INTO `sys_lens` VALUES (609, 33, '六年前，唐暖宁意外失身，薄宴沉说她不守妇道，一纸离婚协议书将她扫地出门，净身出户', 500, '唐暖宁, 成年女性, 黑发, 疲惫的眼神, 轻轻摇头的表情, 现代家居背景, 室内场景, 中午时分, 自然光从窗户洒入, 侧面中景镜头, 感叹无奈的氛围', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (610, 33, '六年后，她带着孩子归来，看到她身边缩小版的自己，某人才知道当年那个野男人就是他本尊', 1000, '薄宴沉, 成年男性, 黑发, 惊讶的表情, 双手捂住脸, 现代客厅, 沙发旁, 下午时光, 暖色调灯光, 近景特写, 家庭矛盾的紧张感', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (611, 33, '他追悔莫及，又惊又喜，从此高冷总裁化身黏人精，夜夜都想爬她的床', 1500, '大儿子, 青少年男性, 棕发, 嫌弃的表情, 双手捂住眼睛, 现代客厅, 沙发旁, 下午时光, 暖色调灯光, 近景特写, 家庭矛盾的紧张感', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (612, 33, '再后来，听说她要嫁人，他冲进酒店砸了婚礼现场，咬牙切齿，你老公还没死呢', 2000, '二儿子, 青少年男性, 棕发, 嫌弃的表情, 双手捂住眼睛, 现代客厅, 沙发旁, 下午时光, 暖色调灯光, 近景特写, 家庭矛盾的紧张感', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (613, 33, '众人目瞪口呆', 2500, '三儿子, 幼年男孩, 短发, 忧虑的眼神, 紧张的表情, 站在门边, 现代家庭环境, 日落时分, 柔和的室内照明, 斜侧角度拍摄, 对未来的担忧情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (614, 33, '大儿子无语摇头，这个男人，我不想认识', 3000, '四儿子, 幼年男孩, 短发, 忧虑的眼神, 紧张的表情, 站在门边, 现代家庭环境, 日落时分, 柔和的室内照明, 斜侧角度拍摄, 对未来的担忧情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (615, 33, '二儿子嫌弃捂眼睛，丢死个人了，没眼看，根本没眼看', 3500, '小女儿, 穿着粉色公主裙, 大约5岁, 白皙皮肤, 大眼睛闪烁着天真光芒, 右手揪着男人的西装裤脚, 左手背在身后, 歪着小脑袋露出困惑又可爱的表情, 站在豪华婚礼殿堂里, 巨大的水晶吊灯洒下温暖光芒, 庄重华丽的装饰, 众多宾客面带惊讶注视着这一幕, 社交尴尬场景, 西装革履的男人(薄宴沉), 表情无奈又宠溺, 站在舞台边缘, 镜头从低角度仰拍, 突出小女孩的萌态和现场的尴尬氛围, 8k高清壁纸, 动画风格, 温馨又略带搞笑的色调', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (616, 33, '三儿子一脸担忧，完了，爹地今晚要挨打了', 4000, '，', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (617, 33, '四儿子蹙眉黑脸翻白眼，白眼翻到天上去了，无力吐槽', 4500, '年轻', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (618, 33, '只有小女儿穿着公主裙跑过去，揪着薄宴沉的衣角，歪着小脑袋奶萌奶萌的说，爹地，妈咪不可以当伴娘嘛', 5000, '女性', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (619, 33, '薄宴沉：……', 5500, '，', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (620, 33, '喜提年度最佳大型社死现场', 6000, '长发', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (621, 34, '相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，不要不要……啊……男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 500, '男人, 成年男性, 黑发, 坚定的眼神, 紧握的拳头, 现代室内场景, 中午时分, 自然光从窗户洒入, 正面中景镜头, 承诺与紧张的氛围', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (622, 34, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 1000, '唐暖宁, 成年女性, 长发, 痛苦的表情, 紧咬的嘴唇, 现代卧室, 下午时光, 昏暗的室内照明, 侧面特写, 痛苦与无助的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (623, 34, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！这算什么？婚内出轨吗？接下来让她怎么做人？让她怎么去面对自己的老公？', 1500, '唐暖宁, 成年女性, 长发, 迷茫的眼神, 紧握的床单, 现代卧室, 日落时分, 柔和的室内照明, 正面中景镜头, 迷茫与自责的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (624, 34, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……他会相信她吗？他还会接纳她吗？他们的婚姻还能继续吗？', 2000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 绝望与无助的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (625, 34, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。她不知道自己上辈子到底做错了什么，命运竟这般待她。从小没有父爱母爱，生活一塌糊涂。她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 2500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (626, 34, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 3000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (627, 34, '当年，从给她办理退学手续到订婚结婚。没有一个人征求过她的意见。也没有一个人问她愿意不愿意。他们擅作主张，直接毁了她的学业和前途。', 3500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (628, 34, '她哭过怨过，但最终还是向现实妥协了。都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 4000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (629, 34, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。可如今……就在薄宴沉回来当天出了这种事，她该怎么办？', 4500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (630, 34, '叮叮叮……手机突然响起，是家里的阿姨打来的，太太，先生叫您回来。唐暖宁的心脏咯噔了一下，心虚，心慌，他已经回去了吗？', 5000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (631, 34, '嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。唐暖宁的脑子嗡的一下，炸开了。薄宴沉要跟她离婚？！', 5500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (632, 34, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。可是这两年，他待她不薄！吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 6000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (633, 34, '两人相隔千里，她也能感受到他的关心。她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。没想到……', 6500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (634, 34, '太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。阿姨激动的说着，可是唐暖宁怎么能不难过呢？她都快难过死了。她这该死的人生，真是烂的不能再烂了。', 7000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (635, 34, '可是她现在还有什么资格说不离？她已经没了清白，她配不上他了。唐暖宁抽了下鼻翼，哑声道，我知道了，我马上回去签字。', 7500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (636, 34, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 8000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (637, 34, '她前脚刚走，几十辆黑色豪车突然出现在机场外。一群黑衣保镖同时下车，把机场团团围住。助理恭敬的打开车门，薄宴沉抬腿下车。纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 8500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (638, 34, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！大家都用仰望好奇的目光，小心翼翼打量着他。', 9000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (639, 34, '薄宴沉目无他人，踱步向VIP休息室走去。昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 9500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (640, 34, '那是人家姑娘的初夜。他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！他薄宴沉，说到做到。', 10000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (641, 34, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……', 10500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (642, 34, '就是什么？！……就是癞蛤蟆想吃天鹅肉。呵！薄宴沉抿起薄唇，脸色阴冷。', 11000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (643, 34, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 11500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (644, 34, '不是他薄情，是他们之间没有任何感情可言！离婚对于她来说是好事，是解脱。为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 12000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (645, 34, '没想到，她竟然是个不正经又登高踩底的女人！既然如此，那她就不配得到他的补偿。之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！是！', 12500, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 正面中景镜头, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (646, 34, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。用最温和最体面的一面，见她。一生一世一双人，他碰了她，这辈子就非她不要。', 13000, '唐暖宁, 成年女性, 长发, 泪眼模糊, 紧握的床单, 现代卧室, 夜晚, 昏暗的室内照明, 侧面特写, 自责与绝望的情绪', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (732, 28, '六年前，唐暖宁意外失身，薄宴沉说她不守妇道，一纸离婚协议书将她扫地出门，净身出户。 六年后，她带着孩子归来，看到她身边缩小版的自己，某人才知道当年那个野男人就是他本尊。', 500, '唐暖宁，三十岁女性，黑发微卷，眼角略带疲惫，嘴角却有一丝倔强，现代都市背景，室内场景，傍晚时分，暖黄色灯光洒在脸上，侧面中景镜头，手中紧握一张泛黄的离婚协议书，眼神中透露出复杂的情绪，既有怨恨又有一丝释然，身旁站着一个小男孩，眉眼间与薄宴沉如出一辙，两人之间保持着微妙的距离，薄宴沉站在对面，西装革履，眼神中闪过一丝震惊与懊悔，背景中隐约可见的时钟指向六点，暗示着时间的流逝与命运的捉弄，空气中弥漫着紧张与压抑的氛围，仿佛一场无声的较量正在上演。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (733, 28, ' 他追悔莫及，又惊又喜，从此高冷总裁化身黏人精，夜夜都想爬她的床。 再后来，听说她要嫁人，他冲进酒店砸了婚礼现场，咬牙切齿，“你老公还没死呢！” 众人目瞪口呆，“！！！！！！” ', 1000, '成年男性，高冷总裁，西装革履，眼神中透露出复杂的情绪，从冷漠到狂热的转变，现代都市背景，豪华酒店内，夜晚时分，灯光璀璨，侧面特写镜头，情绪从愤怒到绝望的张力，紧握的拳头，西装褶皱的细节，时间在瞬间凝固，现实与超现实的交织，感官上的冲击与混乱。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (734, 28, ' 大儿子无语摇头，“这个男人，我不想认识。” 二儿子嫌弃捂眼睛，“丢死个人了，没眼看，根本没眼看。” 三儿子一脸担忧，“完了，爹地今晚要挨打了。” 四儿子蹙眉黑脸翻白眼，白眼翻', 1500, '大儿子，成年男性，黑发，疲惫的眼神，轻轻摇头的表情，现代家居背景，室内场景，中午时分，自然光从窗户洒入，侧面中景镜头，感叹无奈的氛围。二儿子，青少年，金发，嫌弃的表情，双手捂眼的动作，现代家居背景，室内场景，中午时分，自然光从窗户洒入，正面中景镜头，尴尬厌恶的氛围。三儿子，少年，棕发，担忧的表情，紧锁的眉头，现代家居背景，室内场景，中午时分，自然光从窗户洒入，侧面近景镜头，紧张不安的氛围。四儿子，青少年，黑发，蹙眉的表情，翻白眼的动作，现代家居背景，室内场景，中午时分，自然光从窗户洒入，正面近景镜头，愤怒不屑的氛围。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (735, 28, ' 到天上去了，无力吐槽。 只有小女儿穿着公主裙跑过去，揪着薄宴沉的衣角，歪着小脑袋奶萌奶萌的说， “爹地，妈咪不可以当伴娘嘛？” 薄宴沉：“……” 喜提年度最佳大型社死现场！', 2000, '小女儿，约五岁，穿着粉色公主裙，头发扎成两个小辫子，眼睛圆润明亮，带着天真的疑惑，揪着薄宴沉的衣角，歪着头，奶声奶气地提问。薄宴沉，成年男性，西装笔挺，表情瞬间凝固，眼神中透出一丝尴尬与无奈，嘴角微微抽动，似乎不知如何回应。背景为婚礼现场，室内装饰华丽，灯光柔和，周围人群的目光聚焦在他们身上，气氛瞬间凝固。侧面中景镜头捕捉到薄宴沉的僵硬姿态和小女儿的纯真表情，形成强烈对比，情绪张力拉满，现实元素占比高，超现实阈值为零，感官通感为尴尬与萌趣交织。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (738, 27, '六年前，唐暖宁意外失身，薄宴沉说她不守妇道，一纸离婚协议书将她扫地出门，净身出户。', 500, '唐暖宁，28岁，女性，长发凌乱，眼中含泪，紧握离婚协议书，现代都市背景，豪华别墅内，黄昏时分，夕阳余晖透过落地窗洒在她身上，侧面特写镜头，绝望与愤怒交织的情绪，离婚协议书作为道具隐喻她的无助与背叛，空间距离学显示她与薄宴沉之间的冷漠与疏离，禁忌触碰体现在她颤抖的手指触碰协议书，机位设计为低角度拍摄，强化她的脆弱，动态捕捉她转身离去的瞬间，材质强化体现在协议书纸张的脆弱与她的坚强对比，时间诡计通过六年前的回忆与现实交织，现实元素占比高，超现实阈值为零，感官通感体现在她感受到的冰冷与孤独。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (739, 27, '六年后，她带着孩子归来，看到她身边缩小版的自己，某人才知道当年那个野男人就是他本尊。', 1000, '成年女性，约三十岁，长发微卷，眼神坚定，带着一丝疲惫，身边跟着一个约六岁的男孩，男孩黑发，眉眼间与她极为相似，穿着简单的童装，现代都市背景，黄昏时分，夕阳的余晖洒在街道上，母子俩站在街角，光影交错，侧面中景镜头，男孩好奇地四处张望，女性则微微低头，嘴角带着一丝苦涩的笑意，手中握着一只旧式怀表，表链微微晃动，情绪复杂，既有重逢的期待，又有过往的无奈，男性角色站在不远处，西装革履，眼神震惊，微微张开的嘴唇显示出内心的震撼，街道上行人匆匆，背景中有一辆红色出租车驶过，现实元素占比高，超现实阈值为零，感官通感为视觉与情感的交织。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (740, 27, '他追悔莫及，又惊又喜，从此高冷总裁化身黏人精，夜夜都想爬她的床。', 1500, '成年男性，西装革履，眼神中透露出复杂的情绪，嘴角微微上扬却带着一丝苦涩，现代都市公寓背景，夜晚时分，柔和的灯光洒在房间内，侧面中景镜头，床头柜上的闹钟显示凌晨两点，空气中弥漫着暧昧与不安的氛围，他轻轻靠近床边，手指微微颤抖，眼神中既有渴望又有犹豫，空间距离逐渐缩短，禁忌触碰的边缘，动态捕捉他每一个细微的动作，材质强化丝绸床单的质感，时间诡计让这一刻仿佛凝固，现实元素占比高，超现实阈值低，感官通感让观众感受到他内心的挣扎与渴望。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (741, 27, '再后来，听说她要嫁人，他冲进酒店砸了婚礼现场，咬牙切齿，“你老公还没死呢！”', 2000, '中年男子，短发凌乱，眼神狂乱，西装褶皱，拳头紧握，冲入酒店大厅，婚礼现场，白色婚纱与红色地毯，刺眼的灯光，侧面全景镜头，愤怒与绝望交织，面部肌肉紧绷，嘴角抽搐，声音嘶哑，空间距离迅速缩短，打破禁忌，动态捕捉其冲撞动作，材质强化玻璃碎裂声，时间诡计暗示过去与现在的冲突，现实元素占比高，超现实阈值低，感官通感为视觉与听觉的强烈冲击。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (742, 27, '众人目瞪口呆，“！！！！！！”', 2500, '众人，年龄各异，面容各异，眼神中透露出震惊，嘴巴微张，表情凝固，现代室内场景，白天，自然光从窗户照射进来，正面中景镜头，气氛紧张，情绪达到高潮，空间感强烈，时间仿佛停滞，现实元素占比高，超现实阈值低，感官通感强烈。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (743, 27, '大儿子无语摇头，“这个男人，我不想认识。”', 3000, '大儿子，成年男性，黑发，疲惫的眼神，轻轻摇头的表情，现代家居背景，室内场景，中午时分，自然光从窗户洒入，侧面中景镜头，感叹无奈的氛围', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (744, 27, '二儿子嫌弃捂眼睛，“丢死个人了，没眼看，根本没眼看。”', 3500, '二儿子，青少年，短发，皱眉捂眼，厌恶表情，现代客厅背景，午后阳光斜射，侧面近景镜头，尴尬氛围，手部动作强化，空间距离拉远，情绪张力强烈，现实元素主导，感官通感视觉与触觉结合。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (745, 27, '三儿子一脸担忧，“完了，爹地今晚要挨打了。”', 4000, '三儿子，青少年，短发，眉头紧锁，眼神焦虑，嘴角微微下垂，现代家庭客厅背景，傍晚时分，室内灯光昏暗，侧面近景镜头，紧张不安的氛围，手中紧握手机，手指无意识地敲打屏幕，身体微微前倾，仿佛随时准备行动，声音低沉且急促，透露出对父亲即将遭受惩罚的深切担忧。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (746, 27, '四儿子蹙眉黑脸翻白眼，白眼翻到天上去了，无力吐槽。', 4500, '四儿子，青年男性，黑发，紧蹙的眉头与翻白眼的夸张表情，面部肌肉紧绷，现代家居背景，室内场景，午后时分，自然光从窗户斜射，侧面近景镜头，无奈与嘲讽的情绪交织，空间距离感拉近，禁忌触碰的微妙氛围，动态捕捉其翻白眼的瞬间，材质强化其面部细节，时间诡计暗示其内心的矛盾，现实元素占比高，超现实阈值低，感官通感传递其内心的无力感。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (747, 27, '只有小女儿穿着公主裙跑过去，揪着薄宴沉的衣角，歪着小脑袋奶萌奶萌的说，“爹地，妈咪不可以当伴娘嘛？”', 5000, '小女儿，约五岁，穿着粉色公主裙，金发卷曲，大眼睛闪烁着天真，歪头时露出奶萌的表情，小手紧紧揪着薄宴沉的衣角，现代家居背景，室内场景，午后阳光透过窗帘洒入，侧面近景镜头，充满童真与期待的氛围。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (748, 27, '薄宴沉：“……”', 5500, '薄宴沉, 成年男性, 黑发, 深邃的眼神, 嘴角微抿的表情, 现代都市背景, 室内场景, 傍晚时分, 暖色调灯光从天花板洒下, 正面特写镜头, 沉默思索的氛围', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (749, 27, '喜提年度最佳大型社死现场！', 6000, '年轻女性，20岁出头，黑发披肩，尴尬的笑容，眼神闪烁，穿着时尚但略显凌乱，现代都市背景，室内场景，傍晚时分，暖色调灯光从天花板洒下，正面中景镜头，紧张尴尬的氛围，手中紧握手机，微微颤抖，背景中隐约可见围观人群，空间距离感强烈，禁忌触碰的暗示，动态捕捉到她的不安动作，材质强化了衣物的褶皱，时间诡计让场景显得更加漫长，现实元素占比高，超现实阈值低，感官通感中仿佛能听到她的心跳声。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (750, 35, '六年前，唐暖宁意外失身，薄宴沉说她不守妇道，一纸离婚协议书将她扫地出门，净身出户。 六年后，她带着孩子归来，看到她身边缩小版的自己，某人才知道当年那个野男人就是他本尊。', 500, '唐暖宁，28岁，女性，长发微卷，眼神中带着坚韧与疲惫，嘴角微微下垂，现代都市背景，室内场景，黄昏时分，暖黄色灯光洒满房间，侧面中景镜头，情绪复杂，带着一丝讽刺与无奈。薄宴沉，32岁，男性，西装笔挺，眼神中透露出震惊与懊悔，现代家居背景，室内场景，黄昏时分，自然光与灯光交织，正面特写镜头，情绪张力强烈，带着一丝悔恨与愤怒。孩子，6岁，男孩，黑发，眼神清澈，现代家居背景，室内场景，黄昏时分，自然光从窗户洒入，侧面中景镜头，天真无邪的氛围。道具隐喻：离婚协议书，象征着过去的错误与误解。空间距离学：唐暖宁与薄宴沉之间保持着一定的距离，显示出他们之间的隔阂与矛盾。禁忌触碰：薄宴沉试图靠近唐暖宁，但被她轻轻避开。机位设计：镜头从唐暖宁的侧面切换到薄宴沉的正脸，突出他们之间的情感冲突。动态捕捉：唐暖宁轻轻摇头，薄宴沉紧握拳头，显示出他们内心的挣扎与矛盾。材质强化：唐暖宁的衣物柔软，薄宴沉的西装笔挺，象征着他们不同的生活状态。时间诡计：六年前与六年后，时间线的交错，揭示出真相的复杂性。现实元素占比：现代都市背景，室内场景，黄昏时分，自然光与灯光交织，突出现实感。超现实阈值：孩子作为缩小版的薄宴沉，揭示出超现实的真相。感官通感：暖黄色灯光与黄昏的自然光交织，营造出复杂的情感氛围。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (751, 35, ' 他追悔莫及，又惊又喜，从此高冷总裁化身黏人精，夜夜都想爬她的床。 再后来，听说她要嫁人，他冲进酒店砸了婚礼现场，咬牙切齿，“你老公还没死呢！” 众人目瞪口呆，“！！！！！！” ', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (752, 35, ' 大儿子无语摇头，“这个男人，我不想认识。” 二儿子嫌弃捂眼睛，“丢死个人了，没眼看，根本没眼看。” 三儿子一脸担忧，“完了，爹地今晚要挨打了。” 四儿子蹙眉黑脸翻白眼，白眼翻', 1500, '大儿子，成年男性，黑发，疲惫的眼神，轻轻摇头的表情，现代家居背景，室内场景，中午时分，自然光从窗户洒入，侧面中景镜头，感叹无奈的氛围。二儿子，青少年，金发，嫌弃的表情，双手捂眼，现代家居背景，室内场景，中午时分，自然光从窗户洒入，正面中景镜头，尴尬厌恶的氛围。三儿子，少年，棕发，担忧的表情，现代家居背景，室内场景，中午时分，自然光从窗户洒入，侧面近景镜头，紧张不安的氛围。四儿子，青少年，黑发，蹙眉黑脸，翻白眼，现代家居背景，室内场景，中午时分，自然光从窗户洒入，正面近景镜头，愤怒不屑的氛围。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (753, 35, ' 到天上去了，无力吐槽。 只有小女儿穿着公主裙跑过去，揪着薄宴沉的衣角，歪着小脑袋奶萌奶萌的说， “爹地，妈咪不可以当伴娘嘛？” 薄宴沉：“……” 喜提年度最佳大型社死现场！', 2000, '小女儿，幼童，公主裙，奶萌表情，揪衣角动作，薄宴沉，成年男性，无奈沉默，现代室内场景，自然光，侧面近景镜头，尴尬氛围，亲子关系，空间距离近，情绪张力高，现实元素占比大，超现实阈值低，感官通感为视觉与情感交织。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (754, 36, '{', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (755, 36, '  \"prompt\": \"<lora:20250301-1740790579306:1>,1boy,\",', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (756, 36, '  \"negative_prompt\": \"\",', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (757, 36, '  \"steps\": \"20\",', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (758, 36, '  \"cfg_scale\": \"7\",', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (759, 36, '  \"width\": \"512\",', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (760, 36, '  \"height\": \"512\",', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (761, 36, '  \"sampler_name\": \"DPM++ 2M\",', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (762, 36, '  \"scheduler\": \"Karras\",', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (763, 36, '  \"seed\": 555,', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (764, 36, '  \"n_iter\": \"1\",', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (765, 36, '  \"batch_size\": \"1\",', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (766, 36, '  \"restore_faces\": \"True\", // 脸部修复', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (767, 36, '   \"return_grid\": \"True\",  // 返回网格预览 xl-base 好像没用', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (768, 36, '    \"send_images\": \"True\",  // 是否在响应中返回生成的图像', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (769, 36, '    \"save_images\": \"False\",  // 是否保存生成的图像 一般api设置成False', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (770, 36, '    \"do_not_save_samples\": \"False\",  // 是否保存samples 一般api设置成False', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (771, 36, '    \"do_not_save_grid\": \"False\",  // 是否保存网格的图像 一般api设置成False', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (772, 36, '  \"override_settings\": {', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (773, 36, '    \"sd_model_checkpoint\": \"SD1.5\\\\悬疑故事推文v1.safetensors\", // 指定大模型', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (774, 36, '    \"sd_vae\": \"Automatic\" // 指定vae 默认自动', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (775, 36, '  },', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (776, 36, '   \"alwayson_scripts\": {', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (777, 36, '        \"controlnet\":', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (778, 36, '            {', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (779, 36, '                \"args\": [', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (780, 36, '                    {', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (781, 36, '                        \"enabled\": \"True\",  // 启用', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (782, 36, '                        \"control_mode\": \"Balanced\",  // 对应webui 的 Control Mode 可以直接填字符串 Balanced 平和，My prompt is more important提示词重要，ControlNet is more important ControlNet 更重要  控制模式', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (783, 36, '                        \"model\": \"control_v11p_sd15_canny [d14c016b]\",  // 对应webui 的 Model 模型', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (784, 36, '                        \"module\": \"canny\",  // 对应webui 的 Preprocessor 预处理器', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (785, 36, '                        \"weight\": 1,  // 对应webui 的Control Weight 控制强度', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (786, 36, '                        \"processor_res\": 512,  // 预处理器分辨率 对应webui的Resolution', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (787, 36, '                        \"threshold_a\": 100,  //低阈值a 部分control module会用上 例如硬边缘处理器', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (788, 36, '                        \"threshold_b\": 200,  //高阈值b 部分control module会用上 例如硬边缘处理器', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (789, 36, '                        \"guidance_start\": 0,  // 什么时候介入 对应webui 的 Starting Control Step 控制介入时机', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (790, 36, '                        \"guidance_end\": 1,  // 什么时候退出 对应webui 的 Ending Control Step 控制结束时机', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (791, 36, '                        \"pixel_perfect\": \"True\",  // 像素完美', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (792, 36, '                        \"resize_mode\": \"Crop and Resize\", //对应wevui的缩放模式', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (793, 36, '                        \"save_detected_map\": \"True\",  // 因为使用了 controlnet API会返回生成controlnet的效果图，默认是True，如何不需要，改成False', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (794, 36, '                        \"input_image\": \"\",  // 图片 格式为base64', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (795, 36, '                    }', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (796, 36, '                    //多个controlnet 在复制上面一个字典下来就行', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (797, 36, '                ]', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (798, 36, '            },', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (799, 36, '        \"Refiner\": {', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (800, 36, '            \"args\": [', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (801, 36, '                \"True\",  //精修 是否开启', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (802, 36, '                \"sd_xl_refiner_1.SD1.5\\\\悬疑故事推文v1.safetensors0\",  // 大模型昵称', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (803, 36, '                0.75,  // 介入时机 精修开始的步数百分比，上边采样步数填写的是20，精修模型就从 20*0.8=16 之后，也就是第17步，开始参与绘制图片。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (804, 36, '            ]', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (805, 36, '        }', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (806, 36, '    },', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (807, 36, '  \"enable_hr\": \"True\", // 开启高清修复', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (808, 36, '  \"denoising_strength\": 0.4, //重绘幅度', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (809, 36, '  \"hr_second_pass_steps\": 0, //重设迭代步数', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (810, 36, '  \"hr_scale\": 2,    //放大倍率 这个放大倍数不能和x_Y放大一起使用，要么按倍率放大，要么按x_Y放大', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (811, 36, '  \"hr_resize_x\": 0,  // 不放大，指定宽高 对应webui Resize width to 和Resize height to', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (812, 36, '  \"hr_resize_y\": 0,  // 不放大，指定宽高 对应webui Resize width to 和Resize height to', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (813, 36, '  \"hr_upscaler\": \"R-ESRGAN 4x+\" //放大算法', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (814, 36, '}', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (815, 37, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (816, 37, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, '成年男性，黑发，坚定的眼神，声音低沉有力，现代室内场景，傍晚时分，暖黄色灯光从天花板洒下，侧面特写镜头，唐暖宁，年轻女性，长发凌乱，眼神慌乱，疯狂摇头的动作，两人面对面站立，距离约一米，男人伸手欲触碰唐暖宁的肩膀，唐暖宁后退一步，情绪紧张，空气中弥漫着压抑的氛围，背景中隐约传来时钟滴答声，现实元素占比90%，超现实阈值10%。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (817, 37, '“不要不要……啊……”', 1500, '年轻女子, 二十出头, 长发凌乱, 惊恐的眼神, 颤抖的嘴唇, 与陌生男子对峙, 昏暗的室内, 深夜时分, 月光透过窗帘缝隙, 手持刀具, 恐惧与绝望交织, 瞳孔放大, 呼吸急促, 距离仅一步之遥, 刀尖指向, 动态的挣扎, 丝绸睡衣, 时间仿佛凝固, 现实与噩梦交织, 冰冷触感, 正面特写镜头', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (818, 37, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, '成年男性，肌肉紧绷，面部狰狞，手臂青筋暴起，唐暖宁，年轻女性，面容痛苦，脸色苍白，瞬间失去意识，现代室内场景，昏暗灯光，阴影交错，地板冰冷，金属链条声回荡，侧面特写镜头，动态捕捉肌肉收缩与面部扭曲，情绪张力达到顶点，空间距离极近，禁忌触碰，时间诡计使瞬间拉长，现实元素占比高，超现实阈值低，感官通感传递疼痛与恐惧。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (819, 37, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, '年轻女性，长发凌乱，肌肤泛红，眼神迷离，嘴角微抿，现代酒店房间，清晨时分，阳光透过窗帘缝隙斜射，床单褶皱，空气中弥漫着香水与汗水的混合气息，特写镜头，孤独与留恋交织，手指轻抚床单，空间空旷，时间流逝感强烈，现实元素主导，感官记忆强烈。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (820, 37, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, '年轻女性，黑发凌乱，眼神迷离，脸颊泛红，唇色微暗，现代卧室背景，深夜时分，昏暗的灯光投射出暧昧的光影，侧面近景镜头，空气中弥漫着情欲与疲惫的气息，床单褶皱，衣物散落，时间诡计暗示着刚刚结束的激情，现实元素占比高，超现实阈值低，感官通感中夹杂着汗水和香水的混合气味。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (821, 37, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, '唐暖宁，年轻女性，黑发凌乱，咬唇动作显露出内心的挣扎与不安，攥紧床单的手指关节发白，视线逐渐模糊，泪水在眼眶中打转，现代卧室背景，夜晚时分，昏暗的灯光投射出阴影，特写镜头捕捉面部表情，情绪张力强烈，空间距离感压缩，床单的褶皱强化了内心的波动，时间仿佛凝固，现实元素占比高，超现实阈值低，感官通感传递出压抑与无助。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (822, 37, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, '成年女性，已婚，优雅装扮，焦虑眼神，紧握手机，机场大厅，傍晚时分，昏暗灯光，侧面特写镜头，紧张不安的氛围，手机屏幕显示未接来电，时间显示延误，空间距离感强烈，禁忌触碰暗示，动态捕捉她的颤抖，材质强化玻璃反射，时间诡计暗示等待的漫长，现实元素占比高，超现实阈值低，感官通感传递焦虑与无助。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (823, 37, '这算什么？', 4500, '年轻男子，黑发凌乱，眼神中透露出困惑与不满，嘴角微微下垂，现代办公室背景，室内场景，下午时分，日光灯冷光照射，正面中景镜头，气氛中夹杂着无奈与质疑，手中紧握的笔作为道具，暗示内心的挣扎与不安。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (824, 37, '婚内出轨吗？', 5000, '中年男性，西装革履，无名指上的婚戒微微发亮，眼神闪烁不定，手机屏幕在昏暗的酒吧角落发出幽蓝光芒，与邻座年轻女子暧昧的距离仅剩一拳之隔，威士忌杯中的冰块在暖黄灯光下缓缓融化，嘴角不自觉上扬的微表情暴露内心的窃喜，背景音乐是慵懒的爵士乐，空气中弥漫着香水与酒精混合的气息，特写镜头捕捉到他快速删除聊天记录的手指动作，窗外夜色渐深，霓虹灯投射在玻璃上的光影将他的侧脸分割成明暗两半。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (825, 37, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, '中年女性，黑发微卷，眼神闪烁不安，紧握的双手显露出内心的挣扎，与丈夫的关系陷入信任危机，现代家庭客厅，傍晚时分，昏黄的灯光投射出阴影，中景镜头捕捉到她的犹豫与恐惧，茶几上的离婚协议书成为无声的隐喻，空气中弥漫着紧张与绝望，她微微咬唇，目光游离，与丈夫保持着一臂之遥的距离，禁忌话题在两人之间形成无形的屏障，镜头从侧面切入，捕捉她颤抖的肩膀，棉质家居服衬托出她的脆弱，时间仿佛在这一刻凝固，现实的压力与内心的煎熬交织，超现实的孤独感逐渐蔓延，感官上仿佛能听到她急促的呼吸声。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (826, 37, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, '年轻女性，二十出头，长发凌乱，眼神惊恐，嘴唇颤抖，机场背景，夜晚时分，昏暗的灯光，紧急出口标志闪烁，侧面特写镜头，紧张恐惧的氛围，男人粗糙的手紧抓她的手腕，休息室门半掩，阴影笼罩，急促的呼吸声，金属门把手的冰冷触感，时间仿佛凝固，现实与噩梦交织，感官混乱，心跳声放大。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (827, 37, '他会相信她吗？', 6500, '中年男子，灰白短发，深邃眼窝，紧锁的眉头，犹豫的嘴角，现代办公室背景，黄昏时分，夕阳余晖透过百叶窗斜射，办公桌上的咖啡杯冒着热气，正面特写镜头，内心挣扎的氛围，手指无意识地敲击桌面，西装革履，时间仿佛凝固，现实与信任的博弈，空气中弥漫着紧张与不确定。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (828, 37, '他还会接纳她吗？', 7000, '中年男子，灰白短发，深邃皱纹，眼神复杂，微微皱眉，现代办公室背景，黄昏时分，暖黄灯光与窗外暮色交织，正面特写镜头，犹豫不决的氛围，手指轻敲桌面，西装革履，时钟指向六点，现实元素主导，轻微超现实光影效果，听觉上隐约传来远处钟声', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (829, 37, '他们的婚姻还能继续吗？', 7500, '中年夫妻，妻子眼角细纹，丈夫鬓角微白，彼此眼神回避，客厅角落的婚纱照蒙尘，黄昏光线斜射，茶几上离婚协议书半掩，沉默中压抑着未说出口的怨恨，两人分坐沙发两端，距离超过安全社交范围，妻子手指无意识摩挲婚戒，丈夫反复调整领带，窗外雷声隐隐，现实与回忆交织，空气中弥漫着无法言说的疲惫与挣扎。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (830, 37, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (831, 37, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, '她，年轻女性，长发微乱，眼神迷茫，嘴角微微下垂，现代都市背景，室内昏暗的灯光，夜晚时分，光影交错，侧面特写镜头，无奈与困惑交织的情绪，手中紧握的旧照片，空间狭小压抑，禁忌的回忆触碰，动态捕捉她颤抖的手指，材质强化照片的陈旧感，时间诡计暗示前世今生，现实元素占比高，超现实阈值低，感官通感中带着一丝苦涩。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (832, 37, '从小没有父爱母爱，生活一塌糊涂。', 9000, '年轻男子，约二十岁，瘦削身形，凌乱黑发，眼神空洞，嘴角微抿，现代城市背景，破旧公寓内，黄昏时分，昏暗灯光从窗外斜射，正面特写镜头，孤独无助的氛围，手中紧握一张泛黄照片，照片边缘磨损，情绪压抑，微表情中透露出渴望与绝望，空间狭小拥挤，墙壁斑驳，时间仿佛停滞，现实元素占比高，超现实感微弱，感官上能感受到潮湿的霉味和冰冷的空气。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (833, 37, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, '年轻女性，二十岁左右，黑发微卷，眼神坚定却带着一丝疲惫，紧握的拳头透露出内心的挣扎，现代农村背景，室内场景，傍晚时分，昏黄的灯光映照出她孤独的身影，正面特写镜头，压抑无奈的氛围，桌上摊开的大学录取通知书与一旁摆放的彩礼单形成鲜明对比，空间距离学上她与养父母保持一定距离，禁忌触碰体现在她拒绝接受彩礼的动作，动态捕捉她微微颤抖的肩膀，材质强化通过粗糙的木质家具凸显她的困境，时间诡计体现在她即将踏入大学却面临婚姻的压力，现实元素占比高，超现实阈值为零，感官通感通过她紧咬的嘴唇传达出内心的痛苦与不甘。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (834, 37, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, '唐欣，年轻女性，黑发柔顺，眼神中透露出不甘与无奈，紧抿的嘴唇显露出内心的挣扎，现代豪华客厅背景，室内场景，黄昏时分，暖色调灯光洒在精致的家具上，侧面中景镜头，沉重的氛围，手中紧握的茶杯微微颤抖，空间距离感明显，禁忌话题的触碰，动态捕捉她微微转身的动作，材质强化了丝绸裙摆的细腻质感，时间诡计暗示着命运的转折，现实元素占比高，超现实阈值低，感官通感中透出一丝苦涩的味道。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (835, 37, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (836, 37, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (837, 37, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (838, 37, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (839, 37, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (840, 37, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (841, 37, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (842, 37, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (843, 37, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (844, 37, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (845, 37, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (846, 37, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (847, 37, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (848, 37, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (849, 37, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (850, 37, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (851, 37, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (852, 37, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (853, 37, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (854, 37, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (855, 37, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (856, 37, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (857, 37, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (858, 37, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (859, 37, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (860, 37, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (861, 37, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (862, 37, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (863, 37, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (864, 37, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (865, 37, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (866, 37, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (867, 37, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (868, 37, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (869, 37, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (870, 37, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (871, 37, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (872, 37, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (873, 37, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (874, 37, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (875, 37, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (876, 37, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (877, 37, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (878, 37, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (879, 37, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (880, 37, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (881, 37, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (882, 37, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (883, 37, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (884, 37, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (885, 37, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (886, 37, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (887, 37, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (888, 37, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (889, 37, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (890, 37, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (891, 37, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (892, 37, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (893, 37, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (894, 37, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (895, 37, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (896, 37, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (897, 37, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (898, 37, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (899, 37, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (985, 27, NULL, 501, '大儿子成年男性黑发疲惫的眼神轻轻摇头的表情现代家居背景室内场景中午时分自然光从窗户洒入侧面中景镜头感叹无奈的氛围', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (987, 38, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, '年轻男子，二十出头，黑发微卷，眼神炽热而坚定，嘴角微微上扬，透露出自信与决心。他身穿简朴的布衣，却难掩其内在的锋芒。背景为古代庭院，夕阳余晖洒在他的侧脸上，形成一道金色的轮廓。他双手紧握，仿佛在宣誓，语气中带着不容置疑的坚定。镜头为正面中景，捕捉到他微微前倾的身体姿态，显示出他对眼前女子的迫切与承诺。空气中弥漫着一种紧张而期待的氛围，仿佛时间在这一刻凝固。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (988, 38, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, '成年男性，低沉坚定的声音，黑发，眼神坚定，唐暖宁，年轻女性，长发凌乱，眼神慌乱，疯狂摇头，现代室内场景，傍晚时分，暖黄色灯光，侧面近景镜头，紧张对峙的氛围，男人微微前倾的身体，唐暖宁后退半步，空间距离逐渐拉近，男人伸手欲触碰，唐暖宁侧身躲避，禁忌触碰的瞬间，情绪张力达到顶点，微表情捕捉到男人嘴角的坚定和唐暖宁眼中的抗拒，现实元素占比高，超现实阈值为零，感官通感为听觉上的坚定与视觉上的慌乱交织。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (989, 38, '“不要不要……啊……”', 1500, '年轻女子, 二十出头, 长发凌乱, 惊恐的眼神, 双手抱头的动作, 现代公寓背景, 室内场景, 深夜时分, 昏暗的灯光投射出阴影, 正面特写镜头, 极度恐惧的氛围', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (990, 38, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, '成年男性，肌肉紧绷，青筋暴起，冷酷眼神，唐暖宁，年轻女性，苍白面容，痛苦表情，两人对立，现代室内，昏暗灯光，阴影交错，金属手铐，象征束缚，紧张氛围，男人嘴角微扬，唐暖宁眉头紧锁，空间狭窄，男人逼近，唐暖宁后退，动态捕捉，男人动作迅猛，唐暖宁无力反抗，皮革手套，增强压迫感，时间凝固，现实元素主导，超现实感微弱，听觉冲击，唐暖宁惨叫刺耳。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (991, 38, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, '年轻女性，长发凌乱，眼神迷离，唇色微红，床单褶皱，空气中弥漫着香水与汗水混合的气息，清晨微光透过窗帘缝隙洒入，侧面特写镜头，情绪复杂交织，空间距离感强烈，时间诡计暗示短暂分离，现实元素占比高，感官通感强烈。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (992, 38, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (993, 38, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, '唐暖宁，年轻女性，黑发凌乱，咬唇动作显露出内心的挣扎与不安，攥紧床单的手指关节发白，视线逐渐模糊暗示情绪崩溃的边缘，现代卧室背景，昏暗的室内光线，傍晚时分，窗外微弱的光线透过窗帘缝隙洒入，特写镜头聚焦于她的面部和手部，紧张压抑的氛围，微表情中透露出痛苦与无助，空间距离感被压缩，禁忌触碰的床单成为情感宣泄的载体，动态捕捉她逐渐失控的情绪，床单的褶皱材质强化了内心的波动，时间诡计让这一刻显得漫长而沉重，现实元素占比高，超现实阈值为零，感官通感中触觉与视觉交织，传递出深层的心理压力。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (994, 38, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, '年轻女性，约30岁，精致妆容，眼神焦虑，已婚身份，机场大厅背景，傍晚时分，灯光昏暗，侧面特写镜头，手中紧握手机，表情复杂，混合着期待与不安，周围人群匆匆，空间拥挤，时间流逝感强烈，现实元素占比高，超现实阈值低，情绪张力紧绷。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (995, 38, '这算什么？', 4500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (996, 38, '婚内出轨吗？', 5000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (997, 38, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, '中年女性，微卷棕发，眼神闪烁，紧抿的嘴唇，现代家庭客厅，黄昏时分，昏暗的室内光线，侧面特写镜头，焦虑与愧疚交织的情绪，双手紧握茶杯，陶瓷杯象征脆弱的婚姻关系，身体微微前倾，与镜头形成压迫感，窗外夕阳投射出长长的阴影，暗示时间的流逝与无法挽回的过错，现实元素占比90%，超现实阈值10%，听觉上隐约传来时钟滴答声，触觉上感受到茶杯的冰冷。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (998, 38, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, '年轻女子，二十出头，长发凌乱，眼神惊恐，嘴唇颤抖，现代机场背景，夜晚，昏暗的灯光与闪烁的应急灯交织，侧面特写镜头，紧张恐惧的氛围，手被陌生男人紧紧抓住，黑色休息室门半开，阴影笼罩，急促的呼吸声与远处嘈杂声交织，时间在混乱中扭曲，现实与噩梦的界限模糊，感官被恐惧放大。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (999, 38, '他会相信她吗？', 6500, '中年男子，灰白短发，深邃的眼眶中透出怀疑与犹豫，微微皱眉的表情，现代办公室背景，傍晚时分，昏暗的灯光投射在两人之间，正面特写镜头，紧张不安的氛围，桌面上的文件散乱，手指无意识地敲击桌面，眼神闪烁不定，身体微微后倾，保持距离，空气中弥漫着不信任的气息。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1000, 38, '他还会接纳她吗？', 7000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1001, 38, '他们的婚姻还能继续吗？', 7500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1002, 38, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1003, 38, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1004, 38, '从小没有父爱母爱，生活一塌糊涂。', 9000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1005, 38, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1006, 38, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1007, 38, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1008, 38, '当年，从给她办理退学手续到订婚结婚。', 11000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1009, 38, '没有一个人征求过她的意见。', 11500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1010, 38, '也没有一个人问她愿意不愿意。', 12000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1011, 38, '他们擅作主张，直接毁了她的学业和前途。', 12500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1012, 38, '她哭过怨过，但最终还是向现实妥协了。', 13000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1013, 38, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1014, 38, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1015, 38, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1016, 38, '可如今……', 15000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1017, 38, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1018, 38, '“叮叮叮……”', 16000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1019, 38, '手机突然响起，是家里的阿姨打来的，', 16500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1020, 38, '“太太，先生叫您回来。”', 17000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1021, 38, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1022, 38, '“他已经回去了吗？”', 18000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1023, 38, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1024, 38, '唐暖宁的脑子嗡的一下，炸开了。', 19000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1025, 38, '薄宴沉要跟她离婚？！', 19500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1026, 38, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1027, 38, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1028, 38, '可是这两年，他待她不薄！', 21000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1029, 38, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1030, 38, '两人相隔千里，她也能感受到他的关心。', 22000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1031, 38, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1032, 38, '没想到……', 23000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1033, 38, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1034, 38, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1035, 38, '她都快难过死了。', 24500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1036, 38, '她这该死的人生，真是烂的不能再烂了。', 25000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1037, 38, '可是她现在还有什么资格说不离？', 25500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1038, 38, '她已经没了清白，她配不上他了。', 26000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1039, 38, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1040, 38, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1041, 38, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1042, 38, '一群黑衣保镖同时下车，把机场团团围住。', 28000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1043, 38, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1044, 38, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1045, 38, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1046, 38, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1047, 38, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1048, 38, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1049, 38, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1050, 38, '那是人家姑娘的初夜。', 32000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1051, 38, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1052, 38, '他薄宴沉，说到做到。', 33000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1053, 38, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, '薄宴沉，中年男性，西装笔挺，步伐稳健，眉头微皱，周生，年轻助理，短发干练，神情紧张，快步追赶，现代办公楼走廊，午后阳光透过玻璃幕墙洒落，光影交错，侧面全景镜头，紧张急促的氛围，皮鞋与地板的摩擦声，时间紧迫的暗示，现实职场环境，压力感通过急促的呼吸声传达。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1054, 38, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1055, 38, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1056, 38, '“就是什么？！”', 35000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1057, 38, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, '中年男子，微胖，油腻发亮的额头，嘴角带着讥讽的笑意，眼神中透露出不屑，现代办公室环境，午后阳光透过百叶窗斜射进来，形成明暗交错的条纹，办公桌上散乱的文件和咖啡杯，侧面特写镜头，语气轻蔑，手指轻轻敲击桌面，空气中弥漫着压抑的竞争氛围，现实元素占比高，超现实阈值低，听觉上仿佛能听到他话语中的刺耳回音。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1058, 38, '“呵！”', 36000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1059, 38, '薄宴沉抿起薄唇，脸色阴冷。', 36500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1060, 38, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1061, 38, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1062, 38, '不是他薄情，是他们之间没有任何感情可言！', 38000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1063, 38, '离婚对于她来说是好事，是解脱。', 38500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1064, 38, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, '中年男性，西装革履，眼神中带着愧疚与疲惫，手中紧握一张巨额支票，站在豪华别墅的客厅中，落地窗外阳光刺眼，室内装饰奢华却显得冰冷，侧面中景镜头捕捉到他微微颤抖的手，空气中弥漫着无奈与压抑，空间距离暗示两人关系的疏离，时间诡计暗示过去的错误无法弥补，现实元素占比高，超现实阈值低，感官通感中透出一丝金钱无法填补的空虚。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1065, 38, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1066, 38, '既然如此，那她就不配得到他的补偿。', 40000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1067, 38, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1068, 38, '“是！”', 41000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1069, 38, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1070, 38, '用最温和最体面的一面，见她。', 42000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1071, 38, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1072, 39, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1073, 39, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1074, 39, '“不要不要……啊……”', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1075, 39, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1076, 39, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1077, 39, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1078, 39, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1079, 39, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1080, 39, '这算什么？', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1081, 39, '婚内出轨吗？', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1082, 39, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1083, 39, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1084, 39, '他会相信她吗？', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1085, 39, '他还会接纳她吗？', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1086, 39, '他们的婚姻还能继续吗？', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1087, 39, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1088, 39, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1089, 39, '从小没有父爱母爱，生活一塌糊涂。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1090, 39, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1091, 39, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1092, 39, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1093, 39, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1094, 39, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1095, 39, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1096, 39, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1097, 39, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1098, 39, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1099, 39, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1100, 39, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1101, 39, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1102, 39, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1103, 39, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1104, 39, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1105, 39, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1106, 39, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1107, 39, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1108, 39, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1109, 39, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1110, 39, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1111, 39, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1112, 39, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1113, 39, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1114, 39, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1115, 39, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1116, 39, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1117, 39, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1118, 39, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1119, 39, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1120, 39, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1121, 39, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1122, 39, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1123, 39, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1124, 39, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1125, 39, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1126, 39, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1127, 39, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1128, 39, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1129, 39, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1130, 39, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1131, 39, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1132, 39, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1133, 39, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1134, 39, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1135, 39, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1136, 39, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1137, 39, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1138, 39, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1139, 39, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1140, 39, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1141, 39, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1142, 39, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1143, 39, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1144, 39, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1145, 39, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1146, 39, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1147, 39, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1148, 39, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1149, 39, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1150, 39, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1151, 39, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1152, 39, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1153, 39, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1154, 39, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1155, 39, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1156, 39, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1157, 40, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1158, 40, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1159, 40, '“不要不要……啊……”', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1160, 40, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1161, 40, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1162, 40, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1163, 40, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1164, 40, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1165, 40, '这算什么？', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1166, 40, '婚内出轨吗？', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1167, 40, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1168, 40, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1169, 40, '他会相信她吗？', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1170, 40, '他还会接纳她吗？', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1171, 40, '他们的婚姻还能继续吗？', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1172, 40, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1173, 40, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1174, 40, '从小没有父爱母爱，生活一塌糊涂。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1175, 40, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1176, 40, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1177, 40, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1178, 40, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1179, 40, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1180, 40, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1181, 40, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1182, 40, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1183, 40, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1184, 40, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1185, 40, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1186, 40, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1187, 40, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1188, 40, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1189, 40, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1190, 40, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1191, 40, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1192, 40, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1193, 40, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1194, 40, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1195, 40, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1196, 40, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1197, 40, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1198, 40, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1199, 40, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1200, 40, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1201, 40, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1202, 40, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1203, 40, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1204, 40, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1205, 40, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1206, 40, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1207, 40, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1208, 40, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1209, 40, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1210, 40, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1211, 40, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1212, 40, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1213, 40, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1214, 40, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1215, 40, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1216, 40, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1217, 40, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1218, 40, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1219, 40, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1220, 40, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1221, 40, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1222, 40, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1223, 40, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1224, 40, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1225, 40, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1226, 40, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1227, 40, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1228, 40, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1229, 40, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1230, 40, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1231, 40, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1232, 40, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1233, 40, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1234, 40, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1235, 40, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1236, 40, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1237, 40, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1238, 40, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1239, 40, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1240, 40, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1241, 40, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1242, 41, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1243, 41, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1244, 41, '“不要不要……啊……”', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1245, 41, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1246, 41, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1247, 41, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1248, 41, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1249, 41, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1250, 41, '这算什么？', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1251, 41, '婚内出轨吗？', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1252, 41, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1253, 41, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1254, 41, '他会相信她吗？', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1255, 41, '他还会接纳她吗？', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1256, 41, '他们的婚姻还能继续吗？', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1257, 41, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1258, 41, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1259, 41, '从小没有父爱母爱，生活一塌糊涂。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1260, 41, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1261, 41, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1262, 41, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1263, 41, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1264, 41, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1265, 41, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1266, 41, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1267, 41, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1268, 41, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1269, 41, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1270, 41, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1271, 41, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1272, 41, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1273, 41, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1274, 41, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1275, 41, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1276, 41, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1277, 41, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1278, 41, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1279, 41, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1280, 41, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1281, 41, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1282, 41, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1283, 41, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1284, 41, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1285, 41, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1286, 41, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1287, 41, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1288, 41, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1289, 41, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1290, 41, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1291, 41, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1292, 41, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1293, 41, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1294, 41, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1295, 41, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1296, 41, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1297, 41, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1298, 41, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1299, 41, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1300, 41, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1301, 41, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1302, 41, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1303, 41, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1304, 41, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1305, 41, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1306, 41, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1307, 41, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1308, 41, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1309, 41, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1310, 41, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1311, 41, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1312, 41, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1313, 41, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1314, 41, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1315, 41, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1316, 41, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1317, 41, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1318, 41, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1319, 41, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1320, 41, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1321, 41, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1322, 41, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1323, 41, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1324, 41, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1325, 41, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1326, 41, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1412, 42, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1413, 42, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1414, 42, '“不要不要……啊……”', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1415, 42, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1416, 42, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1417, 42, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1418, 42, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1419, 42, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1420, 42, '这算什么？', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1421, 42, '婚内出轨吗？', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1422, 42, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1423, 42, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1424, 42, '他会相信她吗？', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1425, 42, '他还会接纳她吗？', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1426, 42, '他们的婚姻还能继续吗？', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1427, 42, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1428, 42, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1429, 42, '从小没有父爱母爱，生活一塌糊涂。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1430, 42, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1431, 42, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1432, 42, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1433, 42, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1434, 42, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1435, 42, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1436, 42, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1437, 42, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1438, 42, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1439, 42, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1440, 42, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1441, 42, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1442, 42, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1443, 42, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1444, 42, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1445, 42, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1446, 42, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1447, 42, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1448, 42, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1449, 42, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1450, 42, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1451, 42, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1452, 42, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1453, 42, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1454, 42, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1455, 42, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1456, 42, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1457, 42, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1458, 42, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1459, 42, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1460, 42, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1461, 42, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1462, 42, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1463, 42, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1464, 42, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1465, 42, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1466, 42, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1467, 42, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1468, 42, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1469, 42, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1470, 42, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1471, 42, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1472, 42, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1473, 42, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1474, 42, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1475, 42, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1476, 42, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1477, 42, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1478, 42, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1479, 42, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1480, 42, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1481, 42, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1482, 42, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1483, 42, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1484, 42, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1485, 42, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1486, 42, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1487, 42, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1488, 42, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1489, 42, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1490, 42, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1491, 42, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1492, 42, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1493, 42, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1494, 42, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1495, 42, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1496, 42, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1497, 43, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，\"不要不要……啊……\"', 500, '男人, 成年男性, 低沉而坚定的声音, 唐暖宁, 年轻女性, 痛苦的表情, 拒绝的姿态, 机场休息室, 昏暗的灯光, 凌乱的衣物散落, 紧张的氛围, 近距离特写镜头, 急促的呼吸声, 柔软的床单, 瞬间的疼痛, 现实与超现实的交织, 强烈的情绪冲突', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1498, 43, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 1000, '男人, 成年男性, 强壮体格, 急促的呼吸声, 突然的暴力动作, 与唐暖宁的亲密关系, 机场VIP休息室, 昏暗的灯光, 凌乱的衣服和卫生纸团, 紧张而痛苦的氛围, 扭曲的面部表情, 近距离接触, 低角度镜头, 动态的身体动作, 粗糙的床单材质, 时间紧迫感, 现实中的暴力场景, 超现实的疼痛感, 听觉上的惨叫声', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1499, 43, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 1500, '年轻女性，二十出头，长发凌乱，眼神迷离，唇色微红，床单褶皱，清晨阳光透过窗帘缝隙洒入，室内光线柔和，空气中弥漫着淡淡的香水味，侧面特写镜头，情绪复杂，带着一丝失落与回味，空间空旷，床单材质柔软，时间定格在清晨，现实元素占比高，超现实阈值低，感官通感强烈。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1500, 43, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 2000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1501, 43, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 2500, '唐暖宁，年轻女性，黑发凌乱，眼神迷离，嘴唇紧咬，手指紧攥床单，床单褶皱明显，现代卧室背景，室内昏暗，傍晚时分，窗外微光透入，侧面特写镜头，情绪压抑，床单材质柔软，时间流逝感强烈，现实元素占比高，超现实阈值低，感官通感强烈。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1502, 43, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 3000, '成年女性，黑发微卷，眼神焦虑，紧握手机，机场大厅背景，傍晚时分，灯光昏暗，侧面特写镜头，情绪紧张，空间拥挤，动态捕捉她的不安，材质强化玻璃反射，时间诡计暗示等待的漫长，现实元素占比高，超现实阈值低，感官通感传递压抑氛围。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1503, 43, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 3500, '唐暖宁，年轻女性，黑发微乱，泪珠顺着脸颊滑落，眼神中透露出无助与挣扎，现代室内场景，黄昏时分，暖黄的灯光映照着她的侧脸，特写镜头捕捉到泪珠的晶莹剔透，情绪张力强烈，空间距离感拉近，禁忌触碰的脆弱感，动态捕捉到泪珠的坠落轨迹，材质强化了泪珠的透明质感，时间诡计让这一刻显得漫长，现实元素占比高，超现实阈值低，感官通感传递出内心的痛苦与无奈。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1504, 43, '手机突然响起，是家里的阿姨打来的，\"太太，先生叫您回来。\"', 4000, '中年女性，优雅气质，手机紧握，眉头微皱，现代都市背景，室内场景，傍晚时分，暖黄灯光映照，正面特写镜头，紧张不安的氛围', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1505, 43, '唐暖宁的心脏咯噔了一下，心虚，心慌，\"他已经回去了吗？\"', 4500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1506, 43, '阿姨回答，\"嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。\"', 5000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1507, 43, '唐暖宁的脑子嗡的一下，炸开了。', 5500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1508, 43, '唐暖宁抽了下鼻翼，哑声道，\"我知道了，我马上回去签字。\"', 6000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1509, 43, '唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 6500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1510, 43, '几十辆黑色豪车突然出现在机场外。', 7000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1511, 43, '一群黑衣保镖同时下车，把机场团团围住。', 7500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1512, 43, '助理恭敬的打开车门，薄宴沉抬腿下车。', 8000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1513, 43, '薄宴沉目无他人，踱步向VIP休息室走去。', 8500, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1514, 43, '助理周生小跑着跟上他的步伐，\"沉哥，家里来电话，太太已经回家了，不过……\"', 9000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1515, 43, '薄宴沉抿起薄唇，脸色阴冷。', 9500, '薄宴沉，成年男性，薄唇紧抿，脸色阴冷，眼神锐利如刀，现代都市背景，室内场景，黄昏时分，昏暗的灯光投射在脸上，侧面特写镜头，压抑愤怒的氛围，微表情中透露出内心的挣扎，空间距离感强烈，禁忌触碰的暗示，动态捕捉到手指微微颤抖，材质强化了冷硬的西装质感，时间诡计暗示即将爆发的冲突，现实元素占比高，超现实阈值为零，感官通感中感受到空气中的紧张与寒意。', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1516, 43, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 10000, '', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1517, 44, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1518, 44, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1519, 44, '唐暖宁再次醒来时，身边已经没了人影，但暧昧的气息却没有消散。', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1520, 44, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1521, 44, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1522, 44, '唐暖宁是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1523, 44, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1524, 44, '唐暖宁从小没有父爱母爱，生活一塌糊涂。', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1525, 44, '唐暖宁好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1526, 44, '唐暖宁的养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1527, 44, '唐暖宁从给她办理退学手续到订婚结婚，没有一个人征求过她的意见。', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1528, 44, '唐暖宁哭过怨过，但最终还是向现实妥协了。', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1529, 44, '唐暖宁独守空房两年，本本分分，从没有别的心思。', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1530, 44, '唐暖宁的手机突然响起，是家里的阿姨打来的。', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1531, 44, '唐暖宁的心脏咯噔了一下，心虚，心慌。', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1532, 44, '唐暖宁的脑子嗡的一下，炸开了。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1533, 44, '唐暖宁知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1534, 44, '唐暖宁以为薄宴沉只是不喜欢家族联姻，不是不喜欢她。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1535, 44, '唐暖宁挂了电话，强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1536, 44, '几十辆黑色豪车突然出现在机场外，一群黑衣保镖同时下车，把机场团团围住。', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1537, 44, '薄宴沉抬腿下车，纯手工定制皮鞋，价值不菲的高定西装，限量版腕表。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1538, 44, '薄宴沉目无他人，踱步向VIP休息室走去。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1539, 44, '薄宴沉昨晚吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1540, 44, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1541, 44, '薄宴沉抿起薄唇，脸色阴冷。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1542, 44, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1543, 45, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，\"不要不要……啊……\"', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1544, 45, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1545, 45, '唐暖宁再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1546, 45, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1547, 45, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1548, 45, '唐暖宁是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1549, 45, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1550, 45, '唐暖宁从小没有父爱母爱，生活一塌糊涂', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1551, 45, '唐暖宁好不容易考上了理想的大学，养父养母却又逼着她嫁人', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1552, 45, '唐暖宁的养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1553, 45, '唐暖宁的养父养母擅作主张，直接毁了她的学业和前途', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1554, 45, '唐暖宁哭过怨过，但最终还是向现实妥协了', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1555, 45, '唐暖宁独守空房两年，本本分分，从没有别的心思', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1556, 45, '唐暖宁的手机突然响起，是家里的阿姨打来的，\"太太，先生叫您回来\"', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1557, 45, '唐暖宁的心脏咯噔了一下，心虚，心慌，\"他已经回去了吗？\"', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1558, 45, '唐暖宁的脑子嗡的一下，炸开了，薄宴沉要跟她离婚', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1559, 45, '唐暖宁挂了电话，强忍着身体不适，穿好衣服，跌跌撞撞离开了机场', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1560, 45, '几十辆黑色豪车突然出现在机场外，一群黑衣保镖同时下车，把机场团团围住', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1561, 45, '薄宴沉抬腿下车，纯手工定制皮鞋，价值不菲的高定西装，限量版腕表', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1562, 45, '薄宴沉目无他人，踱步向VIP休息室走去', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1563, 45, '薄宴沉昨晚吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1564, 45, '薄宴沉怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1565, 45, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1566, 45, '薄宴沉听到太太昨晚应该是跟别的男人在一起，身上的痕迹很明显', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1567, 45, '薄宴沉听到太太这两年找了不少男人，经常夜不归宿', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1568, 45, '薄宴沉听到太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1569, 45, '薄宴沉抿起薄唇，脸色阴冷', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1570, 45, '薄宴沉决定之前的离婚协议作废，重新签，让她净身出户', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1571, 45, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1572, 46, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1573, 46, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1574, 46, '“不要不要……啊……”', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1575, 46, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1576, 46, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1577, 46, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1578, 46, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1579, 46, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1580, 46, '这算什么？', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1581, 46, '婚内出轨吗？', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1582, 46, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1583, 46, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1584, 46, '他会相信她吗？', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1585, 46, '他还会接纳她吗？', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1586, 46, '他们的婚姻还能继续吗？', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1587, 46, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1588, 46, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1589, 46, '从小没有父爱母爱，生活一塌糊涂。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1590, 46, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1591, 46, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1592, 46, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1593, 46, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1594, 46, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1595, 46, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1596, 46, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1597, 46, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1598, 46, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1599, 46, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1600, 46, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1601, 46, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1602, 46, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1603, 46, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1604, 46, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1605, 46, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1606, 46, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1607, 46, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1608, 46, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1609, 46, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1610, 46, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1611, 46, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1612, 46, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1613, 46, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1614, 46, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1615, 46, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1616, 46, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1617, 46, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1618, 46, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1619, 46, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1620, 46, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1621, 46, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1622, 46, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1623, 46, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1624, 46, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1625, 46, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1626, 46, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1627, 46, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1628, 46, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1629, 46, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1630, 46, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1631, 46, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1632, 46, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1633, 46, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1634, 46, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1635, 46, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1636, 46, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1637, 46, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1638, 46, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1639, 46, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1640, 46, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1641, 46, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1642, 46, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1643, 46, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1644, 46, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1645, 46, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1646, 46, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1647, 46, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1648, 46, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1649, 46, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1650, 46, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1651, 46, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1652, 46, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1653, 46, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1654, 46, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1655, 46, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1656, 46, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1657, 47, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头。', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1658, 47, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1659, 47, '唐暖宁再次醒来时，身边已经没了人影，但暧昧的气息却没有消散。', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1660, 47, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1661, 47, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1662, 47, '唐暖宁是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1663, 47, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1664, 47, '唐暖宁从小没有父爱母爱，生活一塌糊涂。', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1665, 47, '唐暖宁好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1666, 47, '唐暖宁的养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1667, 47, '唐暖宁从给她办理退学手续到订婚结婚，没有一个人征求过她的意见。', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1668, 47, '唐暖宁哭过怨过，但最终还是向现实妥协了。', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1669, 47, '唐暖宁独守空房两年，本本分分，从没有别的心思。', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1670, 47, '唐暖宁的手机突然响起，是家里的阿姨打来的。', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1671, 47, '唐暖宁的心脏咯噔了一下，心虚，心慌。', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1672, 47, '唐暖宁的脑子嗡的一下，炸开了。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1673, 47, '唐暖宁知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1674, 47, '唐暖宁以为薄宴沉只是不喜欢家族联姻，不是不喜欢她。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1675, 47, '唐暖宁挂了电话，强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1676, 47, '唐暖宁前脚刚走，几十辆黑色豪车突然出现在机场外。', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1677, 47, '一群黑衣保镖同时下车，把机场团团围住。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1678, 47, '助理恭敬的打开车门，薄宴沉抬腿下车。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1679, 47, '薄宴沉目无他人，踱步向VIP休息室走去。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1680, 47, '薄宴沉昨晚吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1681, 47, '薄宴沉怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1682, 47, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1683, 47, '薄宴沉抿起薄唇，脸色阴冷。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1684, 47, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1685, 48, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1686, 48, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1687, 48, '“不要不要……啊……”', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1688, 48, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1689, 48, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1690, 48, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1691, 48, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1692, 48, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1693, 48, '这算什么？', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1694, 48, '婚内出轨吗？', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1695, 48, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1696, 48, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1697, 48, '他会相信她吗？', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1698, 48, '他还会接纳她吗？', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1699, 48, '他们的婚姻还能继续吗？', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1700, 48, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1701, 48, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1702, 48, '从小没有父爱母爱，生活一塌糊涂。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1703, 48, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1704, 48, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1705, 48, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1706, 48, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1707, 48, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1708, 48, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1709, 48, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1710, 48, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1711, 48, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1712, 48, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1713, 48, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1714, 48, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1715, 48, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1716, 48, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1717, 48, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1718, 48, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1719, 48, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1720, 48, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1721, 48, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1722, 48, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1723, 48, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1724, 48, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1725, 48, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1726, 48, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1727, 48, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1728, 48, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1729, 48, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1730, 48, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1731, 48, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1732, 48, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1733, 48, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1734, 48, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1735, 48, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1736, 48, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1737, 48, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1738, 48, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1739, 48, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1740, 48, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1741, 48, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1742, 48, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1743, 48, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1744, 48, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1745, 48, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1746, 48, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1747, 48, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1748, 48, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1749, 48, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1750, 48, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1751, 48, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1752, 48, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1753, 48, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1754, 48, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1755, 48, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1756, 48, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1757, 48, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1758, 48, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1759, 48, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1760, 48, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1761, 48, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1762, 48, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1763, 48, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1764, 48, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1765, 48, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1766, 48, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1767, 48, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1768, 48, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1769, 48, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1770, 49, '“相信我！我会对你负责，会让你成为天下最幸福，最尊贵的女人！”', 500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1771, 49, '男人坚定的承诺声在耳边响起，唐暖宁疯狂摇头，', 1000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1772, 49, '“不要不要……啊……”', 1500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1773, 49, '男人猛的发力，唐暖宁惨叫一声，疼晕过去了。', 2000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1774, 49, '再次醒来时，身边已经没了人影，但是暧昧的气息却没有消散。', 2500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1775, 49, '地上随处可见的卫生纸团和凌乱的衣服，彰显着不久前的疯狂。', 3000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1776, 49, '唐暖宁咬着嘴唇攥紧床单，视线逐渐模糊……', 3500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1777, 49, '她是个有夫之妇，今天是来机场接老公的，如今还没接到人，就先失去了清白！', 4000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1778, 49, '这算什么？', 4500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1779, 49, '婚内出轨吗？', 5000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1780, 49, '接下来让她怎么做人？让她怎么去面对自己的老公？', 5500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1781, 49, '如果告诉他，她来机场接他，结果机场发生动乱，慌乱中她被一个男人拽进漆黑的休息室，发生了这种不堪的事……', 6000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1782, 49, '他会相信她吗？', 6500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1783, 49, '他还会接纳她吗？', 7000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1784, 49, '他们的婚姻还能继续吗？', 7500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1785, 49, '唐暖宁控制不住自己，眼泪扑哒扑哒往下掉。', 8000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1786, 49, '她不知道自己上辈子到底做错了什么，命运竟这般待她。', 8500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1787, 49, '从小没有父爱母爱，生活一塌糊涂。', 9000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1788, 49, '她想通过学习改变命运，好不容易考上了理想的大学，养父养母却又逼着她嫁人。', 9500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1789, 49, '该去联姻的明明是她妹妹唐欣，可因为联姻对象是个残疾，所以换成了她！', 10000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1790, 49, '养父养母舍不得亲生女儿受苦，又拒绝不了丰厚的彩礼，就用多年的养育之恩逼迫她替嫁过去。', 10500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1791, 49, '当年，从给她办理退学手续到订婚结婚。', 11000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1792, 49, '没有一个人征求过她的意见。', 11500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1793, 49, '也没有一个人问她愿意不愿意。', 12000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1794, 49, '他们擅作主张，直接毁了她的学业和前途。', 12500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1795, 49, '她哭过怨过，但最终还是向现实妥协了。', 13000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1796, 49, '都说女人出嫁就是重生，能摆脱那个冷漠的家庭也是好的，既然嫁了，那就做个好妻子。', 13500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1797, 49, '这两年薄宴沉一直在国外治疗腿疾，她独守空房两年，本本分分，从没有别的心思。', 14000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1798, 49, '这是她牺牲了学业和前途才换来的婚姻，是她的新生，她倍加珍惜。', 14500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1799, 49, '可如今……', 15000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1800, 49, '就在薄宴沉回来当天出了这种事，她该怎么办？', 15500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1801, 49, '“叮叮叮……”', 16000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1802, 49, '手机突然响起，是家里的阿姨打来的，', 16500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1803, 49, '“太太，先生叫您回来。”', 17000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1804, 49, '唐暖宁的心脏咯噔了一下，心虚，心慌，', 17500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1805, 49, '“他已经回去了吗？”', 18000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1806, 49, '“嗯，先生回来看您不在家立马又走了，走之前嘱咐，让您回来签字，先生他……他要跟您离婚。”', 18500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1807, 49, '唐暖宁的脑子嗡的一下，炸开了。', 19000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1808, 49, '薄宴沉要跟她离婚？！', 19500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1809, 49, '她知道薄宴沉对这桩婚姻不满，结婚当天他直接缺席，之后也一直没出现过。', 20000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1810, 49, '他们结婚两年，连一面都没见过，甚至都不知道彼此长什么样子。', 20500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1811, 49, '可是这两年，他待她不薄！', 21000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1812, 49, '吃穿用度从没委屈过她，她生病的时候他还会嘱咐佣人照顾好她。', 21500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1813, 49, '两人相隔千里，她也能感受到他的关心。', 22000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1814, 49, '她以为薄宴沉只是不喜欢家族联姻，不是不喜欢她，只要她做个好妻子，他们就能像其他恩爱夫妻一样，相互关心照拂，一起走完余生。', 22500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1815, 49, '没想到……', 23000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1816, 49, '“太太您不用太难过，先生把这栋别墅给您了，还给了您两辆豪车，还有很多很多钱。”', 23500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1817, 49, '阿姨激动的说着，可是唐暖宁怎么能不难过呢？', 24000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1818, 49, '她都快难过死了。', 24500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1819, 49, '她这该死的人生，真是烂的不能再烂了。', 25000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1820, 49, '可是她现在还有什么资格说不离？', 25500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1821, 49, '她已经没了清白，她配不上他了。', 26000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1822, 49, '唐暖宁抽了下鼻翼，哑声道，“我知道了，我马上回去签字。”', 26500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1823, 49, '挂了电话，唐暖宁强忍着身体不适，穿好衣服，跌跌撞撞离开了机场。', 27000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1824, 49, '她前脚刚走，几十辆黑色豪车突然出现在机场外。', 27500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1825, 49, '一群黑衣保镖同时下车，把机场团团围住。', 28000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1826, 49, '助理恭敬的打开车门，薄宴沉抬腿下车。', 28500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1827, 49, '纯手工定制皮鞋，价值不菲的高定西装，限量版腕表……成功男人的标配。', 29000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1828, 49, '他身材高挑，五官硬朗，强势又高冷的王者之气从他骨子里散发出来，让人不寒而栗！', 29500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1829, 49, '大家都用仰望好奇的目光，小心翼翼打量着他。', 30000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1830, 49, '薄宴沉目无他人，踱步向VIP休息室走去。', 30500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1831, 49, '昨晚他吃了不干净的东西被人追杀，情急之下他毁了一个姑娘的清白。', 31000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1832, 49, '之后他怕敌人追杀到这里连累到姑娘，他就先走了，消除危险以后他才回来。', 31500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1833, 49, '那是人家姑娘的初夜。', 32000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1834, 49, '他昨晚就说了，一定会对她负责，会让她成为这个世界上最幸福最尊贵的女人！', 32500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1835, 49, '他薄宴沉，说到做到。', 33000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1836, 49, '薄宴沉还没走到休息室，助理周生小跑着跟上他的步伐，', 33500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1837, 49, '“沉哥，家里来电话，太太已经回家了，不过……太太昨晚应该是跟别的男人在一起，身上的痕迹很明显。听家里管家说，太太这两年找了不少男人，经常夜不归宿……', 34000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1838, 49, '而且太太醉酒的时候还会口无遮拦，曾在酒吧当众说，说您是个残疾配不上她，说您娶了她，就是……”', 34500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1839, 49, '“就是什么？！”', 35000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1840, 49, '“……就是癞蛤蟆想吃天鹅肉。”', 35500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1841, 49, '“呵！”', 36000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1842, 49, '薄宴沉抿起薄唇，脸色阴冷。', 36500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1843, 49, '那个妻子是两年前薄家为了压制他的势力，强行塞给他的，他一次都没见过她，就连结婚当天他都没回来。', 37000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1844, 49, '如今局势已稳，他大权在握，不用再被束缚，所以他回来第一件事就是跟这个妻子离婚。', 37500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1845, 49, '不是他薄情，是他们之间没有任何感情可言！', 38000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1846, 49, '离婚对于她来说是好事，是解脱。', 38500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1847, 49, '为了弥补她这两年的青春，他给了她不少补偿，豪宅豪车，还有十个亿的支票。', 39000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1848, 49, '没想到，她竟然是个不正经又登高踩底的女人！', 39500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1849, 49, '既然如此，那她就不配得到他的补偿。', 40000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1850, 49, '“之前的离婚协议作废，重新签！她婚内出轨不守妇道，让她净身出户！”', 40500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1851, 49, '“是！”', 41000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1852, 49, '薄宴沉来到休息室门口，平息掉怒火，整理好衣冠，这才推开休息室的房门。', 41500, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1853, 49, '用最温和最体面的一面，见她。', 42000, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens` VALUES (1854, 49, '一生一世一双人，他碰了她，这辈子就非她不要。', 42500, NULL, NULL, '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_lens_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_lens_roles`;
CREATE TABLE `sys_lens_roles`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `lens_id` bigint NOT NULL COMMENT '镜头ID',
  `status` bit(1) NULL DEFAULT NULL COMMENT '是否启用(0:禁用,1:启用)',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_lens_roles
-- ----------------------------
INSERT INTO `sys_lens_roles` VALUES (4, 732, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 733, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 734, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 735, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (2, 732, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (2, 733, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (2, 734, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (2, 735, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1497, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1498, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1499, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1500, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1501, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1502, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1503, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1504, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1505, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1506, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1507, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1508, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1509, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1510, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1511, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1512, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1513, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1514, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1515, b'0', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_lens_roles` VALUES (4, 1516, b'0', '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_project
-- ----------------------------
DROP TABLE IF EXISTS `sys_project`;
CREATE TABLE `sys_project`  (
  `project_id` bigint NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `user_id` bigint NOT NULL COMMENT '关联的用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '项目名称',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '状态(0.故事分镜,1.批量绘图,2.视频生成)',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_project
-- ----------------------------
INSERT INTO `sys_project` VALUES (1, 1001, '未来科技项目', '0', '0', '张三', '2023-05-15 10:30:00', '李四', '2023-06-20 14:45:30');
INSERT INTO `sys_project` VALUES (2, 1002, '智能家居系统', '1', '0', '王五', '2023-07-01 09:15:20', '王五', '2023-07-05 16:30:45');
INSERT INTO `sys_project` VALUES (3, 1003, '在线教育平台', '2', '0', '赵六', '2023-08-12 14:00:00', '陈七', '2023-09-20 08:50:15');
INSERT INTO `sys_project` VALUES (4, 1004, '医疗健康APP', '0', '1', '孙八', '2022-11-05 13:45:30', '周九', '2022-12-01 10:20:00');
INSERT INTO `sys_project` VALUES (5, 1005, '新能源研发项目', '1', '0', '吴十', '2023-03-18 09:30:00', '吴十', '2023-04-15 16:00:45');
INSERT INTO `sys_project` VALUES (6, 1006, '智能物流系统', '2', '0', '郑十一', '2023-09-30 11:15:20', '张三', '2023-10-10 09:50:15');
INSERT INTO `sys_project` VALUES (7, 1007, '游戏开发计划', '0', '0', '李四', '2023-02-20 14:30:00', '赵六', '2023-05-25 17:45:30');
INSERT INTO `sys_project` VALUES (8, 1008, '金融科技解决方案', '1', '0', '王五', '2023-06-01 08:00:00', '陈七', '2023-06-15 12:30:45');
INSERT INTO `sys_project` VALUES (9, 1009, '环保材料创新', '2', '1', '孙八', '2023-07-22 13:15:20', NULL, '2025-03-03 10:56:10');
INSERT INTO `sys_project` VALUES (10, 1010, '太空探索计划', '0', '1', '吴十', '2022-12-31 23:59:59', '郑十一', '2023-01-01 00:00:00');
INSERT INTO `sys_project` VALUES (20, 1, 'qww', '0', '1', NULL, '2025-03-03 12:02:46', NULL, '2025-03-03 19:26:55');
INSERT INTO `sys_project` VALUES (21, 1, 'qwwq', '0', '1', NULL, '2025-03-03 13:57:30', NULL, '2025-03-03 19:26:51');
INSERT INTO `sys_project` VALUES (22, 1, 'qwwq', '0', '1', NULL, '2025-03-03 13:57:35', NULL, '2025-03-03 19:26:54');
INSERT INTO `sys_project` VALUES (23, 1, 'wqwq', '0', '1', NULL, '2025-03-03 16:29:01', NULL, '2025-03-03 19:26:53');
INSERT INTO `sys_project` VALUES (24, 1, '111', '0', '1', NULL, '2025-03-03 17:33:03', NULL, '2025-03-03 19:26:56');
INSERT INTO `sys_project` VALUES (25, 1, 'qww', '0', '1', NULL, '2025-03-03 18:15:48', NULL, '2025-03-03 19:26:45');
INSERT INTO `sys_project` VALUES (26, 1, '144', '0', '1', NULL, '2025-03-03 18:59:55', NULL, '2025-03-03 19:26:46');
INSERT INTO `sys_project` VALUES (27, 1, '我期望', '0', '0', NULL, '2025-03-03 19:26:59', NULL, '2025-03-03 19:26:59');
INSERT INTO `sys_project` VALUES (28, 1, '玩玩', '0', '0', NULL, '2025-03-03 19:28:41', NULL, '2025-03-03 19:28:41');
INSERT INTO `sys_project` VALUES (29, 1, '额外', '0', '0', NULL, '2025-03-03 19:28:46', NULL, '2025-03-03 19:28:46');
INSERT INTO `sys_project` VALUES (30, 1, '去问问', '0', '0', NULL, '2025-03-03 19:30:36', NULL, '2025-03-03 19:30:36');
INSERT INTO `sys_project` VALUES (31, 1, '11232', '0', '0', NULL, '2025-03-03 20:08:42', NULL, '2025-03-03 20:08:42');
INSERT INTO `sys_project` VALUES (32, 1, 'sasa', '0', '0', NULL, '2025-03-03 20:39:32', NULL, '2025-03-03 20:39:32');
INSERT INTO `sys_project` VALUES (33, 1, 'asas', '0', '0', NULL, '2025-03-04 09:02:18', NULL, '2025-03-04 09:02:18');
INSERT INTO `sys_project` VALUES (34, 1, '测试', '0', '0', NULL, '2025-03-04 10:14:17', NULL, '2025-03-04 10:14:17');
INSERT INTO `sys_project` VALUES (35, 1, '1', '0', '0', NULL, '2025-03-05 20:59:25', NULL, '2025-03-05 20:59:25');
INSERT INTO `sys_project` VALUES (36, 1, '2', '0', '0', NULL, '2025-03-05 21:06:59', NULL, '2025-03-05 21:06:59');
INSERT INTO `sys_project` VALUES (37, 1, '3', '0', '0', NULL, '2025-03-05 21:07:12', NULL, '2025-03-05 21:07:12');
INSERT INTO `sys_project` VALUES (38, 1, '1', '0', '0', NULL, '2025-03-05 21:24:39', NULL, '2025-03-05 21:24:39');
INSERT INTO `sys_project` VALUES (39, 1, '33', '0', '0', NULL, '2025-03-06 23:06:26', NULL, '2025-03-06 23:06:26');
INSERT INTO `sys_project` VALUES (40, 1, '6', '0', '0', NULL, '2025-03-06 23:07:57', NULL, '2025-03-06 23:07:57');
INSERT INTO `sys_project` VALUES (41, 1, '22', '0', '0', NULL, '2025-03-06 23:10:57', NULL, '2025-03-06 23:10:57');
INSERT INTO `sys_project` VALUES (42, 1, '9', '0', '0', NULL, '2025-03-06 23:13:41', NULL, '2025-03-06 23:13:41');
INSERT INTO `sys_project` VALUES (43, 1, '1', '0', '0', NULL, '2025-03-07 14:40:31', NULL, '2025-03-07 14:40:31');
INSERT INTO `sys_project` VALUES (44, 1, '22', '0', '0', NULL, '2025-03-07 21:31:41', NULL, '2025-03-07 21:31:41');
INSERT INTO `sys_project` VALUES (45, 1, '222', '0', '0', NULL, '2025-03-07 21:47:45', NULL, '2025-03-07 21:47:45');
INSERT INTO `sys_project` VALUES (46, 1, '99', '0', '0', NULL, '2025-03-07 21:55:16', NULL, '2025-03-07 21:55:16');
INSERT INTO `sys_project` VALUES (47, 1, '额外', '0', '0', NULL, '2025-03-07 22:00:54', NULL, '2025-03-07 22:00:54');
INSERT INTO `sys_project` VALUES (48, 1, '信息', '0', '0', NULL, '2025-03-07 22:04:11', NULL, '2025-03-07 22:04:11');
INSERT INTO `sys_project` VALUES (49, 1, '33', '0', '0', NULL, '2025-03-07 22:10:14', NULL, '2025-03-07 22:10:14');

-- ----------------------------
-- Table structure for sys_prompt
-- ----------------------------
DROP TABLE IF EXISTS `sys_prompt`;
CREATE TABLE `sys_prompt`  (
  `prompt_id` bigint NOT NULL AUTO_INCREMENT COMMENT '提示词id',
  `prompt_type_id` bigint NULL DEFAULT NULL COMMENT '分类ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '中文名称',
  `en_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '英文名称',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '提示词展示图片',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`prompt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_prompt
-- ----------------------------
INSERT INTO `sys_prompt` VALUES (1, 1, '女青年', NULL, NULL, '0', NULL, '2025-03-04 18:13:14', NULL, NULL);
INSERT INTO `sys_prompt` VALUES (2, 1, '男青年', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (3, 1, '少女', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (4, 1, '少年', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (5, 1, '幼女', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (6, 1, '幼童', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (7, 1, '成熟女性', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (8, 1, '成熟男性', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (9, 1, '老奶奶', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (10, 1, '老爷爷', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (11, 1, '婴儿', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (12, 2, '偏瘦', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (13, 2, '健壮', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (14, 2, '肥胖', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (15, 2, '孕妇', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (16, 3, '黑色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (17, 3, '棕色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (18, 3, '橙色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (19, 3, '红色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (20, 3, '粉色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (21, 3, '紫色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (22, 3, '蓝色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (23, 3, '紫色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (24, 3, '黄色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (25, 3, '青色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (26, 3, '绿色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (27, 3, '白色', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (28, 4, '短发', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (29, 4, '长发', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (30, 4, '卷发', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (31, 4, '秃头', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (32, 4, '刺猬头', NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt` VALUES (33, 4, '朋克头', NULL, NULL, '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_prompt_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_prompt_type`;
CREATE TABLE `sys_prompt_type`  (
  `prompt_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT '提示词类型ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '提示词类型名称',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`prompt_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_prompt_type
-- ----------------------------
INSERT INTO `sys_prompt_type` VALUES (1, '角色', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (2, '体型', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (3, '肤色', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (4, '发色', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (5, '发型', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (6, '服装', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (7, '上身服装', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (8, '下身服装', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (9, '鞋子', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (10, '帽子', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (11, '饰品', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (12, '耳朵', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (13, '胡子', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (14, '镜头角度', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_prompt_type` VALUES (15, '表情', '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `registration_date` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '\0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'N8n4JnBSqC1uUUcCY7zNqw==', '管理员', 'https://tse3-mm.cn.bing.net/th/id/OIP-C.7GLMYPqMlt2LgkbPsOnDIAAAAA?rs=1&pid=ImgDetMain', 'admin@example.com', '13800138000', '2023-01-01 00:00:00', '0', '0', 'admin', '2023-01-01 00:00:00', 'admin', '2023-01-01 00:00:00', '管理员账号');
INSERT INTO `sys_user` VALUES (2, 'zhangsan', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '张三', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', 'zhangsan@example.com', '13811112222', '2023-01-15 10:30:00', '0', '0', 'admin', '2023-01-15 10:30:00', 'admin', '2023-02-01 14:20:00', '普通用户');
INSERT INTO `sys_user` VALUES (3, 'lisi', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '李四', 'https://gw.alipayobjects.com/zos/antfincdn/efFD%24IOql2/weixintupian_20170331104822.jpg', 'lisi@example.com', '13922223333', '2023-02-05 09:15:00', '0', '0', 'admin', '2023-02-05 09:15:00', 'admin', '2023-02-10 11:30:00', '设计师账号');
INSERT INTO `sys_user` VALUES (4, 'wangwu', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '王五', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', 'wangwu@example.com', '13633334444', '2023-02-20 14:45:00', '0', '0', 'admin', '2023-02-20 14:45:00', 'admin', '2023-03-01 16:20:00', '产品经理账号');
INSERT INTO `sys_user` VALUES (5, 'zhaoliu', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '赵六', 'https://gw.alipayobjects.com/zos/antfincdn/efFD%24IOql2/weixintupian_20170331104822.jpg', 'zhaoliu@example.com', '13744445555', '2023-03-10 11:20:00', '0', '0', 'admin', '2023-03-10 11:20:00', 'admin', '2023-03-15 09:30:00', '测试人员账号');

-- ----------------------------
-- Table structure for sys_user_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_setting`;
CREATE TABLE `sys_user_setting`  (
  `setting_id` int NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `stable_diffusion_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'StableDiffusionWebUI的请求接口',
  `stable_diffusion_cloud_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'StableDiffusionWebUI的云端请求接口',
  `comfy_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ComfyWebUI的请求接口',
  `comfy_cloud_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ComfyWebUI的云端请求接口',
  `agent_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '代理地址',
  `project_draft` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '项目草稿位置',
  `jianying_draft` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '剪映草稿位置',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_setting
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
