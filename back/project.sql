/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : project06

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2022-03-17 11:07:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL COMMENT '模型',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `fun` varchar(255) DEFAULT NULL COMMENT '功能说明',
  `keyCode` varchar(255) NOT NULL COMMENT '关键字',
  `val` varchar(255) DEFAULT NULL COMMENT '值',
  `detail` varchar(255) DEFAULT NULL COMMENT '详细说明',
  `cond` varchar(255) DEFAULT NULL COMMENT '生效条件',
  `effectTime` varchar(255) DEFAULT NULL COMMENT '生效时机',
  `demo` varchar(255) DEFAULT NULL COMMENT '生效条件',
  `startTime` varchar(255) DEFAULT '' COMMENT '起始版本日期',
  `endTime` varchar(255) DEFAULT NULL COMMENT '终止版本日期',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('9', '应用程序', '调试', 'Adone保护模式的控制', 'Adone_project', '', '', '', 'path=全路径或进程名，session=N', '', '', '', '有效');
INSERT INTO `project` VALUES ('85', '基本', '功能', '在有指定文件有移动，复制，创建时警告', 'altert_file', 'N(0/1/2...)', '', '', '', '', '2022-03-15T16:00:00.000Z', '2022-03-22T16:00:00.000Z', '有效');
INSERT INTO `project` VALUES ('84', '文档', '调试', '接入监测兼容其他服务器', 'agent_packet_sip_ign', 'N(0/1/2...)', '', '', '', '', '2022-03-15T16:00:00.000Z', '2022-03-22T16:00:00.000Z', '失效');
INSERT INTO `project` VALUES ('86', '加密', '功能', '客户端自动登录', 'AutoLoginSDSystem', 'N(0/1/2...)', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('51', '打印', '功能', '打印水印用工号替换用户名', 'Agent_ZXTX_UID2UName', 'N(0/1/....)', '和C语言一样，PHP 中也有三元运算符', '和C语言一样，PHP 中也有三元运算符，三元运算符可以实现简单的条件判断功能，', '', '果用户在网页上单击一个购买按钮，会显示一个购买确认信息框来响应这个动作。', '2022-03-14T16:00:00.000Z', '2022-03-21T16:00:00.000Z', '失效');
INSERT INTO `project` VALUES ('36', '加密', '调试', 'ocular目录申请相关文件收缩', 'AreqInfoClear', '', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('35', '应用程序', '功能', '禁止关闭指定应用程序', 'App_Project', 'path=全路径或进程名，session=N', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('34', '文档', '功能', '中兴通讯电脑使用人、当前使用人获取，间隔时间', 'Agent_ZXTXInfo_CheckTimeInterval', '', '', '', '', '', '2022-03-11T13:41', '2022-03-26T13:41', '有效');
INSERT INTO `project` VALUES ('118', '资产', '功能', '软件资产比较时候属性数量的比较方式', 'AssetAttrCompareType', 'N(0/1/2...)', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('119', '基本', '功能', '获取网络适配器信息配置', 'agent_gettype', 'n(0/1/2...)', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('120', '123', '功能', '', '123', '', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('50', '打印', '调试', '打印水印用工号替换用户名', 'Agent_ZXTX_UID2UName', 'N(0/1/....)', '和C语言一样，PHP 中也有三元运算符', '和C语言一样，PHP 中也有三元运算符，三元运算符可以实现简单的条件判断功能，', '', '果用户在网页上单击一个购买按钮，会显示一个购买确认信息框来响应这个动作。', '2022-03-14T16:00:00.000Z', '2022-03-21T16:00:00.000Z', '失效');
INSERT INTO `project` VALUES ('29', '文档', '功能', '安全监测监测间隔时间', 'Agent_TDS_checjTimeInterval', 'N', '前两天业务涉及到一个拉取答题排行榜的需求，数据库里数据是这样的：\r\n同一个人可能提交过多次成绩，所以同一个人可能会有多次记录；\r\n同一个人提交的多次成绩中可能有至少两次成绩是一样的。\r\n\r\n于是，查询的时候，首先查询出每个人的最高成绩记录，然后如果某个人的最高成绩记录有多条，去重！', '前两天业务涉及到一个拉取答题排行榜的需求，数据库里数据是这样的：\r\n同一个人可能提交过多次成绩，所以同一个人可能会有多次记录；\r\n\r\n同一个人提交的多次成绩中可能有至少两次成绩是一样的。\r\n于是，查询的时候，首先查询出每个人的最高成绩记录，然后如果某个人的最高成绩记录有多条，去重！', 'path=全路径或进程名，session=N', '', '2022-03-11T10:43', '2022-03-11T13:45', '有效');
INSERT INTO `project` VALUES ('30', '打印', '功能', '打印水印用工号替换用户名', 'Agent_ZXTX_UID2UName', 'N(0/1/....)', '和C语言一样，PHP 中也有三元运算符，三元运算符可以实现简单的条件判断功能，即根据第一个表达式的结果在另外两个表达式中选择一个并执行，三元运算符也被称为三目运算符或者条件运算符。', '和C语言一样，PHP 中也有三元运算符，三元运算符可以实现简单的条件判断功能，即根据第一个表达式的结果在另外两个表达式中选择一个并执行，三元运算符也被称为三目运算符或者条件运算符。', '介绍：事件是在编程时系统内发生的动作或者发生的事情，系统会在事件出现时产生或触发某种信号，并且会提供一个自动加载某种动作（列如：运行一段代码）的机制。例如：如果用户在网页上单击一个购买按钮，会显示一个购买确认信息框来响应这个动作。', '', '2022-03-11T10:46', '2022-03-19T10:46', '有效');
INSERT INTO `project` VALUES ('111', '加密', '功能', 'ocular目录申请相关文件收缩', 'AreqinfoClear', 'N(0/1/2.....)', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('94', '应用程序', '功能', 'BAT程序识别', 'appctrl_uncisid_limit', 'N(0/1/2...)', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('89', '设备', '功能', 'abd控制', 'android_debug_dis', '', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('90', '加密', '功能', '解密申请文件数量限制', 'apply_decrypt_upper', 'n(0/1/2...)', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('88', '资产', '功能', '软件资产比较时属性数量的比较方式', 'AssetAttrCompareSystem', '', '', '', '', '', '', '', '有效');
INSERT INTO `project` VALUES ('87', '加密', '功能', '共享文件夹允许打印文件', 'allow_netshareprotectdir_print', 'N(0/1/2...)', '', '', '', '', '', '', '有效');
