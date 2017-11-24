/*
Navicat MySQL Data Transfer

Source Server         : yy
Source Server Version : 50614
Source Host           : 127.0.0.1:33066
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-11-20 09:26:10
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
  PRIMARY KEY (`comID`),
  KEY `dcComID` (`dcComID`),
  CONSTRAINT `commtent_ibfk_1` FOREIGN KEY (`dcComID`) REFERENCES `dynamiccontent` (`dcID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of commtent
-- ----------------------------

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
  PRIMARY KEY (`dcID`),
  KEY `userID` (`userID`),
  CONSTRAINT `dynamiccontent_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of dynamiccontent
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
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
