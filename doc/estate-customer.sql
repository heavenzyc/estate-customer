/*
Navicat MySQL Data Transfer

Source Server         : mysql-local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : estate-customer

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-03-18 17:52:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（VALID-有效， INVALID-无效）',
  `process_state` varchar(50) DEFAULT NULL COMMENT '处理状态（NOT-未联系， DONE-已联系，SOLD-已出售）',
  `park_name` varchar(50) DEFAULT NULL COMMENT '小区名称(天府名居)',
  `house_name` varchar(50) DEFAULT NULL COMMENT '房号(5栋一单元801）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `process_remark` varchar(500) DEFAULT NULL COMMENT '处理备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '三胖子', '13200903495', '34895489', 'VALID', 'NOT', '天府名居', '1栋1单元101', '2015-03-13 15:37:19', null, null, null);
INSERT INTO `client` VALUES ('2', '死胖子', '18900930092', '23423423', 'VALID', 'SOLD', '天府名居', '1栋1单元102', '2015-03-13 15:44:27', null, null, null);
INSERT INTO `client` VALUES ('3', '大胖子', '18234389094', '234353048', 'VALID', 'DONE', '天府名居', '1栋1单元103', '2015-03-13 16:36:20', null, null, null);
INSERT INTO `client` VALUES ('4', '金三胖', '15634324323', '23452340', 'VALID', 'NOT', '天府名居', '1栋1单元104', '2015-03-13 16:37:02', null, null, null);
INSERT INTO `client` VALUES ('14', '奥巴马', '18088888888', '1234098', 'VALID', 'DONE', '天堂小区', '1栋1单元111', '2015-03-16 16:38:23', null, '咋还没联系', '已经联系了，说是要买房子');
INSERT INTO `client` VALUES ('15', '普金', '19099999999', '2345234', 'VALID', 'DONE', '地狱小区', '0栋0单元000', '2015-03-16 16:38:23', null, '已经联系了', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
INSERT INTO `file_info` VALUES ('18', '1426672229280.jpg', 'f:\\apache-tomcat-7.0.47\\webapps\\ROOT\\upload\\20150318\\1426672229280.jpg', '20150318/1426672229280.jpg', '.jpg', '{\"height\":768,\"width\":1024}', '2015-03-18 17:50:29', '14', null, 'VALID');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL COMMENT '客户id',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '跟进时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户跟进信息';

-- ----------------------------
-- Records of track_info
-- ----------------------------
