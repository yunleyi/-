/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : yunleyi36

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2022-11-12 21:13:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(100) NOT NULL,
  `taskowner` varchar(40) NOT NULL,
  `tasktime` date NOT NULL,
  `taskintro` varchar(255) NOT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('12', 'qwe', 'qwe', '2022-05-04', 'qwe');
INSERT INTO `task` VALUES ('13', '记录3', 'dd', '2022-05-24', 'test1');
INSERT INTO `task` VALUES ('14', '记录4', 'd1', '2022-05-24', '测试');
INSERT INTO `task` VALUES ('15', 'test', '测试', '2022-05-06', '111');
INSERT INTO `task` VALUES ('16', 'dididi', '啦啦啦', '2022-05-03', '456');
INSERT INTO `task` VALUES ('17', '测试', 'JSP', '2022-05-25', 'test添加');
INSERT INTO `task` VALUES ('18', '测试2', 'JSP程序设计', '2022-05-25', '滴滴滴');
INSERT INTO `task` VALUES ('19', '任务名称111', '发布者111', '2022-05-25', '描述111');
INSERT INTO `task` VALUES ('20', '任务名称2', '任务发布者2', '2022-05-25', '描述2');
INSERT INTO `task` VALUES ('21', '名称3-测试', '发布者3', '2022-05-25', '描述3');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'admin');
