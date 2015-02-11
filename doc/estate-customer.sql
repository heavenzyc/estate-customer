/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : estate-customer

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-02-11 16:19:07
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
  `park_name` varchar(50) DEFAULT NULL,
  `house_name` varchar(50) DEFAULT NULL,
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
-- Table structure for input_info
-- ----------------------------
DROP TABLE IF EXISTS `input_info`;
CREATE TABLE `input_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '入库单号',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目工程名',
  `purchase_type_id` varchar(50) DEFAULT NULL COMMENT '采购类别编码',
  `purchase_type_name` varchar(20) DEFAULT NULL COMMENT '采购类别名称',
  `contract_num` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `merchant_id` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `merchant_name` varchar(50) DEFAULT NULL COMMENT '供应商编码名称',
  `warehouse` varchar(50) DEFAULT NULL COMMENT '入库仓库',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  `material_id` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `material_name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `count` decimal(10,2) DEFAULT NULL COMMENT '入库数量',
  `money` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `transport_person` varchar(20) DEFAULT NULL COMMENT '运输人',
  `car_num` varchar(20) DEFAULT NULL COMMENT '运输车号',
  `weigh_person` varchar(20) DEFAULT NULL COMMENT '过磅人',
  `send_person` varchar(20) DEFAULT NULL COMMENT '发货人',
  `accept_person` varchar(20) DEFAULT NULL COMMENT '收货人',
  `input_time` datetime DEFAULT NULL COMMENT '入库日期',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `send_person_id` varchar(50) DEFAULT NULL COMMENT '发货人编码',
  `accept_person_id` varchar(50) DEFAULT NULL COMMENT '收货人编码',
  `standard_id` varchar(50) DEFAULT NULL COMMENT '材料规格编码',
  `standard_name` varchar(50) DEFAULT NULL COMMENT '材料规格名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `accept_merchant_id` varchar(50) DEFAULT NULL COMMENT '收货单位编码',
  `accept_merchant_name` varchar(50) DEFAULT NULL COMMENT '收货单位名称',
  `discount` decimal(10,2) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL COMMENT '材料编号',
  `type` varchar(20) DEFAULT NULL COMMENT '类型（ADD-手动添加  EXCEL-excel导入）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='入库信息表';

