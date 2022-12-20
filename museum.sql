/*
Navicat MySQL Data Transfer

Source Server         : keshe
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : museum

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2022-12-14 19:14:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `unit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `btime` datetime DEFAULT NULL,
  `rtime` datetime DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `sid` int DEFAULT NULL,
  `borrowman` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `borrow_ibfk_1` (`uid`),
  KEY `borrow_ibfk_2` (`sid`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `spec` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('13', '1', '2022-12-05 07:07:16', '2022-12-05 06:46:15', '21', '2', '18838032551', '', '10', '2', '2013350398@qq.com', '归还');
INSERT INTO `borrow` VALUES ('15', '1', '2022-08-01 12:53:26', '2022-12-05 07:03:39', '23', '2', '18838032551', '', '20', '2', '2013350398@qq.com', '已结束');
INSERT INTO `borrow` VALUES ('20', '1', '2022-11-26 16:56:47', '2022-11-29 14:56:20', 'test', '2', '18838032551', '', '10', '2', '2013350398@qq.com', '已结束');
INSERT INTO `borrow` VALUES ('22', '4', '2022-11-29 14:55:43', '2022-12-14 18:32:06', '', '38', '18838032551', '', '92', '6', '2013350398@qq.com', '归还');
INSERT INTO `borrow` VALUES ('23', '4', '2022-12-03 23:04:06', '2022-12-14 18:32:02', '', '38', '18838032551', '', '89', '6', '2013350398@qq.com', '已结束');
INSERT INTO `borrow` VALUES ('26', '1', '2022-12-03 15:10:43', '2022-12-14 18:31:10', '', '2', '18838032551', '', '108', '2', '2013350398@qq.com', '归还');
INSERT INTO `borrow` VALUES ('27', '1', '2022-12-05 07:04:52', '2022-12-05 07:07:06', '', '42', '18838032551', '', '129', '22', '2013350398@qq.com', '已结束');
INSERT INTO `borrow` VALUES ('29', '1', '2022-12-05 07:02:48', '2022-12-07 15:18:04', '', '43', '18838032551', '', '123', '7', '2013350398@qq.com', '已结束');
INSERT INTO `borrow` VALUES ('31', '1', '2022-12-05 06:53:30', '2022-12-14 18:31:14', '', '42', '18838032551', '', '123', '22', '2013350398@qq.com', '已结束');
INSERT INTO `borrow` VALUES ('32', '4', '2022-12-07 04:15:44', '2022-12-07 09:54:37', '', '2', '18838032551', '', '89', '2', '2013350398@qq.com', '已结束');
INSERT INTO `borrow` VALUES ('33', '1', '2022-12-07 15:17:16', '2022-12-14 18:31:35', '', '2', '18838032551', '', '119', '2', '2013350398@qq.com', '已借出');
INSERT INTO `borrow` VALUES ('41', '4', '2022-12-07 15:19:15', '2022-12-14 18:31:39', '', '58', '18838032551', '', '89', 'user1', '2013350398@qq.com', '已借出');
INSERT INTO `borrow` VALUES ('42', '1', '2022-12-07 15:17:10', '2022-12-14 18:31:43', '', '2', '18838032551', '', '129', '2', '2013350398@qq.com', '归还');
INSERT INTO `borrow` VALUES ('43', '789', '2022-12-07 15:28:15', '2022-12-14 18:31:46', '', '38', '18838032551', '', '137', '6', '2013350398@qq.com', '归还');
INSERT INTO `borrow` VALUES ('44', '789', '2022-12-07 15:18:38', '2022-12-14 18:31:50', '', '38', '18838032551', '', '138', '6', '2013350398@qq.com', '待审核');
INSERT INTO `borrow` VALUES ('45', '789', '2022-12-07 15:19:36', '2022-12-14 18:31:53', '', '42', '18838032551', '', '145', '22', '2013350398@qq.com', '待审核');
INSERT INTO `borrow` VALUES ('46', '789', '2022-12-07 15:19:41', '2022-12-14 18:31:56', '', '42', '18838032551', '', '138', '22', '2013350398@qq.com', '待审核');
INSERT INTO `borrow` VALUES ('47', '789', '2022-12-07 15:19:51', '2022-12-14 18:31:59', '', '42', '18838032551', '', '141', '22', '2013350398@qq.com', '待审核');

-- ----------------------------
-- Table structure for chara
-- ----------------------------
DROP TABLE IF EXISTS `chara`;
CREATE TABLE `chara` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of chara
-- ----------------------------
INSERT INTO `chara` VALUES ('2', '工作人员', null, '2', null);
INSERT INTO `chara` VALUES ('3', 'admin', null, null, '3');
INSERT INTO `chara` VALUES ('4', '普通用户', '2022-11-23 09:57:18', null, null);
INSERT INTO `chara` VALUES ('25', '工作人员', '2022-11-24 09:26:44', null, null);
INSERT INTO `chara` VALUES ('26', '工作人员', '2022-11-28 15:44:00', null, null);
INSERT INTO `chara` VALUES ('29', '工作人员', '2022-11-28 15:47:50', null, null);
INSERT INTO `chara` VALUES ('30', '工作人员', '2022-11-28 16:13:17', null, null);
INSERT INTO `chara` VALUES ('35', '工作人员', '2022-12-05 03:29:08', null, null);
INSERT INTO `chara` VALUES ('37', '工作人员', '2022-12-05 04:16:28', null, null);
INSERT INTO `chara` VALUES ('38', '普通用户', '2022-12-05 04:27:56', null, null);
INSERT INTO `chara` VALUES ('39', '普通用户', '2022-12-05 04:53:55', null, null);
INSERT INTO `chara` VALUES ('40', '普通用户', '2022-12-05 05:03:21', null, null);
INSERT INTO `chara` VALUES ('42', '普通用户', '2022-12-05 06:30:39', null, null);
INSERT INTO `chara` VALUES ('45', '普通用户', '2022-12-07 13:21:14', null, null);
INSERT INTO `chara` VALUES ('46', '工作人员', '2022-12-07 14:07:43', null, null);

-- ----------------------------
-- Table structure for spec
-- ----------------------------
DROP TABLE IF EXISTS `spec`;
CREATE TABLE `spec` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `excavatetime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ages` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `entryman` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `entrytime` datetime DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `unitname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spec
-- ----------------------------
INSERT INTO `spec` VALUES ('10', '1', '1', '111', '11', '1', '1', 'spec1', '2022-11-24 12:20:26', '微信图片_20221120144251.png', '是', '1', '1');
INSERT INTO `spec` VALUES ('11', '2', '2', '2', '2', '2', '1', '2', '2022-11-24 12:20:42', '微信图片_20221120144223.jpg', '否', '1', '2');
INSERT INTO `spec` VALUES ('15', '4', '4', '4', '4', '4', '2', '444', '2022-12-03 22:54:29', '微信图片_20221120144211.jpg', '否', '4', '1234');
INSERT INTO `spec` VALUES ('20', '5', '5', '', '', '', '1', '', '2022-11-25 12:34:37', '微信图片_20221120144256.png', '是', '1', '5');
INSERT INTO `spec` VALUES ('89', '1', '11', '13', '14', '15', '2', '16', '2022-11-28 15:19:06', '微信图片_20221120144310.png', '是', '4', 'test1');
INSERT INTO `spec` VALUES ('92', '4', '4', '4', '4', '4', '22', '', '2022-11-28 15:19:06', null, '是', '4', 'test4');
INSERT INTO `spec` VALUES ('108', '', '', '', '', '', '1', '', '2022-12-03 14:40:23', 'null', '是', '1', 'test11');
INSERT INTO `spec` VALUES ('119', '', '', '', '', '', '1', '', '2022-12-05 05:16:30', null, '是', '1', 'test');
INSERT INTO `spec` VALUES ('121', '', '', '', '', '', '1', '', '2022-12-05 05:22:35', null, '是', '1', '1111');
INSERT INTO `spec` VALUES ('123', '1', '11', '13', '14', '15', '1', '16', '2022-12-05 05:32:43', 'null', '是', '1', 'test1');
INSERT INTO `spec` VALUES ('128', '2', '2', '2', '2', '2', '2', '', '2022-12-05 06:07:22', null, '否', '1', 'test2');
INSERT INTO `spec` VALUES ('129', '3', '3', '3', '3', '3', '2', '', '2022-12-05 06:07:22', null, '是', '1', 'test3');
INSERT INTO `spec` VALUES ('136', '2', '2', '2', '2', '2', '2', '', '2022-12-07 06:06:25', '微信图片_20221120144231.png', '否', '789', 'test2');
INSERT INTO `spec` VALUES ('137', '3', '3', '3', '3', '3', '2', '', '2022-12-07 06:06:25', '微信图片_20221120144251.png', '是', '789', 'test3');
INSERT INTO `spec` VALUES ('138', '4', '4', '4', '4', '4', '2', '', '2022-12-07 06:06:25', null, '是', '789', 'test4');
INSERT INTO `spec` VALUES ('140', 's1', 'site1', 'time1', 'material1', 'age1', '2', 'descr1', '2022-12-07 15:02:11', null, '是', '789', 'spectest1');
INSERT INTO `spec` VALUES ('141', 's1', 'site1', 'time1', 'material1', 'age1', '2', 'descr1', '2022-12-07 15:02:19', null, '是', '789', '1');
INSERT INTO `spec` VALUES ('142', '1', '12', '13', '14', '15', '2', '16', '2022-12-07 15:09:24', null, '是', '789', 'test_1');
INSERT INTO `spec` VALUES ('143', '2', '2', '2', '2', '2', '2', '', '2022-12-07 15:09:24', null, '否', '789', 'test_2');
INSERT INTO `spec` VALUES ('144', '3', '3', '3', '3', '3', '2', '', '2022-12-07 15:09:24', '微信图片_20221120144223.jpg', '是', '789', 'test_3');
INSERT INTO `spec` VALUES ('145', '4', '4', '4', '4', '4', '2', '', '2022-12-07 15:09:24', null, '是', '789', 'test_4');

-- ----------------------------
-- Table structure for uc
-- ----------------------------
DROP TABLE IF EXISTS `uc`;
CREATE TABLE `uc` (
  `uid` int NOT NULL,
  `cid` int NOT NULL,
  PRIMARY KEY (`uid`,`cid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of uc
-- ----------------------------
INSERT INTO `uc` VALUES ('2', '2');
INSERT INTO `uc` VALUES ('3', '3');
INSERT INTO `uc` VALUES ('4', '4');
INSERT INTO `uc` VALUES ('38', '25');
INSERT INTO `uc` VALUES ('39', '26');
INSERT INTO `uc` VALUES ('42', '29');
INSERT INTO `uc` VALUES ('43', '30');
INSERT INTO `uc` VALUES ('48', '35');
INSERT INTO `uc` VALUES ('50', '37');
INSERT INTO `uc` VALUES ('51', '38');
INSERT INTO `uc` VALUES ('52', '39');
INSERT INTO `uc` VALUES ('53', '40');
INSERT INTO `uc` VALUES ('55', '42');
INSERT INTO `uc` VALUES ('58', '45');
INSERT INTO `uc` VALUES ('59', '46');

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unid` int NOT NULL AUTO_INCREMENT,
  `unname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `linkman` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `unittype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`unid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('12', '1', '2', '18838032551', '2013350398@qq.com', '111', '国家级单位');
INSERT INTO `unit` VALUES ('13', '4', '4', '18838032551', '2013350398@qq.com', '111', '国家级单位');
INSERT INTO `unit` VALUES ('15', '789', '311', '18838032552', '2013350398@qq.com', '798', '省部级单位');
INSERT INTO `unit` VALUES ('22', 'unit', '', '18838032551', '2013350398@qq.com', '11', '国家级单位');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `home` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `num` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `regist` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `sexy` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `head` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `unitname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', '2', '2', '11', '18838032551', '2013350398@qq.com', '22', '2', '', '2022-11-28 18:26:43', '男', 'flower1.jpg', '工作人员', '2022-12-14 11:07:40', '1', '2');
INSERT INTO `users` VALUES ('3', 'admin', '123', '管理员', '18838032551', '2013350398@qq.com', 'null', '', '', '2022-11-28 18:26:48', '男', '', 'admin', '2022-12-14 18:26:59', '', '123');
INSERT INTO `users` VALUES ('4', '4', '4', '44', '18838032551', '2013350398@qq.com', '123456', '4', '', '2022-11-28 18:26:53', '', 'flower1.jpg', '普通用户', '2022-12-03 15:27:40', '', '4');
INSERT INTO `users` VALUES ('38', '6', '6', '11', '18838032551', '2013350398@qq.com', '', '6', '', '2022-11-24 09:26:44', 'null', '微信图片_20221120144150.jpg', '工作人员', '2022-12-07 15:28:29', '1', '6');
INSERT INTO `users` VALUES ('39', '200802111', '2111', '张昌含弘', '18838032552', '2013350398@qq.com', '北京林业大学', '200802111', '', '2022-11-28 15:44:00', '', '', '工作人员', '2022-11-28 15:44:00', '4', '2111');
INSERT INTO `users` VALUES ('42', '22', '2', '', '18838032551', '2013350398@qq.com', '', '22', '', '2022-11-28 15:47:50', '', '', '工作人员', '2022-12-07 15:19:10', '4', null);
INSERT INTO `users` VALUES ('43', '7', '7', '', '18838032551', '2013350398@qq.com', '北京林业大学', '7', '', '2022-11-28 16:13:17', '男', 'flower2.jpg', '工作人员', '2022-12-12 15:06:02', '4', null);
INSERT INTO `users` VALUES ('48', '1111', '1111', '', '18838032551', '2013350398@qq.com', '', '', '', '2022-12-05 03:29:08', '女', '', '工作人员', '2022-12-05 03:29:08', '1', null);
INSERT INTO `users` VALUES ('50', '21', '', '', '18838032551', '2013350398@qq.com', '', '21', '是', '2022-12-05 04:16:28', '女', '初始头像.jpg', '工作人员', '2022-12-05 04:16:28', '4', null);
INSERT INTO `users` VALUES ('51', '211', '1', '1', '18838032551', '2013350398@qq.com', '', '', '是', '2022-12-05 04:27:56', '女', '初始头像.jpg', '普通用户', '2022-12-05 06:40:17', 'null', null);
INSERT INTO `users` VALUES ('52', '222', '2', '', '18838032551', '2013350398@qq.com', '', '', '是', '2022-12-05 04:53:55', '男', '初始头像.jpg', '普通用户', '2022-12-05 04:53:55', 'null', null);
INSERT INTO `users` VALUES ('53', '2121', '1', '21', '18838032551', '2013350398@qq.com', '', '', '是', '2022-12-05 05:03:21', '男', '初始头像.jpg', '普通用户', '2022-12-05 05:15:21', 'null', null);
INSERT INTO `users` VALUES ('55', '1212', '1', '', '18838032551', '2013350398@qq.com', '', '', '是', '2022-12-05 06:30:39', '男', '初始头像.jpg', '普通用户', '2022-12-05 06:30:39', 'null', null);
INSERT INTO `users` VALUES ('58', 'user1', '1', '用户1', '18838032551', '2013350398@qq.com', '北京林业大学', '', '是', '2022-12-07 13:21:14', '男', '微信图片_20221120144211.jpg', '普通用户', '2022-12-14 11:10:22', 'null', '1');
INSERT INTO `users` VALUES ('59', 'staff1', 'aff1', '工作人员1', '18838032551', '2013350398@qq.com', '北京林业大学', 'staff1', '是', '2022-12-07 14:07:43', '男', '初始头像.jpg', '工作人员', '2022-12-07 15:13:01', 'unit1', null);
