/*
Navicat MySQL Data Transfer

Source Server         : mysql-local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : estate-customer

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-03-13 14:48:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（VALID-有效， INVALID-无效）',
  `craete_time` datetime DEFAULT NULL,
  `process_state` varchar(50) DEFAULT NULL COMMENT '处理状态（NOT-未联系， DONE-已联系）',
  `park_name` varchar(50) DEFAULT NULL COMMENT '小区名称(天府名居)',
  `house_name` varchar(50) DEFAULT NULL COMMENT '房号(5栋一单元801）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of client
-- ----------------------------

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
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `obj_id` int(11) NOT NULL COMMENT '关联的对象id，与关联的对象有关',
  `name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `path` varchar(200) DEFAULT NULL COMMENT '图片相对路径',
  `create_time` datetime DEFAULT NULL,
  `obj_type` varchar(50) DEFAULT NULL COMMENT '关联对象的类型（客户-CLIENT, 房子-HOUSE）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of picture
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
