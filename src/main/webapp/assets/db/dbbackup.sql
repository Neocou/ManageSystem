-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: managesystem
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,2,1,0,'待进行',40,'这是一个栗子');
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `community_ID` int(11) NOT NULL AUTO_INCREMENT,
  `street_ID` int(11) DEFAULT NULL,
  `comm_Name` varchar(20) NOT NULL,
  `comm_Information` text,
  PRIMARY KEY (`community_ID`),
  KEY `FK_Relationship_5` (`street_ID`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`street_ID`) REFERENCES `street` (`street_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (0,0,'未分配',NULL),(1,1,'小敏社区',NULL),(2,1,'小红社区',NULL),(3,2,'晓东社区',NULL),(4,3,'敏敏社区',NULL),(5,1,'啊啊社区',NULL),(6,2,'mou社区',NULL),(7,3,'222社区',NULL);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_Num` int(11) NOT NULL AUTO_INCREMENT,
  `department_Name` varchar(20) NOT NULL,
  `address` varchar(1000) NOT NULL DEFAULT '无',
  `dep_Describe` varchar(1000) NOT NULL DEFAULT '无',
  PRIMARY KEY (`department_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (0,'总部','无','老大的家'),(1,'财务部','无','管钱的地方呗'),(2,'测试部','无','无'),(3,'俄式部','无','测试'),(8,'啊实打实打算','阿斯顿阿三','啊实打实的'),(10,'测试日志','测试日志','测试日志'),(11,'测试以下添加','测试以下添加','测试以下添加'),(12,'a','无','无');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_first`
--

DROP TABLE IF EXISTS `event_first`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_first` (
  `Event_B_ID` int(11) NOT NULL,
  `Event_B_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Event_B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_first`
--

LOCK TABLES `event_first` WRITE;
/*!40000 ALTER TABLE `event_first` DISABLE KEYS */;
INSERT INTO `event_first` VALUES (1,'市容环境'),(2,'宣传广告'),(3,'施工管理'),(4,'突发事件'),(5,'街面秩序'),(6,'其他事件');
/*!40000 ALTER TABLE `event_first` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_second`
--

DROP TABLE IF EXISTS `event_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_second` (
  `event_L_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Event_B_ID` int(11) DEFAULT NULL,
  `event_L_Name` varchar(20) NOT NULL,
  `e_Managemet_Unit` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`event_L_ID`),
  KEY `FK_Relationship_8` (`Event_B_ID`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`Event_B_ID`) REFERENCES `event_first` (`Event_B_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_second`
--

LOCK TABLES `event_second` WRITE;
/*!40000 ALTER TABLE `event_second` DISABLE KEYS */;
INSERT INTO `event_second` VALUES (1,1,'私搭乱建',NULL),(2,1,'暴露垃圾',NULL),(3,2,'非法小广告',NULL),(4,2,'占道广告牌',NULL),(5,3,'施工扰民',NULL),(6,3,'施工占道',NULL),(7,4,'路面坍陷',NULL),(8,4,'道路积水',NULL),(9,5,'无照经营',NULL),(10,5,'商业噪音',NULL),(11,6,'其他时间',NULL);
/*!40000 ALTER TABLE `event_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grid`
--

DROP TABLE IF EXISTS `grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grid` (
  `grid_ID` int(11) NOT NULL,
  `community_ID` int(11) DEFAULT NULL,
  `grid_Information` text,
  PRIMARY KEY (`grid_ID`),
  KEY `FK_Relationship_6` (`community_ID`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`community_ID`) REFERENCES `community` (`community_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grid`
--

LOCK TABLES `grid` WRITE;
/*!40000 ALTER TABLE `grid` DISABLE KEYS */;
INSERT INTO `grid` VALUES (0,0,'未分配'),(1,1,'网格1'),(2,2,'网格2'),(3,3,'网格3'),(4,4,'网格4'),(5,5,'网格5'),(6,1,'网格6'),(7,2,'网格7'),(8,3,'网格8'),(9,6,'99'),(10,7,'100');
/*!40000 ALTER TABLE `grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `notice_ID` int(11) NOT NULL AUTO_INCREMENT,
  `notice_organization` varchar(20) NOT NULL,
  `notice_content` text,
  `notice_time` date DEFAULT NULL,
  PRIMARY KEY (`notice_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'学院办公室','信软学院2017年国庆节、中秋节放假安排\r\n各位老师：\r\n2017年学校国庆节、中秋节放假安排如下：\r\n   10月1日至8日放假调休，共8天。9月30日（星期六）按星期一（10月2日所在教学周）课表上课。 其中，10月1日-3日（国庆节）、10月4日（中秋节）为法定节假日。\r\n学院机关国庆节、中秋节期间值班安排见附件。 \r\n安全工作：\r\n1、各实验室、团队、科室放假前要开展一次以防火、防盗为重点的安全检查，及时消除各类安全隐患，切实落实各项安全防范措施，对贵重物品要实行统一管理。\r\n2、请各部门放假期间要做好防火、防盗和安全保卫等各项工作。\r\n3、学生科加强对学生的安全教育，做好学生出行的管理工作。\r\n4、各位老师、同学在假期出行期间提高警惕，注意自己及家人的人身、财产安全。家中有小孩的老师，切实履行监护责任。','2017-10-20'),(2,'学生啊啊','阿森纳的阿三','2017-10-14'),(3,'asdsad','萨达萨达是','2017-11-25'),(4,'官方','官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方官方','2017-11-18'),(8,'sdfsdf','sadsadsadasdasd','2017-11-03'),(9,'dgdfgfdgdfg','dfgdfg','2017-11-21');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_record`
--

DROP TABLE IF EXISTS `operation_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_record`
--

LOCK TABLES `operation_record` WRITE;
/*!40000 ALTER TABLE `operation_record` DISABLE KEYS */;
INSERT INTO `operation_record` VALUES (27,1,'==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ','陈音东','2017-11-04 18:22:09'),(28,1,'==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录(String), 9(Integer)','陈音东','2017-11-04 18:22:09'),(29,1,'<==    Updates: 1','陈音东','2017-11-04 18:22:09'),(30,1,'==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ','陈音东','2017-11-04 18:24:31'),(31,1,'==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录2(String), 9(Integer)','陈音东','2017-11-04 18:24:31'),(32,1,'<==    Updates: 1','陈音东','2017-11-04 18:24:32'),(33,1,'==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ','陈音东','2017-11-04 18:25:11'),(34,1,'==> Parameters: 俄式部(String), 无(String), 测试(String), 3(Integer)','陈音东','2017-11-04 18:25:11'),(35,1,'<==    Updates: 1','陈音东','2017-11-04 18:25:12'),(36,1,'==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ','陈音东','2017-11-04 18:26:55'),(37,1,'==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录23(String), 9(Integer)','陈音东','2017-11-04 18:26:55'),(38,1,'<==    Updates: 1','陈音东','2017-11-04 18:26:55'),(39,1,'==>  Preparing: insert into department ( department_Name, address, dep_Describe ) values ( ?, ?, ? ) ','陈音东','2017-11-04 18:27:50'),(40,1,'==> Parameters: 测试日志(String), 测试日志(String), 测试日志(String)','陈音东','2017-11-04 18:27:50'),(41,1,'<==    Updates: 1','陈音东','2017-11-04 18:27:50'),(42,2,'==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ','张三','2017-11-04 19:14:00'),(43,2,'==> Parameters: 啊是的撒大苏打实打实(String), 萨达萨达是(String), 测试修改记录234(String), 9(Integer)','张三','2017-11-04 19:14:00'),(44,2,'<==    Updates: 1','张三','2017-11-04 19:14:01'),(45,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-05 12:55:08'),(46,1,'==> Parameters: 1(Integer), 1(Integer), 测试以下(String), 男(String), 12(Integer), 18282296013(String)','陈音东','2017-11-05 12:55:08'),(47,1,'<==    Updates: 1','陈音东','2017-11-05 12:55:08'),(48,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-05 20:00:21'),(49,1,'==> Parameters: 1(Integer), 1(Integer), 陈颖啊啊啊啊(String), 男(String), 11(Integer), 18248859652(String)','陈音东','2017-11-05 20:00:21'),(50,1,'<==    Updates: 1','陈音东','2017-11-05 20:00:21'),(51,1,'==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 12:47:26'),(52,1,'==> Parameters: 1(Integer), 0(Integer), 张三(String), 男(String), 18(Integer), 18282248546(String), 2(Integer)','陈音东','2017-11-06 12:47:26'),(53,1,'<==    Updates: 1','陈音东','2017-11-06 12:47:27'),(54,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:19:38'),(55,1,'==> Parameters: 1(Integer), 1(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:19:38'),(56,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:20:32'),(57,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:20:32'),(58,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:21:00'),(59,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:21:00'),(60,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:21:55'),(61,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:21:55'),(62,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:22:40'),(63,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:22:40'),(64,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:22:48'),(65,1,'==> Parameters: 15(Integer), 0(Integer), 陈音东aaaa(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:22:48'),(66,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:24:12'),(67,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:24:12'),(68,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:25:46'),(69,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:25:46'),(70,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:27:27'),(71,1,'==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:27:27'),(72,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:28:11'),(73,1,'==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:28:11'),(74,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:28:13'),(75,1,'==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:28:13'),(76,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:28:23'),(77,1,'==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:28:23'),(78,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:28:43'),(79,1,'==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:28:43'),(80,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 14:28:57'),(81,1,'==> Parameters: 12(Integer), 0(Integer), 陈音东(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 14:28:57'),(82,1,'==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 14:32:07'),(83,1,'==> Parameters: 15(Integer), 0(Integer), 陈音东(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 14:32:07'),(84,1,'==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 14:35:04'),(85,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 14:35:04'),(86,1,'<==    Updates: 1','陈音东','2017-11-06 14:35:04'),(87,1,'==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 14:35:11'),(88,1,'==> Parameters: 15(Integer), 0(Integer), 陈音东(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 14:35:11'),(89,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 14:44:43'),(90,1,'==> Parameters: 55(Integer)','陈音东','2017-11-06 14:44:43'),(91,1,'<==    Updates: 0','陈音东','2017-11-06 14:44:43'),(92,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 14:46:17'),(93,1,'==> Parameters: 55(Integer)','陈音东','2017-11-06 14:46:17'),(94,1,'<==    Updates: 0','陈音东','2017-11-06 14:46:17'),(95,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 14:47:14'),(96,1,'==> Parameters: 55(Integer)','陈音东','2017-11-06 14:47:14'),(97,1,'<==    Updates: 0','陈音东','2017-11-06 14:47:14'),(98,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 14:47:43'),(99,1,'==> Parameters: 55(Integer)','陈音东','2017-11-06 14:47:43'),(100,1,'<==    Updates: 0','陈音东','2017-11-06 14:47:43'),(101,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 14:48:04'),(102,1,'==> Parameters: 55(Integer)','陈音东','2017-11-06 14:48:04'),(103,1,'<==    Updates: 0','陈音东','2017-11-06 14:48:04'),(104,1,'==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 14:59:58'),(105,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东测试(String), 男(String), 25(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 14:59:58'),(106,1,'<==    Updates: 1','陈音东','2017-11-06 14:59:58'),(107,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东测试','2017-11-06 15:26:30'),(108,1,'==> Parameters: 陈音东测试(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)','陈音东测试','2017-11-06 15:26:30'),(109,1,'<==    Updates: 1','陈音东测试','2017-11-06 15:26:30'),(110,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东测试','2017-11-06 15:26:33'),(111,1,'==> Parameters: 陈音东(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)','陈音东测试','2017-11-06 15:26:34'),(112,1,'<==    Updates: 1','陈音东测试','2017-11-06 15:26:34'),(113,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 15:26:57'),(114,1,'==> Parameters: 陈音东(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 15:26:57'),(115,1,'<==    Updates: 1','陈音东','2017-11-06 15:26:57'),(116,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 15:26:59'),(117,1,'==> Parameters: 陈音东(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 15:26:59'),(118,1,'<==    Updates: 1','陈音东','2017-11-06 15:26:59'),(119,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 15:27:04'),(120,1,'==> Parameters: 张三(String), 男(String), 26(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 15:27:05'),(121,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 15:38:18'),(122,1,'==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 15:38:18'),(123,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 15:40:08'),(124,1,'==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 1111(String)','陈音东','2017-11-06 15:40:08'),(125,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 15:41:06'),(126,1,'==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 18282296013(String)','陈音东','2017-11-06 15:41:06'),(127,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 15:42:00'),(128,1,'==> Parameters: 1(Integer), 1(Integer), 测试js(String), 男(String), 11(Integer), 18282296013(String)','陈音东','2017-11-06 15:42:00'),(129,1,'<==    Updates: 1','陈音东','2017-11-06 15:42:00'),(130,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 15:45:52'),(131,1,'==> Parameters: 1(Integer), 1(Integer), 测试js222(String), 男(String), 11(Integer), 18248859652(String)','陈音东','2017-11-06 15:45:52'),(132,1,'<==    Updates: 1','陈音东','2017-11-06 15:45:52'),(133,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 15:46:47'),(134,1,'==> Parameters: 1(Integer), 1(Integer), ces踩踩踩(String), 男(String), 11(Integer), 18282296013(String)','陈音东','2017-11-06 15:46:47'),(135,1,'<==    Updates: 1','陈音东','2017-11-06 15:46:47'),(136,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 15:47:36'),(137,1,'==> Parameters: 1(Integer), 1(Integer), asdasdsadsa(String), 男(String), 11(Integer), 111(String)','陈音东','2017-11-06 15:47:36'),(138,1,'<==    Updates: 1','陈音东','2017-11-06 15:47:36'),(139,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 15:48:42'),(140,1,'==> Parameters: 45(Integer)','陈音东','2017-11-06 15:48:43'),(141,1,'<==    Updates: 1','陈音东','2017-11-06 15:48:43'),(142,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 15:57:12'),(143,1,'==> Parameters: 44(Integer)','陈音东','2017-11-06 15:57:13'),(144,1,'<==    Updates: 1','陈音东','2017-11-06 15:57:13'),(145,1,'==>  Preparing: update user SET pass_Word = ? where user_Number = ? ','陈音东','2017-11-06 16:00:46'),(146,1,'==> Parameters: 12345678(String), 1(Integer)','陈音东','2017-11-06 16:00:47'),(147,1,'<==    Updates: 1','陈音东','2017-11-06 16:00:47'),(148,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 19:37:01'),(149,1,'==> Parameters: 陈音东(String), 男(String), 27(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 19:37:01'),(150,1,'<==    Updates: 1','陈音东','2017-11-06 19:37:01'),(151,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 19:40:47'),(152,1,'==> Parameters: 陈音东(String), 男(String), 28(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 19:40:47'),(153,1,'<==    Updates: 1','陈音东','2017-11-06 19:40:47'),(154,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 19:41:41'),(155,1,'==> Parameters: 陈音东(String), 男(String), 29(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 19:41:41'),(156,1,'<==    Updates: 1','陈音东','2017-11-06 19:41:41'),(157,1,'==>  Preparing: update user SET user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 19:41:50'),(158,1,'==> Parameters: 张三(String), 男(String), 29(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 19:41:50'),(159,1,'==>  Preparing: delete from department where department_Num = ? ','陈音东','2017-11-06 20:21:18'),(160,1,'==> Parameters: 9(Integer)','陈音东','2017-11-06 20:21:18'),(161,1,'<==    Updates: 1','陈音东','2017-11-06 20:21:18'),(162,1,'==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ','陈音东','2017-11-06 20:27:22'),(163,1,'==> Parameters: 总部(String), 无(String), 老大的家(String), 0(Integer)','陈音东','2017-11-06 20:27:22'),(164,1,'<==    Updates: 1','陈音东','2017-11-06 20:27:22'),(165,1,'==>  Preparing: update department SET department_Name = ?, address = ?, dep_Describe = ? where department_Num = ? ','陈音东','2017-11-06 20:27:38'),(166,1,'==> Parameters: 财务部(String), 无(String), 管钱的地方呗(String), 1(Integer)','陈音东','2017-11-06 20:27:38'),(167,1,'<==    Updates: 1','陈音东','2017-11-06 20:27:38'),(168,1,'==>  Preparing: insert into department ( department_Name, address, dep_Describe ) values ( ?, ?, ? ) ','陈音东','2017-11-06 20:27:52'),(169,1,'==> Parameters: 测试以下添加(String), 测试以下添加(String), 测试以下添加(String)','陈音东','2017-11-06 20:27:52'),(170,1,'<==    Updates: 1','陈音东','2017-11-06 20:27:52'),(171,1,'==>  Preparing: update post SET post_name = ?, p_Discribe = ? where post_Num = ? ','陈音东','2017-11-06 20:31:14'),(172,1,'==> Parameters: 部长(String), java.io.StringReader@498ac39f(StringReader), 3(Integer)','陈音东','2017-11-06 20:31:14'),(173,1,'<==    Updates: 1','陈音东','2017-11-06 20:31:14'),(174,1,'==>  Preparing: insert into post ( post_name, p_Discribe ) values ( ?, ? ) ','陈音东','2017-11-06 20:31:27'),(175,1,'==> Parameters: 测试1(String), java.io.StringReader@4c7229d7(StringReader)','陈音东','2017-11-06 20:31:27'),(176,1,'<==    Updates: 1','陈音东','2017-11-06 20:31:27'),(177,1,'==>  Preparing: delete from post where post_Num = ? ','陈音东','2017-11-06 20:31:34'),(178,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 20:31:34'),(179,1,'<==    Updates: 1','陈音东','2017-11-06 20:31:34'),(180,1,'==>  Preparing: delete from user_grid where user_Number = ? and grid_ID = ? ','陈音东','2017-11-06 20:34:55'),(181,1,'==> Parameters: 43(Integer), 0(Integer)','陈音东','2017-11-06 20:34:55'),(182,1,'<==    Updates: 1','陈音东','2017-11-06 20:34:55'),(183,1,'==>  Preparing: delete from user_grid where user_Number = ? and grid_ID = ? ','陈音东','2017-11-06 20:35:37'),(184,1,'==> Parameters: 5(Integer), 5(Integer)','陈音东','2017-11-06 20:35:37'),(185,1,'<==    Updates: 0','陈音东','2017-11-06 20:35:37'),(186,1,'==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ','陈音东','2017-11-06 20:39:56'),(187,1,'==> Parameters: 0(Integer), 2(Integer)','陈音东','2017-11-06 20:39:56'),(188,1,'<==    Updates: 1','陈音东','2017-11-06 20:39:56'),(189,1,'==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ','陈音东','2017-11-06 20:43:12'),(190,1,'==> Parameters: 2(Integer), 2(Integer)','陈音东','2017-11-06 20:43:12'),(191,1,'<==    Updates: 0','陈音东','2017-11-06 20:43:12'),(192,1,'==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ','陈音东','2017-11-06 20:43:29'),(193,1,'==> Parameters: 2(Integer), 2(Integer)','陈音东','2017-11-06 20:43:29'),(194,1,'<==    Updates: 0','陈音东','2017-11-06 20:43:29'),(195,1,'==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ','陈音东','2017-11-06 20:48:56'),(196,1,'==> Parameters: 2(Integer), 2(Integer)','陈音东','2017-11-06 20:48:56'),(197,1,'<==    Updates: 0','陈音东','2017-11-06 20:48:56'),(198,1,'==>  Preparing: insert ignore into user_grid (grid_ID, user_Number) values (?, ?) ','陈音东','2017-11-06 20:49:03'),(199,1,'==> Parameters: 2(Integer), 3(Integer)','陈音东','2017-11-06 20:49:03'),(200,1,'<==    Updates: 1','陈音东','2017-11-06 20:49:03'),(201,1,'==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 20:50:48'),(202,1,'==> Parameters: 1(Integer), 0(Integer), 陈音东(String), 男(String), 30(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 20:50:48'),(203,1,'<==    Updates: 1','陈音东','2017-11-06 20:50:48'),(204,1,'==>  Preparing: update user SET department_Num = ?, post_Num = ?, user_Name = ?, gender = ?, age = ?, phone_Num = ? where user_Number = ? ','陈音东','2017-11-06 20:50:56'),(205,1,'==> Parameters: 1(Integer), 22(Integer), 陈音东(String), 男(String), 30(Integer), 18282296014(String), 1(Integer)','陈音东','2017-11-06 20:50:56'),(206,1,'==>  Preparing: delete from user where user_Number = ? ','陈音东','2017-11-06 20:51:43'),(207,1,'==> Parameters: 43(Integer)','陈音东','2017-11-06 20:51:43'),(208,1,'<==    Updates: 1','陈音东','2017-11-06 20:51:43'),(209,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 20:52:22'),(210,1,'==> Parameters: 1(Integer), 1(Integer), 测试js222js222js222(String), 男(String), 111(Integer), 18248859652(String)','陈音东','2017-11-06 20:52:22'),(211,1,'<==    Updates: 1','陈音东','2017-11-06 20:52:22'),(212,1,'==>  Preparing: insert into user ( department_Num, post_Num, user_Name, gender, age, phone_Num ) values ( ?, ?, ?, ?, ?, ? ) ','陈音东','2017-11-06 20:52:32'),(213,1,'==> Parameters: 111(Integer), 111(Integer), 测试js222js222js222(String), 男(String), 111(Integer), 111(String)','陈音东','2017-11-06 20:52:32'),(214,1,'==>  Preparing: update user SET pass_Word = ? where user_Number = ? ','陈音东','2017-11-06 20:53:31'),(215,1,'==> Parameters: 123456(String), 1(Integer)','陈音东','2017-11-06 20:53:31'),(216,1,'<==    Updates: 1','陈音东','2017-11-06 20:53:31'),(217,1,'==>  Preparing: delete from role where role_ID = ? ','陈音东','2017-11-06 21:01:03'),(218,1,'==> Parameters: 9(Integer)','陈音东','2017-11-06 21:01:03'),(219,1,'<==    Updates: 1','陈音东','2017-11-06 21:01:03'),(220,1,'==>  Preparing: insert into role ( role_Name, role_Describe ) values ( ?, ? ) ','陈音东','2017-11-06 21:02:00'),(221,1,'==> Parameters: aaaa(String), java.io.StringReader@20b9196(StringReader)','陈音东','2017-11-06 21:02:01'),(222,1,'<==    Updates: 1','陈音东','2017-11-06 21:02:01'),(223,1,'==>  Preparing: update role SET role_Name = ? where role_ID = ? ','陈音东','2017-11-06 21:03:16'),(224,1,'==> Parameters: aaaaaaa(String), 10(Integer)','陈音东','2017-11-06 21:03:16'),(225,1,'<==    Updates: 1','陈音东','2017-11-06 21:03:16'),(226,1,'==>  Preparing: delete from role where role_ID = ? ','陈音东','2017-11-06 21:05:15'),(227,1,'==> Parameters: 10(Integer)','陈音东','2017-11-06 21:05:16'),(228,1,'<==    Updates: 1','陈音东','2017-11-06 21:05:16'),(229,1,'==>  Preparing: delete from role_power where role_ID = ? ','陈音东','2017-11-06 21:06:43'),(230,1,'==> Parameters: 0(Integer)','陈音东','2017-11-06 21:06:43'),(231,1,'<==    Updates: 7','陈音东','2017-11-06 21:06:43'),(232,1,'==>  Preparing: insert ignore into role_power (role_ID, power_ID) values (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) , (?, ?) ','陈音东','2017-11-06 21:06:43'),(233,1,'==> Parameters: 0(Integer), 0(Integer), 0(Integer), 1(Integer), 0(Integer), 3(Integer), 0(Integer), 4(Integer), 0(Integer), 5(Integer), 0(Integer), 9(Integer), 0(Integer), 10(Integer), 0(Integer), 12(Integer)','陈音东','2017-11-06 21:06:43'),(234,1,'<==    Updates: 8','陈音东','2017-11-06 21:06:43'),(235,1,'==>  Preparing: insert ignore into user_role (user_Number, role_ID) values (?, ?) , (?, ?) , (?, ?) , (?, ?) ','陈音东','2017-11-06 21:11:14'),(236,1,'==> Parameters: 3(Integer), 0(Integer), 4(Integer), 0(Integer), 5(Integer), 0(Integer), 7(Integer), 0(Integer)','陈音东','2017-11-06 21:11:14'),(237,1,'<==    Updates: 2','陈音东','2017-11-06 21:11:14'),(238,1,'==>  Preparing: insert ignore into user_role (user_Number, role_ID) values (?, ?) , (?, ?) , (?, ?) , (?, ?) ','陈音东','2017-11-06 21:11:34'),(239,1,'==> Parameters: 2(Integer), 0(Integer), 3(Integer), 0(Integer), 4(Integer), 0(Integer), 5(Integer), 0(Integer)','陈音东','2017-11-06 21:11:34'),(240,1,'<==    Updates: 0','陈音东','2017-11-06 21:11:34'),(241,1,'==>  Preparing: insert ignore into user_role (user_Number, role_ID) values (?, ?) ','陈音东','2017-11-06 21:12:36'),(242,1,'==> Parameters: 5(Integer), 1(Integer)','陈音东','2017-11-06 21:12:36'),(243,1,'<==    Updates: 1','陈音东','2017-11-06 21:12:36'),(244,1,'==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:15:32'),(245,1,'==> Parameters: 1(Integer), 啊实打实的撒打算(String)','陈音东','2017-11-06 21:15:32'),(246,1,'<==    Updates: 1','陈音东','2017-11-06 21:15:32'),(247,1,'==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ','陈音东','2017-11-06 21:15:58'),(248,1,'==> Parameters: 啊实打实的撒打算啊实打实的(String), 13(Integer)','陈音东','2017-11-06 21:15:58'),(249,1,'<==    Updates: 1','陈音东','2017-11-06 21:15:58'),(250,1,'==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ','陈音东','2017-11-06 21:16:43'),(251,1,'==> Parameters: 啊实打实的撒打算啊实打实的啊啊(String), 13(Integer)','陈音东','2017-11-06 21:16:43'),(252,1,'<==    Updates: 1','陈音东','2017-11-06 21:16:43'),(253,1,'==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ','陈音东','2017-11-06 21:17:13'),(254,1,'==> Parameters: 啊实打实的撒打算啊实打实的啊啊阿斯顿撒(String), 13(Integer)','陈音东','2017-11-06 21:17:13'),(255,1,'<==    Updates: 1','陈音东','2017-11-06 21:17:14'),(256,1,'==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ','陈音东','2017-11-06 21:17:22'),(257,1,'==> Parameters: 啊实打实的撒打算啊实打实的啊啊阿斯顿(String), 13(Integer)','陈音东','2017-11-06 21:17:22'),(258,1,'<==    Updates: 1','陈音东','2017-11-06 21:17:23'),(259,1,'==>  Preparing: delete from parts_second where part_L_ID = ? ','陈音东','2017-11-06 21:19:15'),(260,1,'==> Parameters: 13(Integer)','陈音东','2017-11-06 21:19:15'),(261,1,'<==    Updates: 1','陈音东','2017-11-06 21:19:15'),(262,1,'==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:22:29'),(263,1,'==> Parameters: 1(Integer), adasdasdas(String)','陈音东','2017-11-06 21:22:29'),(264,1,'<==    Updates: 1','陈音东','2017-11-06 21:22:29'),(265,1,'==>  Preparing: update event_second SET event_L_Name = ? where event_L_ID = ? ','陈音东','2017-11-06 21:22:41'),(266,1,'==> Parameters: adasdasdas啊实打实的(String), 12(Integer)','陈音东','2017-11-06 21:22:41'),(267,1,'<==    Updates: 1','陈音东','2017-11-06 21:22:41'),(268,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:22:45'),(269,1,'==> Parameters: 12(Integer)','陈音东','2017-11-06 21:22:45'),(270,1,'<==    Updates: 1','陈音东','2017-11-06 21:22:45'),(271,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:22:46'),(272,1,'==> Parameters: 12(Integer)','陈音东','2017-11-06 21:22:46'),(273,1,'<==    Updates: 0','陈音东','2017-11-06 21:22:46'),(274,1,'==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:23:55'),(275,1,'==> Parameters: 1(Integer), 大苏打实打实(String)','陈音东','2017-11-06 21:23:55'),(276,1,'<==    Updates: 1','陈音东','2017-11-06 21:23:56'),(277,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:24:01'),(278,1,'==> Parameters: 13(Integer)','陈音东','2017-11-06 21:24:01'),(279,1,'<==    Updates: 1','陈音东','2017-11-06 21:24:01'),(280,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:24:01'),(281,1,'==> Parameters: 13(Integer)','陈音东','2017-11-06 21:24:01'),(282,1,'<==    Updates: 0','陈音东','2017-11-06 21:24:01'),(283,1,'==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:24:38'),(284,1,'==> Parameters: 1(Integer), 撒大声地撒大声地(String)','陈音东','2017-11-06 21:24:38'),(285,1,'<==    Updates: 1','陈音东','2017-11-06 21:24:38'),(286,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:24:59'),(287,1,'==> Parameters: 14(Integer)','陈音东','2017-11-06 21:24:59'),(288,1,'<==    Updates: 1','陈音东','2017-11-06 21:24:59'),(289,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:24:59'),(290,1,'==> Parameters: 14(Integer)','陈音东','2017-11-06 21:24:59'),(291,1,'<==    Updates: 0','陈音东','2017-11-06 21:24:59'),(292,1,'==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:25:38'),(293,1,'==> Parameters: 1(Integer), 啊实打实大苏打(String)','陈音东','2017-11-06 21:25:38'),(294,1,'<==    Updates: 1','陈音东','2017-11-06 21:25:38'),(295,1,'==>  Preparing: insert into event_second ( Event_B_ID, event_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:26:28'),(296,1,'==> Parameters: 1(Integer), 啊萨达萨达是的(String)','陈音东','2017-11-06 21:26:28'),(297,1,'<==    Updates: 1','陈音东','2017-11-06 21:26:28'),(298,1,'==>  Preparing: update event_second SET event_L_Name = ? where event_L_ID = ? ','陈音东','2017-11-06 21:26:37'),(299,1,'==> Parameters: 啊萨达萨达是的啊实打实(String), 16(Integer)','陈音东','2017-11-06 21:26:37'),(300,1,'<==    Updates: 1','陈音东','2017-11-06 21:26:38'),(301,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:27:11'),(302,1,'==> Parameters: 16(Integer)','陈音东','2017-11-06 21:27:11'),(303,1,'<==    Updates: 1','陈音东','2017-11-06 21:27:11'),(304,1,'==>  Preparing: delete from event_second where event_L_ID = ? ','陈音东','2017-11-06 21:27:11'),(305,1,'==> Parameters: 16(Integer)','陈音东','2017-11-06 21:27:11'),(306,1,'<==    Updates: 0','陈音东','2017-11-06 21:27:11'),(307,1,'==>  Preparing: update cases SET event_L_ID = ?, part_L_ID = ?, grid_ID = ?, time_Limit = ?, case_Describe = ? where case_ID = ? ','陈音东','2017-11-06 21:32:14'),(308,1,'==> Parameters: 2(Integer), 1(Integer), 0(Integer), 40(Integer), 这是一个栗子(String), 1(Integer)','陈音东','2017-11-06 21:32:14'),(309,1,'<==    Updates: 1','陈音东','2017-11-06 21:32:14'),(310,1,'==>  Preparing: insert into rest_time ( start_Time, end_Time ) values ( ?, ? ) ','陈音东','2017-11-06 21:35:21'),(311,1,'==> Parameters: 2017-11-09(Date), 2017-11-18(Date)','陈音东','2017-11-06 21:35:21'),(312,1,'<==    Updates: 1','陈音东','2017-11-06 21:35:21'),(313,1,'==>  Preparing: update rest_time SET start_Time = ?, end_Time = ? where Rest_Num = ? ','陈音东','2017-11-06 21:35:36'),(314,1,'==> Parameters: 2017-11-09(Date), 2017-11-30(Date), 6(Integer)','陈音东','2017-11-06 21:35:36'),(315,1,'<==    Updates: 1','陈音东','2017-11-06 21:35:36'),(316,1,'==>  Preparing: delete from rest_time where Rest_Num = ? ','陈音东','2017-11-06 21:35:54'),(317,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:35:54'),(318,1,'<==    Updates: 1','陈音东','2017-11-06 21:35:54'),(319,1,'==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ','陈音东','2017-11-06 21:38:20'),(320,1,'==> Parameters: sadasdsad(String), 2017-11-18(Date), java.io.StringReader@734eb9b4(StringReader)','陈音东','2017-11-06 21:38:20'),(321,1,'<==    Updates: 1','陈音东','2017-11-06 21:38:20'),(322,1,'==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ','陈音东','2017-11-06 21:38:31'),(323,1,'==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@78fb9a3a(StringReader), 6(Integer)','陈音东','2017-11-06 21:38:31'),(324,1,'<==    Updates: 1','陈音东','2017-11-06 21:38:31'),(325,1,'==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ','陈音东','2017-11-06 21:41:02'),(326,1,'==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@e03852b(StringReader), 6(Integer)','陈音东','2017-11-06 21:41:02'),(327,1,'<==    Updates: 1','陈音东','2017-11-06 21:41:02'),(328,1,'==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ','陈音东','2017-11-06 21:41:24'),(329,1,'==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@3c5f22da(StringReader), 6(Integer)','陈音东','2017-11-06 21:41:24'),(330,1,'<==    Updates: 1','陈音东','2017-11-06 21:41:24'),(331,1,'==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ','陈音东','2017-11-06 21:41:48'),(332,1,'==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@59477eb2(StringReader), 6(Integer)','陈音东','2017-11-06 21:41:48'),(333,1,'<==    Updates: 1','陈音东','2017-11-06 21:41:48'),(334,1,'==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ','陈音东','2017-11-06 21:41:53'),(335,1,'==> Parameters: sadasdsadasdsad(String), 2017-11-18(Date), java.io.StringReader@7bbb0649(StringReader), 6(Integer)','陈音东','2017-11-06 21:41:53'),(336,1,'<==    Updates: 1','陈音东','2017-11-06 21:41:53'),(337,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:13'),(338,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:13'),(339,1,'<==    Updates: 1','陈音东','2017-11-06 21:42:13'),(340,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:13'),(341,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:13'),(342,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:13'),(343,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:13'),(344,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:13'),(345,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:13'),(346,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:14'),(347,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:14'),(348,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:14'),(349,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:14'),(350,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:14'),(351,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:14'),(352,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:14'),(353,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:14'),(354,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:14'),(355,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:14'),(356,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:14'),(357,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:14'),(358,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:14'),(359,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:14'),(360,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:14'),(361,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:14'),(362,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:14'),(363,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:14'),(364,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:15'),(365,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:15'),(366,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:15'),(367,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:15'),(368,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:15'),(369,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:15'),(370,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:15'),(371,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:15'),(372,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:15'),(373,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:15'),(374,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:15'),(375,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:15'),(376,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:15'),(377,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:15'),(378,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:15'),(379,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:16'),(380,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:16'),(381,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:16'),(382,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:16'),(383,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:16'),(384,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:16'),(385,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:16'),(386,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:16'),(387,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:16'),(388,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:16'),(389,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:16'),(390,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:16'),(391,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:16'),(392,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:16'),(393,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:16'),(394,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:16'),(395,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:16'),(396,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:16'),(397,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:16'),(398,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:16'),(399,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:17'),(400,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:17'),(401,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:17'),(402,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:17'),(403,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:17'),(404,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:17'),(405,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:17'),(406,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:17'),(407,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:17'),(408,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:17'),(409,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:17'),(410,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:17'),(411,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:17'),(412,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:17'),(413,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:18'),(414,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:18'),(415,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:18'),(416,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:18'),(417,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:18'),(418,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:18'),(419,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:18'),(420,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:18'),(421,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:18'),(422,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:18'),(423,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:18'),(424,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:19'),(425,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:19'),(426,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:19'),(427,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:19'),(428,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:19'),(429,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:19'),(430,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:19'),(431,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:19'),(432,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:19'),(433,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:19'),(434,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:19'),(435,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:19'),(436,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:19'),(437,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:20'),(438,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:20'),(439,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:20'),(440,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:20'),(441,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:20'),(442,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:20'),(443,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:20'),(444,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:20'),(445,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:20'),(446,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:20'),(447,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:20'),(448,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:20'),(449,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:20'),(450,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:20'),(451,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:20'),(452,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:20'),(453,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:21'),(454,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:21'),(455,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:21'),(456,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:21'),(457,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:21'),(458,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:21'),(459,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:21'),(460,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:21'),(461,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:21'),(462,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:21'),(463,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:26'),(464,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:26'),(465,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:26'),(466,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:27'),(467,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:27'),(468,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:27'),(469,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:27'),(470,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:27'),(471,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:27'),(472,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:27'),(473,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:27'),(474,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:27'),(475,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:27'),(476,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:27'),(477,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:27'),(478,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:27'),(479,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:27'),(480,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:27'),(481,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:28'),(482,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:28'),(483,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:28'),(484,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:28'),(485,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:28'),(486,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:28'),(487,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:28'),(488,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:28'),(489,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:28'),(490,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:28'),(491,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:28'),(492,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:28'),(493,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:28'),(494,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:28'),(495,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:28'),(496,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:28'),(497,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:28'),(498,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:28'),(499,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:28'),(500,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:28'),(501,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:29'),(502,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:29'),(503,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:29'),(504,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:29'),(505,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:29'),(506,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:29'),(507,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:29'),(508,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:29'),(509,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:29'),(510,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:29'),(511,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:29'),(512,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:29'),(513,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:29'),(514,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:29'),(515,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:29'),(516,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:29'),(517,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:29'),(518,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:29'),(519,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:29'),(520,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:30'),(521,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:30'),(522,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:30'),(523,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:30'),(524,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:42:30'),(525,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:30'),(526,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:41'),(527,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:41'),(528,1,'<==    Updates: 1','陈音东','2017-11-06 21:42:41'),(529,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:41'),(530,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:41'),(531,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:41'),(532,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:42'),(533,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:42'),(534,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:42'),(535,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:42'),(536,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:42'),(537,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:42'),(538,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:42'),(539,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:42'),(540,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:42'),(541,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:42'),(542,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:42'),(543,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:42'),(544,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:42'),(545,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:42'),(546,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:42'),(547,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:43'),(548,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:43'),(549,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:43'),(550,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:43'),(551,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:43'),(552,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:43'),(553,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:43'),(554,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:43'),(555,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:43'),(556,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:43'),(557,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:43'),(558,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:43'),(559,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:43'),(560,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:43'),(561,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:44'),(562,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:44'),(563,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:44'),(564,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:44'),(565,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:44'),(566,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:44'),(567,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:44'),(568,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:44'),(569,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:44'),(570,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:44'),(571,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:44'),(572,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:44'),(573,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:44'),(574,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:44'),(575,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:44'),(576,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:44'),(577,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:44'),(578,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:45'),(579,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:45'),(580,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:42:45'),(581,1,'==> Parameters: 5(Integer)','陈音东','2017-11-06 21:42:45'),(582,1,'<==    Updates: 0','陈音东','2017-11-06 21:42:45'),(583,1,'==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ','陈音东','2017-11-06 21:44:10'),(584,1,'==> Parameters: 学院办公室(String), 2017-11-09(Date), java.io.StringReader@7c1056e5(StringReader)','陈音东','2017-11-06 21:44:10'),(585,1,'<==    Updates: 1','陈音东','2017-11-06 21:44:10'),(586,1,'==>  Preparing: update notice SET notice_organization = ?, notice_time = ?, notice_content = ? where notice_ID = ? ','陈音东','2017-11-06 21:44:25'),(587,1,'==> Parameters: 学院办公室(String), 2017-11-09(Date), java.io.StringReader@38d9e14f(StringReader), 7(Integer)','陈音东','2017-11-06 21:44:25'),(588,1,'<==    Updates: 1','陈音东','2017-11-06 21:44:25'),(589,1,'==>  Preparing: delete from notice where notice_ID = ? ','陈音东','2017-11-06 21:44:29'),(590,1,'==> Parameters: 7(Integer)','陈音东','2017-11-06 21:44:29'),(591,1,'<==    Updates: 1','陈音东','2017-11-06 21:44:29'),(592,1,'==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:46:27'),(593,1,'==> Parameters: 1(Integer), (String)','陈音东','2017-11-06 21:46:28'),(594,1,'<==    Updates: 1','陈音东','2017-11-06 21:46:28'),(595,1,'==>  Preparing: delete from parts_second where part_L_ID = ? ','陈音东','2017-11-06 21:46:38'),(596,1,'==> Parameters: 14(Integer)','陈音东','2017-11-06 21:46:38'),(597,1,'<==    Updates: 1','陈音东','2017-11-06 21:46:38'),(598,1,'==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:46:42'),(599,1,'==> Parameters: 1(Integer), (String)','陈音东','2017-11-06 21:46:42'),(600,1,'<==    Updates: 1','陈音东','2017-11-06 21:46:42'),(601,1,'==>  Preparing: insert ignore into parts_second ( part_B_ID, part_L_Name ) values ( ?, ? ) ','陈音东','2017-11-06 21:46:45'),(602,1,'==> Parameters: 1(Integer), (String)','陈音东','2017-11-06 21:46:45'),(603,1,'<==    Updates: 1','陈音东','2017-11-06 21:46:45'),(604,1,'==>  Preparing: delete from parts_second where part_L_ID = ? ','陈音东','2017-11-06 21:46:50'),(605,1,'==> Parameters: 15(Integer)','陈音东','2017-11-06 21:46:50'),(606,1,'<==    Updates: 1','陈音东','2017-11-06 21:46:50'),(607,1,'==>  Preparing: insert into post ','陈音东','2017-11-06 21:50:12'),(608,1,'==> Parameters: ','陈音东','2017-11-06 21:50:12'),(609,1,'==>  Preparing: insert into post ','陈音东','2017-11-06 21:52:31'),(610,1,'==> Parameters: ','陈音东','2017-11-06 21:52:31'),(611,1,'==>  Preparing: insert into post ( post_name ) values ( ? ) ','陈音东','2017-11-06 21:52:37'),(612,1,'==> Parameters: a(String)','陈音东','2017-11-06 21:52:37'),(613,1,'<==    Updates: 1','陈音东','2017-11-06 21:52:37'),(614,1,'==>  Preparing: delete from post where post_Num = ? ','陈音东','2017-11-06 21:52:41'),(615,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 21:52:41'),(616,1,'<==    Updates: 1','陈音东','2017-11-06 21:52:41'),(617,1,'==>  Preparing: insert into post ( post_name ) values ( ? ) ','陈音东','2017-11-06 21:52:47'),(618,1,'==> Parameters: a(String)','陈音东','2017-11-06 21:52:48'),(619,1,'<==    Updates: 1','陈音东','2017-11-06 21:52:48'),(620,1,'==>  Preparing: update post where post_Num = ? ','陈音东','2017-11-06 21:52:53'),(621,1,'==> Parameters: 7(Integer)','陈音东','2017-11-06 21:52:53'),(622,1,'==>  Preparing: insert into department ','陈音东','2017-11-06 21:52:59'),(623,1,'==> Parameters: ','陈音东','2017-11-06 21:52:59'),(624,1,'==>  Preparing: insert into department ','陈音东','2017-11-06 21:54:33'),(625,1,'==> Parameters: ','陈音东','2017-11-06 21:54:33'),(626,1,'==>  Preparing: insert into department ( department_Name ) values ( ? ) ','陈音东','2017-11-06 21:54:41'),(627,1,'==> Parameters: a(String)','陈音东','2017-11-06 21:54:41'),(628,1,'<==    Updates: 1','陈音东','2017-11-06 21:54:41'),(629,1,'==>  Preparing: update department where department_Num = ? ','陈音东','2017-11-06 21:54:48'),(630,1,'==> Parameters: 12(Integer)','陈音东','2017-11-06 21:54:48'),(631,1,'==>  Preparing: insert into user ( gender, phone_Num ) values ( ?, ? ) ','陈音东','2017-11-06 21:55:17'),(632,1,'==> Parameters: 男(String), (String)','陈音东','2017-11-06 21:55:17'),(633,1,'<==    Updates: 1','陈音东','2017-11-06 21:55:17'),(634,1,'==>  Preparing: insert into role ( role_Name, role_Describe ) values ( ?, ? ) ','陈音东','2017-11-06 21:55:51'),(635,1,'==> Parameters: (String), java.io.StringReader@68dbde7b(StringReader)','陈音东','2017-11-06 21:55:51'),(636,1,'<==    Updates: 1','陈音东','2017-11-06 21:55:51'),(637,1,'==>  Preparing: insert into role values ( ?, ? ) ','陈音东','2017-11-06 21:56:27'),(638,1,'==> Parameters: (String), java.io.StringReader@402f1515(StringReader)','陈音东','2017-11-06 21:56:27'),(639,1,'==>  Preparing: update role SET role_Name = ? where role_ID = ? ','陈音东','2017-11-06 21:56:33'),(640,1,'==> Parameters: (String), 11(Integer)','陈音东','2017-11-06 21:56:33'),(641,1,'<==    Updates: 1','陈音东','2017-11-06 21:56:33'),(642,1,'==>  Preparing: update post where post_Num = ? ','陈音东','2017-11-06 21:56:53'),(643,1,'==> Parameters: 7(Integer)','陈音东','2017-11-06 21:56:53'),(644,1,'==>  Preparing: insert into post ','陈音东','2017-11-06 21:59:02'),(645,1,'==> Parameters: ','陈音东','2017-11-06 21:59:02'),(646,1,'==>  Preparing: update role SET role_Name = ? where role_ID = ? ','陈音东','2017-11-06 21:59:10'),(647,1,'==> Parameters: (String), 11(Integer)','陈音东','2017-11-06 21:59:10'),(648,1,'<==    Updates: 1','陈音东','2017-11-06 21:59:10'),(649,1,'==>  Preparing: delete from role where role_ID = ? ','陈音东','2017-11-06 21:59:16'),(650,1,'==> Parameters: 11(Integer)','陈音东','2017-11-06 21:59:16'),(651,1,'<==    Updates: 1','陈音东','2017-11-06 21:59:16'),(652,1,'==>  Preparing: insert into role ','陈音东','2017-11-06 21:59:21'),(653,1,'==> Parameters: ','陈音东','2017-11-06 21:59:21'),(654,1,'==>  Preparing: insert into role ','陈音东','2017-11-06 22:01:10'),(655,1,'==> Parameters: ','陈音东','2017-11-06 22:01:10'),(656,1,'==>  Preparing: insert ignore into parts_second ( part_B_ID ) values ( ?, ? ) ','陈音东','2017-11-06 22:01:22'),(657,1,'==> Parameters: 1(Integer), (String)','陈音东','2017-11-06 22:01:22'),(658,1,'==>  Preparing: update parts_second SET part_L_Name = ? where part_L_ID = ? ','陈音东','2017-11-06 22:01:35'),(659,1,'==> Parameters: (String), 16(Integer)','陈音东','2017-11-06 22:01:35'),(660,1,'<==    Updates: 1','陈音东','2017-11-06 22:01:35'),(661,1,'==>  Preparing: delete from parts_second where part_L_ID = ? ','陈音东','2017-11-06 22:01:37'),(662,1,'==> Parameters: 16(Integer)','陈音东','2017-11-06 22:01:38'),(663,1,'<==    Updates: 1','陈音东','2017-11-06 22:01:38'),(664,1,'==>  Preparing: insert into event_second ( Event_B_ID ) values ( ?, ? ) ','陈音东','2017-11-06 22:01:44'),(665,1,'==> Parameters: 1(Integer), (String)','陈音东','2017-11-06 22:01:44'),(666,1,'==>  Preparing: insert into rest_time ( start_Time, end_Time ) values ( ?, ? ) ','陈音东','2017-11-06 22:06:55'),(667,1,'==> Parameters: 2017-11-11(Date), 2017-11-30(Date)','陈音东','2017-11-06 22:06:55'),(668,1,'<==    Updates: 1','陈音东','2017-11-06 22:06:55'),(669,1,'==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:13:38'),(670,1,'==> Parameters: sdfsdf(String), 2017-11-03(Date), java.io.StringReader@47c7b1dd(StringReader)','陈音东','2017-11-06 22:13:38'),(671,1,'<==    Updates: 1','陈音东','2017-11-06 22:13:38'),(672,1,'==>  Preparing: update question_details SET ques_L_Name = ?, answer = ? where ques_L_ID = ? ','陈音东','2017-11-06 22:19:41'),(673,1,'==> Parameters: 问题1管理员是谁(String), java.io.StringReader@429ce0e9(StringReader), 1(Integer)','陈音东','2017-11-06 22:19:42'),(674,1,'<==    Updates: 1','陈音东','2017-11-06 22:19:42'),(675,1,'==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:20:01'),(676,1,'==> Parameters: 1(Integer), (String), java.io.StringReader@4f1081c5(StringReader)','陈音东','2017-11-06 22:20:01'),(677,1,'<==    Updates: 1','陈音东','2017-11-06 22:20:02'),(678,1,'==>  Preparing: delete from question_details where ques_L_ID = ? ','陈音东','2017-11-06 22:21:26'),(679,1,'==> Parameters: 6(Integer)','陈音东','2017-11-06 22:21:26'),(680,1,'<==    Updates: 1','陈音东','2017-11-06 22:21:26'),(681,1,'==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:29:29'),(682,1,'==> Parameters: 1(Integer), asdsadsadasdsadsadasdsadsad(String), java.io.StringReader@2279a423(StringReader)','陈音东','2017-11-06 22:29:29'),(683,1,'==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:30:50'),(684,1,'==> Parameters: 1(Integer), asdsadsadasdsadsadasdsadsad(String), java.io.StringReader@126884e2(StringReader)','陈音东','2017-11-06 22:30:50'),(685,1,'==>  Preparing: insert ignore into notice ( notice_organization, notice_time, notice_content ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:32:11'),(686,1,'==> Parameters: dgdfgfdgdfg(String), 2017-11-21(Date), java.io.StringReader@2e133915(StringReader)','陈音东','2017-11-06 22:32:12'),(687,1,'<==    Updates: 1','陈音东','2017-11-06 22:32:12'),(688,1,'==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:35:56'),(689,1,'==> Parameters: 1(Integer), asdasdasdasd(String), java.io.StringReader@28ba1a2f(StringReader)','陈音东','2017-11-06 22:35:56'),(690,1,'<==    Updates: 1','陈音东','2017-11-06 22:35:56'),(691,1,'==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:37:10'),(692,1,'==> Parameters: 1(Integer), sadasdasd(String), java.io.StringReader@79554e6c(StringReader)','陈音东','2017-11-06 22:37:10'),(693,1,'<==    Updates: 1','陈音东','2017-11-06 22:37:10'),(694,1,'==>  Preparing: insert into question_details ( ques_B_ID ) values ( ? ) ','陈音东','2017-11-06 22:37:14'),(695,1,'==> Parameters: 1(Integer)','陈音东','2017-11-06 22:37:14'),(696,1,'==>  Preparing: insert into question_details ( ques_B_ID, ques_L_Name, answer ) values ( ?, ?, ? ) ','陈音东','2017-11-06 22:37:20'),(697,1,'==> Parameters: 1(Integer), asdasdasdasdasdasd(String), java.io.StringReader@5e68003f(StringReader)','陈音东','2017-11-06 22:37:20'),(698,1,'<==    Updates: 1','陈音东','2017-11-06 22:37:20');
/*!40000 ALTER TABLE `operation_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_first`
--

DROP TABLE IF EXISTS `parts_first`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts_first` (
  `part_B_ID` int(11) NOT NULL,
  `part_B_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`part_B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_first`
--

LOCK TABLES `parts_first` WRITE;
/*!40000 ALTER TABLE `parts_first` DISABLE KEYS */;
INSERT INTO `parts_first` VALUES (1,'公共设施'),(2,'道路交通'),(3,'市容环境'),(4,'园林绿化'),(5,'房屋土地'),(6,'其他设施');
/*!40000 ALTER TABLE `parts_first` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_second`
--

DROP TABLE IF EXISTS `parts_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts_second` (
  `part_L_ID` int(11) NOT NULL AUTO_INCREMENT,
  `part_B_ID` int(11) DEFAULT NULL,
  `part_L_Name` varchar(20) NOT NULL,
  `part_Manage_Unit` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`part_L_ID`),
  KEY `FK_Relationship_9` (`part_B_ID`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`part_B_ID`) REFERENCES `parts_first` (`part_B_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_second`
--

LOCK TABLES `parts_second` WRITE;
/*!40000 ALTER TABLE `parts_second` DISABLE KEYS */;
INSERT INTO `parts_second` VALUES (1,1,'路灯',NULL),(2,1,'邮筒',NULL),(3,2,'停车场',NULL),(4,2,'公交车亭',NULL),(5,3,'公共厕所',NULL),(6,3,'垃圾箱',NULL),(7,4,'绿地',NULL),(8,4,'雕塑',NULL),(9,5,'宣传栏',NULL),(10,5,'人防工事',NULL),(11,6,'工地',NULL),(12,1,'马桶',NULL);
/*!40000 ALTER TABLE `parts_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_Num` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(20) NOT NULL,
  `p_Discribe` text,
  PRIMARY KEY (`post_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (0,'总经理','老大的位置'),(1,'经理','老大没在我第一'),(2,'会计','小小部长能耐大'),(3,'部长','什么都能做把'),(4,'董事长','终极boss'),(7,'a',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power` (
  `power_ID` int(11) NOT NULL,
  `power_Name` varchar(20) NOT NULL,
  `power_Describe` text,
  PRIMARY KEY (`power_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
INSERT INTO `power` VALUES (0,'默认权限','默认权限'),(1,'部门管理','部门管理'),(2,'岗位管理','岗位管理'),(3,'区块管理','区块管理'),(4,'用户信息管理','用户信息管理'),(5,'角色权限管理','角色权限管理'),(6,'部件管理','部件管理'),(7,'事件管理','事件管理'),(8,'案件限时管理','案件限时管理'),(9,'休息时间管理','休息时间管理'),(10,'公文发布管理','公文发布管理'),(11,'知识库管理','知识库管理'),(12,'数据库管理','数据库管理'),(13,'操作记录管理','操作记录管理');
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_details`
--

DROP TABLE IF EXISTS `question_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_details` (
  `ques_L_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ques_B_ID` int(11) DEFAULT NULL,
  `ques_L_Name` varchar(20) NOT NULL,
  `answer` text,
  PRIMARY KEY (`ques_L_ID`),
  KEY `FK_Relationship_7` (`ques_B_ID`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`ques_B_ID`) REFERENCES `question_first` (`ques_B_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_details`
--

LOCK TABLES `question_details` WRITE;
/*!40000 ALTER TABLE `question_details` DISABLE KEYS */;
INSERT INTO `question_details` VALUES (1,1,'问题1管理员是谁','不知道'),(2,2,'问题二','不知道'),(3,3,'问题三','不知道'),(4,4,'问题四','不知道'),(5,3,'高考分数','45000'),(7,1,'asdasdasdasd','asdasdasdasd'),(8,1,'sadasdasd','asdasdasdasd'),(9,1,'asdasdasdasdasdasd','asdasdasdasdasdasd');
/*!40000 ALTER TABLE `question_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_first`
--

DROP TABLE IF EXISTS `question_first`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_first` (
  `ques_B_ID` int(11) NOT NULL,
  `ques_B_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ques_B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_first`
--

LOCK TABLES `question_first` WRITE;
/*!40000 ALTER TABLE `question_first` DISABLE KEYS */;
INSERT INTO `question_first` VALUES (1,'登陆问题'),(2,'修改问题'),(3,'设备问题'),(4,'举报问题');
/*!40000 ALTER TABLE `question_first` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_time`
--

DROP TABLE IF EXISTS `rest_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rest_time` (
  `Rest_Num` int(11) NOT NULL AUTO_INCREMENT,
  `start_Time` date NOT NULL,
  `end_Time` date NOT NULL,
  PRIMARY KEY (`Rest_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_time`
--

LOCK TABLES `rest_time` WRITE;
/*!40000 ALTER TABLE `rest_time` DISABLE KEYS */;
INSERT INTO `rest_time` VALUES (2,'2017-10-21','2017-10-29'),(3,'2017-12-08','2017-12-30'),(4,'2017-12-15','2017-12-30'),(5,'2017-11-02','2017-11-16'),(7,'2017-11-11','2017-11-30');
/*!40000 ALTER TABLE `rest_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `role_Name` varchar(20) NOT NULL,
  `role_Describe` text,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (0,'默认角色','默认'),(1,'系统管理员','系统管理员'),(2,'信息采集员','信息采集员'),(3,'受理员','受理员'),(4,'派遣员','派遣员'),(5,'值班长','值班长'),(6,'指挥长','指挥长'),(8,'asdasd阿斯顿搜索','啊实打实的');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `roleTopower` AFTER INSERT ON `role`

FOR EACH ROW begin

declare s int;

set s = (select role_ID from role where role_ID = new.role_ID );

  insert into role_power(role_ID)  values(s);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `role_power`
--

DROP TABLE IF EXISTS `role_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_power` (
  `role_ID` int(11) NOT NULL,
  `power_ID` int(11) NOT NULL DEFAULT '0',
  KEY `FK_Relationship_15` (`role_ID`) USING BTREE,
  KEY `FK_Relationship_4` (`power_ID`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`power_ID`) REFERENCES `power` (`power_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_power`
--

LOCK TABLES `role_power` WRITE;
/*!40000 ALTER TABLE `role_power` DISABLE KEYS */;
INSERT INTO `role_power` VALUES (2,5),(3,5),(5,5),(6,5),(4,5),(4,8),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(0,0),(0,1),(0,3),(0,4),(0,5),(0,9),(0,10),(0,12);
/*!40000 ALTER TABLE `role_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `street`
--

DROP TABLE IF EXISTS `street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `street` (
  `street_ID` int(11) NOT NULL,
  `street_Name` varchar(20) NOT NULL,
  `s_Information` text,
  PRIMARY KEY (`street_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street`
--

LOCK TABLES `street` WRITE;
/*!40000 ALTER TABLE `street` DISABLE KEYS */;
INSERT INTO `street` VALUES (0,'未分配',NULL),(1,'建设路',''),(2,'红星街',NULL),(3,'三大框',NULL);
/*!40000 ALTER TABLE `street` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,0,'123456','陈音东','男',30,'18282296014','在线'),(2,1,0,'123456','张三','男',18,'18282248546','在线'),(3,0,0,'123123','无名氏asdasd','男',18,NULL,'离线'),(4,1,0,'456123','张三是','男',18,NULL,'离线'),(5,1,0,'456123','张三是啊','男',18,NULL,'离线'),(7,1,0,'456123','张三是啊啊','男',18,NULL,'离线'),(24,1,1,'123456','陈颖啊啊啊啊','男',11,'18248859652','离线'),(42,1,1,'123456','测试js','男',11,'18282296013','离线'),(46,1,1,'123456','测试js222js222js222','男',111,'18248859652','离线'),(48,0,0,'123456','','男',18,'','离线');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `userTogrid` AFTER INSERT ON `user`

FOR EACH ROW begin

declare s int;

set s = (select user_Number from user where user_Number = new.user_Number );

  insert into user_grid(user_Number)  values(s);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `userToRole` AFTER INSERT ON `user`

FOR EACH ROW begin

declare s int;

set s = (select user_Number from user where user_Number = new.user_Number );

  insert into user_role(user_Number)  values(s);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_grid`
--

DROP TABLE IF EXISTS `user_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_grid` (
  `grid_ID` int(11) NOT NULL DEFAULT '0',
  `user_Number` int(11) NOT NULL,
  PRIMARY KEY (`grid_ID`,`user_Number`),
  KEY `FK_Relationship_14` (`grid_ID`) USING BTREE,
  KEY `FK_Relationship_16` (`user_Number`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`grid_ID`) REFERENCES `grid` (`grid_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`user_Number`) REFERENCES `user` (`user_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_grid`
--

LOCK TABLES `user_grid` WRITE;
/*!40000 ALTER TABLE `user_grid` DISABLE KEYS */;
INSERT INTO `user_grid` VALUES (0,1),(0,2),(0,5),(0,7),(0,24),(0,42),(0,46),(0,48),(1,1),(1,5),(2,2),(2,3);
/*!40000 ALTER TABLE `user_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_Number` int(11) NOT NULL,
  `role_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_Number`,`role_ID`),
  KEY `FK_Relationship_3` (`user_Number`) USING BTREE,
  KEY `FK_Relationship_10` (`role_ID`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`user_Number`) REFERENCES `user` (`user_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,0),(1,1),(2,0),(3,0),(4,0),(5,0),(5,1),(7,0),(24,0),(42,0),(46,0),(48,0);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-06 23:18:41
