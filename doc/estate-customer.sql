/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : estate-customer

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-04-03 00:17:20
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
) ENGINE=InnoDB AUTO_INCREMENT=4283 DEFAULT CHARSET=utf8 COMMENT='客户表';

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
INSERT INTO `client` VALUES ('4118', '谢晓梅,邓浩', '13558760910|||13881175', 'VALID', 'NOT', '礼顿山', '3栋1单元301', '2015-03-25 21:18:51', null, null, '3', '1', '3', '301', '109.71');
INSERT INTO `client` VALUES ('4119', '祝琳', '13980010808', 'VALID', 'NOT', '礼顿山', '3栋1单元302', '2015-03-25 21:18:51', null, null, '3', '1', '3', '302', '89.35');
INSERT INTO `client` VALUES ('4120', '杨紫艳', '15908179103', 'VALID', 'NOT', '礼顿山', '3栋1单元303', '2015-03-25 21:18:51', null, null, '3', '1', '3', '303', '125.22');
INSERT INTO `client` VALUES ('4121', '张杨韵', '18980676301', 'VALID', 'NOT', '礼顿山', '3栋1单元305', '2015-03-25 21:18:51', null, null, '3', '1', '3', '305', '127.03');
INSERT INTO `client` VALUES ('4122', '张云芳', '13608023272', 'VALID', 'NOT', '礼顿山', '3栋1单元306', '2015-03-25 21:18:51', null, null, '3', '1', '3', '306', '121.06');
INSERT INTO `client` VALUES ('4123', '周婕,许立博', '13518100658|||13518191', 'VALID', 'NOT', '礼顿山', '3栋1单元401', '2015-03-25 21:18:51', null, null, '3', '1', '4', '401', '109.4');
INSERT INTO `client` VALUES ('4124', '丁少宁', '18602840411', 'VALID', 'NOT', '礼顿山', '3栋1单元402', '2015-03-25 21:18:51', null, null, '3', '1', '4', '402', '89.38');
INSERT INTO `client` VALUES ('4125', '唐俊华', '13548210066', 'VALID', 'NOT', '礼顿山', '3栋1单元403', '2015-03-25 21:18:51', null, null, '3', '1', '4', '403', '125.22');
INSERT INTO `client` VALUES ('4126', '雷红', '15982094161', 'VALID', 'NOT', '礼顿山', '3栋1单元404', '2015-03-25 21:18:51', null, null, '3', '1', '4', '404', '126.5');
INSERT INTO `client` VALUES ('4127', '胡淑莲', '18080766545', 'VALID', 'NOT', '礼顿山', '3栋1单元405', '2015-03-25 21:18:51', null, null, '3', '1', '4', '405', '127.06');
INSERT INTO `client` VALUES ('4128', '刘桂莲,赵平川', '18608250616|||18608250', 'VALID', 'NOT', '礼顿山', '3栋1单元406', '2015-03-25 21:18:51', null, null, '3', '1', '4', '406', '120.28');
INSERT INTO `client` VALUES ('4129', '唐安泰,唐淑萍', '18200568946', 'VALID', 'NOT', '礼顿山', '3栋1单元501', '2015-03-25 21:18:51', null, null, '3', '1', '5', '501', '109.37');
INSERT INTO `client` VALUES ('4130', '严秀贞,冯明杰', '13881997392|||13881997', 'VALID', 'NOT', '礼顿山', '3栋1单元502', '2015-03-25 21:18:51', null, null, '3', '1', '5', '502', '89.35');
INSERT INTO `client` VALUES ('4131', '魏杰,王怡波', '13882111955|||13882119', 'VALID', 'NOT', '礼顿山', '3栋1单元503', '2015-03-25 21:18:51', null, null, '3', '1', '5', '503', '124.83');
INSERT INTO `client` VALUES ('4132', '张洪艳', '18709907789', 'VALID', 'NOT', '礼顿山', '3栋1单元504', '2015-03-25 21:18:51', null, null, '3', '1', '5', '504', '126.46');
INSERT INTO `client` VALUES ('4133', '刘欣欣,但雅琴', '13438111482|||13438111', 'VALID', 'NOT', '礼顿山', '3栋1单元505', '2015-03-25 21:18:51', null, null, '3', '1', '5', '505', '126.62');
INSERT INTO `client` VALUES ('4134', '李凌峰,牟利萍', '13880255502|||13880255', 'VALID', 'NOT', '礼顿山', '3栋1单元506', '2015-03-25 21:18:51', null, null, '3', '1', '5', '506', '120.68');
INSERT INTO `client` VALUES ('4135', '李东远', '15388112986', 'VALID', 'NOT', '礼顿山', '3栋1单元601', '2015-03-25 21:18:52', null, '1.0', '3', '1', '6', '601', '109.4');
INSERT INTO `client` VALUES ('4136', '钟征云', '13608064932', 'VALID', 'NOT', '礼顿山', '3栋1单元602', '2015-03-25 21:18:52', null, null, '3', '1', '6', '602', '89.38');
INSERT INTO `client` VALUES ('4137', '王月冬,邓敏', '13388386963|||13388386', 'VALID', 'NOT', '礼顿山', '3栋1单元603', '2015-03-25 21:18:52', null, null, '3', '1', '6', '603', '124.83');
INSERT INTO `client` VALUES ('4138', '杨述琴,冯宝龙', '18601253481|||18601253', 'VALID', 'NOT', '礼顿山', '3栋1单元604', '2015-03-25 21:18:52', null, null, '3', '1', '6', '604', '126.1');
INSERT INTO `client` VALUES ('4139', '江许旺,曹爱玲', '13666288335|||13980657', 'VALID', 'NOT', '礼顿山', '3栋1单元605', '2015-03-25 21:18:52', null, null, '3', '1', '6', '605', '126.66');
INSERT INTO `client` VALUES ('4140', '黄华英', '13730691516', 'VALID', 'NOT', '礼顿山', '3栋1单元606', '2015-03-25 21:18:52', null, null, '3', '1', '6', '606', '120.28');
INSERT INTO `client` VALUES ('4141', '李斌,刘婧', '18628219012|||18628219', 'VALID', 'NOT', '礼顿山', '3栋1单元701', '2015-03-25 21:18:52', null, null, '3', '1', '7', '701', '109.37');
INSERT INTO `client` VALUES ('4142', '陈诗,袁岳', '13709066288|||13708094', 'VALID', 'NOT', '礼顿山', '3栋1单元703', '2015-03-25 21:18:52', null, null, '3', '1', '7', '703', '124.83');
INSERT INTO `client` VALUES ('4143', '郭辉,王玉', '18030508666|', 'VALID', 'NOT', '礼顿山', '3栋1单元704', '2015-03-25 21:18:52', null, null, '3', '1', '7', '704', '126.05');
INSERT INTO `client` VALUES ('4144', '唐静,刘建新', '15902865970|||15902865', 'VALID', 'NOT', '礼顿山', '3栋1单元705', '2015-03-25 21:18:52', null, null, '3', '1', '7', '705', '126.62');
INSERT INTO `client` VALUES ('4145', '胡晋辉,刘明明', '18281819688|||13508268', 'VALID', 'NOT', '礼顿山', '3栋1单元801', '2015-03-25 21:18:52', null, null, '3', '1', '8', '801', '109.4');
INSERT INTO `client` VALUES ('4146', '杨玲', '1860281468', 'VALID', 'NOT', '礼顿山', '3栋1单元802', '2015-03-25 21:18:52', null, null, '3', '1', '8', '802', '89.38');
INSERT INTO `client` VALUES ('4147', '周兰英', '13398105691', 'VALID', 'NOT', '礼顿山', '3栋1单元803', '2015-03-25 21:18:52', null, null, '3', '1', '8', '803', '124.83');
INSERT INTO `client` VALUES ('4148', '罗强', '13882094009', 'VALID', 'NOT', '礼顿山', '3栋1单元804', '2015-03-25 21:18:52', null, null, '3', '1', '8', '804', '126.1');
INSERT INTO `client` VALUES ('4149', '周德全,吴洪英', '18981796863|||18981796', 'VALID', 'NOT', '礼顿山', '3栋1单元805', '2015-03-25 21:18:52', null, null, '3', '1', '8', '805', '126.66');
INSERT INTO `client` VALUES ('4150', '伍泓锦', '1878342124', 'VALID', 'NOT', '礼顿山', '3栋1单元806', '2015-03-25 21:18:52', null, null, '3', '1', '8', '806', '120.28');
INSERT INTO `client` VALUES ('4151', '肖丽', '13668204698', 'VALID', 'NOT', '礼顿山', '3栋1单元901', '2015-03-25 21:18:52', null, null, '3', '1', '9', '901', '109.37');
INSERT INTO `client` VALUES ('4152', '高芸,谢锦宏', '13881558299|||13881558', 'VALID', 'NOT', '礼顿山', '3栋1单元902', '2015-03-25 21:18:52', null, null, '3', '1', '9', '902', '89.35');
INSERT INTO `client` VALUES ('4153', '黄自兴,张光琼', '13565092300|||13565092', 'VALID', 'NOT', '礼顿山', '3栋1单元903', '2015-03-25 21:18:52', null, null, '3', '1', '9', '903', '124.83');
INSERT INTO `client` VALUES ('4154', '虞翔茂,暴文英', '13308139875|||13308139', 'VALID', 'NOT', '礼顿山', '3栋1单元904', '2015-03-25 21:18:52', null, null, '3', '1', '9', '904', '126.05');
INSERT INTO `client` VALUES ('4155', '关琳,吴爽', '13880753357|||13880753', 'VALID', 'NOT', '礼顿山', '3栋1单元905', '2015-03-25 21:18:52', null, null, '3', '1', '9', '905', '126.62');
INSERT INTO `client` VALUES ('4156', '周涛', '18615779827', 'VALID', 'NOT', '礼顿山', '3栋1单元906', '2015-03-25 21:18:52', null, null, '3', '1', '9', '906', '120.68');
INSERT INTO `client` VALUES ('4157', '杨梦欣', '13980616186', 'VALID', 'NOT', '礼顿山', '3栋1单元1001', '2015-03-25 21:18:52', null, null, '3', '1', '10', '1001', '109.4');
INSERT INTO `client` VALUES ('4158', '李逸', '1388079386', 'VALID', 'NOT', '礼顿山', '3栋1单元1002', '2015-03-25 21:18:52', null, null, '3', '1', '10', '1002', '89.38');
INSERT INTO `client` VALUES ('4159', '钱晴', '18608006821', 'VALID', 'NOT', '礼顿山', '3栋1单元1003', '2015-03-25 21:18:52', null, null, '3', '1', '10', '1003', '124.83');
INSERT INTO `client` VALUES ('4160', '赵霖', '15198280874', 'VALID', 'NOT', '礼顿山', '3栋1单元1004', '2015-03-25 21:18:52', null, null, '3', '1', '10', '1004', '126.1');
INSERT INTO `client` VALUES ('4161', '杨玉珠,杨杰', '18227643669|||18227643', 'VALID', 'NOT', '礼顿山', '3栋1单元1005', '2015-03-25 21:18:52', null, null, '3', '1', '10', '1005', '126.66');
INSERT INTO `client` VALUES ('4162', '胡雪', '13880805519', 'VALID', 'NOT', '礼顿山', '3栋1单元1006', '2015-03-25 21:18:52', null, null, '3', '1', '10', '1006', '120.28');
INSERT INTO `client` VALUES ('4163', '肖璐,代翔', '13688150345|||13709007', 'VALID', 'NOT', '礼顿山', '3栋1单元1101', '2015-03-25 21:18:52', null, null, '3', '1', '11', '1101', '109.37');
INSERT INTO `client` VALUES ('4164', '赵竟文,赵治富,雍丽', '13890768873|||13890768873|||13890768', 'VALID', 'NOT', '礼顿山', '3栋1单元1102', '2015-03-25 21:18:52', null, null, '3', '1', '11', '1102', '89.35');
INSERT INTO `client` VALUES ('4165', '高容', '13982033099', 'VALID', 'NOT', '礼顿山', '3栋1单元1103', '2015-03-25 21:18:52', null, null, '3', '1', '11', '1103', '124.83');
INSERT INTO `client` VALUES ('4166', '刘国正,温兰', '15928876903|||15928876', 'VALID', 'NOT', '礼顿山', '3栋1单元1104', '2015-03-25 21:18:52', null, null, '3', '1', '11', '1104', '126.05');
INSERT INTO `client` VALUES ('4167', '周炜玮,韩勇', '13084426861|||13084426', 'VALID', 'NOT', '礼顿山', '3栋1单元1105', '2015-03-25 21:18:52', null, null, '3', '1', '11', '1105', '126.62');
INSERT INTO `client` VALUES ('4168', '杨雯,周洛磊', '18502803129|||18502803', 'VALID', 'NOT', '礼顿山', '3栋1单元1106', '2015-03-25 21:18:52', null, null, '3', '1', '11', '1106', '120.68');
INSERT INTO `client` VALUES ('4169', '舒琴,王彬', '18683563081|||18683563', 'VALID', 'NOT', '礼顿山', '3栋1单元1201', '2015-03-25 21:18:52', null, null, '3', '1', '12', '1201', '109.4');
INSERT INTO `client` VALUES ('4170', '王晗月', '13882532589', 'VALID', 'NOT', '礼顿山', '3栋1单元1202', '2015-03-25 21:18:52', null, null, '3', '1', '12', '1202', '89.38');
INSERT INTO `client` VALUES ('4171', '王海超', '15884450287', 'VALID', 'NOT', '礼顿山', '3栋1单元1204', '2015-03-25 21:18:52', null, null, '3', '1', '12', '1204', '126.1');
INSERT INTO `client` VALUES ('4172', '肖猷', '13219026755', 'VALID', 'NOT', '礼顿山', '3栋1单元1205', '2015-03-25 21:18:52', null, null, '3', '1', '12', '1205', '127.06');
INSERT INTO `client` VALUES ('4173', '雷海燕', '18600360217', 'VALID', 'NOT', '礼顿山', '3栋1单元1206', '2015-03-25 21:18:52', null, null, '3', '1', '12', '1206', '120.28');
INSERT INTO `client` VALUES ('4174', '杨伟', '13808080425', 'VALID', 'NOT', '礼顿山', '3栋1单元1301', '2015-03-25 21:18:52', null, null, '3', '1', '13', '1301', '109.37');
INSERT INTO `client` VALUES ('4175', '胡兴颖', '13678366158', 'VALID', 'NOT', '礼顿山', '3栋1单元1303', '2015-03-25 21:18:52', null, null, '3', '1', '13', '1303', '125.22');
INSERT INTO `client` VALUES ('4176', '彭飞,卢雪', '13880857124|||13880857', 'VALID', 'NOT', '礼顿山', '3栋1单元1304', '2015-03-25 21:18:52', null, null, '3', '1', '13', '1304', '126.05');
INSERT INTO `client` VALUES ('4177', '刘彤', '1381106827', 'VALID', 'NOT', '礼顿山', '3栋1单元1305', '2015-03-25 21:18:53', null, null, '3', '1', '13', '1305', '126.62');
INSERT INTO `client` VALUES ('4178', '罗利诚', '18628027177', 'VALID', 'NOT', '礼顿山', '3栋1单元1306', '2015-03-25 21:18:53', null, null, '3', '1', '13', '1306', '120.68');
INSERT INTO `client` VALUES ('4179', '韩语薇', '15928574877', 'VALID', 'NOT', '礼顿山', '3栋1单元1401', '2015-03-25 21:18:53', null, null, '3', '1', '14', '1401', '109.4');
INSERT INTO `client` VALUES ('4180', '蒋玉川', '18683292377', 'VALID', 'NOT', '礼顿山', '3栋1单元1402', '2015-03-25 21:18:53', null, null, '3', '1', '14', '1402', '89.38');
INSERT INTO `client` VALUES ('4181', '肖舜', '18782995991', 'VALID', 'NOT', '礼顿山', '3栋1单元1403', '2015-03-25 21:18:53', null, null, '3', '1', '14', '1403', '125.22');
INSERT INTO `client` VALUES ('4182', '胡世武,朱桥嘉', '13094418025|||13094418', 'VALID', 'NOT', '礼顿山', '3栋1单元1404', '2015-03-25 21:18:53', null, null, '3', '1', '14', '1404', '126.1');
INSERT INTO `client` VALUES ('4183', '刘前刚,甘小琴', '13548216011|||13548216', 'VALID', 'NOT', '礼顿山', '3栋1单元1405', '2015-03-25 21:18:53', null, null, '3', '1', '14', '1405', '127.06');
INSERT INTO `client` VALUES ('4184', '宋子铭', '13825762693', 'VALID', 'NOT', '礼顿山', '3栋1单元1406', '2015-03-25 21:18:53', null, null, '3', '1', '14', '1406', '120.28');
INSERT INTO `client` VALUES ('4185', '陈亮吉', '13808060933', 'VALID', 'NOT', '礼顿山', '3栋1单元1502', '2015-03-25 21:18:53', null, null, '3', '1', '15', '1502', '89.35');
INSERT INTO `client` VALUES ('4186', '卿茜', '13072820535', 'VALID', 'NOT', '礼顿山', '3栋1单元1503', '2015-03-25 21:18:53', null, null, '3', '1', '15', '1503', '125.22');
INSERT INTO `client` VALUES ('4187', '肖红平', '13072820535', 'VALID', 'NOT', '礼顿山', '3栋1单元1504', '2015-03-25 21:18:53', null, null, '3', '1', '15', '1504', '126.46');
INSERT INTO `client` VALUES ('4188', '严芳', '139807139', 'VALID', 'NOT', '礼顿山', '3栋1单元1505', '2015-03-25 21:18:53', null, null, '3', '1', '15', '1505', '127.03');
INSERT INTO `client` VALUES ('4189', '高睿', '18628200626', 'VALID', 'NOT', '礼顿山', '3栋1单元1506', '2015-03-25 21:18:53', null, null, '3', '1', '15', '1506', '121.06');
INSERT INTO `client` VALUES ('4190', '钟杰,李云辉', '15023070169|||13398107', 'VALID', 'NOT', '礼顿山', '3栋1单元1601', '2015-03-25 21:18:53', null, null, '3', '1', '16', '1601', '109.4');
INSERT INTO `client` VALUES ('4191', '蒲晨曦,宋书青', '18602868123|||18602868', 'VALID', 'NOT', '礼顿山', '3栋1单元1602', '2015-03-25 21:18:53', null, null, '3', '1', '16', '1602', '89.38');
INSERT INTO `client` VALUES ('4192', '王鹏', '1861817139', 'VALID', 'NOT', '礼顿山', '3栋1单元1603', '2015-03-25 21:18:53', null, null, '3', '1', '16', '1603', '125.22');
INSERT INTO `client` VALUES ('4193', '马金彬,许飞', '13558808207|||13558808', 'VALID', 'NOT', '礼顿山', '3栋1单元1604', '2015-03-25 21:18:53', null, null, '3', '1', '16', '1604', '126.5');
INSERT INTO `client` VALUES ('4194', '刘杰', '13880520666', 'VALID', 'NOT', '礼顿山', '3栋1单元1605', '2015-03-25 21:18:53', null, null, '3', '1', '16', '1605', '127.06');
INSERT INTO `client` VALUES ('4195', '徐红兵,贺巧琳', '13808213408|||13028135', 'VALID', 'NOT', '礼顿山', '3栋1单元1606', '2015-03-25 21:18:53', null, null, '3', '1', '16', '1606', '120.65');
INSERT INTO `client` VALUES ('4196', '刘丁玲', '13508221777', 'VALID', 'NOT', '礼顿山', '3栋1单元1701', '2015-03-25 21:18:53', null, null, '3', '1', '17', '1701', '109.37');
INSERT INTO `client` VALUES ('4197', '王建,王文凤', '13882285558|||13882285', 'VALID', 'NOT', '礼顿山', '3栋1单元1702', '2015-03-25 21:18:53', null, null, '3', '1', '17', '1702', '89.63');
INSERT INTO `client` VALUES ('4198', '易杰', '13739404281', 'VALID', 'NOT', '礼顿山', '3栋1单元1703', '2015-03-25 21:18:53', null, null, '3', '1', '17', '1703', '125.22');
INSERT INTO `client` VALUES ('4199', '叶健', '13808195895', 'VALID', 'NOT', '礼顿山', '3栋1单元1704', '2015-03-25 21:18:53', null, null, '3', '1', '17', '1704', '126.46');
INSERT INTO `client` VALUES ('4200', '何永发', '1536359088', 'VALID', 'NOT', '礼顿山', '3栋1单元1705', '2015-03-25 21:18:53', null, null, '3', '1', '17', '1705', '126.62');
INSERT INTO `client` VALUES ('4201', '肖遥,赵薇', '15882237605|||15882237', 'VALID', 'NOT', '礼顿山', '3栋1单元1706', '2015-03-25 21:18:53', null, null, '3', '1', '17', '1706', '121.06');
INSERT INTO `client` VALUES ('4202', '廖杨', '18628010366', 'VALID', 'NOT', '礼顿山', '3栋1单元1801', '2015-03-25 21:18:53', null, null, '3', '1', '18', '1801', '109.4');
INSERT INTO `client` VALUES ('4203', '余胜', '18602802312', 'VALID', 'NOT', '礼顿山', '3栋1单元1802', '2015-03-25 21:18:53', null, null, '3', '1', '18', '1802', '89.38');
INSERT INTO `client` VALUES ('4204', '杜肖', '13908183841', 'VALID', 'NOT', '礼顿山', '3栋1单元1803', '2015-03-25 21:18:53', null, null, '3', '1', '18', '1803', '125.22');
INSERT INTO `client` VALUES ('4205', '邹庆', '13608181621', 'VALID', 'NOT', '礼顿山', '3栋1单元1804', '2015-03-25 21:18:53', null, null, '3', '1', '18', '1804', '126.5');
INSERT INTO `client` VALUES ('4206', '王薇媛', '13688066123', 'VALID', 'NOT', '礼顿山', '3栋1单元1805', '2015-03-25 21:18:53', null, null, '3', '1', '18', '1805', '127.06');
INSERT INTO `client` VALUES ('4207', '杨禹超', '18683437171', 'VALID', 'NOT', '礼顿山', '3栋1单元1806', '2015-03-25 21:18:53', null, null, '3', '1', '18', '1806', '120.28');
INSERT INTO `client` VALUES ('4208', '肖迪佳', '15802835315', 'VALID', 'NOT', '礼顿山', '3栋1单元1901', '2015-03-25 21:18:53', null, null, '3', '1', '19', '1901', '109.37');
INSERT INTO `client` VALUES ('4209', '陈建伟', '13880719672', 'VALID', 'NOT', '礼顿山', '3栋1单元1902', '2015-03-25 21:18:53', null, null, '3', '1', '19', '1902', '89.35');
INSERT INTO `client` VALUES ('4210', '邹平川', '1380821108', 'VALID', 'NOT', '礼顿山', '3栋1单元1903', '2015-03-25 21:18:53', null, null, '3', '1', '19', '1903', '125.22');
INSERT INTO `client` VALUES ('4211', '龙艳丽', '15198165716', 'VALID', 'NOT', '礼顿山', '3栋1单元1904', '2015-03-25 21:18:53', null, null, '3', '1', '19', '1904', '126.46');
INSERT INTO `client` VALUES ('4212', '刘福兵,黄扶敏', '18081188053|||13666266', 'VALID', 'NOT', '礼顿山', '3栋1单元1905', '2015-03-25 21:18:53', null, null, '3', '1', '19', '1905', '126.62');
INSERT INTO `client` VALUES ('4213', '黄兵', '15283388262', 'VALID', 'NOT', '礼顿山', '3栋1单元1906', '2015-03-25 21:18:53', null, null, '3', '1', '19', '1906', '121.06');
INSERT INTO `client` VALUES ('4214', '张达,杨伟杰', '15881138518|||15881138', 'VALID', 'NOT', '礼顿山', '3栋1单元2001', '2015-03-25 21:18:53', null, null, '3', '1', '20', '2001', '109.4');
INSERT INTO `client` VALUES ('4215', '罗厚元', '13541350459', 'VALID', 'NOT', '礼顿山', '3栋1单元2002', '2015-03-25 21:18:53', null, null, '3', '1', '20', '2002', '89.38');
INSERT INTO `client` VALUES ('4216', '杨洪梅', '13980722135', 'VALID', 'NOT', '礼顿山', '3栋1单元2003', '2015-03-25 21:18:53', null, null, '3', '1', '20', '2003', '125.22');
INSERT INTO `client` VALUES ('4217', '李琦', '13518185951', 'VALID', 'NOT', '礼顿山', '3栋1单元2004', '2015-03-25 21:18:53', null, null, '3', '1', '20', '2004', '126.5');
INSERT INTO `client` VALUES ('4218', '刘敏', '13880520666', 'VALID', 'NOT', '礼顿山', '3栋1单元2005', '2015-03-25 21:18:53', null, null, '3', '1', '20', '2005', '127.06');
INSERT INTO `client` VALUES ('4219', '廖淼', '13990926733', 'VALID', 'NOT', '礼顿山', '3栋1单元2006', '2015-03-25 21:18:53', null, null, '3', '1', '20', '2006', '120.28');
INSERT INTO `client` VALUES ('4220', '陶忻玥,李青涛', '15208209617|||15208209', 'VALID', 'NOT', '礼顿山', '3栋1单元2101', '2015-03-25 21:18:54', null, null, '3', '1', '21', '2101', '109.37');
INSERT INTO `client` VALUES ('4221', '任波,唐雪梅', '13708067226|||18628023', 'VALID', 'NOT', '礼顿山', '3栋1单元2102', '2015-03-25 21:18:54', null, null, '3', '1', '21', '2102', '89.35');
INSERT INTO `client` VALUES ('4222', '任静', '13980578757', 'VALID', 'NOT', '礼顿山', '3栋1单元2103', '2015-03-25 21:18:54', null, null, '3', '1', '21', '2103', '124.83');
INSERT INTO `client` VALUES ('4223', '郭欢', '18611181609', 'VALID', 'NOT', '礼顿山', '3栋1单元2104', '2015-03-25 21:18:54', null, null, '3', '1', '21', '2104', '126.05');
INSERT INTO `client` VALUES ('4224', '张海燕', '13541364302', 'VALID', 'NOT', '礼顿山', '3栋1单元2105', '2015-03-25 21:18:54', null, null, '3', '1', '21', '2105', '126.62');
INSERT INTO `client` VALUES ('4225', '刘强,谢凤', '138822759801|||13882259', 'VALID', 'NOT', '礼顿山', '3栋1单元2106', '2015-03-25 21:18:54', null, null, '3', '1', '21', '2106', '121.06');
INSERT INTO `client` VALUES ('4226', '杜世清,李小明', '13880709182|', 'VALID', 'NOT', '礼顿山', '3栋1单元2202', '2015-03-25 21:18:54', null, null, '3', '1', '22', '2202', '89.66');
INSERT INTO `client` VALUES ('4227', '邹帆,陈嘉', '15928665930|||15928665', 'VALID', 'NOT', '礼顿山', '3栋1单元2203', '2015-03-25 21:18:54', null, null, '3', '1', '22', '2203', '125.22');
INSERT INTO `client` VALUES ('4228', '谢韬,张彬', '13678090785|||13678090', 'VALID', 'NOT', '礼顿山', '3栋1单元2204', '2015-03-25 21:18:54', null, null, '3', '1', '22', '2204', '126.5');
INSERT INTO `client` VALUES ('4229', '黄聪敏,刘渊', '13699605856|||13699605', 'VALID', 'NOT', '礼顿山', '3栋1单元2205', '2015-03-25 21:18:54', null, null, '3', '1', '22', '2205', '126.66');
INSERT INTO `client` VALUES ('4230', '伍兰亚', '13881729544', 'VALID', 'NOT', '礼顿山', '3栋1单元2302', '2015-03-25 21:18:54', null, null, '3', '1', '23', '2302', '89.63');
INSERT INTO `client` VALUES ('4231', '王克明,何世琼', '13709445799|||13709445', 'VALID', 'NOT', '礼顿山', '3栋1单元2303', '2015-03-25 21:18:54', null, null, '3', '1', '23', '2303', '125.22');
INSERT INTO `client` VALUES ('4232', '王友春,和玉梅', '13808149533|||13808149', 'VALID', 'NOT', '礼顿山', '3栋1单元2304', '2015-03-25 21:18:54', null, null, '3', '1', '23', '2304', '126.46');
INSERT INTO `client` VALUES ('4233', '宁斌', '18608038662', 'VALID', 'NOT', '礼顿山', '3栋1单元2305', '2015-03-25 21:18:54', null, null, '3', '1', '23', '2305', '126.62');
INSERT INTO `client` VALUES ('4234', '龙春良', '13378238989', 'VALID', 'NOT', '礼顿山', '3栋1单元2306', '2015-03-25 21:18:54', null, null, '3', '1', '23', '2306', '120.68');
INSERT INTO `client` VALUES ('4235', '阳旭,张孟平', '13982199408|||13982199', 'VALID', 'NOT', '礼顿山', '3栋1单元2401', '2015-03-25 21:18:54', null, null, '3', '1', '24', '2401', '109.4');
INSERT INTO `client` VALUES ('4236', '钱灿,张怡', '13648000774|||13648000', 'VALID', 'NOT', '礼顿山', '3栋1单元2402', '2015-03-25 21:18:54', null, null, '3', '1', '24', '2402', '89.38');
INSERT INTO `client` VALUES ('4237', '姚新怡', '18908130188', 'VALID', 'NOT', '礼顿山', '3栋1单元2403', '2015-03-25 21:18:54', null, null, '3', '1', '24', '2403', '125.22');
INSERT INTO `client` VALUES ('4238', '周静', '13981388297', 'VALID', 'NOT', '礼顿山', '3栋1单元2404', '2015-03-25 21:18:54', null, null, '3', '1', '24', '2404', '126.5');
INSERT INTO `client` VALUES ('4239', '刘金焕', '13880520666', 'VALID', 'NOT', '礼顿山', '3栋1单元2405', '2015-03-25 21:18:54', null, null, '3', '1', '24', '2405', '127.06');
INSERT INTO `client` VALUES ('4240', '黄诗斯,张远培', '18683711666|||18683711', 'VALID', 'NOT', '礼顿山', '3栋1单元2406', '2015-03-25 21:18:54', null, null, '3', '1', '24', '2406', '120.65');
INSERT INTO `client` VALUES ('4241', '赵爽', '18780161034', 'VALID', 'NOT', '礼顿山', '3栋1单元2501', '2015-03-25 21:18:54', null, null, '3', '1', '25', '2501', '109.37');
INSERT INTO `client` VALUES ('4242', '王媛媛,高欣', '15928015227|||15928015', 'VALID', 'NOT', '礼顿山', '3栋1单元2502', '2015-03-25 21:18:54', null, null, '3', '1', '25', '2502', '89.35');
INSERT INTO `client` VALUES ('4243', '谢声江,康兰华', '13811766956|', 'VALID', 'NOT', '礼顿山', '3栋1单元2503', '2015-03-25 21:18:54', null, null, '3', '1', '25', '2503', '125.22');
INSERT INTO `client` VALUES ('4244', '赵秀明', '186003728', 'VALID', 'NOT', '礼顿山', '3栋1单元2504', '2015-03-25 21:18:54', null, null, '3', '1', '25', '2504', '126.46');
INSERT INTO `client` VALUES ('4245', '仰光金', '13802210135', 'VALID', 'NOT', '礼顿山', '3栋1单元2505', '2015-03-25 21:18:54', null, null, '3', '1', '25', '2505', '126.62');
INSERT INTO `client` VALUES ('4246', '黄杰', '13086663976', 'VALID', 'NOT', '礼顿山', '3栋1单元2506', '2015-03-25 21:18:54', null, null, '3', '1', '25', '2506', '121.06');
INSERT INTO `client` VALUES ('4247', '吴玉姣', '18602886989', 'VALID', 'NOT', '礼顿山', '3栋1单元2601', '2015-03-25 21:18:54', null, null, '3', '1', '26', '2601', '109.4');
INSERT INTO `client` VALUES ('4248', '曾跃', '18628017277', 'VALID', 'NOT', '礼顿山', '3栋1单元2602', '2015-03-25 21:18:54', null, null, '3', '1', '26', '2602', '89.38');
INSERT INTO `client` VALUES ('4249', '张漫雨', '13808018588', 'VALID', 'NOT', '礼顿山', '3栋1单元2603', '2015-03-25 21:18:54', null, null, '3', '1', '26', '2603', '125.22');
INSERT INTO `client` VALUES ('4250', '朱科龙', '18990127291', 'VALID', 'NOT', '礼顿山', '3栋1单元2604', '2015-03-25 21:18:54', null, null, '3', '1', '26', '2604', '126.5');
INSERT INTO `client` VALUES ('4251', '王学定,王飒', '13881886680|||13881886', 'VALID', 'NOT', '礼顿山', '3栋1单元2605', '2015-03-25 21:18:54', null, null, '3', '1', '26', '2605', '127.06');
INSERT INTO `client` VALUES ('4252', '肖洁', '18782053057', 'VALID', 'NOT', '礼顿山', '3栋1单元2606', '2015-03-25 21:18:54', null, null, '3', '1', '26', '2606', '120.28');
INSERT INTO `client` VALUES ('4253', '武艺', '13708002117', 'VALID', 'NOT', '礼顿山', '3栋1单元2701', '2015-03-25 21:18:54', null, null, '3', '1', '27', '2701', '109.37');
INSERT INTO `client` VALUES ('4254', '车现梅', '18683260308', 'VALID', 'NOT', '礼顿山', '3栋1单元2703', '2015-03-25 21:18:54', null, null, '3', '1', '27', '2703', '125.22');
INSERT INTO `client` VALUES ('4255', '何晓红,吴鸿铭', '13198591005|||13541285', 'VALID', 'NOT', '礼顿山', '3栋1单元2704', '2015-03-25 21:18:54', null, null, '3', '1', '27', '2704', '126.46');
INSERT INTO `client` VALUES ('4256', '韩兢兢', '18602851216', 'VALID', 'NOT', '礼顿山', '3栋1单元2705', '2015-03-25 21:18:54', null, null, '3', '1', '27', '2705', '126.62');
INSERT INTO `client` VALUES ('4257', '谢羽旻', '13699403197', 'VALID', 'NOT', '礼顿山', '3栋1单元2706', '2015-03-25 21:18:54', null, null, '3', '1', '27', '2706', '121.06');
INSERT INTO `client` VALUES ('4258', '彭进书', '18780441863', 'VALID', 'NOT', '礼顿山', '3栋1单元2801', '2015-03-25 21:18:54', null, null, '3', '1', '28', '2801', '109.4');
INSERT INTO `client` VALUES ('4259', '王霆,罗辰予', '18782912771|||18090127', 'VALID', 'NOT', '礼顿山', '3栋1单元2802', '2015-03-25 21:18:54', null, null, '3', '1', '28', '2802', '89.38');
INSERT INTO `client` VALUES ('4260', '甘志凤', '13730866548', 'VALID', 'NOT', '礼顿山', '3栋1单元2803', '2015-03-25 21:18:54', null, null, '3', '1', '28', '2803', '125.22');
INSERT INTO `client` VALUES ('4261', '罗春雨,龙晓雨', '18683523576|||18683523', 'VALID', 'NOT', '礼顿山', '3栋1单元2804', '2015-03-25 21:18:54', null, null, '3', '1', '28', '2804', '126.5');
INSERT INTO `client` VALUES ('4262', '祝越飞', '15882223313', 'VALID', 'NOT', '礼顿山', '3栋1单元2805', '2015-03-25 21:18:54', null, '', '3', '1', '28', '2805', '127.06');
INSERT INTO `client` VALUES ('4263', '卢雨菲', '18583278809', 'VALID', 'NOT', '礼顿山', '3栋1单元2806', '2015-03-25 21:18:54', null, null, '3', '1', '28', '2806', '120.65');
INSERT INTO `client` VALUES ('4264', '孔祥瑞,周梓鑫', '18782100789|||18782100', 'VALID', 'NOT', '礼顿山', '3栋1单元2901', '2015-03-25 21:18:54', null, null, '3', '1', '29', '2901', '109.37');
INSERT INTO `client` VALUES ('4265', '王汝胜,邱琳', '13981875151|||13981875', 'VALID', 'NOT', '礼顿山', '3栋1单元2902', '2015-03-25 21:18:54', null, null, '3', '1', '29', '2902', '89.35');
INSERT INTO `client` VALUES ('4266', '邱跃峰', '18628002047', 'VALID', 'DONE', '礼顿山', '3栋1单元2903', '2015-03-25 21:18:55', null, null, '3', '1', '29', '2903', '125.22');
INSERT INTO `client` VALUES ('4267', '朱朝强,范冬冬', '18701436055|||18701436', 'VALID', 'NOT', '礼顿山', '3栋1单元2904', '2015-03-25 21:18:55', null, null, '3', '1', '29', '2904', '126.46');
INSERT INTO `client` VALUES ('4268', '刘秦,周毅', '13980438705|||13980438', 'VALID', 'NOT', '礼顿山', '3栋1单元2905', '2015-03-25 21:18:55', null, null, '3', '1', '29', '2905', '127.03');
INSERT INTO `client` VALUES ('4269', '张维群,罗永梅', '13981975378|||13981975', 'VALID', 'NOT', '礼顿山', '3栋1单元2906', '2015-03-25 21:18:55', null, null, '3', '1', '29', '2906', '120.68');
INSERT INTO `client` VALUES ('4270', '郭芳,范忠军', '18980684890|||18980684', 'VALID', 'NOT', '礼顿山', '3栋1单元3001', '2015-03-25 21:18:55', null, null, '3', '1', '30', '3001', '109.4');
INSERT INTO `client` VALUES ('4271', '高飞', '18608004571', 'VALID', 'NOT', '礼顿山', '3栋1单元3002', '2015-03-25 21:18:55', null, null, '3', '1', '30', '3002', '89.38');
INSERT INTO `client` VALUES ('4272', '贾雪梅', '13668253134', 'VALID', 'NOT', '礼顿山', '3栋1单元3003', '2015-03-25 21:18:55', null, null, '3', '1', '30', '3003', '125.22');
INSERT INTO `client` VALUES ('4273', '郑安伟,吴珏', '13808186691|||13808186', 'VALID', 'NOT', '礼顿山', '3栋1单元3004', '2015-03-25 21:18:55', null, null, '3', '1', '30', '3004', '126.5');
INSERT INTO `client` VALUES ('4274', '刘望晓', '13908180577', 'VALID', 'NOT', '礼顿山', '3栋1单元3005', '2015-03-25 21:18:55', null, null, '3', '1', '30', '3005', '127.06');
INSERT INTO `client` VALUES ('4275', '于景盛', '18030778666', 'VALID', 'NOT', '礼顿山', '3栋1单元3006', '2015-03-25 21:18:55', null, null, '3', '1', '30', '3006', '120.28');
INSERT INTO `client` VALUES ('4276', '孙黛婧', '130944208', 'VALID', 'NOT', '礼顿山', '3栋1单元3102', '2015-03-25 21:18:55', null, null, '3', '1', '31', '3102', '89.35');
INSERT INTO `client` VALUES ('4277', '雷小松,杨郭', '13810925589|||13810925', 'VALID', 'NOT', '礼顿山', '3栋1单元3103', '2015-03-25 21:18:55', null, null, '3', '1', '31', '3103', '125.22');
INSERT INTO `client` VALUES ('4278', '杨文韵,蒋敏', '13909083187|||13909083', 'VALID', 'NOT', '礼顿山', '3栋1单元3104', '2015-03-25 21:18:55', null, null, '3', '1', '31', '3104', '126.05');
INSERT INTO `client` VALUES ('4279', '宋丽丽', '18080339028', 'VALID', 'NOT', '礼顿山', '3栋1单元3105', '2015-03-25 21:18:55', null, null, '3', '1', '31', '3105', '126.62');
INSERT INTO `client` VALUES ('4280', '戴惠芬', '13882260817', 'VALID', 'NOT', '礼顿山', '3栋1单元3106', '2015-03-25 21:18:55', null, null, '3', '1', '31', '3106', '121.06');
INSERT INTO `client` VALUES ('4281', '程麟,何芳', '18280370843|||18280370', 'VALID', 'NOT', '礼顿山', '3栋1单元3201', '2015-03-25 21:18:55', null, null, '3', '1', '32', '3201', '109.17');
INSERT INTO `client` VALUES ('4282', '李泽鑫', '1354792248', 'VALID', 'NOT', '礼顿山', '3栋1单元3206', '2015-03-25 21:18:55', null, null, '3', '1', '32', '3206', '120.27');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

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
INSERT INTO `file_info` VALUES ('32', '1427289580239.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\estate-customer\\upload\\20150325\\1427289580239.jpg', '20150325/1427289580239.jpg', '.jpg', '{\"height\":1200,\"width\":1920}', '2015-03-25 21:19:40', '4266', null, 'VALID');
INSERT INTO `file_info` VALUES ('33', '1427289586219.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\estate-customer\\upload\\20150325\\1427289586219.jpg', '20150325/1427289586219.jpg', '.jpg', '{\"height\":1050,\"width\":1680}', '2015-03-25 21:19:46', '4266', null, 'VALID');
INSERT INTO `file_info` VALUES ('34', '1427289596583.jpg', 'F:\\myWorkspace\\estate-customer\\wecode-modules\\wecode-business-platform\\target\\estate-customer\\upload\\20150325\\1427289596583.jpg', '20150325/1427289596583.jpg', '.jpg', '{\"height\":1200,\"width\":1920}', '2015-03-25 21:19:56', '4266', null, 'VALID');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='客户跟进信息';

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
INSERT INTO `track_info` VALUES ('15', '4266', '今天已联系，。。。。。', '2015-03-25 21:20:36');
