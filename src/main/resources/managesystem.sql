/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : managesystem

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-06 23:19:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cases
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `case_ID` int(11) NOT NULL AUTO_INCREMENT,
  `event_L_ID` int(11) DEFAULT NULL,
  `part_L_ID` int(11) DEFAULT NULL,
  `grid_ID` int(11) DEFAULT NULL,
  `stage` varchar(20) NOT NULL DEFAULT '待进行',
  `time_Limit` int(11) NOT NULL DEFAULT '30',
  `case_Describe` varchar(1000) NOT NULL DEFAULT '无',
  PRIMARY KEY (`case_ID`),
  KEY `FK_Relationship_13` (`grid_ID`),
  KEY `FK_Relationship_12` (`part_L_ID`),
  KEY `FK_Relationship_11` (`event_L_ID`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`event_L_ID`) REFERENCES `event_second` (`event_L_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`part_L_ID`) REFERENCES `parts_second` (`part_L_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`grid_ID`) REFERENCES `grid` (`grid_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` VALUES ('1', '2', '1', '0', '待进行', '40', '这是一个栗子');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `community_ID` int(11) NOT NULL AUTO_INCREMENT,
  `street_ID` int(11) DEFAULT NULL,
  `comm_Name` varchar(20) NOT NULL,
  `comm_Information` text,
  PRIMARY KEY (`community_ID`),
  KEY `FK_Relationship_5` (`street_ID`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`street_ID`) REFERENCES `street` (`street_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('0', '0', '未分配', null);
INSERT INTO `community` VALUES ('1', '1', '小敏社区', null);
INSERT INTO `community` VALUES ('2', '1', '小红社区', null);
INSERT INTO `community` VALUES ('3', '2', '晓东社区', null);
INSERT INTO `community` VALUES ('4', '3', '敏敏社区', null);
INSERT INTO `community` VALUES ('5', '1', '啊啊社区', null);
INSERT INTO `community` VALUES ('6', '2', 'mou社区', null);
INSERT INTO `community` VALUES ('7', '3', '222社区', null);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_Num` int(11) NOT NULL AUTO_INCREMENT,
  `department_Name` varchar(20) NOT NULL,
  `address` varchar(1000) NOT NULL DEFAULT '无',
  `dep_Describe` varchar(1000) NOT NULL DEFAULT '无',
  PRIMARY KEY (`department_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('0', '总部', '无', '老大的家');
INSERT INTO `department` VALUES ('1', '财务部', '无', '管钱的地方呗');
INSERT INTO `department` VALUES ('2', '测试部', '无', '无');
INSERT INTO `department` VALUES ('3', '俄式部', '无', '测试');
INSERT INTO `department` VALUES ('8', '啊实打实打算', '阿斯顿阿三', '啊实打实的');
INSERT INTO `department` VALUES ('10', '测试日志', '测试日志', '测试日志');
INSERT INTO `department` VALUES ('11', '测试以下添加', '测试以下添加', '测试以下添加');
INSERT INTO `department` VALUES ('12', 'a', '无', '无');

-- ----------------------------
-- Table structure for event_first
-- ----------------------------
DROP TABLE IF EXISTS `event_first`;
CREATE TABLE `event_first` (
  `Event_B_ID` int(11) NOT NULL,
  `Event_B_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Event_B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_first
-- ----------------------------
INSERT INTO `event_first` VALUES ('1', '市容环境');
INSERT INTO `event_first` VALUES ('2', '宣传广告');
INSERT INTO `event_first` VALUES ('3', '施工管理');
INSERT INTO `event_first` VALUES ('4', '突发事件');
INSERT INTO `event_first` VALUES ('5', '街面秩序');
INSERT INTO `event_first` VALUES ('6', '其他事件');

-- ----------------------------
-- Table structure for event_second
-- ----------------------------
DROP TABLE IF EXISTS `event_second`;
CREATE TABLE `event_second` (
  `event_L_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Event_B_ID` int(11) DEFAULT NULL,
  `event_L_Name` varchar(20) NOT NULL,
  `e_Managemet_Unit` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`event_L_ID`),
  KEY `FK_Relationship_8` (`Event_B_ID`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`Event_B_ID`) REFERENCES `event_first` (`Event_B_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_second
-- ----------------------------
INSERT INTO `event_second` VALUES ('1', '1', '私搭乱建', null);
INSERT INTO `event_second` VALUES ('2', '1', '暴露垃圾', null);
INSERT INTO `event_second` VALUES ('3', '2', '非法小广告', null);
INSERT INTO `event_second` VALUES ('4', '2', '占道广告牌', null);
INSERT INTO `event_second` VALUES ('5', '3', '施工扰民', null);
INSERT INTO `event_second` VALUES ('6', '3', '施工占道', null);
INSERT INTO `event_second` VALUES ('7', '4', '路面坍陷', null);
INSERT INTO `event_second` VALUES ('8', '4', '道路积水', null);
INSERT INTO `event_second` VALUES ('9', '5', '无照经营', null);
INSERT INTO `event_second` VALUES ('10', '5', '商业噪音', null);
INSERT INTO `event_second` VALUES ('11', '6', '其他时间', null);

-- ----------------------------
-- Table structure for grid
-- ----------------------------
DROP TABLE IF EXISTS `grid`;
CREATE TABLE `grid` (
  `grid_ID` int(11) NOT NULL,
  `community_ID` int(11) DEFAULT NULL,
  `grid_Information` text,
  PRIMARY KEY (`grid_ID`),
  KEY `FK_Relationship_6` (`community_ID`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`community_ID`) REFERENCES `community` (`community_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grid
-- ----------------------------
INSERT INTO `grid` VALUES ('0', '0', '未分配');
INSERT INTO `grid` VALUES ('1', '1', '网格1');
INSERT INTO `grid` VALUES ('2', '2', '网格2');
INSERT INTO `grid` VALUES ('3', '3', '网格3');
INSERT INTO `grid` VALUES ('4', '4', '网格4');
INSERT INTO `grid` VALUES ('5', '5', '网格5');
INSERT INTO `grid` VALUES ('6', '1', '网格6');
INSERT INTO `grid` VALUES ('7', '2', '网格7');
INSERT INTO `grid` VALUES ('8', '3', '网格8');
INSERT INTO `grid` VALUES ('9', '6', '99');
INSERT INTO `grid` VALUES ('10', '7', '100');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_ID` int(11) NOT NULL AUTO_INCREMENT,
  `notice_organization` varchar(20) NOT NULL,
  `notice_content` text,
  `notice_time` date DEFAULT NULL,
  PRIMARY KEY (`notice_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '学院办公室', '信软学院2017年国庆节、中秋节放假安排\r\n各位老师：\r\n2017年学校国庆节、中秋节放假安排如下：\r\n   10月1日至8日放假调休，共8天。9月30日（星期六）按星期一（10月2日所在教学周）课表上课。 其中，10月1日-3日（国庆节）、10月4日（中秋节）为法定节假日。\r\n学院机关国庆节、中秋节期间值班安排见附件。 \r\n安全工作：\r\n1、各实验室、团队、科室放假前要开展一次以防火、防盗为重点的安全检查，及时消除各类安全隐患，切实落实各项安全防范措施，对贵重物品要实行统一管理。\r\n2、请各部门放假期间要做好防火、防盗和安全保卫等各项工作。\r\n3、学生科加强对学生的安全教育，做好学生出行的管理工作。\r\n4、各位老师、同学在假期出行期间提高警惕，注意自己及家人的人身、财产安全。家中有小孩的老师，切实履行监护责任。', '2017-10-20');
INSERT INTO `notice` VALUES ('2', '学生啊啊', '阿森纳的阿三', '2017-10-14');
INSERT INTO `notice` VALUES ('3', 'asdsad', '萨达萨达是', '2017-11-25');
INSERT INTO `notice` VALUES ('4', '官方', '官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方', '2017-11-18');
INSERT INTO `notice` VALUES ('8', 'sdfsdf', 'sadsadsadasdasd', '2017-11-03');
INSERT INTO `notice` VALUES ('9', 'dgdfgfdgdfg', 'dfgdfg', '2017-11-21');

-- ----------------------------
-- Table structure for operation_record
-- ----------------------------
DROP TABLE IF EXISTS `operation_record`;
CREATE TABLE `operation_record` (
  `operation_id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_user` int(20) NOT NULL,
  `operation_context` varchar(255) NOT NULL,
  `operation_name` varchar(255) NOT NULL,
  `operation_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`operation_id`),
  KEY `FK_operation_name` (`operation_name`),
  KEY `FK_operation_userid` (`operation_user`),
  CONSTRAINT `FK_operation_userid` FOREIGN KEY (`operation_user`) REFERENCES `user` (`user_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_record
-- ----------------------------
INSERT INTO `operation_record` VALUES ('27', '1', '==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ', '陈音东', '2017-11-04 18:22:09');
INSERT INTO `operation_record` VALUES ('28', '1', '==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录(String), 9(Integer)', '陈音东', '2017-11-04 18:22:09');
INSERT INTO `operation_record` VALUES ('29', '1', '<==    Updates: 1', '陈音东', '2017-11-04 18:22:09');
INSERT INTO `operation_record` VALUES ('30', '1', '==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ', '陈音东', '2017-11-04 18:24:31');
INSERT INTO `operation_record` VALUES ('31', '1', '==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录2(String), 9(Integer)', '陈音东', '2017-11-04 18:24:31');
INSERT INTO `operation_record` VALUES ('32', '1', '<==    Updates: 1', '陈音东', '2017-11-04 18:24:32');
INSERT INTO `operation_record` VALUES ('33', '1', '==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ', '陈音东', '2017-11-04 18:25:11');
INSERT INTO `operation_record` VALUES ('34', '1', '==> Parameters: 俄式部(String), 无(String), 测试(String), 3(Integer)', '陈音东', '2017-11-04 18:25:11');
INSERT INTO `operation_record` VALUES ('35', '1', '<==    Updates: 1', '陈音东', '2017-11-04 18:25:12');
INSERT INTO `operation_record` VALUES ('36', '1', '==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ', '陈音东', '2017-11-04 18:26:55');
INSERT INTO `operation_record` VALUES ('37', '1', '==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录23(String), 9(Integer)', '陈音东', '2017-11-04 18:26:55');
INSERT INTO `operation_record` VALUES ('38', '1', '<==    Updates: 1', '陈音东', '2017-11-04 18:26:55');
INSERT INTO `operation_record` VALUES ('39', '1', '==>  Preparing: insert into department ( department_Name, address, dep_Describe ) values ( ?, ?, ? ) ', '陈音东', '2017-11-04 18:27:50');
INSERT INTO `operation_record` VALUES ('40', '1', '==> Parameters: 测试日志(String), 测试日志(String), 测试日志(String)', '陈音东', '2017-11-04 18:27:50');
INSERT INTO `operation_record` VALUES ('41', '1', '<==    Updates: 1', '陈音东', '2017-11-04 18:27:50');
INSERT INTO `operation_record` VALUES ('42', '2', '==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ', '张三', '2017-11-04 19:14:00');
INSERT INTO `operation_record` VALUES ('43', '2', '==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录234(String), 9(Integer)', '张三', '2017-11-04 19:14:00');
INSERT INTO `operation_record` VALUES ('44', '2', '<==    Updates: 1', '张三', '2017-11-04 19:14:01');
INSERT INTO `operation_record` VALUES ('45', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-05 12:55:08');
INSERT INTO `operation_record` VALUES ('46', '1', '==> Parameters: 1(Integer), 1(Integer), 测试以下(String), 男(String), 12(Integer), 18282296013(String)', '陈音东', '2017-11-05 12:55:08');
INSERT INTO `operation_record` VALUES ('47', '1', '<==    Updates: 1', '陈音东', '2017-11-05 12:55:08');
INSERT INTO `operation_record` VALUES ('48', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-05 20:00:21');
INSERT INTO `operation_record` VALUES ('49', '1', '==> Parameters: 1(Integer), 1(Integer), 陈颖啊啊啊啊(String), 男(String), 11(Integer), 18248859652(String)', '陈音东', '2017-11-05 20:00:21');
INSERT INTO `operation_record` VALUES ('50', '1', '<==    Updates: 1', '陈音东', '2017-11-05 20:00:21');
INSERT INTO `operation_record` VALUES ('51', '1', '==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 12:47:26');
INSERT INTO `operation_record` VALUES ('52', '1', '==> Parameters: 1(Integer), 0(Integer), 张三(String), 男(String), 18(Integer), 18282248546(String), 2(Integer)', '陈音东', '2017-11-06 12:47:26');
INSERT INTO `operation_record` VALUES ('53', '1', '<==    Updates: 1', '陈音东', '2017-11-06 12:47:27');
INSERT INTO `operation_record` VALUES ('54', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:19:38');
INSERT INTO `operation_record` VALUES ('55', '1', '==> Parameters: 1(Integer), 1(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:19:38');
INSERT INTO `operation_record` VALUES ('56', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:20:32');
INSERT INTO `operation_record` VALUES ('57', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:20:32');
INSERT INTO `operation_record` VALUES ('58', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:21:00');
INSERT INTO `operation_record` VALUES ('59', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:21:00');
INSERT INTO `operation_record` VALUES ('60', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:21:55');
INSERT INTO `operation_record` VALUES ('61', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:21:55');
INSERT INTO `operation_record` VALUES ('62', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:22:40');
INSERT INTO `operation_record` VALUES ('63', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:22:40');
INSERT INTO `operation_record` VALUES ('64', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:22:48');
INSERT INTO `operation_record` VALUES ('65', '1', '==> Parameters: 15(Integer), 0(Integer), 陈音东aaaa(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:22:48');
INSERT INTO `operation_record` VALUES ('66', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:24:12');
INSERT INTO `operation_record` VALUES ('67', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:24:12');
INSERT INTO `operation_record` VALUES ('68', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:25:46');
INSERT INTO `operation_record` VALUES ('69', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:25:46');
INSERT INTO `operation_record` VALUES ('70', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:27:27');
INSERT INTO `operation_record` VALUES ('71', '1', '==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:27:27');
INSERT INTO `operation_record` VALUES ('72', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:28:11');
INSERT INTO `operation_record` VALUES ('73', '1', '==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:28:11');
INSERT INTO `operation_record` VALUES ('74', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:28:13');
INSERT INTO `operation_record` VALUES ('75', '1', '==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:28:13');
INSERT INTO `operation_record` VALUES ('76', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:28:23');
INSERT INTO `operation_record` VALUES ('77', '1', '==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:28:23');
INSERT INTO `operation_record` VALUES ('78', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:28:43');
INSERT INTO `operation_record` VALUES ('79', '1', '==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:28:43');
INSERT INTO `operation_record` VALUES ('80', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 14:28:57');
INSERT INTO `operation_record` VALUES ('81', '1', '==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 14:28:57');
INSERT INTO `operation_record` VALUES ('82', '1', '==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 14:32:07');
INSERT INTO `operation_record` VALUES ('83', '1', '==> Parameters: 15(Integer), 0(Integer), 陈音东(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 14:32:07');
INSERT INTO `operation_record` VALUES ('84', '1', '==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 14:35:04');
INSERT INTO `operation_record` VALUES ('85', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 14:35:04');
INSERT INTO `operation_record` VALUES ('86', '1', '<==    Updates: 1', '陈音东', '2017-11-06 14:35:04');
INSERT INTO `operation_record` VALUES ('87', '1', '==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 14:35:11');
INSERT INTO `operation_record` VALUES ('88', '1', '==> Parameters: 15(Integer), 0(Integer), 陈音东(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 14:35:11');
INSERT INTO `operation_record` VALUES ('89', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 14:44:43');
INSERT INTO `operation_record` VALUES ('90', '1', '==> Parameters: 55(Integer)', '陈音东', '2017-11-06 14:44:43');
INSERT INTO `operation_record` VALUES ('91', '1', '<==    Updates: 0', '陈音东', '2017-11-06 14:44:43');
INSERT INTO `operation_record` VALUES ('92', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 14:46:17');
INSERT INTO `operation_record` VALUES ('93', '1', '==> Parameters: 55(Integer)', '陈音东', '2017-11-06 14:46:17');
INSERT INTO `operation_record` VALUES ('94', '1', '<==    Updates: 0', '陈音东', '2017-11-06 14:46:17');
INSERT INTO `operation_record` VALUES ('95', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 14:47:14');
INSERT INTO `operation_record` VALUES ('96', '1', '==> Parameters: 55(Integer)', '陈音东', '2017-11-06 14:47:14');
INSERT INTO `operation_record` VALUES ('97', '1', '<==    Updates: 0', '陈音东', '2017-11-06 14:47:14');
INSERT INTO `operation_record` VALUES ('98', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 14:47:43');
INSERT INTO `operation_record` VALUES ('99', '1', '==> Parameters: 55(Integer)', '陈音东', '2017-11-06 14:47:43');
INSERT INTO `operation_record` VALUES ('100', '1', '<==    Updates: 0', '陈音东', '2017-11-06 14:47:43');
INSERT INTO `operation_record` VALUES ('101', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 14:48:04');
INSERT INTO `operation_record` VALUES ('102', '1', '==> Parameters: 55(Integer)', '陈音东', '2017-11-06 14:48:04');
INSERT INTO `operation_record` VALUES ('103', '1', '<==    Updates: 0', '陈音东', '2017-11-06 14:48:04');
INSERT INTO `operation_record` VALUES ('104', '1', '==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 14:59:58');
INSERT INTO `operation_record` VALUES ('105', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东测试(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 14:59:58');
INSERT INTO `operation_record` VALUES ('106', '1', '<==    Updates: 1', '陈音东', '2017-11-06 14:59:58');
INSERT INTO `operation_record` VALUES ('107', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东测试', '2017-11-06 15:26:30');
INSERT INTO `operation_record` VALUES ('108', '1', '==> Parameters: 陈音东测试(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)', '陈音东测试', '2017-11-06 15:26:30');
INSERT INTO `operation_record` VALUES ('109', '1', '<==    Updates: 1', '陈音东测试', '2017-11-06 15:26:30');
INSERT INTO `operation_record` VALUES ('110', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东测试', '2017-11-06 15:26:33');
INSERT INTO `operation_record` VALUES ('111', '1', '==> Parameters: 陈音东(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)', '陈音东测试', '2017-11-06 15:26:34');
INSERT INTO `operation_record` VALUES ('112', '1', '<==    Updates: 1', '陈音东测试', '2017-11-06 15:26:34');
INSERT INTO `operation_record` VALUES ('113', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 15:26:57');
INSERT INTO `operation_record` VALUES ('114', '1', '==> Parameters: 陈音东(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 15:26:57');
INSERT INTO `operation_record` VALUES ('115', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:26:57');
INSERT INTO `operation_record` VALUES ('116', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 15:26:59');
INSERT INTO `operation_record` VALUES ('117', '1', '==> Parameters: 陈音东(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 15:26:59');
INSERT INTO `operation_record` VALUES ('118', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:26:59');
INSERT INTO `operation_record` VALUES ('119', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 15:27:04');
INSERT INTO `operation_record` VALUES ('120', '1', '==> Parameters: 张三(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 15:27:05');
INSERT INTO `operation_record` VALUES ('121', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 15:38:18');
INSERT INTO `operation_record` VALUES ('122', '1', '==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 15:38:18');
INSERT INTO `operation_record` VALUES ('123', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 15:40:08');
INSERT INTO `operation_record` VALUES ('124', '1', '==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 1111(String)', '陈音东', '2017-11-06 15:40:08');
INSERT INTO `operation_record` VALUES ('125', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 15:41:06');
INSERT INTO `operation_record` VALUES ('126', '1', '==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 18282296013(String)', '陈音东', '2017-11-06 15:41:06');
INSERT INTO `operation_record` VALUES ('127', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 15:42:00');
INSERT INTO `operation_record` VALUES ('128', '1', '==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 18282296013(String)', '陈音东', '2017-11-06 15:42:00');
INSERT INTO `operation_record` VALUES ('129', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:42:00');
INSERT INTO `operation_record` VALUES ('130', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 15:45:52');
INSERT INTO `operation_record` VALUES ('131', '1', '==> Parameters: 1(Integer), 1(Integer), 测试js222(String), 男(String), 11(Integer), 18248859652(String)', '陈音东', '2017-11-06 15:45:52');
INSERT INTO `operation_record` VALUES ('132', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:45:52');
INSERT INTO `operation_record` VALUES ('133', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 15:46:47');
INSERT INTO `operation_record` VALUES ('134', '1', '==> Parameters: 1(Integer), 1(Integer), ces踩踩踩(String), 男(String), 11(Integer), 18282296013(String)', '陈音东', '2017-11-06 15:46:47');
INSERT INTO `operation_record` VALUES ('135', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:46:47');
INSERT INTO `operation_record` VALUES ('136', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 15:47:36');
INSERT INTO `operation_record` VALUES ('137', '1', '==> Parameters: 1(Integer), 1(Integer), asdasdsadsa(String), 男(String), 11(Integer), 111(String)', '陈音东', '2017-11-06 15:47:36');
INSERT INTO `operation_record` VALUES ('138', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:47:36');
INSERT INTO `operation_record` VALUES ('139', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 15:48:42');
INSERT INTO `operation_record` VALUES ('140', '1', '==> Parameters: 45(Integer)', '陈音东', '2017-11-06 15:48:43');
INSERT INTO `operation_record` VALUES ('141', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:48:43');
INSERT INTO `operation_record` VALUES ('142', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 15:57:12');
INSERT INTO `operation_record` VALUES ('143', '1', '==> Parameters: 44(Integer)', '陈音东', '2017-11-06 15:57:13');
INSERT INTO `operation_record` VALUES ('144', '1', '<==    Updates: 1', '陈音东', '2017-11-06 15:57:13');
INSERT INTO `operation_record` VALUES ('145', '1', '==>  Preparing: update user SET pass_Word = ? where user_Number = ? ', '陈音东', '2017-11-06 16:00:46');
INSERT INTO `operation_record` VALUES ('146', '1', '==> Parameters: 12345678(String), 1(Integer)', '陈音东', '2017-11-06 16:00:47');
INSERT INTO `operation_record` VALUES ('147', '1', '<==    Updates: 1', '陈音东', '2017-11-06 16:00:47');
INSERT INTO `operation_record` VALUES ('148', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 19:37:01');
INSERT INTO `operation_record` VALUES ('149', '1', '==> Parameters: 陈音东(String), 男(String), 27(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 19:37:01');
INSERT INTO `operation_record` VALUES ('150', '1', '<==    Updates: 1', '陈音东', '2017-11-06 19:37:01');
INSERT INTO `operation_record` VALUES ('151', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 19:40:47');
INSERT INTO `operation_record` VALUES ('152', '1', '==> Parameters: 陈音东(String), 男(String), 28(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 19:40:47');
INSERT INTO `operation_record` VALUES ('153', '1', '<==    Updates: 1', '陈音东', '2017-11-06 19:40:47');
INSERT INTO `operation_record` VALUES ('154', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 19:41:41');
INSERT INTO `operation_record` VALUES ('155', '1', '==> Parameters: 陈音东(String), 男(String), 29(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 19:41:41');
INSERT INTO `operation_record` VALUES ('156', '1', '<==    Updates: 1', '陈音东', '2017-11-06 19:41:41');
INSERT INTO `operation_record` VALUES ('157', '1', '==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 19:41:50');
INSERT INTO `operation_record` VALUES ('158', '1', '==> Parameters: 张三(String), 男(String), 29(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 19:41:50');
INSERT INTO `operation_record` VALUES ('159', '1', '==>  Preparing: delete from department where department_Num = ? ', '陈音东', '2017-11-06 20:21:18');
INSERT INTO `operation_record` VALUES ('160', '1', '==> Parameters: 9(Integer)', '陈音东', '2017-11-06 20:21:18');
INSERT INTO `operation_record` VALUES ('161', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:21:18');
INSERT INTO `operation_record` VALUES ('162', '1', '==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ', '陈音东', '2017-11-06 20:27:22');
INSERT INTO `operation_record` VALUES ('163', '1', '==> Parameters: 总部(String), 无(String), 老大的家(String), 0(Integer)', '陈音东', '2017-11-06 20:27:22');
INSERT INTO `operation_record` VALUES ('164', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:27:22');
INSERT INTO `operation_record` VALUES ('165', '1', '==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ', '陈音东', '2017-11-06 20:27:38');
INSERT INTO `operation_record` VALUES ('166', '1', '==> Parameters: 财务部(String), 无(String), 管钱的地方呗(String), 1(Integer)', '陈音东', '2017-11-06 20:27:38');
INSERT INTO `operation_record` VALUES ('167', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:27:38');
INSERT INTO `operation_record` VALUES ('168', '1', '==>  Preparing: insert into department ( department_Name, address, dep_Describe ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 20:27:52');
INSERT INTO `operation_record` VALUES ('169', '1', '==> Parameters: 测试以下添加(String), 测试以下添加(String), 测试以下添加(String)', '陈音东', '2017-11-06 20:27:52');
INSERT INTO `operation_record` VALUES ('170', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:27:52');
INSERT INTO `operation_record` VALUES ('171', '1', '==>  Preparing: update post SET post_name = ?, p_Discribe = ? where post_Num = ? ', '陈音东', '2017-11-06 20:31:14');
INSERT INTO `operation_record` VALUES ('172', '1', '==> Parameters: 部长(String), java.io.StringReader@498ac39f(StringReader), 3(Integer)', '陈音东', '2017-11-06 20:31:14');
INSERT INTO `operation_record` VALUES ('173', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:31:14');
INSERT INTO `operation_record` VALUES ('174', '1', '==>  Preparing: insert into post ( post_name, p_Discribe ) values ( ?, ? ) ', '陈音东', '2017-11-06 20:31:27');
INSERT INTO `operation_record` VALUES ('175', '1', '==> Parameters: 测试1(String), java.io.StringReader@4c7229d7(StringReader)', '陈音东', '2017-11-06 20:31:27');
INSERT INTO `operation_record` VALUES ('176', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:31:27');
INSERT INTO `operation_record` VALUES ('177', '1', '==>  Preparing: delete from post where post_Num = ? ', '陈音东', '2017-11-06 20:31:34');
INSERT INTO `operation_record` VALUES ('178', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 20:31:34');
INSERT INTO `operation_record` VALUES ('179', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:31:34');
INSERT INTO `operation_record` VALUES ('180', '1', '==>  Preparing: delete from user_grid where user_Number = ? and grid_ID = ? ', '陈音东', '2017-11-06 20:34:55');
INSERT INTO `operation_record` VALUES ('181', '1', '==> Parameters: 43(Integer), 0(Integer)', '陈音东', '2017-11-06 20:34:55');
INSERT INTO `operation_record` VALUES ('182', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:34:55');
INSERT INTO `operation_record` VALUES ('183', '1', '==>  Preparing: delete from user_grid where user_Number = ? and grid_ID = ? ', '陈音东', '2017-11-06 20:35:37');
INSERT INTO `operation_record` VALUES ('184', '1', '==> Parameters: 5(Integer), 5(Integer)', '陈音东', '2017-11-06 20:35:37');
INSERT INTO `operation_record` VALUES ('185', '1', '<==    Updates: 0', '陈音东', '2017-11-06 20:35:37');
INSERT INTO `operation_record` VALUES ('186', '1', '==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ', '陈音东', '2017-11-06 20:39:56');
INSERT INTO `operation_record` VALUES ('187', '1', '==> Parameters: 0(Integer), 2(Integer)', '陈音东', '2017-11-06 20:39:56');
INSERT INTO `operation_record` VALUES ('188', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:39:56');
INSERT INTO `operation_record` VALUES ('189', '1', '==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ', '陈音东', '2017-11-06 20:43:12');
INSERT INTO `operation_record` VALUES ('190', '1', '==> Parameters: 2(Integer), 2(Integer)', '陈音东', '2017-11-06 20:43:12');
INSERT INTO `operation_record` VALUES ('191', '1', '<==    Updates: 0', '陈音东', '2017-11-06 20:43:12');
INSERT INTO `operation_record` VALUES ('192', '1', '==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ', '陈音东', '2017-11-06 20:43:29');
INSERT INTO `operation_record` VALUES ('193', '1', '==> Parameters: 2(Integer), 2(Integer)', '陈音东', '2017-11-06 20:43:29');
INSERT INTO `operation_record` VALUES ('194', '1', '<==    Updates: 0', '陈音东', '2017-11-06 20:43:29');
INSERT INTO `operation_record` VALUES ('195', '1', '==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ', '陈音东', '2017-11-06 20:48:56');
INSERT INTO `operation_record` VALUES ('196', '1', '==> Parameters: 2(Integer), 2(Integer)', '陈音东', '2017-11-06 20:48:56');
INSERT INTO `operation_record` VALUES ('197', '1', '<==    Updates: 0', '陈音东', '2017-11-06 20:48:56');
INSERT INTO `operation_record` VALUES ('198', '1', '==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ', '陈音东', '2017-11-06 20:49:03');
INSERT INTO `operation_record` VALUES ('199', '1', '==> Parameters: 2(Integer), 3(Integer)', '陈音东', '2017-11-06 20:49:03');
INSERT INTO `operation_record` VALUES ('200', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:49:03');
INSERT INTO `operation_record` VALUES ('201', '1', '==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 20:50:48');
INSERT INTO `operation_record` VALUES ('202', '1', '==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 30(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 20:50:48');
INSERT INTO `operation_record` VALUES ('203', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:50:48');
INSERT INTO `operation_record` VALUES ('204', '1', '==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ', '陈音东', '2017-11-06 20:50:56');
INSERT INTO `operation_record` VALUES ('205', '1', '==> Parameters: 1(Integer), 22(Integer), 陈音东(String), 男(String), 30(Integer), 18282296014(String), 1(Integer)', '陈音东', '2017-11-06 20:50:56');
INSERT INTO `operation_record` VALUES ('206', '1', '==>  Preparing: delete from user where user_Number = ? ', '陈音东', '2017-11-06 20:51:43');
INSERT INTO `operation_record` VALUES ('207', '1', '==> Parameters: 43(Integer)', '陈音东', '2017-11-06 20:51:43');
INSERT INTO `operation_record` VALUES ('208', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:51:43');
INSERT INTO `operation_record` VALUES ('209', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 20:52:22');
INSERT INTO `operation_record` VALUES ('210', '1', '==> Parameters: 1(Integer), 1(Integer), 测试js222js222js222(String), 男(String), 111(Integer), 18248859652(String)', '陈音东', '2017-11-06 20:52:22');
INSERT INTO `operation_record` VALUES ('211', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:52:22');
INSERT INTO `operation_record` VALUES ('212', '1', '==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ', '陈音东', '2017-11-06 20:52:32');
INSERT INTO `operation_record` VALUES ('213', '1', '==> Parameters: 111(Integer), 111(Integer), 测试js222js222js222(String), 男(String), 111(Integer), 111(String)', '陈音东', '2017-11-06 20:52:32');
INSERT INTO `operation_record` VALUES ('214', '1', '==>  Preparing: update user SET pass_Word = ? where user_Number = ? ', '陈音东', '2017-11-06 20:53:31');
INSERT INTO `operation_record` VALUES ('215', '1', '==> Parameters: 123456(String), 1(Integer)', '陈音东', '2017-11-06 20:53:31');
INSERT INTO `operation_record` VALUES ('216', '1', '<==    Updates: 1', '陈音东', '2017-11-06 20:53:31');
INSERT INTO `operation_record` VALUES ('217', '1', '==>  Preparing: delete from role where role_ID = ? ', '陈音东', '2017-11-06 21:01:03');
INSERT INTO `operation_record` VALUES ('218', '1', '==> Parameters: 9(Integer)', '陈音东', '2017-11-06 21:01:03');
INSERT INTO `operation_record` VALUES ('219', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:01:03');
INSERT INTO `operation_record` VALUES ('220', '1', '==>  Preparing: insert into role ( role_Name, role_Describe ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:02:00');
INSERT INTO `operation_record` VALUES ('221', '1', '==> Parameters: aaaa(String), java.io.StringReader@20b9196(StringReader)', '陈音东', '2017-11-06 21:02:01');
INSERT INTO `operation_record` VALUES ('222', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:02:01');
INSERT INTO `operation_record` VALUES ('223', '1', '==>  Preparing: update role SET role_Name = ? where role_ID = ? ', '陈音东', '2017-11-06 21:03:16');
INSERT INTO `operation_record` VALUES ('224', '1', '==> Parameters: aaaaaaa(String), 10(Integer)', '陈音东', '2017-11-06 21:03:16');
INSERT INTO `operation_record` VALUES ('225', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:03:16');
INSERT INTO `operation_record` VALUES ('226', '1', '==>  Preparing: delete from role where role_ID = ? ', '陈音东', '2017-11-06 21:05:15');
INSERT INTO `operation_record` VALUES ('227', '1', '==> Parameters: 10(Integer)', '陈音东', '2017-11-06 21:05:16');
INSERT INTO `operation_record` VALUES ('228', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:05:16');
INSERT INTO `operation_record` VALUES ('229', '1', '==>  Preparing: delete from role_power where role_ID = ? ', '陈音东', '2017-11-06 21:06:43');
INSERT INTO `operation_record` VALUES ('230', '1', '==> Parameters: 0(Integer)', '陈音东', '2017-11-06 21:06:43');
INSERT INTO `operation_record` VALUES ('231', '1', '<==    Updates: 7', '陈音东', '2017-11-06 21:06:43');
INSERT INTO `operation_record` VALUES ('232', '1', '==>  Preparing: insert ignore into role_power (role_ID, power_ID) values (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) ', '陈音东', '2017-11-06 21:06:43');
INSERT INTO `operation_record` VALUES ('233', '1', '==> Parameters: 0(Integer), 0(Integer), 0(Integer), 1(Integer), 0(Integer), 3(Integer), 0(Integer), 4(Integer), 0(Integer), 5(Integer), 0(Integer), 9(Integer), 0(Integer), 10(Integer), 0(Integer), 12(Integer)', '陈音东', '2017-11-06 21:06:43');
INSERT INTO `operation_record` VALUES ('234', '1', '<==    Updates: 8', '陈音东', '2017-11-06 21:06:43');
INSERT INTO `operation_record` VALUES ('235', '1', '==>  Preparing: insert ignore into user_role (user_Number, role_ID) values (?, ?) , (?, ?) , (?, ?) , (?, ?) ', '陈音东', '2017-11-06 21:11:14');
INSERT INTO `operation_record` VALUES ('236', '1', '==> Parameters: 3(Integer), 0(Integer), 4(Integer), 0(Integer), 5(Integer), 0(Integer), 7(Integer), 0(Integer)', '陈音东', '2017-11-06 21:11:14');
INSERT INTO `operation_record` VALUES ('237', '1', '<==    Updates: 2', '陈音东', '2017-11-06 21:11:14');
INSERT INTO `operation_record` VALUES ('238', '1', '==>  Preparing: insert ignore into user_role (user_Number, role_ID) values (?, ?) , (?, ?) , (?, ?) , (?, ?) ', '陈音东', '2017-11-06 21:11:34');
INSERT INTO `operation_record` VALUES ('239', '1', '==> Parameters: 2(Integer), 0(Integer), 3(Integer), 0(Integer), 4(Integer), 0(Integer), 5(Integer), 0(Integer)', '陈音东', '2017-11-06 21:11:34');
INSERT INTO `operation_record` VALUES ('240', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:11:34');
INSERT INTO `operation_record` VALUES ('241', '1', '==>  Preparing: insert ignore into user_role (user_Number, role_ID) values (?, ?) ', '陈音东', '2017-11-06 21:12:36');
INSERT INTO `operation_record` VALUES ('242', '1', '==> Parameters: 5(Integer), 1(Integer)', '陈音东', '2017-11-06 21:12:36');
INSERT INTO `operation_record` VALUES ('243', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:12:36');
INSERT INTO `operation_record` VALUES ('244', '1', '==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:15:32');
INSERT INTO `operation_record` VALUES ('245', '1', '==> Parameters: 1(Integer), 啊实打实的撒打算(String)', '陈音东', '2017-11-06 21:15:32');
INSERT INTO `operation_record` VALUES ('246', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:15:32');
INSERT INTO `operation_record` VALUES ('247', '1', '==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ', '陈音东', '2017-11-06 21:15:58');
INSERT INTO `operation_record` VALUES ('248', '1', '==> Parameters: 啊实打实的撒打算啊实打实的(String), 13(Integer)', '陈音东', '2017-11-06 21:15:58');
INSERT INTO `operation_record` VALUES ('249', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:15:58');
INSERT INTO `operation_record` VALUES ('250', '1', '==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ', '陈音东', '2017-11-06 21:16:43');
INSERT INTO `operation_record` VALUES ('251', '1', '==> Parameters: 啊实打实的撒打算啊实打实的啊啊(String), 13(Integer)', '陈音东', '2017-11-06 21:16:43');
INSERT INTO `operation_record` VALUES ('252', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:16:43');
INSERT INTO `operation_record` VALUES ('253', '1', '==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ', '陈音东', '2017-11-06 21:17:13');
INSERT INTO `operation_record` VALUES ('254', '1', '==> Parameters: 啊实打实的撒打算啊实打实的啊啊阿斯顿撒(String), 13(Integer)', '陈音东', '2017-11-06 21:17:13');
INSERT INTO `operation_record` VALUES ('255', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:17:14');
INSERT INTO `operation_record` VALUES ('256', '1', '==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ', '陈音东', '2017-11-06 21:17:22');
INSERT INTO `operation_record` VALUES ('257', '1', '==> Parameters: 啊实打实的撒打算啊实打实的啊啊阿斯顿(String), 13(Integer)', '陈音东', '2017-11-06 21:17:22');
INSERT INTO `operation_record` VALUES ('258', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:17:23');
INSERT INTO `operation_record` VALUES ('259', '1', '==>  Preparing: delete from parts_second where part_L_ID = ? ', '陈音东', '2017-11-06 21:19:15');
INSERT INTO `operation_record` VALUES ('260', '1', '==> Parameters: 13(Integer)', '陈音东', '2017-11-06 21:19:15');
INSERT INTO `operation_record` VALUES ('261', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:19:15');
INSERT INTO `operation_record` VALUES ('262', '1', '==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:22:29');
INSERT INTO `operation_record` VALUES ('263', '1', '==> Parameters: 1(Integer), adasdasdas(String)', '陈音东', '2017-11-06 21:22:29');
INSERT INTO `operation_record` VALUES ('264', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:22:29');
INSERT INTO `operation_record` VALUES ('265', '1', '==>  Preparing: update event_second SET event_L_Name = ? where event_L_ID = ? ', '陈音东', '2017-11-06 21:22:41');
INSERT INTO `operation_record` VALUES ('266', '1', '==> Parameters: adasdasdas啊实打实的(String), 12(Integer)', '陈音东', '2017-11-06 21:22:41');
INSERT INTO `operation_record` VALUES ('267', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:22:41');
INSERT INTO `operation_record` VALUES ('268', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:22:45');
INSERT INTO `operation_record` VALUES ('269', '1', '==> Parameters: 12(Integer)', '陈音东', '2017-11-06 21:22:45');
INSERT INTO `operation_record` VALUES ('270', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:22:45');
INSERT INTO `operation_record` VALUES ('271', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:22:46');
INSERT INTO `operation_record` VALUES ('272', '1', '==> Parameters: 12(Integer)', '陈音东', '2017-11-06 21:22:46');
INSERT INTO `operation_record` VALUES ('273', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:22:46');
INSERT INTO `operation_record` VALUES ('274', '1', '==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:23:55');
INSERT INTO `operation_record` VALUES ('275', '1', '==> Parameters: 1(Integer), 大苏打实打实(String)', '陈音东', '2017-11-06 21:23:55');
INSERT INTO `operation_record` VALUES ('276', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:23:56');
INSERT INTO `operation_record` VALUES ('277', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:24:01');
INSERT INTO `operation_record` VALUES ('278', '1', '==> Parameters: 13(Integer)', '陈音东', '2017-11-06 21:24:01');
INSERT INTO `operation_record` VALUES ('279', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:24:01');
INSERT INTO `operation_record` VALUES ('280', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:24:01');
INSERT INTO `operation_record` VALUES ('281', '1', '==> Parameters: 13(Integer)', '陈音东', '2017-11-06 21:24:01');
INSERT INTO `operation_record` VALUES ('282', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:24:01');
INSERT INTO `operation_record` VALUES ('283', '1', '==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:24:38');
INSERT INTO `operation_record` VALUES ('284', '1', '==> Parameters: 1(Integer), 撒大声地撒大声地(String)', '陈音东', '2017-11-06 21:24:38');
INSERT INTO `operation_record` VALUES ('285', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:24:38');
INSERT INTO `operation_record` VALUES ('286', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:24:59');
INSERT INTO `operation_record` VALUES ('287', '1', '==> Parameters: 14(Integer)', '陈音东', '2017-11-06 21:24:59');
INSERT INTO `operation_record` VALUES ('288', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:24:59');
INSERT INTO `operation_record` VALUES ('289', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:24:59');
INSERT INTO `operation_record` VALUES ('290', '1', '==> Parameters: 14(Integer)', '陈音东', '2017-11-06 21:24:59');
INSERT INTO `operation_record` VALUES ('291', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:24:59');
INSERT INTO `operation_record` VALUES ('292', '1', '==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:25:38');
INSERT INTO `operation_record` VALUES ('293', '1', '==> Parameters: 1(Integer), 啊实打实大苏打(String)', '陈音东', '2017-11-06 21:25:38');
INSERT INTO `operation_record` VALUES ('294', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:25:38');
INSERT INTO `operation_record` VALUES ('295', '1', '==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:26:28');
INSERT INTO `operation_record` VALUES ('296', '1', '==> Parameters: 1(Integer), 啊萨达萨达是的(String)', '陈音东', '2017-11-06 21:26:28');
INSERT INTO `operation_record` VALUES ('297', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:26:28');
INSERT INTO `operation_record` VALUES ('298', '1', '==>  Preparing: update event_second SET event_L_Name = ? where event_L_ID = ? ', '陈音东', '2017-11-06 21:26:37');
INSERT INTO `operation_record` VALUES ('299', '1', '==> Parameters: 啊萨达萨达是的啊实打实(String), 16(Integer)', '陈音东', '2017-11-06 21:26:37');
INSERT INTO `operation_record` VALUES ('300', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:26:38');
INSERT INTO `operation_record` VALUES ('301', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:27:11');
INSERT INTO `operation_record` VALUES ('302', '1', '==> Parameters: 16(Integer)', '陈音东', '2017-11-06 21:27:11');
INSERT INTO `operation_record` VALUES ('303', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:27:11');
INSERT INTO `operation_record` VALUES ('304', '1', '==>  Preparing: delete from event_second where event_L_ID = ? ', '陈音东', '2017-11-06 21:27:11');
INSERT INTO `operation_record` VALUES ('305', '1', '==> Parameters: 16(Integer)', '陈音东', '2017-11-06 21:27:11');
INSERT INTO `operation_record` VALUES ('306', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:27:11');
INSERT INTO `operation_record` VALUES ('307', '1', '==>  Preparing: update cases SET event_L_ID = ?, part_L_ID = ?, grid_ID = ?, time_Limit = ?, case_Describe = ? where case_ID = ? ', '陈音东', '2017-11-06 21:32:14');
INSERT INTO `operation_record` VALUES ('308', '1', '==> Parameters: 2(Integer), 1(Integer), 0(Integer), 40(Integer), 这是一个栗子(String), 1(Integer)', '陈音东', '2017-11-06 21:32:14');
INSERT INTO `operation_record` VALUES ('309', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:32:14');
INSERT INTO `operation_record` VALUES ('310', '1', '==>  Preparing: insert into rest_time ( start_Time, end_Time ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:35:21');
INSERT INTO `operation_record` VALUES ('311', '1', '==> Parameters: 2017-11-09(Date), 2017-11-18(Date)', '陈音东', '2017-11-06 21:35:21');
INSERT INTO `operation_record` VALUES ('312', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:35:21');
INSERT INTO `operation_record` VALUES ('313', '1', '==>  Preparing: update rest_time SET start_Time = ?, end_Time = ? where Rest_Num = ? ', '陈音东', '2017-11-06 21:35:36');
INSERT INTO `operation_record` VALUES ('314', '1', '==> Parameters: 2017-11-09(Date), 2017-11-30(Date), 6(Integer)', '陈音东', '2017-11-06 21:35:36');
INSERT INTO `operation_record` VALUES ('315', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:35:36');
INSERT INTO `operation_record` VALUES ('316', '1', '==>  Preparing: delete from rest_time where Rest_Num = ? ', '陈音东', '2017-11-06 21:35:54');
INSERT INTO `operation_record` VALUES ('317', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:35:54');
INSERT INTO `operation_record` VALUES ('318', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:35:54');
INSERT INTO `operation_record` VALUES ('319', '1', '==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 21:38:20');
INSERT INTO `operation_record` VALUES ('320', '1', '==> Parameters: sadasdsad(String), 2017-11-18(Date), java.io.StringReader@734eb9b4(StringReader)', '陈音东', '2017-11-06 21:38:20');
INSERT INTO `operation_record` VALUES ('321', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:38:20');
INSERT INTO `operation_record` VALUES ('322', '1', '==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ', '陈音东', '2017-11-06 21:38:31');
INSERT INTO `operation_record` VALUES ('323', '1', '==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@78fb9a3a(StringReader), 6(Integer)', '陈音东', '2017-11-06 21:38:31');
INSERT INTO `operation_record` VALUES ('324', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:38:31');
INSERT INTO `operation_record` VALUES ('325', '1', '==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ', '陈音东', '2017-11-06 21:41:02');
INSERT INTO `operation_record` VALUES ('326', '1', '==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@e03852b(StringReader), 6(Integer)', '陈音东', '2017-11-06 21:41:02');
INSERT INTO `operation_record` VALUES ('327', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:41:02');
INSERT INTO `operation_record` VALUES ('328', '1', '==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ', '陈音东', '2017-11-06 21:41:24');
INSERT INTO `operation_record` VALUES ('329', '1', '==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@3c5f22da(StringReader), 6(Integer)', '陈音东', '2017-11-06 21:41:24');
INSERT INTO `operation_record` VALUES ('330', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:41:24');
INSERT INTO `operation_record` VALUES ('331', '1', '==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ', '陈音东', '2017-11-06 21:41:48');
INSERT INTO `operation_record` VALUES ('332', '1', '==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@59477eb2(StringReader), 6(Integer)', '陈音东', '2017-11-06 21:41:48');
INSERT INTO `operation_record` VALUES ('333', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:41:48');
INSERT INTO `operation_record` VALUES ('334', '1', '==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ', '陈音东', '2017-11-06 21:41:53');
INSERT INTO `operation_record` VALUES ('335', '1', '==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@7bbb0649(StringReader), 6(Integer)', '陈音东', '2017-11-06 21:41:53');
INSERT INTO `operation_record` VALUES ('336', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:41:53');
INSERT INTO `operation_record` VALUES ('337', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('338', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('339', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('340', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('341', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('342', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('343', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('344', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('345', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:13');
INSERT INTO `operation_record` VALUES ('346', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('347', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('348', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('349', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('350', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('351', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('352', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('353', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('354', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('355', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('356', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('357', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('358', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('359', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('360', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('361', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('362', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('363', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:14');
INSERT INTO `operation_record` VALUES ('364', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('365', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('366', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('367', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('368', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('369', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('370', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('371', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('372', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('373', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('374', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('375', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('376', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('377', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('378', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:15');
INSERT INTO `operation_record` VALUES ('379', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('380', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('381', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('382', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('383', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('384', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('385', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('386', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('387', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('388', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('389', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('390', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('391', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('392', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('393', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('394', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('395', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('396', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('397', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('398', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:16');
INSERT INTO `operation_record` VALUES ('399', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('400', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('401', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('402', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('403', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('404', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('405', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('406', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('407', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('408', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('409', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('410', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('411', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('412', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:17');
INSERT INTO `operation_record` VALUES ('413', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('414', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('415', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('416', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('417', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('418', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('419', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('420', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('421', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('422', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('423', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:18');
INSERT INTO `operation_record` VALUES ('424', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('425', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('426', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('427', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('428', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('429', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('430', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('431', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('432', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('433', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('434', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('435', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('436', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:19');
INSERT INTO `operation_record` VALUES ('437', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('438', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('439', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('440', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('441', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('442', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('443', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('444', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('445', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('446', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('447', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('448', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('449', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('450', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('451', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('452', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:20');
INSERT INTO `operation_record` VALUES ('453', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('454', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('455', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('456', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('457', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('458', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('459', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('460', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('461', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('462', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:21');
INSERT INTO `operation_record` VALUES ('463', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:26');
INSERT INTO `operation_record` VALUES ('464', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:26');
INSERT INTO `operation_record` VALUES ('465', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:26');
INSERT INTO `operation_record` VALUES ('466', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('467', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('468', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('469', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('470', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('471', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('472', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('473', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('474', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('475', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('476', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('477', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('478', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('479', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('480', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:27');
INSERT INTO `operation_record` VALUES ('481', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('482', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('483', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('484', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('485', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('486', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('487', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('488', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('489', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('490', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('491', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('492', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('493', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('494', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('495', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('496', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('497', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('498', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('499', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('500', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:28');
INSERT INTO `operation_record` VALUES ('501', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('502', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('503', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('504', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('505', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('506', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('507', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('508', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('509', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('510', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('511', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('512', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('513', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('514', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('515', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('516', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('517', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('518', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('519', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:29');
INSERT INTO `operation_record` VALUES ('520', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:30');
INSERT INTO `operation_record` VALUES ('521', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:30');
INSERT INTO `operation_record` VALUES ('522', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:30');
INSERT INTO `operation_record` VALUES ('523', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:30');
INSERT INTO `operation_record` VALUES ('524', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:42:30');
INSERT INTO `operation_record` VALUES ('525', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:30');
INSERT INTO `operation_record` VALUES ('526', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:41');
INSERT INTO `operation_record` VALUES ('527', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:41');
INSERT INTO `operation_record` VALUES ('528', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:42:41');
INSERT INTO `operation_record` VALUES ('529', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:41');
INSERT INTO `operation_record` VALUES ('530', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:41');
INSERT INTO `operation_record` VALUES ('531', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:41');
INSERT INTO `operation_record` VALUES ('532', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('533', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('534', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('535', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('536', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('537', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('538', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('539', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('540', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('541', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('542', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('543', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('544', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('545', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('546', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:42');
INSERT INTO `operation_record` VALUES ('547', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('548', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('549', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('550', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('551', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('552', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('553', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('554', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('555', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('556', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('557', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('558', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('559', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('560', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:43');
INSERT INTO `operation_record` VALUES ('561', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('562', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('563', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('564', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('565', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('566', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('567', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('568', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('569', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('570', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('571', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('572', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('573', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('574', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('575', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('576', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('577', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:44');
INSERT INTO `operation_record` VALUES ('578', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:45');
INSERT INTO `operation_record` VALUES ('579', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:45');
INSERT INTO `operation_record` VALUES ('580', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:42:45');
INSERT INTO `operation_record` VALUES ('581', '1', '==> Parameters: 5(Integer)', '陈音东', '2017-11-06 21:42:45');
INSERT INTO `operation_record` VALUES ('582', '1', '<==    Updates: 0', '陈音东', '2017-11-06 21:42:45');
INSERT INTO `operation_record` VALUES ('583', '1', '==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 21:44:10');
INSERT INTO `operation_record` VALUES ('584', '1', '==> Parameters: 学院办公室(String), 2017-11-09(Date), java.io.StringReader@7c1056e5(StringReader)', '陈音东', '2017-11-06 21:44:10');
INSERT INTO `operation_record` VALUES ('585', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:44:10');
INSERT INTO `operation_record` VALUES ('586', '1', '==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ', '陈音东', '2017-11-06 21:44:25');
INSERT INTO `operation_record` VALUES ('587', '1', '==> Parameters: 学院办公室(String), 2017-11-09(Date), java.io.StringReader@38d9e14f(StringReader), 7(Integer)', '陈音东', '2017-11-06 21:44:25');
INSERT INTO `operation_record` VALUES ('588', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:44:25');
INSERT INTO `operation_record` VALUES ('589', '1', '==>  Preparing: delete from notice where notice_ID = ? ', '陈音东', '2017-11-06 21:44:29');
INSERT INTO `operation_record` VALUES ('590', '1', '==> Parameters: 7(Integer)', '陈音东', '2017-11-06 21:44:29');
INSERT INTO `operation_record` VALUES ('591', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:44:29');
INSERT INTO `operation_record` VALUES ('592', '1', '==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:46:27');
INSERT INTO `operation_record` VALUES ('593', '1', '==> Parameters: 1(Integer), (String)', '陈音东', '2017-11-06 21:46:28');
INSERT INTO `operation_record` VALUES ('594', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:46:28');
INSERT INTO `operation_record` VALUES ('595', '1', '==>  Preparing: delete from parts_second where part_L_ID = ? ', '陈音东', '2017-11-06 21:46:38');
INSERT INTO `operation_record` VALUES ('596', '1', '==> Parameters: 14(Integer)', '陈音东', '2017-11-06 21:46:38');
INSERT INTO `operation_record` VALUES ('597', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:46:38');
INSERT INTO `operation_record` VALUES ('598', '1', '==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:46:42');
INSERT INTO `operation_record` VALUES ('599', '1', '==> Parameters: 1(Integer), (String)', '陈音东', '2017-11-06 21:46:42');
INSERT INTO `operation_record` VALUES ('600', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:46:42');
INSERT INTO `operation_record` VALUES ('601', '1', '==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:46:45');
INSERT INTO `operation_record` VALUES ('602', '1', '==> Parameters: 1(Integer), (String)', '陈音东', '2017-11-06 21:46:45');
INSERT INTO `operation_record` VALUES ('603', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:46:45');
INSERT INTO `operation_record` VALUES ('604', '1', '==>  Preparing: delete from parts_second where part_L_ID = ? ', '陈音东', '2017-11-06 21:46:50');
INSERT INTO `operation_record` VALUES ('605', '1', '==> Parameters: 15(Integer)', '陈音东', '2017-11-06 21:46:50');
INSERT INTO `operation_record` VALUES ('606', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:46:50');
INSERT INTO `operation_record` VALUES ('607', '1', '==>  Preparing: insert into post ', '陈音东', '2017-11-06 21:50:12');
INSERT INTO `operation_record` VALUES ('608', '1', '==> Parameters: ', '陈音东', '2017-11-06 21:50:12');
INSERT INTO `operation_record` VALUES ('609', '1', '==>  Preparing: insert into post ', '陈音东', '2017-11-06 21:52:31');
INSERT INTO `operation_record` VALUES ('610', '1', '==> Parameters: ', '陈音东', '2017-11-06 21:52:31');
INSERT INTO `operation_record` VALUES ('611', '1', '==>  Preparing: insert into post ( post_name ) values ( ? ) ', '陈音东', '2017-11-06 21:52:37');
INSERT INTO `operation_record` VALUES ('612', '1', '==> Parameters: a(String)', '陈音东', '2017-11-06 21:52:37');
INSERT INTO `operation_record` VALUES ('613', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:52:37');
INSERT INTO `operation_record` VALUES ('614', '1', '==>  Preparing: delete from post where post_Num = ? ', '陈音东', '2017-11-06 21:52:41');
INSERT INTO `operation_record` VALUES ('615', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 21:52:41');
INSERT INTO `operation_record` VALUES ('616', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:52:41');
INSERT INTO `operation_record` VALUES ('617', '1', '==>  Preparing: insert into post ( post_name ) values ( ? ) ', '陈音东', '2017-11-06 21:52:47');
INSERT INTO `operation_record` VALUES ('618', '1', '==> Parameters: a(String)', '陈音东', '2017-11-06 21:52:48');
INSERT INTO `operation_record` VALUES ('619', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:52:48');
INSERT INTO `operation_record` VALUES ('620', '1', '==>  Preparing: update post where post_Num = ? ', '陈音东', '2017-11-06 21:52:53');
INSERT INTO `operation_record` VALUES ('621', '1', '==> Parameters: 7(Integer)', '陈音东', '2017-11-06 21:52:53');
INSERT INTO `operation_record` VALUES ('622', '1', '==>  Preparing: insert into department ', '陈音东', '2017-11-06 21:52:59');
INSERT INTO `operation_record` VALUES ('623', '1', '==> Parameters: ', '陈音东', '2017-11-06 21:52:59');
INSERT INTO `operation_record` VALUES ('624', '1', '==>  Preparing: insert into department ', '陈音东', '2017-11-06 21:54:33');
INSERT INTO `operation_record` VALUES ('625', '1', '==> Parameters: ', '陈音东', '2017-11-06 21:54:33');
INSERT INTO `operation_record` VALUES ('626', '1', '==>  Preparing: insert into department ( department_Name ) values ( ? ) ', '陈音东', '2017-11-06 21:54:41');
INSERT INTO `operation_record` VALUES ('627', '1', '==> Parameters: a(String)', '陈音东', '2017-11-06 21:54:41');
INSERT INTO `operation_record` VALUES ('628', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:54:41');
INSERT INTO `operation_record` VALUES ('629', '1', '==>  Preparing: update department where department_Num = ? ', '陈音东', '2017-11-06 21:54:48');
INSERT INTO `operation_record` VALUES ('630', '1', '==> Parameters: 12(Integer)', '陈音东', '2017-11-06 21:54:48');
INSERT INTO `operation_record` VALUES ('631', '1', '==>  Preparing: insert into user ( gender, phone_Num ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:55:17');
INSERT INTO `operation_record` VALUES ('632', '1', '==> Parameters: 男(String), (String)', '陈音东', '2017-11-06 21:55:17');
INSERT INTO `operation_record` VALUES ('633', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:55:17');
INSERT INTO `operation_record` VALUES ('634', '1', '==>  Preparing: insert into role ( role_Name, role_Describe ) values ( ?, ? ) ', '陈音东', '2017-11-06 21:55:51');
INSERT INTO `operation_record` VALUES ('635', '1', '==> Parameters: (String), java.io.StringReader@68dbde7b(StringReader)', '陈音东', '2017-11-06 21:55:51');
INSERT INTO `operation_record` VALUES ('636', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:55:51');
INSERT INTO `operation_record` VALUES ('637', '1', '==>  Preparing: insert into role values ( ?, ? ) ', '陈音东', '2017-11-06 21:56:27');
INSERT INTO `operation_record` VALUES ('638', '1', '==> Parameters: (String), java.io.StringReader@402f1515(StringReader)', '陈音东', '2017-11-06 21:56:27');
INSERT INTO `operation_record` VALUES ('639', '1', '==>  Preparing: update role SET role_Name = ? where role_ID = ? ', '陈音东', '2017-11-06 21:56:33');
INSERT INTO `operation_record` VALUES ('640', '1', '==> Parameters: (String), 11(Integer)', '陈音东', '2017-11-06 21:56:33');
INSERT INTO `operation_record` VALUES ('641', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:56:33');
INSERT INTO `operation_record` VALUES ('642', '1', '==>  Preparing: update post where post_Num = ? ', '陈音东', '2017-11-06 21:56:53');
INSERT INTO `operation_record` VALUES ('643', '1', '==> Parameters: 7(Integer)', '陈音东', '2017-11-06 21:56:53');
INSERT INTO `operation_record` VALUES ('644', '1', '==>  Preparing: insert into post ', '陈音东', '2017-11-06 21:59:02');
INSERT INTO `operation_record` VALUES ('645', '1', '==> Parameters: ', '陈音东', '2017-11-06 21:59:02');
INSERT INTO `operation_record` VALUES ('646', '1', '==>  Preparing: update role SET role_Name = ? where role_ID = ? ', '陈音东', '2017-11-06 21:59:10');
INSERT INTO `operation_record` VALUES ('647', '1', '==> Parameters: (String), 11(Integer)', '陈音东', '2017-11-06 21:59:10');
INSERT INTO `operation_record` VALUES ('648', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:59:10');
INSERT INTO `operation_record` VALUES ('649', '1', '==>  Preparing: delete from role where role_ID = ? ', '陈音东', '2017-11-06 21:59:16');
INSERT INTO `operation_record` VALUES ('650', '1', '==> Parameters: 11(Integer)', '陈音东', '2017-11-06 21:59:16');
INSERT INTO `operation_record` VALUES ('651', '1', '<==    Updates: 1', '陈音东', '2017-11-06 21:59:16');
INSERT INTO `operation_record` VALUES ('652', '1', '==>  Preparing: insert into role ', '陈音东', '2017-11-06 21:59:21');
INSERT INTO `operation_record` VALUES ('653', '1', '==> Parameters: ', '陈音东', '2017-11-06 21:59:21');
INSERT INTO `operation_record` VALUES ('654', '1', '==>  Preparing: insert into role ', '陈音东', '2017-11-06 22:01:10');
INSERT INTO `operation_record` VALUES ('655', '1', '==> Parameters: ', '陈音东', '2017-11-06 22:01:10');
INSERT INTO `operation_record` VALUES ('656', '1', '==>  Preparing: insert ignore into parts_second ( part_B_ID ) values ( ?, ? ) ', '陈音东', '2017-11-06 22:01:22');
INSERT INTO `operation_record` VALUES ('657', '1', '==> Parameters: 1(Integer), (String)', '陈音东', '2017-11-06 22:01:22');
INSERT INTO `operation_record` VALUES ('658', '1', '==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ', '陈音东', '2017-11-06 22:01:35');
INSERT INTO `operation_record` VALUES ('659', '1', '==> Parameters: (String), 16(Integer)', '陈音东', '2017-11-06 22:01:35');
INSERT INTO `operation_record` VALUES ('660', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:01:35');
INSERT INTO `operation_record` VALUES ('661', '1', '==>  Preparing: delete from parts_second where part_L_ID = ? ', '陈音东', '2017-11-06 22:01:37');
INSERT INTO `operation_record` VALUES ('662', '1', '==> Parameters: 16(Integer)', '陈音东', '2017-11-06 22:01:38');
INSERT INTO `operation_record` VALUES ('663', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:01:38');
INSERT INTO `operation_record` VALUES ('664', '1', '==>  Preparing: insert into event_second ( Event_B_ID ) values ( ?, ? ) ', '陈音东', '2017-11-06 22:01:44');
INSERT INTO `operation_record` VALUES ('665', '1', '==> Parameters: 1(Integer), (String)', '陈音东', '2017-11-06 22:01:44');
INSERT INTO `operation_record` VALUES ('666', '1', '==>  Preparing: insert into rest_time ( start_Time, end_Time ) values ( ?, ? ) ', '陈音东', '2017-11-06 22:06:55');
INSERT INTO `operation_record` VALUES ('667', '1', '==> Parameters: 2017-11-11(Date), 2017-11-30(Date)', '陈音东', '2017-11-06 22:06:55');
INSERT INTO `operation_record` VALUES ('668', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:06:55');
INSERT INTO `operation_record` VALUES ('669', '1', '==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:13:38');
INSERT INTO `operation_record` VALUES ('670', '1', '==> Parameters: sdfsdf(String), 2017-11-03(Date), java.io.StringReader@47c7b1dd(StringReader)', '陈音东', '2017-11-06 22:13:38');
INSERT INTO `operation_record` VALUES ('671', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:13:38');
INSERT INTO `operation_record` VALUES ('672', '1', '==>  Preparing: update question_details SET ques_L_Name = ?, answer = ? where ques_L_ID = ? ', '陈音东', '2017-11-06 22:19:41');
INSERT INTO `operation_record` VALUES ('673', '1', '==> Parameters: 问题1管理员是谁(String), java.io.StringReader@429ce0e9(StringReader), 1(Integer)', '陈音东', '2017-11-06 22:19:42');
INSERT INTO `operation_record` VALUES ('674', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:19:42');
INSERT INTO `operation_record` VALUES ('675', '1', '==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:20:01');
INSERT INTO `operation_record` VALUES ('676', '1', '==> Parameters: 1(Integer), (String), java.io.StringReader@4f1081c5(StringReader)', '陈音东', '2017-11-06 22:20:01');
INSERT INTO `operation_record` VALUES ('677', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:20:02');
INSERT INTO `operation_record` VALUES ('678', '1', '==>  Preparing: delete from question_details where ques_L_ID = ? ', '陈音东', '2017-11-06 22:21:26');
INSERT INTO `operation_record` VALUES ('679', '1', '==> Parameters: 6(Integer)', '陈音东', '2017-11-06 22:21:26');
INSERT INTO `operation_record` VALUES ('680', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:21:26');
INSERT INTO `operation_record` VALUES ('681', '1', '==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:29:29');
INSERT INTO `operation_record` VALUES ('682', '1', '==> Parameters: 1(Integer), asdsadsadasdsadsadasdsadsad(String), java.io.StringReader@2279a423(StringReader)', '陈音东', '2017-11-06 22:29:29');
INSERT INTO `operation_record` VALUES ('683', '1', '==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:30:50');
INSERT INTO `operation_record` VALUES ('684', '1', '==> Parameters: 1(Integer), asdsadsadasdsadsadasdsadsad(String), java.io.StringReader@126884e2(StringReader)', '陈音东', '2017-11-06 22:30:50');
INSERT INTO `operation_record` VALUES ('685', '1', '==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:32:11');
INSERT INTO `operation_record` VALUES ('686', '1', '==> Parameters: dgdfgfdgdfg(String), 2017-11-21(Date), java.io.StringReader@2e133915(StringReader)', '陈音东', '2017-11-06 22:32:12');
INSERT INTO `operation_record` VALUES ('687', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:32:12');
INSERT INTO `operation_record` VALUES ('688', '1', '==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:35:56');
INSERT INTO `operation_record` VALUES ('689', '1', '==> Parameters: 1(Integer), asdasdasdasd(String), java.io.StringReader@28ba1a2f(StringReader)', '陈音东', '2017-11-06 22:35:56');
INSERT INTO `operation_record` VALUES ('690', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:35:56');
INSERT INTO `operation_record` VALUES ('691', '1', '==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:37:10');
INSERT INTO `operation_record` VALUES ('692', '1', '==> Parameters: 1(Integer), sadasdasd(String), java.io.StringReader@79554e6c(StringReader)', '陈音东', '2017-11-06 22:37:10');
INSERT INTO `operation_record` VALUES ('693', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:37:10');
INSERT INTO `operation_record` VALUES ('694', '1', '==>  Preparing: insert into question_details ( ques_B_ID ) values ( ? ) ', '陈音东', '2017-11-06 22:37:14');
INSERT INTO `operation_record` VALUES ('695', '1', '==> Parameters: 1(Integer)', '陈音东', '2017-11-06 22:37:14');
INSERT INTO `operation_record` VALUES ('696', '1', '==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ', '陈音东', '2017-11-06 22:37:20');
INSERT INTO `operation_record` VALUES ('697', '1', '==> Parameters: 1(Integer), asdasdasdasdasdasd(String), java.io.StringReader@5e68003f(StringReader)', '陈音东', '2017-11-06 22:37:20');
INSERT INTO `operation_record` VALUES ('698', '1', '<==    Updates: 1', '陈音东', '2017-11-06 22:37:20');

-- ----------------------------
-- Table structure for parts_first
-- ----------------------------
DROP TABLE IF EXISTS `parts_first`;
CREATE TABLE `parts_first` (
  `part_B_ID` int(11) NOT NULL,
  `part_B_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`part_B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_first
-- ----------------------------
INSERT INTO `parts_first` VALUES ('1', '公共设施');
INSERT INTO `parts_first` VALUES ('2', '道路交通');
INSERT INTO `parts_first` VALUES ('3', '市容环境');
INSERT INTO `parts_first` VALUES ('4', '园林绿化');
INSERT INTO `parts_first` VALUES ('5', '房屋土地');
INSERT INTO `parts_first` VALUES ('6', '其他设施');

-- ----------------------------
-- Table structure for parts_second
-- ----------------------------
DROP TABLE IF EXISTS `parts_second`;
CREATE TABLE `parts_second` (
  `part_L_ID` int(11) NOT NULL AUTO_INCREMENT,
  `part_B_ID` int(11) DEFAULT NULL,
  `part_L_Name` varchar(20) NOT NULL,
  `part_Manage_Unit` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`part_L_ID`),
  KEY `FK_Relationship_9` (`part_B_ID`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`part_B_ID`) REFERENCES `parts_first` (`part_B_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_second
-- ----------------------------
INSERT INTO `parts_second` VALUES ('1', '1', '路灯', null);
INSERT INTO `parts_second` VALUES ('2', '1', '邮筒', null);
INSERT INTO `parts_second` VALUES ('3', '2', '停车场', null);
INSERT INTO `parts_second` VALUES ('4', '2', '公交车亭', null);
INSERT INTO `parts_second` VALUES ('5', '3', '公共厕所', null);
INSERT INTO `parts_second` VALUES ('6', '3', '垃圾箱', null);
INSERT INTO `parts_second` VALUES ('7', '4', '绿地', null);
INSERT INTO `parts_second` VALUES ('8', '4', '雕塑', null);
INSERT INTO `parts_second` VALUES ('9', '5', '宣传栏', null);
INSERT INTO `parts_second` VALUES ('10', '5', '人防工事', null);
INSERT INTO `parts_second` VALUES ('11', '6', '工地', null);
INSERT INTO `parts_second` VALUES ('12', '1', '马桶', null);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_Num` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(20) NOT NULL,
  `p_Discribe` text,
  PRIMARY KEY (`post_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('0', '总经理', '老大的位置');
INSERT INTO `post` VALUES ('1', '经理', '老大没在我第一');
INSERT INTO `post` VALUES ('2', '会计', '小小部长能耐大');
INSERT INTO `post` VALUES ('3', '部长', '什么都能做把');
INSERT INTO `post` VALUES ('4', '董事长', '终极boss');
INSERT INTO `post` VALUES ('7', 'a', null);

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `power_ID` int(11) NOT NULL,
  `power_Name` varchar(20) NOT NULL,
  `power_Describe` text,
  PRIMARY KEY (`power_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('0', '默认权限', '默认权限');
INSERT INTO `power` VALUES ('1', '部门管理', '部门管理');
INSERT INTO `power` VALUES ('2', '岗位管理', '岗位管理');
INSERT INTO `power` VALUES ('3', '区块管理', '区块管理');
INSERT INTO `power` VALUES ('4', '用户信息管理', '用户信息管理');
INSERT INTO `power` VALUES ('5', '角色权限管理', '角色权限管理');
INSERT INTO `power` VALUES ('6', '部件管理', '部件管理');
INSERT INTO `power` VALUES ('7', '事件管理', '事件管理');
INSERT INTO `power` VALUES ('8', '案件限时管理', '案件限时管理');
INSERT INTO `power` VALUES ('9', '休息时间管理', '休息时间管理');
INSERT INTO `power` VALUES ('10', '公文发布管理', '公文发布管理');
INSERT INTO `power` VALUES ('11', '知识库管理', '知识库管理');
INSERT INTO `power` VALUES ('12', '数据库管理', '数据库管理');
INSERT INTO `power` VALUES ('13', '操作记录管理', '操作记录管理');

-- ----------------------------
-- Table structure for question_details
-- ----------------------------
DROP TABLE IF EXISTS `question_details`;
CREATE TABLE `question_details` (
  `ques_L_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ques_B_ID` int(11) DEFAULT NULL,
  `ques_L_Name` varchar(20) NOT NULL,
  `answer` text,
  PRIMARY KEY (`ques_L_ID`),
  KEY `FK_Relationship_7` (`ques_B_ID`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`ques_B_ID`) REFERENCES `question_first` (`ques_B_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_details
-- ----------------------------
INSERT INTO `question_details` VALUES ('1', '1', '问题1管理员是谁', '不知道');
INSERT INTO `question_details` VALUES ('2', '2', '问题二', '不知道');
INSERT INTO `question_details` VALUES ('3', '3', '问题三', '不知道');
INSERT INTO `question_details` VALUES ('4', '4', '问题四', '不知道');
INSERT INTO `question_details` VALUES ('5', '3', '高考分数', '45000');
INSERT INTO `question_details` VALUES ('7', '1', 'asdasdasdasd', 'asdasdasdasd');
INSERT INTO `question_details` VALUES ('8', '1', 'sadasdasd', 'asdasdasdasd');
INSERT INTO `question_details` VALUES ('9', '1', 'asdasdasdasdasdasd', 'asdasdasdasdasdasd');

-- ----------------------------
-- Table structure for question_first
-- ----------------------------
DROP TABLE IF EXISTS `question_first`;
CREATE TABLE `question_first` (
  `ques_B_ID` int(11) NOT NULL,
  `ques_B_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ques_B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_first
-- ----------------------------
INSERT INTO `question_first` VALUES ('1', '登陆问题');
INSERT INTO `question_first` VALUES ('2', '修改问题');
INSERT INTO `question_first` VALUES ('3', '设备问题');
INSERT INTO `question_first` VALUES ('4', '举报问题');

-- ----------------------------
-- Table structure for rest_time
-- ----------------------------
DROP TABLE IF EXISTS `rest_time`;
CREATE TABLE `rest_time` (
  `Rest_Num` int(11) NOT NULL AUTO_INCREMENT,
  `start_Time` date NOT NULL,
  `end_Time` date NOT NULL,
  PRIMARY KEY (`Rest_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rest_time
-- ----------------------------
INSERT INTO `rest_time` VALUES ('2', '2017-10-21', '2017-10-29');
INSERT INTO `rest_time` VALUES ('3', '2017-12-08', '2017-12-30');
INSERT INTO `rest_time` VALUES ('4', '2017-12-15', '2017-12-30');
INSERT INTO `rest_time` VALUES ('5', '2017-11-02', '2017-11-16');
INSERT INTO `rest_time` VALUES ('7', '2017-11-11', '2017-11-30');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `role_Name` varchar(20) NOT NULL,
  `role_Describe` text,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0', '默认角色', '默认');
INSERT INTO `role` VALUES ('1', '系统管理员', '系统管理员');
INSERT INTO `role` VALUES ('2', '信息采集员', '信息采集员');
INSERT INTO `role` VALUES ('3', '受理员', '受理员');
INSERT INTO `role` VALUES ('4', '派遣员', '派遣员');
INSERT INTO `role` VALUES ('5', '值班长', '值班长');
INSERT INTO `role` VALUES ('6', '指挥长', '指挥长');
INSERT INTO `role` VALUES ('8', 'asdasd阿斯顿搜索', '啊实打实的');

-- ----------------------------
-- Table structure for role_power
-- ----------------------------
DROP TABLE IF EXISTS `role_power`;
CREATE TABLE `role_power` (
  `role_ID` int(11) NOT NULL,
  `power_ID` int(11) NOT NULL DEFAULT '0',
  KEY `FK_Relationship_15` (`role_ID`) USING BTREE,
  KEY `FK_Relationship_4` (`power_ID`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`power_ID`) REFERENCES `power` (`power_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_power
-- ----------------------------
INSERT INTO `role_power` VALUES ('2', '5');
INSERT INTO `role_power` VALUES ('3', '5');
INSERT INTO `role_power` VALUES ('5', '5');
INSERT INTO `role_power` VALUES ('6', '5');
INSERT INTO `role_power` VALUES ('4', '5');
INSERT INTO `role_power` VALUES ('4', '8');
INSERT INTO `role_power` VALUES ('1', '1');
INSERT INTO `role_power` VALUES ('1', '2');
INSERT INTO `role_power` VALUES ('1', '3');
INSERT INTO `role_power` VALUES ('1', '4');
INSERT INTO `role_power` VALUES ('1', '5');
INSERT INTO `role_power` VALUES ('1', '6');
INSERT INTO `role_power` VALUES ('1', '7');
INSERT INTO `role_power` VALUES ('1', '8');
INSERT INTO `role_power` VALUES ('1', '9');
INSERT INTO `role_power` VALUES ('1', '10');
INSERT INTO `role_power` VALUES ('1', '11');
INSERT INTO `role_power` VALUES ('1', '12');
INSERT INTO `role_power` VALUES ('1', '13');
INSERT INTO `role_power` VALUES ('0', '0');
INSERT INTO `role_power` VALUES ('0', '1');
INSERT INTO `role_power` VALUES ('0', '3');
INSERT INTO `role_power` VALUES ('0', '4');
INSERT INTO `role_power` VALUES ('0', '5');
INSERT INTO `role_power` VALUES ('0', '9');
INSERT INTO `role_power` VALUES ('0', '10');
INSERT INTO `role_power` VALUES ('0', '12');

-- ----------------------------
-- Table structure for street
-- ----------------------------
DROP TABLE IF EXISTS `street`;
CREATE TABLE `street` (
  `street_ID` int(11) NOT NULL,
  `street_Name` varchar(20) NOT NULL,
  `s_Information` text,
  PRIMARY KEY (`street_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of street
-- ----------------------------
INSERT INTO `street` VALUES ('0', '未分配', null);
INSERT INTO `street` VALUES ('1', '建设路', '');
INSERT INTO `street` VALUES ('2', '红星街', null);
INSERT INTO `street` VALUES ('3', '三大框', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_Number` int(11) NOT NULL AUTO_INCREMENT,
  `department_Num` int(11) NOT NULL DEFAULT '0',
  `post_Num` int(11) NOT NULL DEFAULT '0',
  `pass_Word` varchar(20) NOT NULL DEFAULT '123456',
  `user_Name` varchar(20) NOT NULL DEFAULT '',
  `gender` char(2) NOT NULL DEFAULT '男',
  `age` int(11) NOT NULL DEFAULT '18',
  `phone_Num` varchar(20) DEFAULT NULL,
  `user_status` varchar(20) NOT NULL DEFAULT '离线',
  PRIMARY KEY (`user_Number`),
  UNIQUE KEY `user_Name` (`user_Name`),
  KEY `FK_Relationship_1` (`department_Num`),
  KEY `FK_Relationship_2` (`post_Num`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`department_Num`) REFERENCES `department` (`department_Num`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`post_Num`) REFERENCES `post` (`post_Num`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '0', '123456', '陈音东', '男', '30', '18282296014', '在线');
INSERT INTO `user` VALUES ('2', '1', '0', '123456', '张三', '男', '18', '18282248546', '在线');
INSERT INTO `user` VALUES ('3', '0', '0', '123123', '无名氏asdasd', '男', '18', null, '离线');
INSERT INTO `user` VALUES ('4', '1', '0', '456123', '张三是', '男', '18', null, '离线');
INSERT INTO `user` VALUES ('5', '1', '0', '456123', '张三是啊', '男', '18', null, '离线');
INSERT INTO `user` VALUES ('7', '1', '0', '456123', '张三是啊啊', '男', '18', null, '离线');
INSERT INTO `user` VALUES ('24', '1', '1', '123456', '陈颖啊啊啊啊', '男', '11', '18248859652', '离线');
INSERT INTO `user` VALUES ('42', '1', '1', '123456', '测试js', '男', '11', '18282296013', '离线');
INSERT INTO `user` VALUES ('46', '1', '1', '123456', '测试js222js222js222', '男', '111', '18248859652', '离线');
INSERT INTO `user` VALUES ('48', '0', '0', '123456', '', '男', '18', '', '离线');

-- ----------------------------
-- Table structure for user_grid
-- ----------------------------
DROP TABLE IF EXISTS `user_grid`;
CREATE TABLE `user_grid` (
  `grid_ID` int(11) NOT NULL DEFAULT '0',
  `user_Number` int(11) NOT NULL,
  PRIMARY KEY (`grid_ID`,`user_Number`),
  KEY `FK_Relationship_14` (`grid_ID`) USING BTREE,
  KEY `FK_Relationship_16` (`user_Number`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`grid_ID`) REFERENCES `grid` (`grid_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`user_Number`) REFERENCES `user` (`user_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_grid
-- ----------------------------
INSERT INTO `user_grid` VALUES ('0', '1');
INSERT INTO `user_grid` VALUES ('0', '2');
INSERT INTO `user_grid` VALUES ('0', '5');
INSERT INTO `user_grid` VALUES ('0', '7');
INSERT INTO `user_grid` VALUES ('0', '24');
INSERT INTO `user_grid` VALUES ('0', '42');
INSERT INTO `user_grid` VALUES ('0', '46');
INSERT INTO `user_grid` VALUES ('0', '48');
INSERT INTO `user_grid` VALUES ('1', '1');
INSERT INTO `user_grid` VALUES ('1', '5');
INSERT INTO `user_grid` VALUES ('2', '2');
INSERT INTO `user_grid` VALUES ('2', '3');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_Number` int(11) NOT NULL,
  `role_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_Number`,`role_ID`),
  KEY `FK_Relationship_3` (`user_Number`) USING BTREE,
  KEY `FK_Relationship_10` (`role_ID`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`user_Number`) REFERENCES `user` (`user_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '0');
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '0');
INSERT INTO `user_role` VALUES ('3', '0');
INSERT INTO `user_role` VALUES ('4', '0');
INSERT INTO `user_role` VALUES ('5', '0');
INSERT INTO `user_role` VALUES ('5', '1');
INSERT INTO `user_role` VALUES ('7', '0');
INSERT INTO `user_role` VALUES ('24', '0');
INSERT INTO `user_role` VALUES ('42', '0');
INSERT INTO `user_role` VALUES ('46', '0');
INSERT INTO `user_role` VALUES ('48', '0');
DROP TRIGGER IF EXISTS `roleTopower`;
DELIMITER ;;
CREATE TRIGGER `roleTopower` AFTER INSERT ON `role` FOR EACH ROW begin

declare s int;

set s = (select role_ID from role where role_ID = new.role_ID );

  insert into role_power(role_ID)  values(s);

end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `userTogrid`;
DELIMITER ;;
CREATE TRIGGER `userTogrid` AFTER INSERT ON `user` FOR EACH ROW begin

declare s int;

set s = (select user_Number from user where user_Number = new.user_Number );

  insert into user_grid(user_Number)  values(s);

end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `userToRole`;
DELIMITER ;;
CREATE TRIGGER `userToRole` AFTER INSERT ON `user` FOR EACH ROW begin

declare s int;

set s = (select user_Number from user where user_Number = new.user_Number );

  insert into user_role(user_Number)  values(s);

end
;;
DELIMITER ;