-- ----------------------------
-- Records of input_info
-- ----------------------------
INSERT INTO `input_info` VALUES ('1', '1422892976596', 'werwer', null, null, null, '001', '国美电器1', 'ewre', '2015-02-03 00:02:56', 'VALID', '001', '煤矿', '1.00', '1000.00', 'werwrwsdf', 'sdfsdf', 'sdf', '金三胖', '王尼玛', '2015-02-03 00:02:56', '23er2', '001', '004', null, null, '2000.00', '吨', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('2', '1422893311314', '222', '001', '煤矿类型1', null, '001', '国美电器1', '222', '2015-02-03 00:08:31', 'VALID', '001', '煤矿', '2.00', '2000.00', '222', '222', '222', '金三胖', '王尼玛', '2015-02-03 00:08:31', '222', '001', '004', '001', 'A级', '1000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('4', '1422937617701', '', '001', '煤矿类型1', null, '001', '国美电器1', '', '2015-02-03 12:26:57', 'INVALID', '001', '煤矿', '224.00', '224000.00', '', '', '', '金三胖', '王尼玛', '2015-02-03 12:26:57', '', '001', '004', '001', 'A级', '1000.00', '吨', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('5', '1422943888875', 'aXX', '001', '煤矿类型1', null, '001', '国美电器1', 'X', '2015-02-03 14:11:28', 'VALID', '001', '煤矿', '21.00', '21000.00', 'X', 'X', 'X', '奥巴马', '长全蛋', '2015-02-03 14:11:28', 'X', '002', '003', '001', 'A级', '1000.00', '吨', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('6', '1422975545526', 'cc', '001', '类型2', null, '2', '国美电器2', 'cc', '2015-02-03 22:59:05', 'VALID', '2', '金矿', '2.00', '100000.00', 'cc', 'cc', 'cc', '敖厂长', '敖厂长', '2015-02-03 22:59:05', 'cc', '6', '6', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('7', '1422977404108', 'ss', '001', '类型2', null, '1', '国美电器1', 'vv', '2015-02-03 23:30:04', 'VALID', '2', '金矿', '2.00', '100000.00', 'vv', 'vv', 'vv', '王尼玛', '王尼玛', '2015-02-03 23:30:04', 'vv', '4', '4', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('8', '1422977492529', '', '001', '类型2', null, '2', '国美电器2', '', '2015-02-03 23:32:32', 'VALID', '2', '金矿', '1.00', '50000.00', '', '', '', '敖厂长', '敖厂长', '2015-02-03 23:32:32', '', '6', '6', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('9', '1423034761121', 'vvvv', '001', '类型2', null, '2', '国美电器2', 'v', '2015-02-04 15:26:01', 'VALID', '2', '金矿', '3.00', '150000.00', 'v', 'v', 'v', '完尼玛', '金三胖', '2015-02-04 15:26:01', 'v', '5', '1', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('10', '1423056028876', 'aaa', '001', '煤矿类型1', null, '1', '国美电器1', 'aa', '2015-02-04 21:20:28', 'VALID', '1', '煤矿', '2.00', '1600.00', 'aa', 'aa', 'aa', '金三胖', '金三胖', '2015-02-04 21:20:28', 'aaa', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', null, 'ADD');
INSERT INTO `input_info` VALUES ('11', '1423056646470', 'bb', '001', '煤矿类型1', null, '1', '国美电器1', 'bb', '2015-02-04 21:30:46', 'VALID', '1', '煤矿', '3.00', '2400.00', 'bb', 'bb', 'bb', '金三胖', '金三胖', '2015-02-04 21:30:46', 'bb', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', null, 'ADD');
INSERT INTO `input_info` VALUES ('12', '0000000001', null, null, '原矿', null, null, null, 'A', '2015-02-09 14:40:40', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', null, null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `input_info` VALUES ('13', '0000000001', null, null, '粉', null, null, null, 'A', '2015-02-09 14:40:40', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', null, null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `input_info` VALUES ('14', '0000000001', null, null, '原矿', null, null, null, 'B', '2015-02-09 14:40:40', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', null, null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `input_info` VALUES ('15', '0000000002', null, null, '原矿', null, null, null, 'A', '2015-02-09 14:40:40', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', null, null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');
INSERT INTO `input_info` VALUES ('16', '0000000003', null, null, '原矿', null, null, null, 'A', '2015-02-09 14:40:40', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AADDD', '2015-01-02 00:00:00', null, null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `input_info` VALUES ('17', '0000000003', null, null, '粉', null, null, null, 'A', '2015-02-09 14:40:40', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468867', '张健君', 'VVVVVV', '李强', '2015-01-02 00:00:00', null, null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `input_info` VALUES ('18', '0000000003', null, null, '原矿', null, null, null, 'B', '2015-02-09 14:40:40', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468868', '张健君', 'VVVVVV', '汪铭锐', '2015-01-02 00:00:00', null, null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `input_info` VALUES ('19', '0000000003', null, null, '原矿', null, null, null, 'A', '2015-02-09 14:40:40', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468869', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-02 00:00:00', null, null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');
INSERT INTO `input_info` VALUES ('20', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('21', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('22', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('23', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('24', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('25', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('26', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('27', '', null, null, '', null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, '', '0.00', '0.00', null, null, null, null, null, null, null, null, null, null, '', '0.00', '', null, null, '0.00', '', 'EXCEL');
INSERT INTO `input_info` VALUES ('28', '', null, null, null, null, null, null, null, '2015-02-09 14:40:40', 'VALID', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'EXCEL');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '材料代码',
  `num` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `standard_id` varchar(50) DEFAULT NULL COMMENT '材料规格编码',
  `standard_name` varchar(50) DEFAULT NULL COMMENT '材料规格名称',
  `unit` varchar(50) DEFAULT NULL COMMENT '材料单位',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `count` decimal(11,2) DEFAULT NULL COMMENT '材料数量',
  `discount` decimal(11,2) DEFAULT NULL COMMENT '材料折扣',
  `type_id` varchar(50) DEFAULT NULL COMMENT '材料类别编码',
  `type_name` varchar(50) DEFAULT NULL COMMENT '材料类别名称',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='材料信息表';

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('1', '001', 'aaa', '煤矿', '001', 'A级', '吨', '1000.00', '100.00', '20.00', '001', '煤矿类型1', '2015-02-02 22:02:44', 'VALID');
INSERT INTO `material` VALUES ('2', '002', 'bbb', '金矿', '001', 'B级', '克', '50000.00', '100.00', '20.00', '001', '类型2', '2015-02-02 22:53:14', 'VALID');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL COMMENT '房子id',
  `name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `path` varchar(200) DEFAULT NULL COMMENT '图片相对路径',
  `create_time` datetime DEFAULT NULL,
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
