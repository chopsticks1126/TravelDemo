/*
Navicat MySQL Data Transfer

Source Server         : yy
Source Server Version : 50614
Source Host           : 127.0.0.1:33066
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-12-21 13:32:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for commtent
-- ----------------------------
DROP TABLE IF EXISTS `commtent`;
CREATE TABLE `commtent` (
  `comID` int(11) NOT NULL AUTO_INCREMENT,
  `dcComID` int(11) DEFAULT NULL,
  `replyContent` varchar(1000) DEFAULT NULL,
  `datetimect` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `replyTag` varchar(10) DEFAULT NULL,
  `isdelete` varchar(2) DEFAULT NULL,
  `isagree` varchar(100) DEFAULT NULL,
  `cmtUserID` int(11) DEFAULT NULL COMMENT '回复评论的人ID',
  PRIMARY KEY (`comID`),
  KEY `dcComID` (`dcComID`),
  CONSTRAINT `commtent_ibfk_1` FOREIGN KEY (`dcComID`) REFERENCES `dynamiccontent` (`dcID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of commtent
-- ----------------------------
INSERT INTO `commtent` VALUES ('14', '1', '哈哈哈哈 测试', '2017-12-04 13:31:42', 'P', 'N', 'N', '1');
INSERT INTO `commtent` VALUES ('15', '1', '1222233344444444444', '2017-12-05 16:07:29', 'P', 'N', 'N', '1');
INSERT INTO `commtent` VALUES ('26', '2', '从单位hi啊', '2017-12-05 17:03:06', 'P', 'N', 'N', '1');
INSERT INTO `commtent` VALUES ('29', '1', '彩打', '2017-12-05 17:03:52', 'P', 'N', 'N', '1');
INSERT INTO `commtent` VALUES ('30', '2', '侧his开户数', '2017-12-05 17:04:21', 'P', 'N', 'N', '1');

-- ----------------------------
-- Table structure for datainfo
-- ----------------------------
DROP TABLE IF EXISTS `datainfo`;
CREATE TABLE `datainfo` (
  `Infoid` int(11) NOT NULL AUTO_INCREMENT,
  `usercode` varchar(50) DEFAULT NULL,
  `startcityName` varchar(50) DEFAULT NULL,
  `passcityName` varchar(50) DEFAULT NULL,
  `startcityName_zh` varchar(100) DEFAULT NULL,
  `passcityName_zh` varchar(100) DEFAULT NULL,
  `startx_axis` double(11,2) DEFAULT NULL,
  `starty_axis` double(11,2) DEFAULT NULL,
  `passx_axis` double(11,2) DEFAULT NULL,
  `passy_axis` double(11,2) DEFAULT NULL,
  `Start_deviceInfo` varchar(1000) DEFAULT NULL,
  `Pass_deviveInfo` varchar(1000) DEFAULT NULL,
  `creatIndoTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isdelete` varchar(2) DEFAULT NULL,
  `oid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Infoid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datainfo
-- ----------------------------
INSERT INTO `datainfo` VALUES ('77', 'admin', '成都', '合肥', 'cd', 'hf', '104.07', '30.57', '117.23', '31.82', '璧峰?绔??', '???绔??', '2017-12-21 11:08:47', '0', '6');
INSERT INTO `datainfo` VALUES ('78', 'admin', '成都', '南京', 'cd', 'nj', '104.07', '30.57', '118.80', '32.06', '璧峰?绔??', '???绔??', '2017-12-21 11:08:53', '0', '9');
INSERT INTO `datainfo` VALUES ('79', 'admin', '成都', '资阳', 'cd', 'zy', '104.07', '30.57', '104.63', '30.13', '璧峰?绔??', '???绔??', '2017-12-21 11:09:17', '0', '7');
INSERT INTO `datainfo` VALUES ('80', 'admin', '成都', '新都', 'cd', 'xd', '104.07', '30.57', '104.15', '30.82', '璧峰?绔??', '???绔??', '2017-12-21 11:09:38', '0', '6');

-- ----------------------------
-- Table structure for dynamiccontent
-- ----------------------------
DROP TABLE IF EXISTS `dynamiccontent`;
CREATE TABLE `dynamiccontent` (
  `dcID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isdelete` varchar(2) DEFAULT NULL,
  `isagree` varchar(100) DEFAULT NULL,
  `headImg` varchar(50) DEFAULT NULL COMMENT '动态任务头像名称',
  PRIMARY KEY (`dcID`),
  KEY `userID` (`userID`),
  CONSTRAINT `dynamiccontent_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of dynamiccontent
-- ----------------------------
INSERT INTO `dynamiccontent` VALUES ('1', '1', '测试测试卷', '2017-11-29 17:19:32', 'N', 'N', 'headPhoto.jpg');
INSERT INTO `dynamiccontent` VALUES ('2', '2', '测试测试卷1', '2017-11-29 17:19:34', 'N', 'N', 'headPhoto.jpg');

-- ----------------------------
-- Table structure for loginfo
-- ----------------------------
DROP TABLE IF EXISTS `loginfo`;
CREATE TABLE `loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Operator` varchar(50) DEFAULT NULL,
  `Operationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Operationdetails` varchar(1000) DEFAULT NULL,
  `beOperator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of loginfo
-- ----------------------------

-- ----------------------------
-- Table structure for msginfo
-- ----------------------------
DROP TABLE IF EXISTS `msginfo`;
CREATE TABLE `msginfo` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of msginfo
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `daytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isdelete` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wh', 'wh', null, '2017-11-29 14:48:00', null);
INSERT INTO `user` VALUES ('2', 'CK', 'CK', null, '2017-11-29 14:57:42', null);
INSERT INTO `user` VALUES ('3', 'zz', 'tc', null, '2017-11-29 15:43:30', null);
