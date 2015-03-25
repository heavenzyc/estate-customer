/*
Navicat MySQL Data Transfer

Source Server         : mysql-local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : estate-customer

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-03-25 18:07:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（VALID-有效， INVALID-无效）',
  `process_state` varchar(50) DEFAULT NULL COMMENT '处理状态（NOT-未联系， DONE-已联系，SOLD-已出售）',
  `park_name` varchar(50) DEFAULT NULL COMMENT '小区名称(天府名居)',
  `house_name` varchar(50) DEFAULT NULL COMMENT '房号(5栋一单元801）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL COMMENT '栋',
  `unit` varchar(50) DEFAULT NULL COMMENT '单元',
  `floor` varchar(50) DEFAULT NULL COMMENT '楼层',
  `num` varchar(50) DEFAULT NULL COMMENT '房号',
  `area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4118 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '三胖子', '13200903495', 'VALID', 'NOT', '天府名居', '1栋1单元101', '2015-03-13 15:37:19', null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('2', '死胖子', '18900930092', 'VALID', 'SOLD', '天府名居', '1栋1单元102', '2015-03-13 15:44:27', null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('3', '大胖子', '18234389094', 'VALID', 'DONE', '天府名居', '1栋1单元103', '2015-03-13 16:36:20', null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('4', '金三胖', '15634324323', 'VALID', 'NOT', '天府名居', '1栋1单元104', '2015-03-13 16:37:02', null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('14', '奥巴马', '18088888888', 'VALID', 'NOT', '天堂小区', '1栋1单元111', '2015-03-16 16:38:23', null, '咋还没联系', null, null, null, null, null);
INSERT INTO `client` VALUES ('15', '普金', '19099999999', 'VALID', 'DONE', '地狱小区', '0栋0单元000', '2015-03-16 16:38:23', null, '已经联系了', null, null, null, null, null);
INSERT INTO `client` VALUES ('16', '张三', '13023498924', 'VALID', 'NOT', '天然居', '5栋5单元505', '2015-03-25 15:32:08', '2015-03-25 16:13:47', '这是个土豪', '5', '5', '5', '505', '120');
INSERT INTO `client` VALUES ('17', '2', '22', 'VALID', 'NOT', '2', '2栋2单元2', '2015-03-25 15:56:46', '2015-03-25 16:01:17', '22222222222222', '2', '2', '2', '2', '222.22');

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `local_path` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `ext` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL COMMENT '关联的对象id，与关联的对象有关',
  `obj_type` varchar(50) DEFAULT NULL COMMENT '关联对象的类型（客户-CLIENT, 房子-HOUSE）',
  `status` varchar(255) DEFAULT NULL COMMENT '状态（VALID-有效， INVALID-无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES ('10', '1426669518597.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426669518597.jpg', '20150318/1426669518597.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:05:18', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('11', '1426669531701.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426669531701.jpg', '20150318/1426669531701.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:05:31', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('12', '1426669597841.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426669597841.jpg', '20150318/1426669597841.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:06:37', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('13', '1426670163691.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426670163691.jpg', '20150318/1426670163691.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:16:03', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('14', '1426670488665.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426670488665.jpg', '20150318/1426670488665.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:21:28', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('15', '1426670772316.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426670772316.jpg', '20150318/1426670772316.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:26:12', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('16', '1426670784276.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426670784276.jpg', '20150318/1426670784276.jpg', '.jpg', '{\"height\":539,\"width\":472}', '2015-03-18 17:26:24', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('17', '1426670810764.png', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426670810764.png', '20150318/1426670810764.png', '.png', '{\"height\":1136,\"width\":1610}', '2015-03-18 17:26:50', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('18', '1426672229280.jpg', 'f:\\apache-tomcat-7.0.47\\webapps\\ROOT\\upload\\20150318\\1426672229280.jpg', '20150318/1426672229280.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:50:29', '14', null, 'INVALID');
INSERT INTO `file_info` VALUES ('19', '1426674030398.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150318\\1426674030398.jpg', '20150318/1426674030398.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 18:20:30', '14', null, 'VALID');
INSERT INTO `file_info` VALUES ('20', '1427264052221.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264052221.jpg', '20150325/1427264052221.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:14:12', '15', null, 'VALID');
INSERT INTO `file_info` VALUES ('21', '1427264083175.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264083175.jpg', '20150325/1427264083175.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:14:43', '15', null, 'VALID');
INSERT INTO `file_info` VALUES ('22', '1427264121894.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264121894.jpg', '20150325/1427264121894.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:15:21', '15', null, 'VALID');
INSERT INTO `file_info` VALUES ('23', '1427264241720.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264241720.jpg', '20150325/1427264241720.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:17:21', '15', null, 'INVALID');
INSERT INTO `file_info` VALUES ('24', '1427264295109.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264295109.jpg', '20150325/1427264295109.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:18:15', '15', null, 'INVALID');
INSERT INTO `file_info` VALUES ('25', '1427264309389.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264309389.jpg', '20150325/1427264309389.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:18:29', '15', null, 'VALID');
INSERT INTO `file_info` VALUES ('26', '1427264313734.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264313734.jpg', '20150325/1427264313734.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:18:33', '15', null, 'VALID');
INSERT INTO `file_info` VALUES ('27', '1427264322842.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427264322842.jpg', '20150325/1427264322842.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 14:18:42', '15', null, 'VALID');
INSERT INTO `file_info` VALUES ('28', '1427271179666.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427271179666.jpg', '20150325/1427271179666.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 16:12:59', '17', null, 'VALID');
INSERT INTO `file_info` VALUES ('29', '1427271184837.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427271184837.jpg', '20150325/1427271184837.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 16:13:04', '17', null, 'VALID');
INSERT INTO `file_info` VALUES ('30', '1427271236113.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427271236113.jpg', '20150325/1427271236113.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 16:13:56', '16', null, 'VALID');
INSERT INTO `file_info` VALUES ('31', '1427271241280.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\wecode-business-platform-1.0-SNAPSHOT\\upload\\20150325\\1427271241280.jpg', '20150325/1427271241280.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-25 16:14:01', '16', null, 'VALID');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '房号',
  `park_name` varchar(50) DEFAULT NULL COMMENT '小区名称',
  `client_id` int(11) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产表';

-- ----------------------------
-- Records of house
-- ----------------------------

-- ----------------------------
-- Table structure for track_info
-- ----------------------------
DROP TABLE IF EXISTS `track_info`;
CREATE TABLE `track_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL COMMENT '客户id',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '跟进时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='客户跟进信息';

-- ----------------------------
-- Records of track_info
-- ----------------------------
INSERT INTO `track_info` VALUES ('1', '14', '联系过了', '2015-03-25 11:33:45');
INSERT INTO `track_info` VALUES ('2', '14', '找不见人', '2015-03-25 11:33:57');
INSERT INTO `track_info` VALUES ('6', '14', '12we3re233qd21dfef', '2015-03-25 13:20:44');
INSERT INTO `track_info` VALUES ('7', '14', '111111111111111', '2015-03-25 13:22:09');
INSERT INTO `track_info` VALUES ('8', '14', '123123213131', '2015-03-25 13:23:47');
INSERT INTO `track_info` VALUES ('9', '14', 'ddferfwefwf', '2015-03-25 13:23:56');
INSERT INTO `track_info` VALUES ('10', '15', '已经联系过了', '2015-03-25 14:18:58');
INSERT INTO `track_info` VALUES ('11', '15', '又找不见人了', '2015-03-25 14:19:08');
INSERT INTO `track_info` VALUES ('12', '14', '找不见了', '2015-03-25 15:36:43');
INSERT INTO `track_info` VALUES ('13', '17', '电话没人接', '2015-03-25 16:12:53');
INSERT INTO `track_info` VALUES ('14', '16', '还未联系到', '2015-03-25 16:14:10');
