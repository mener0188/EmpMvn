/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : 1704d

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-04-26 09:21:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `departid` int(8) NOT NULL AUTO_INCREMENT,
  `departname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`departid`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('1', '研发部');
INSERT INTO `depart` VALUES ('2', '运维部');
INSERT INTO `depart` VALUES ('3', '部门3');
INSERT INTO `depart` VALUES ('68', 'departN-915748167');
INSERT INTO `depart` VALUES ('69', 'departN1387232627');
INSERT INTO `depart` VALUES ('70', 'departN-262388243');
INSERT INTO `depart` VALUES ('71', 'departN-2034315008');
INSERT INTO `depart` VALUES ('72', 'departN-463944323');
INSERT INTO `depart` VALUES ('73', 'departN103532793');
INSERT INTO `depart` VALUES ('74', 'departN828117989');
INSERT INTO `depart` VALUES ('75', 'departN339466428');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `empid` int(8) NOT NULL AUTO_INCREMENT,
  `empname` varchar(64) DEFAULT NULL,
  `empdesc` varchar(64) DEFAULT NULL,
  `departid` int(8) DEFAULT NULL,
  `jobid` int(8) DEFAULT NULL,
  `shengid` int(8) DEFAULT NULL,
  `shiid` int(8) DEFAULT NULL,
  `xianid` int(8) DEFAULT NULL,
  `age` int(8) DEFAULT NULL,
  `sex` varchar(32) DEFAULT NULL,
  `birth` varchar(32) DEFAULT NULL,
  `picName` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('49', 'xxx222', '222', '1', '2', '2', '6', '12', null, null, '2019-12-06', null);
INSERT INTO `emp` VALUES ('63', 'fff', 'fff', '1', '1', null, null, null, null, null, '2020-04-15', null);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jobid` int(8) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '程序员');
INSERT INTO `job` VALUES ('2', '运维人员');
INSERT INTO `job` VALUES ('3', '测试人员');
INSERT INTO `job` VALUES ('4', '项目经理');
