/*
Navicat MySQL Data Transfer

Source Server         : uface
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : uface

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-01-30 11:05:11
author shimingda@deepsense.cn
*/

use uface;
-- ----------------------------
-- Records of t_alert_sound
-- ----------------------------
INSERT INTO `t_alert_sound` VALUES ('1', null, null, null, '0', null, '0', null, null, '默认值', 'default.ogg');

-- ----------------------------
-- Records of t_alert_config
-- ----------------------------
INSERT INTO `t_alert_config` VALUES ('1', null, null, null, '0', null, '0', null, null, 'alert_sound', '1');
INSERT INTO `t_alert_config` VALUES ('2', null, null, null, '0', null, '0', null, null, 'judged_sound', '1');
INSERT INTO `t_alert_config` VALUES ('3', null, null, null, '0', null, '0', null, null, 'stay_time', '5000');
-- ----------------------------
-- Records of t_access_time_rule
-- ----------------------------
INSERT INTO `t_access_time_rule` VALUES ('1', null, null, null, '0', '默认规则', '0', null, null, null, '1,2,3,4,5,6,7', '23:59:59', '24小时通行', null, '00:00:00', null);
-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('1', null, null, '-1', '0', null, '1', null, null, '1;', null, null, '白名单', '1', null);
INSERT INTO `t_group` VALUES ('2', null, null, '-1', '0', null, '1', null, null, '2;', null, null, '黑名单', '2', null);
INSERT INTO `t_group` VALUES ('3', null, null, '-1', '0', null, '1', null, null, '3;', null, null, '访客', '3', null);
-- ----------------------------
-- Records of t_person_config
-- ----------------------------
INSERT INTO `t_person_config` VALUES ('1', null, '2019-04-15 14:44:16', '-1', '0', null, '1', 'root', '2019-04-15 14:44:16', 'authorization', '1', '3');
INSERT INTO `t_person_config` VALUES ('2', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'interviewed', '0', '3');
INSERT INTO `t_person_config` VALUES ('3', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'expireAt', '1', '3');
INSERT INTO `t_person_config` VALUES ('4', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'leaveAuto', '1', '3');
INSERT INTO `t_person_config` VALUES ('5', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'leaveLocation', '0', '3');
INSERT INTO `t_person_config` VALUES ('6', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'leaveDevice', '', '3');
INSERT INTO `t_person_config` VALUES ('7', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'leaveTimeing', '0', '3');
INSERT INTO `t_person_config` VALUES ('8', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'leaveTime', '120', '3');
INSERT INTO `t_person_config` VALUES ('9', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'cardStyle', '1', '3');
INSERT INTO `t_person_config` VALUES ('10', null, '2019-04-15 14:44:17', '-1', '0', null, '1', 'root', '2019-04-15 14:44:17', 'cardForce', '0', '3');
