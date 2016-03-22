-- MySQL dump 10.13  Distrib 5.5.13, for Win32 (x86)
--
-- Host: localhost    Database: dq
-- ------------------------------------------------------
-- Server version	5.5.13

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
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_hint` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1j9d9a06i600gd43uu3km82jw` (`email`),
  UNIQUE KEY `UK_3k4cplvh82srueuttfkwnylq0` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (-3,'\0','\0','','Denver','US','80210','CO','\0','two_roles_user@appfuse.org','','Two Roles','User','$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO','Not a female kitty.','','two_roles_user',1,'http://raibledesigns.com'),(-2,'\0','\0','','Denver','US','80210','CO','\0','matt@raibledesigns.com','','Matt','Raible','$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO','Not a female kitty.订单','','admin',2,'http://raibledesigns.com'),(-1,'\0','\0','','Denver','US','80210','CO','\0','matt_raible@yahoo.com','','Tomcat','User','$2a$10$CnQVJ9bsWBjMpeSKrrdDEeuIptZxXrwtI6CZ/OgtNxhIgpKxXeT9y','A male kitty.','','user',1,'http://tomcat.apache.org'),(10,'\0','\0','','','','','','\0','wf@aa.com','','','','$2a$10$0biZZWJWZBOYGPpAvjRM9e2QvuhqI.WZGPTzeeIwRoOZd1tDNjNn.','123456','','wf',1,''),(11,'\0','\0','','','','','','\0','xtf@aa.com','','','','$2a$10$AIMlcgNgKl9peBbQ3jHWjetsG1maENuUW3L6WkeCaoFIk7XQCC5Tm','123456','','xtf',0,'');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumeration`
--

DROP TABLE IF EXISTS `enumeration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumeration` (
  `enum_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enum_type_id` bigint(20) DEFAULT NULL,
  `enum_code` varchar(20) DEFAULT NULL,
  `sequence_id` int(11) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `pinyin_name` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`enum_id`),
  KEY `FK_jr8` (`enum_type_id`),
  CONSTRAINT `FK_jr8` FOREIGN KEY (`enum_type_id`) REFERENCES `enumeration_type` (`enum_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumeration`
--

LOCK TABLES `enumeration` WRITE;
/*!40000 ALTER TABLE `enumeration` DISABLE KEYS */;
INSERT INTO `enumeration` VALUES (1,1,'default_price',0,'默认价格',NULL,NULL,NULL,NULL,NULL),(2,1,'day_price',1,'日价格','rjg',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumeration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumeration_type`
--

DROP TABLE IF EXISTS `enumeration_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumeration_type` (
  `enum_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_type_id` bigint(20) DEFAULT NULL,
  `has_table` int(11) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`enum_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumeration_type`
--

LOCK TABLES `enumeration_type` WRITE;
/*!40000 ALTER TABLE `enumeration_type` DISABLE KEYS */;
INSERT INTO `enumeration_type` VALUES (1,NULL,NULL,'商品价格类型',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumeration_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `facility_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `facility_type_id` bigint(20) DEFAULT NULL,
  `owner_party_id` bigint(20) DEFAULT NULL,
  `facility_name` varchar(100) DEFAULT NULL,
  `geo_point_id` varchar(100) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,NULL,NULL,1,'总部仓库','',NULL,NULL,NULL,NULL),(2,NULL,NULL,2,'开封尉氏县冷库','','2015-09-06 15:47:59',NULL,11,NULL),(3,NULL,NULL,5,'东莞客户仓库','','2015-09-07 11:05:00',NULL,11,NULL),(4,NULL,NULL,6,'深圳客户仓库','','2015-09-07 11:05:11',NULL,11,NULL);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_transition`
--

DROP TABLE IF EXISTS `facility_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility_transition` (
  `facility_transition_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `facility_id` bigint(20) DEFAULT NULL,
  `in_out_type` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `num` decimal(13,2) DEFAULT NULL,
  `uom_id` bigint(20) DEFAULT NULL,
  `tran_date` date DEFAULT NULL,
  `biz_type` int(11) DEFAULT NULL,
  `biz_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`facility_transition_id`),
  KEY `FK_jr11` (`facility_id`),
  CONSTRAINT `FK_jr11` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_transition`
--

LOCK TABLES `facility_transition` WRITE;
/*!40000 ALTER TABLE `facility_transition` DISABLE KEYS */;
INSERT INTO `facility_transition` VALUES (1,2,1,2,23.00,NULL,NULL,2,NULL,'2015-09-11 14:18:32',NULL,11,NULL),(2,2,-1,2,2.00,NULL,NULL,2,NULL,'2015-09-11 14:18:48',NULL,11,NULL),(3,2,1,1,23.00,NULL,'2015-09-11',2,NULL,'2015-09-11 14:21:33',NULL,11,NULL),(4,2,-1,1,11.50,NULL,'2015-09-21',1,30,'2015-09-21 16:01:54',NULL,11,NULL),(5,2,-1,1,11.50,NULL,'2015-09-21',1,31,'2015-09-21 16:01:54',NULL,11,NULL),(6,2,-1,2,10.50,NULL,'2015-09-21',1,32,'2015-09-21 16:01:54',NULL,11,NULL),(7,2,-1,2,10.50,NULL,'2015-09-21',1,33,'2015-09-21 16:01:54',NULL,11,NULL),(8,2,1,1,122.00,NULL,'2015-10-10',2,NULL,'2015-10-10 10:30:34',NULL,11,NULL),(9,2,1,2,21.00,NULL,'2015-10-10',2,NULL,'2015-10-10 10:30:40',NULL,11,NULL);
/*!40000 ALTER TABLE `facility_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `party_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_type_id` varchar(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1,'party_group',0,'集团总部','2015-08-08 17:48:43',NULL,-2,NULL),(2,'party_group',0,'七彩虹河南中部','2015-08-08 18:33:34',NULL,-2,NULL),(3,'person',0,'王菲','2015-08-25 15:27:27',NULL,-2,NULL),(4,'party_group',0,'客户组','2015-09-03 23:33:36',NULL,-2,NULL),(5,'party_group',0,'东莞市场','2015-09-03 23:34:24',NULL,-2,NULL),(6,'party_group',0,'深圳市场','2015-09-03 23:34:44',NULL,-2,NULL),(7,'person',0,'谢霆锋','2015-09-05 19:45:04',NULL,10,NULL),(8,'party_group',0,'产业聚集区',NULL,NULL,NULL,NULL),(9,'party_group',0,'十八里镇',NULL,NULL,NULL,NULL),(10,'party_group',0,'南曹乡',NULL,NULL,NULL,NULL),(11,'party_group',0,'城关镇',NULL,NULL,NULL,NULL),(12,'party_group',0,'大桥乡',NULL,NULL,NULL,NULL),(13,'party_group',0,'大营乡',NULL,NULL,NULL,NULL),(14,'party_group',0,'大营镇',NULL,NULL,NULL,NULL),(15,'party_group',0,'大马乡',NULL,NULL,NULL,NULL),(16,'party_group',0,'小陈乡',NULL,NULL,NULL,NULL),(17,'party_group',0,'岗李乡',NULL,NULL,NULL,NULL),(18,'party_group',0,'庄头镇',NULL,NULL,NULL,NULL),(19,'party_group',0,'张市镇',NULL,NULL,NULL,NULL),(20,'party_group',0,'新尉园区',NULL,NULL,NULL,NULL),(21,'party_group',0,'朱曲镇',NULL,NULL,NULL,NULL),(22,'party_group',0,'水坡镇',NULL,NULL,NULL,NULL),(23,'party_group',0,'永兴镇',NULL,NULL,NULL,NULL),(24,'party_group',0,'洧川镇',NULL,NULL,NULL,NULL),(25,'party_group',0,'蔡庄镇',NULL,NULL,NULL,NULL),(26,'party_group',0,'邢庄乡',NULL,NULL,NULL,NULL),(27,'party_group',0,'门楼任乡',NULL,NULL,NULL,NULL),(39,'party_group',0,'七里头村',NULL,NULL,NULL,NULL),(40,'party_group',27,'尹庄村',NULL,NULL,NULL,NULL),(41,'party_group',36,'芦馆村',NULL,NULL,NULL,NULL),(42,'party_group',38,'大营村',NULL,NULL,NULL,NULL),(43,'party_group',39,'梅庄社区',NULL,NULL,NULL,NULL),(44,'party_group',40,'席苏村',NULL,NULL,NULL,NULL),(45,'party_group',41,'郝寺村',NULL,NULL,NULL,NULL),(46,'party_group',42,'坡徐村',NULL,NULL,NULL,NULL),(47,'party_group',43,'张寨村',NULL,NULL,NULL,NULL),(48,'party_group',44,'要家村',NULL,NULL,NULL,NULL),(49,'party_group',45,'牛集村',NULL,NULL,NULL,NULL),(50,'party_group',46,'寄庄王村',NULL,NULL,NULL,NULL),(51,'party_group',47,'小西门社区',NULL,NULL,NULL,NULL),(52,'party_group',48,'寺前张社区',NULL,NULL,NULL,NULL),(53,'party_group',49,'南闹店村',NULL,NULL,NULL,NULL),(54,'party_group',50,'小营村',NULL,NULL,NULL,NULL),(55,'party_group',51,'马庙村',NULL,NULL,NULL,NULL),(56,'party_group',52,'前滹沱村',NULL,NULL,NULL,NULL),(57,'party_group',53,'东街村',NULL,NULL,NULL,NULL),(58,'party_group',54,'西街村',NULL,NULL,NULL,NULL),(59,'party_group',57,'小东门社区',NULL,NULL,NULL,NULL),(60,'party_group',58,'斗虎营社区',NULL,NULL,NULL,NULL),(61,'party_group',59,'鳌头吕村',NULL,NULL,NULL,NULL),(62,'party_group',60,'三李村',NULL,NULL,NULL,NULL),(63,'party_group',61,'邢庄村',NULL,NULL,NULL,NULL),(64,'party_group',62,'芦墓张村',NULL,NULL,NULL,NULL),(65,'party_group',64,'朱曲镇东街村',NULL,NULL,NULL,NULL),(66,'party_group',65,'蜜蜂赵村',NULL,NULL,NULL,NULL),(67,'party_group',66,'董庄村',NULL,NULL,NULL,NULL),(68,'party_group',67,'韩庄村',NULL,NULL,NULL,NULL),(69,'party_group',69,'葛庄村',NULL,NULL,NULL,NULL),(70,'party_group',70,'尚村',NULL,NULL,NULL,NULL),(71,'party_group',71,'史庄村',NULL,NULL,NULL,NULL),(72,'party_group',72,'北丁庄村',NULL,NULL,NULL,NULL),(73,'party_group',73,'郭佛村',NULL,NULL,NULL,NULL),(74,'party_group',74,'安庄村',NULL,NULL,NULL,NULL),(75,'party_group',75,'芦馆村',NULL,NULL,NULL,NULL),(76,'party_group',76,'芦馆村',NULL,NULL,NULL,NULL),(77,'party_group',77,'屈楼村',NULL,NULL,NULL,NULL),(78,'party_group',78,'水黄村',NULL,NULL,NULL,NULL),(79,'party_group',79,'烧酒胡村',NULL,NULL,NULL,NULL),(80,'party_group',80,'明家村',NULL,NULL,NULL,NULL),(81,'party_group',81,'付李庄村',NULL,NULL,NULL,NULL),(82,'party_group',83,'大庙杨村',NULL,NULL,NULL,NULL),(83,'party_group',84,'赵庄村',NULL,NULL,NULL,NULL),(84,'party_group',85,'拐杨村',NULL,NULL,NULL,NULL),(85,'party_group',86,'簸箕任村',NULL,NULL,NULL,NULL),(86,'party_group',88,'岳家村',NULL,NULL,NULL,NULL),(87,'party_group',89,'雷家村',NULL,NULL,NULL,NULL),(88,'party_group',90,'郭新庄村',NULL,NULL,NULL,NULL),(89,'party_group',91,'甄家村',NULL,NULL,NULL,NULL),(90,'party_group',92,'王响村',NULL,NULL,NULL,NULL),(91,'party_group',93,'新庄村',NULL,NULL,NULL,NULL),(92,'party_group',94,'大桥村',NULL,NULL,NULL,NULL),(93,'party_group',95,'大李庄村',NULL,NULL,NULL,NULL),(94,'party_group',96,'马庄村',NULL,NULL,NULL,NULL),(95,'party_group',97,'许庄村',NULL,NULL,NULL,NULL),(96,'party_group',98,'崔家村',NULL,NULL,NULL,NULL),(97,'party_group',99,'孔家村',NULL,NULL,NULL,NULL),(98,'party_group',100,'要井村',NULL,NULL,NULL,NULL),(99,'party_group',101,'岗东村',NULL,NULL,NULL,NULL),(100,'party_group',102,'大路王村',NULL,NULL,NULL,NULL),(101,'party_group',103,'大苏村',NULL,NULL,NULL,NULL),(102,'party_group',104,'冯村',NULL,NULL,NULL,NULL),(103,'party_group',105,'河湾要村',NULL,NULL,NULL,NULL),(104,'party_group',106,'大槐树村',NULL,NULL,NULL,NULL),(105,'party_group',107,'通院村',NULL,NULL,NULL,NULL),(106,'party_group',108,'岗刘村',NULL,NULL,NULL,NULL),(107,'party_group',109,'麦仁店村',NULL,NULL,NULL,NULL),(108,'party_group',110,'周庄村',NULL,NULL,NULL,NULL),(109,'party_group',111,'新刘庄村',NULL,NULL,NULL,NULL),(110,'party_group',112,'常王村',NULL,NULL,NULL,NULL),(111,'party_group',113,'十里铺村',NULL,NULL,NULL,NULL),(112,'party_group',114,'碾陈村',NULL,NULL,NULL,NULL),(113,'party_group',115,'湾里马村',NULL,NULL,NULL,NULL),(114,'party_group',116,'老鸦刘村',NULL,NULL,NULL,NULL),(115,'party_group',118,'英内村',NULL,NULL,NULL,NULL),(116,'party_group',119,'英外村',NULL,NULL,NULL,NULL),(117,'party_group',120,'鲁湾村',NULL,NULL,NULL,NULL),(118,'party_group',121,'花桥刘村',NULL,NULL,NULL,NULL),(119,'party_group',122,'许寨村',NULL,NULL,NULL,NULL),(120,'party_group',123,'董庄村',NULL,NULL,NULL,NULL),(121,'party_group',124,'四合村',NULL,NULL,NULL,NULL),(122,'party_group',125,'仓李村',NULL,NULL,NULL,NULL),(123,'party_group',126,'仓刘村',NULL,NULL,NULL,NULL),(124,'party_group',127,'南街村',NULL,NULL,NULL,NULL),(125,'party_group',128,'北街村',NULL,NULL,NULL,NULL),(126,'party_group',129,'北关村',NULL,NULL,NULL,NULL),(127,'party_group',130,'枣陈村',NULL,NULL,NULL,NULL),(128,'party_group',131,'丁庄村',NULL,NULL,NULL,NULL),(129,'party_group',133,'纸坊村',NULL,NULL,NULL,NULL),(130,'party_group',134,'王庄村',NULL,NULL,NULL,NULL),(131,'party_group',135,'湾里河村',NULL,NULL,NULL,NULL),(132,'party_group',136,'翟胡同村',NULL,NULL,NULL,NULL),(133,'party_group',137,'陈庄村',NULL,NULL,NULL,NULL),(134,'party_group',138,'宋庄村',NULL,NULL,NULL,NULL),(135,'party_group',139,'朱曲镇西街村',NULL,NULL,NULL,NULL),(136,'party_group',140,'朱曲镇周寨村',NULL,NULL,NULL,NULL),(137,'party_group',142,'仝庄村',NULL,NULL,NULL,NULL),(138,'party_group',143,'沙沃村',NULL,NULL,NULL,NULL),(139,'party_group',144,'过庄村',NULL,NULL,NULL,NULL),(140,'party_group',145,'养马寨村',NULL,NULL,NULL,NULL),(141,'party_group',146,'刘春桃村',NULL,NULL,NULL,NULL),(142,'party_group',147,'桑树庙村',NULL,NULL,NULL,NULL),(143,'party_group',148,'张庄村',NULL,NULL,NULL,NULL),(144,'party_group',149,'老庄王村',NULL,NULL,NULL,NULL),(145,'party_group',150,'东三赵村',NULL,NULL,NULL,NULL),(146,'party_group',151,'中三赵村',NULL,NULL,NULL,NULL),(147,'party_group',152,'西三赵村',NULL,NULL,NULL,NULL),(148,'party_group',153,'湾李村',NULL,NULL,NULL,NULL),(149,'party_group',154,'关庄村',NULL,NULL,NULL,NULL),(150,'party_group',155,'裴寨村',NULL,NULL,NULL,NULL),(151,'party_group',156,'花村铺村',NULL,NULL,NULL,NULL),(152,'party_group',157,'七里河村',NULL,NULL,NULL,NULL),(153,'party_group',158,'姜庄村',NULL,NULL,NULL,NULL),(154,'party_group',159,'南街社区',NULL,NULL,NULL,NULL),(155,'party_group',160,'大西门社区',NULL,NULL,NULL,NULL),(156,'party_group',161,'南台社区',NULL,NULL,NULL,NULL),(157,'party_group',162,'寺前刘社区',NULL,NULL,NULL,NULL),(158,'party_group',163,'要庄社区',NULL,NULL,NULL,NULL),(159,'party_group',164,'后滹沱村',NULL,NULL,NULL,NULL),(160,'party_group',165,'苏堂村',NULL,NULL,NULL,NULL),(161,'party_group',166,'催湾村',NULL,NULL,NULL,NULL),(162,'party_group',167,'刘庄村',NULL,NULL,NULL,NULL),(163,'party_group',168,'赵岗村',NULL,NULL,NULL,NULL),(164,'party_group',169,'营孜村',NULL,NULL,NULL,NULL),(165,'party_group',170,'二郎庙村',NULL,NULL,NULL,NULL),(166,'party_group',171,'孟家村',NULL,NULL,NULL,NULL),(167,'party_group',172,'蔡庄村',NULL,NULL,NULL,NULL),(168,'party_group',173,'锦被岗村',NULL,NULL,NULL,NULL),(169,'party_group',174,'申庄村',NULL,NULL,NULL,NULL),(170,'party_group',175,'十八里村',NULL,NULL,NULL,NULL),(171,'party_group',176,'武家村',NULL,NULL,NULL,NULL),(172,'party_group',177,'金针村',NULL,NULL,NULL,NULL),(173,'party_group',178,'伏尚村',NULL,NULL,NULL,NULL),(174,'party_group',179,'巩家村',NULL,NULL,NULL,NULL),(175,'party_group',180,'会庄村',NULL,NULL,NULL,NULL),(176,'party_group',181,'赵庄村',NULL,NULL,NULL,NULL),(177,'party_group',182,'崔湾村',NULL,NULL,NULL,NULL),(178,'party_group',183,'万寺村',NULL,NULL,NULL,NULL),(179,'party_group',184,'孟家村',NULL,NULL,NULL,NULL),(180,'party_group',185,'凡家村',NULL,NULL,NULL,NULL),(181,'party_group',186,'黎寺村',NULL,NULL,NULL,NULL),(182,'party_group',187,'牛庄村',NULL,NULL,NULL,NULL),(183,'party_group',188,'江刘庄村',NULL,NULL,NULL,NULL),(184,'party_group',189,'邓家村',NULL,NULL,NULL,NULL),(185,'party_group',190,'周庄村',NULL,NULL,NULL,NULL),(186,'party_group',191,'王杜庄村',NULL,NULL,NULL,NULL),(187,'party_group',192,'丁家村',NULL,NULL,NULL,NULL),(188,'party_group',193,'石槽李村',NULL,NULL,NULL,NULL),(189,'party_group',194,'大王货村',NULL,NULL,NULL,NULL),(190,'party_group',195,'新代庄村',NULL,NULL,NULL,NULL),(191,'party_group',196,'小王货村',NULL,NULL,NULL,NULL),(192,'party_group',197,'杨店村',NULL,NULL,NULL,NULL),(193,'party_group',198,'郑庄村',NULL,NULL,NULL,NULL),(194,'party_group',199,'刘合集村',NULL,NULL,NULL,NULL),(195,'party_group',200,'申刘村',NULL,NULL,NULL,NULL),(196,'party_group',201,'田庄村',NULL,NULL,NULL,NULL),(197,'party_group',202,'段庄村',NULL,NULL,NULL,NULL),(198,'party_group',203,'后双庙村',NULL,NULL,NULL,NULL),(199,'party_group',204,'何楼村',NULL,NULL,NULL,NULL),(200,'party_group',205,'朱曲镇小寨村',NULL,NULL,NULL,NULL),(201,'party_group',206,'石庄村',NULL,NULL,NULL,NULL),(202,'party_group',207,'庞庄村',NULL,NULL,NULL,NULL),(203,'party_group',208,'朱曲镇菜李村',NULL,NULL,NULL,NULL),(204,'party_group',209,'庄头村',NULL,NULL,NULL,NULL),(205,'party_group',211,'王庄村',NULL,NULL,NULL,NULL),(206,'party_group',212,'岗李村',NULL,NULL,NULL,NULL),(207,'party_group',214,'袁楼村',NULL,NULL,NULL,NULL),(208,'party_group',215,'朱曲镇五村',NULL,NULL,NULL,NULL),(209,'party_group',216,'任庄村',NULL,NULL,NULL,NULL),(210,'party_group',218,'朱曲镇北街村',NULL,NULL,NULL,NULL),(211,'party_group',219,'水坡镇李牧庄村',NULL,NULL,NULL,NULL),(212,'party_group',220,'水坡镇南玮坞村',NULL,NULL,NULL,NULL),(213,'party_group',221,'冯庄村',NULL,NULL,NULL,NULL),(214,'party_group',222,'水坡镇北玮坞村',NULL,NULL,NULL,NULL),(215,'party_group',223,'水坡镇西水坡村',NULL,NULL,NULL,NULL),(216,'party_group',224,'水坡镇老李村',NULL,NULL,NULL,NULL),(217,'party_group',225,'水坡镇西杨村',NULL,NULL,NULL,NULL),(218,'party_group',226,'水坡镇肖庄村',NULL,NULL,NULL,NULL),(219,'party_group',227,'花李村',NULL,NULL,NULL,NULL),(220,'party_group',228,'水坡镇北闹店村',NULL,NULL,NULL,NULL),(221,'party_group',229,'水坡镇贾寨村',NULL,NULL,NULL,NULL),(222,'party_group',230,'水坡镇齐岗村',NULL,NULL,NULL,NULL),(223,'party_group',231,'水坡镇李寨村',NULL,NULL,NULL,NULL),(224,'party_group',232,'歇马营村',NULL,NULL,NULL,NULL),(225,'party_group',233,'水坡镇双河府村',NULL,NULL,NULL,NULL),(226,'party_group',234,'水坡镇苏桥村',NULL,NULL,NULL,NULL),(227,'party_group',235,'水坡镇马庄村',NULL,NULL,NULL,NULL),(228,'party_group',236,'水坡镇冉庄村',NULL,NULL,NULL,NULL),(229,'party_group',237,'水坡镇霍寨村',NULL,NULL,NULL,NULL),(230,'party_group',238,'水坡镇东水坡村',NULL,NULL,NULL,NULL),(231,'party_group',239,'水坡镇朱岗村',NULL,NULL,NULL,NULL),(232,'party_group',240,'大马乡大马村',NULL,NULL,NULL,NULL),(233,'party_group',242,'朱曲镇黄湖村',NULL,NULL,NULL,NULL),(234,'party_group',243,'朱曲镇苗庄村',NULL,NULL,NULL,NULL),(235,'party_group',244,'后孙村',NULL,NULL,NULL,NULL),(236,'party_group',245,'朱曲镇石桥村',NULL,NULL,NULL,NULL),(237,'party_group',246,'芦医庙村',NULL,NULL,NULL,NULL),(238,'party_group',247,'吕家村',NULL,NULL,NULL,NULL),(239,'party_group',248,'南曹村',NULL,NULL,NULL,NULL),(240,'party_group',249,'小陈村',NULL,NULL,NULL,NULL),(241,'party_group',250,'枣朱村',NULL,NULL,NULL,NULL),(242,'party_group',251,'尚王村',NULL,NULL,NULL,NULL),(243,'party_group',252,'朱曲镇东街村',NULL,NULL,NULL,NULL),(244,'party_group',253,'祥符张村',NULL,NULL,NULL,NULL),(245,'party_group',255,'椅圈马村',NULL,NULL,NULL,NULL),(246,'party_group',256,'陈村',NULL,NULL,NULL,NULL),(247,'party_group',257,'朱曲镇菜张村',NULL,NULL,NULL,NULL),(248,'party_group',258,'东凡村',NULL,NULL,NULL,NULL),(249,'party_group',259,'岗陆村',NULL,NULL,NULL,NULL),(250,'party_group',260,'前孙村',NULL,NULL,NULL,NULL),(251,'party_group',261,'荣村',NULL,NULL,NULL,NULL),(252,'party_group',262,'高寨村',NULL,NULL,NULL,NULL),(253,'party_group',263,'水坡镇仝家村',NULL,NULL,NULL,NULL),(254,'party_group',264,'水坡镇瓦岗村',NULL,NULL,NULL,NULL),(255,'party_group',265,'北曹村',NULL,NULL,NULL,NULL),(256,'party_group',266,'玉陈村',NULL,NULL,NULL,NULL),(257,'party_group',267,'代庄村',NULL,NULL,NULL,NULL),(258,'party_group',268,'高家村',NULL,NULL,NULL,NULL),(259,'party_group',269,'窝沈村',NULL,NULL,NULL,NULL),(260,'party_group',270,'后张铁村',NULL,NULL,NULL,NULL),(261,'party_group',271,'寺下沈村',NULL,NULL,NULL,NULL),(262,'party_group',272,'前张铁村',NULL,NULL,NULL,NULL),(263,'party_group',273,'孙庄村',NULL,NULL,NULL,NULL),(264,'party_group',274,'柴村',NULL,NULL,NULL,NULL),(265,'party_group',275,'靳村',NULL,NULL,NULL,NULL),(266,'party_group',277,'张同府村',NULL,NULL,NULL,NULL),(267,'party_group',278,'蒋沟村',NULL,NULL,NULL,NULL),(268,'party_group',279,'路庄村',NULL,NULL,NULL,NULL),(269,'party_group',280,'小寺村',NULL,NULL,NULL,NULL),(270,'party_group',281,'孙家村',NULL,NULL,NULL,NULL),(271,'party_group',282,'周庄村',NULL,NULL,NULL,NULL),(272,'party_group',283,'郝家村',NULL,NULL,NULL,NULL),(273,'party_group',284,'朱坡村',NULL,NULL,NULL,NULL),(274,'party_group',285,'寨黄村',NULL,NULL,NULL,NULL),(275,'party_group',286,'砖楼村',NULL,NULL,NULL,NULL),(276,'party_group',287,'许家村',NULL,NULL,NULL,NULL),(277,'party_group',288,'肖庄',NULL,NULL,NULL,NULL),(278,'party_group',289,'史家村',NULL,NULL,NULL,NULL),(279,'party_group',290,'马庄村',NULL,NULL,NULL,NULL),(280,'party_group',291,'五间房李村',NULL,NULL,NULL,NULL),(281,'party_group',292,'檀头高村',NULL,NULL,NULL,NULL),(282,'party_group',293,'丁香李村',NULL,NULL,NULL,NULL),(283,'party_group',294,'祝家村',NULL,NULL,NULL,NULL),(284,'party_group',295,'东郎村',NULL,NULL,NULL,NULL),(285,'party_group',296,'袁庄村',NULL,NULL,NULL,NULL),(286,'party_group',297,'黄集村',NULL,NULL,NULL,NULL),(287,'party_group',298,'石槽王村',NULL,NULL,NULL,NULL),(288,'party_group',300,'坟台村',NULL,NULL,NULL,NULL),(289,'party_group',301,'卢家村',NULL,NULL,NULL,NULL),(290,'party_group',302,'何庄村',NULL,NULL,NULL,NULL),(291,'party_group',303,'后郑村',NULL,NULL,NULL,NULL),(292,'party_group',304,'河沟刘村',NULL,NULL,NULL,NULL),(293,'party_group',305,'黄家村',NULL,NULL,NULL,NULL),(294,'party_group',306,'君李村 ',NULL,NULL,NULL,NULL),(295,'party_group',307,'大马乡西王村',NULL,NULL,NULL,NULL),(296,'party_group',308,'梁家村',NULL,NULL,NULL,NULL),(297,'party_group',309,'杨集村',NULL,NULL,NULL,NULL),(298,'party_group',310,'下赵村',NULL,NULL,NULL,NULL),(299,'party_group',311,'安家村',NULL,NULL,NULL,NULL),(300,'party_group',312,'马村',NULL,NULL,NULL,NULL),(301,'party_group',313,'三户赵村',NULL,NULL,NULL,NULL),(302,'party_group',314,'马庄村',NULL,NULL,NULL,NULL),(303,'party_group',315,'黑凡村',NULL,NULL,NULL,NULL),(304,'party_group',316,'凉马董村',NULL,NULL,NULL,NULL),(305,'party_group',317,'田家村',NULL,NULL,NULL,NULL),(306,'party_group',318,'大营村',NULL,NULL,NULL,NULL),(307,'party_group',319,'东戎村',NULL,NULL,NULL,NULL),(308,'party_group',320,'三石村',NULL,NULL,NULL,NULL),(309,'party_group',321,'小石村',NULL,NULL,NULL,NULL),(310,'party_group',322,'张庄村',NULL,NULL,NULL,NULL),(311,'party_group',323,'凉马胡村',NULL,NULL,NULL,NULL),(312,'party_group',324,'榆林村',NULL,NULL,NULL,NULL),(313,'party_group',325,'凉马李村',NULL,NULL,NULL,NULL),(314,'party_group',326,'貊庄村',NULL,NULL,NULL,NULL),(315,'party_group',327,'前曹村',NULL,NULL,NULL,NULL),(316,'party_group',328,'后曹村',NULL,NULL,NULL,NULL),(317,'party_group',329,'于家村',NULL,NULL,NULL,NULL),(318,'party_group',331,'文家村',NULL,NULL,NULL,NULL),(319,'party_group',333,'魏庄村',NULL,NULL,NULL,NULL),(320,'party_group',334,'刘家村',NULL,NULL,NULL,NULL),(321,'party_group',335,'老鸦田村',NULL,NULL,NULL,NULL),(322,'party_group',336,'裴家村',NULL,NULL,NULL,NULL),(323,'party_group',337,'高庙村',NULL,NULL,NULL,NULL),(324,'party_group',338,'赵迪村',NULL,NULL,NULL,NULL),(325,'party_group',339,'王家村',NULL,NULL,NULL,NULL),(326,'party_group',340,'小范村',NULL,NULL,NULL,NULL),(327,'party_group',341,'郑一村',NULL,NULL,NULL,NULL),(328,'party_group',342,'郑二村',NULL,NULL,NULL,NULL),(329,'party_group',343,'陈家村',NULL,NULL,NULL,NULL),(330,'party_group',344,'鸡王村',NULL,NULL,NULL,NULL),(331,'party_group',345,'黑高村',NULL,NULL,NULL,NULL),(332,'party_group',346,'魏家村',NULL,NULL,NULL,NULL),(333,'party_group',347,'栗林村',NULL,NULL,NULL,NULL),(334,'party_group',348,'新庄村',NULL,NULL,NULL,NULL),(335,'party_group',349,'三杨村',NULL,NULL,NULL,NULL),(336,'party_group',350,'邹家村',NULL,NULL,NULL,NULL),(337,'party_group',351,'牛家村',NULL,NULL,NULL,NULL),(338,'party_group',352,'韩集村',NULL,NULL,NULL,NULL),(339,'party_group',353,'阮家村',NULL,NULL,NULL,NULL),(340,'party_group',354,'大马乡朱庄村',NULL,NULL,NULL,NULL),(341,'party_group',355,'朱家村',NULL,NULL,NULL,NULL),(342,'party_group',356,'马家村',NULL,NULL,NULL,NULL),(343,'party_group',357,'大马乡店张村',NULL,NULL,NULL,NULL),(344,'party_group',359,'庞杨村',NULL,NULL,NULL,NULL),(345,'party_group',360,'大马乡石桥马村',NULL,NULL,NULL,NULL),(346,'party_group',361,'西郎村',NULL,NULL,NULL,NULL),(347,'party_group',362,'二家张村',NULL,NULL,NULL,NULL),(348,'party_group',363,'东黄庄村',NULL,NULL,NULL,NULL),(349,'party_group',364,'水坡镇东夹河村',NULL,NULL,NULL,NULL),(350,'party_group',365,'水坡镇李岗村',NULL,NULL,NULL,NULL),(351,'party_group',367,'后于村',NULL,NULL,NULL,NULL),(352,'party_group',368,'水坡镇彭庄村',NULL,NULL,NULL,NULL),(353,'party_group',369,'大马乡柏岗寨村',NULL,NULL,NULL,NULL),(354,'party_group',370,'前刘村',NULL,NULL,NULL,NULL),(355,'party_group',371,'水坡镇西夹河村',NULL,NULL,NULL,NULL),(356,'party_group',372,'水坡镇横堤村',NULL,NULL,NULL,NULL),(357,'party_group',373,'史桥村',NULL,NULL,NULL,NULL),(358,'party_group',374,'西黄庄村',NULL,NULL,NULL,NULL),(359,'party_group',375,'中山村',NULL,NULL,NULL,NULL),(360,'party_group',376,'大马乡李家村',NULL,NULL,NULL,NULL),(361,'party_group',377,'洼张村',NULL,NULL,NULL,NULL),(362,'party_group',378,'水坡镇盆刘村',NULL,NULL,NULL,NULL),(363,'party_group',379,'水坡镇耿庙村',NULL,NULL,NULL,NULL),(364,'party_group',380,'水坡镇海清郭村',NULL,NULL,NULL,NULL),(365,'party_group',381,'水坡镇南水坡村',NULL,NULL,NULL,NULL),(366,'party_group',384,'大马乡任泽村',NULL,NULL,NULL,NULL),(367,'party_group',385,'产业集聚区七里河村',NULL,NULL,NULL,NULL),(368,'party_group',386,'产业集聚区七里河村',NULL,NULL,NULL,NULL),(369,'party_group',387,'大马乡庙张村',NULL,NULL,NULL,NULL),(370,'party_group',388,'朱曲镇花李村',NULL,NULL,NULL,NULL),(371,'party_group',389,'凉马胡村',NULL,NULL,NULL,NULL),(372,'party_group',390,'朱曲镇仝庄村',NULL,NULL,NULL,NULL),(373,'party_group',391,'大马乡雁黄村',NULL,NULL,NULL,NULL),(374,'party_group',392,'朱曲镇双庙吴村',NULL,NULL,NULL,NULL),(375,'party_group',393,'大马乡郭家村',NULL,NULL,NULL,NULL),(376,'party_group',394,'大马乡陈石村',NULL,NULL,NULL,NULL),(377,'party_group',395,'朱曲镇山字村',NULL,NULL,NULL,NULL),(378,'party_group',396,'大马乡马古岗村',NULL,NULL,NULL,NULL),(379,'party_group',398,'大马乡双岭岗村',NULL,NULL,NULL,NULL),(380,'party_group',399,'孟家村',NULL,NULL,NULL,NULL),(381,'party_group',400,'孟家村',NULL,NULL,NULL,NULL),(382,'party_group',401,'孟家村',NULL,NULL,NULL,NULL),(383,'party_group',402,'孟家村',NULL,NULL,NULL,NULL),(384,'party_group',403,'孟家村',NULL,NULL,NULL,NULL),(385,'party_group',405,'朱曲镇胡张村',NULL,NULL,NULL,NULL),(386,'party_group',408,'朱曲镇史井村',NULL,NULL,NULL,NULL),(387,'party_group',409,'大马乡岗李村',NULL,NULL,NULL,NULL),(388,'party_group',410,'大马乡八里庙村',NULL,NULL,NULL,NULL),(389,'party_group',411,'仓王村',NULL,NULL,NULL,NULL),(390,'party_group',412,'朱曲镇窝口赵村',NULL,NULL,NULL,NULL),(391,'party_group',413,'段庄村',NULL,NULL,NULL,NULL),(392,'party_group',414,'大马乡井赵村',NULL,NULL,NULL,NULL),(393,'party_group',415,'大马乡前宫村',NULL,NULL,NULL,NULL),(394,'party_group',416,'西范庄村',NULL,NULL,NULL,NULL),(395,'party_group',418,'朱曲镇火巴张村',NULL,NULL,NULL,NULL),(396,'party_group',419,'东黎岗村',NULL,NULL,NULL,NULL),(397,'party_group',420,'西黎岗村',NULL,NULL,NULL,NULL),(398,'party_group',421,'胡家村',NULL,NULL,NULL,NULL),(399,'party_group',422,'朱曲镇黄庄村',NULL,NULL,NULL,NULL),(400,'party_group',423,'占庄村',NULL,NULL,NULL,NULL),(401,'party_group',424,'后高村',NULL,NULL,NULL,NULL),(402,'party_group',425,'马口村',NULL,NULL,NULL,NULL),(403,'party_group',426,'霍庄村',NULL,NULL,NULL,NULL),(404,'party_group',427,'前翟村',NULL,NULL,NULL,NULL),(405,'party_group',428,'冉家村',NULL,NULL,NULL,NULL),(406,'party_group',429,'袁口村',NULL,NULL,NULL,NULL),(407,'party_group',430,'水寨村',NULL,NULL,NULL,NULL),(408,'party_group',431,'黄寨村',NULL,NULL,NULL,NULL),(409,'party_group',432,'老庄师村',NULL,NULL,NULL,NULL),(410,'party_group',433,'金寨村',NULL,NULL,NULL,NULL),(411,'party_group',434,'朱曲镇刘庄村',NULL,NULL,NULL,NULL),(412,'party_group',435,'聂家村',NULL,NULL,NULL,NULL),(413,'party_group',436,'凌岗村',NULL,NULL,NULL,NULL),(414,'party_group',437,'红莲张村',NULL,NULL,NULL,NULL),(415,'party_group',438,'打车周村',NULL,NULL,NULL,NULL),(416,'party_group',439,'三柳村',NULL,NULL,NULL,NULL),(417,'party_group',440,'朱曲镇秦楼村',NULL,NULL,NULL,NULL),(418,'party_group',441,'冉村',NULL,NULL,NULL,NULL),(419,'party_group',442,'陈村',NULL,NULL,NULL,NULL),(420,'party_group',443,'朱曲镇古庄村',NULL,NULL,NULL,NULL),(421,'party_group',444,'韩佐村',NULL,NULL,NULL,NULL),(422,'party_group',445,'东范庄村',NULL,NULL,NULL,NULL),(423,'party_group',446,'王寨村',NULL,NULL,NULL,NULL),(424,'party_group',447,'大马乡后宫村',NULL,NULL,NULL,NULL),(425,'party_group',448,'刘庄村',NULL,NULL,NULL,NULL),(426,'party_group',449,'白潭村',NULL,NULL,NULL,NULL),(427,'party_group',450,'朱曲镇后赵村',NULL,NULL,NULL,NULL),(428,'party_group',451,'白楼村',NULL,NULL,NULL,NULL),(429,'party_group',452,'大马乡牛庄村',NULL,NULL,NULL,NULL),(430,'party_group',454,'刘符陈村',NULL,NULL,NULL,NULL),(431,'party_group',455,'朱曲镇陈庄村',NULL,NULL,NULL,NULL),(432,'party_group',456,'司马村',NULL,NULL,NULL,NULL),(433,'party_group',457,'大马乡马庄村',NULL,NULL,NULL,NULL),(434,'party_group',458,'台子岗村',NULL,NULL,NULL,NULL),(435,'party_group',459,'孙留村',NULL,NULL,NULL,NULL),(436,'party_group',460,'大马乡胡陈村',NULL,NULL,NULL,NULL),(437,'party_group',461,'乔寨村',NULL,NULL,NULL,NULL),(438,'party_group',462,'王楼村',NULL,NULL,NULL,NULL),(439,'party_group',463,'大马乡门张村',NULL,NULL,NULL,NULL),(440,'party_group',464,'闫岗村',NULL,NULL,NULL,NULL),(441,'party_group',465,'大马乡鲁家村',NULL,NULL,NULL,NULL),(442,'party_group',466,'朱曲镇米庄村',NULL,NULL,NULL,NULL),(443,'party_group',467,'前双村',NULL,NULL,NULL,NULL),(444,'party_group',468,'齐庄村',NULL,NULL,NULL,NULL),(445,'party_group',469,'大马乡庙陈村',NULL,NULL,NULL,NULL),(446,'party_group',470,'后双村',NULL,NULL,NULL,NULL),(447,'party_group',471,'朱曲镇山魏村',NULL,NULL,NULL,NULL),(448,'party_group',472,'大马乡周家村',NULL,NULL,NULL,NULL),(449,'party_group',473,'丁岗村',NULL,NULL,NULL,NULL),(450,'party_group',474,'吴庄村',NULL,NULL,NULL,NULL),(451,'party_group',475,'唐庄村',NULL,NULL,NULL,NULL),(452,'party_group',476,'双庄村',NULL,NULL,NULL,NULL),(453,'party_group',477,'阮庄村',NULL,NULL,NULL,NULL),(454,'party_group',478,'常岗村',NULL,NULL,NULL,NULL),(455,'party_group',479,'朱曲镇赵刘村',NULL,NULL,NULL,NULL),(456,'party_group',480,'李岗村',NULL,NULL,NULL,NULL),(457,'party_group',481,'黄岗村',NULL,NULL,NULL,NULL),(458,'party_group',483,'后杜柏村',NULL,NULL,NULL,NULL),(459,'party_group',484,'朱曲镇焦庄村',NULL,NULL,NULL,NULL),(460,'party_group',485,'中杜柏村',NULL,NULL,NULL,NULL),(461,'party_group',486,'朱曲镇卢庄村',NULL,NULL,NULL,NULL),(462,'party_group',487,'朱曲镇许官寺村',NULL,NULL,NULL,NULL),(463,'party_group',488,'门楼任村',NULL,NULL,NULL,NULL),(464,'party_group',489,'朱曲镇毛寨村',NULL,NULL,NULL,NULL),(465,'party_group',490,'陈家村',NULL,NULL,NULL,NULL),(466,'party_group',491,'赵家村',NULL,NULL,NULL,NULL),(467,'party_group',493,'大齐村',NULL,NULL,NULL,NULL),(468,'party_group',494,'郑家村',NULL,NULL,NULL,NULL),(469,'party_group',495,'赵存村',NULL,NULL,NULL,NULL),(470,'party_group',496,'李家村',NULL,NULL,NULL,NULL),(471,'party_group',497,'卜家村',NULL,NULL,NULL,NULL),(472,'party_group',498,'郭潘王村',NULL,NULL,NULL,NULL),(473,'party_group',499,'花张村',NULL,NULL,NULL,NULL),(474,'party_group',500,'闫前村',NULL,NULL,NULL,NULL),(475,'party_group',501,'新庄村',NULL,NULL,NULL,NULL),(476,'party_group',502,'闫后村',NULL,NULL,NULL,NULL),(477,'party_group',505,'南袁庄村',NULL,NULL,NULL,NULL),(478,'party_group',506,'王庄村',NULL,NULL,NULL,NULL),(479,'party_group',507,'靳老村',NULL,NULL,NULL,NULL),(480,'party_group',508,'史庄村',NULL,NULL,NULL,NULL),(481,'party_group',509,'江曲村',NULL,NULL,NULL,NULL),(482,'party_group',510,'陈家村',NULL,NULL,NULL,NULL),(483,'party_group',511,'司马村',NULL,NULL,NULL,NULL),(484,'party_group',512,'小齐村',NULL,NULL,NULL,NULL),(485,'party_group',513,'圉村',NULL,NULL,NULL,NULL),(486,'party_group',514,'西贾村',NULL,NULL,NULL,NULL),(487,'party_group',515,'东贾村',NULL,NULL,NULL,NULL),(488,'party_group',516,'后寨村',NULL,NULL,NULL,NULL),(489,'party_group',517,'睢老庄村',NULL,NULL,NULL,NULL),(490,'party_group',518,'前马村',NULL,NULL,NULL,NULL),(491,'party_group',519,'前张村',NULL,NULL,NULL,NULL),(492,'party_group',520,'前张村',NULL,NULL,NULL,NULL),(493,'party_group',521,'后马村',NULL,NULL,NULL,NULL),(494,'party_group',522,'中张村',NULL,NULL,NULL,NULL),(495,'party_group',523,'钱家村',NULL,NULL,NULL,NULL),(496,'party_group',524,'张庄村',NULL,NULL,NULL,NULL),(497,'party_group',525,'沙沃村',NULL,NULL,NULL,NULL),(498,'party_group',526,'新栗村',NULL,NULL,NULL,NULL),(499,'party_group',527,'栗林村',NULL,NULL,NULL,NULL),(500,'party_group',528,'东周杨村',NULL,NULL,NULL,NULL),(501,'party_group',529,'西周杨村',NULL,NULL,NULL,NULL),(502,'party_group',530,'文家村',NULL,NULL,NULL,NULL),(503,'party_group',531,'蔡家村',NULL,NULL,NULL,NULL),(504,'party_group',532,'蔡庄镇留石寺村',NULL,NULL,NULL,NULL),(505,'party_group',533,'蔡庄镇郑坡村',NULL,NULL,NULL,NULL),(506,'party_group',534,'蔡庄镇时村',NULL,NULL,NULL,NULL),(507,'party_group',535,'蔡庄镇南街村',NULL,NULL,NULL,NULL),(508,'party_group',537,'蔡庄镇三楼村',NULL,NULL,NULL,NULL),(509,'party_group',538,'蔡庄镇刘拐村',NULL,NULL,NULL,NULL),(510,'party_group',539,'蔡庄镇北街村',NULL,NULL,NULL,NULL),(511,'party_group',540,'蔡庄镇小张村',NULL,NULL,NULL,NULL),(512,'party_group',541,'蔡庄镇大张村',NULL,NULL,NULL,NULL),(513,'party_group',542,'蔡庄镇后黄村',NULL,NULL,NULL,NULL),(514,'party_group',543,'蔡庄镇南孟村',NULL,NULL,NULL,NULL),(515,'party_group',544,'蔡庄镇罗庄村',NULL,NULL,NULL,NULL),(516,'party_group',545,'蔡庄镇鹿村',NULL,NULL,NULL,NULL),(517,'party_group',546,'蔡庄镇北孟村',NULL,NULL,NULL,NULL),(518,'party_group',547,'蔡庄镇尚庄村',NULL,NULL,NULL,NULL),(519,'party_group',549,'庄头镇马家村',NULL,NULL,NULL,NULL),(520,'party_group',550,'蔡庄镇水台村',NULL,NULL,NULL,NULL),(521,'party_group',551,'蔡庄镇高庄村',NULL,NULL,NULL,NULL),(522,'party_group',553,'蔡庄镇吕庄村',NULL,NULL,NULL,NULL),(523,'party_group',554,'蔡庄镇前王村',NULL,NULL,NULL,NULL),(524,'party_group',555,'蔡庄镇貊寨村',NULL,NULL,NULL,NULL),(525,'party_group',556,'蔡庄镇东街村',NULL,NULL,NULL,NULL),(526,'party_group',557,'蔡庄镇西街村',NULL,NULL,NULL,NULL),(527,'party_group',558,'蔡庄镇大新庄村',NULL,NULL,NULL,NULL),(528,'party_group',559,'蔡庄镇宋庄村',NULL,NULL,NULL,NULL),(529,'party_group',560,'蔡庄镇泥张村',NULL,NULL,NULL,NULL),(530,'party_group',561,'蔡庄镇湾孙村',NULL,NULL,NULL,NULL),(531,'party_group',562,'蔡庄镇大朱村',NULL,NULL,NULL,NULL),(532,'party_group',563,'蔡庄镇香王村',NULL,NULL,NULL,NULL),(533,'party_group',564,'蔡庄镇胡新庄村',NULL,NULL,NULL,NULL),(534,'party_group',565,'蔡庄镇瑶台村',NULL,NULL,NULL,NULL),(535,'party_group',566,'蔡庄镇舍茶岗村',NULL,NULL,NULL,NULL),(536,'party_group',567,'蔡庄镇孟楼村',NULL,NULL,NULL,NULL),(537,'party_group',568,'蔡庄镇蛮杨村',NULL,NULL,NULL,NULL),(538,'party_group',569,'蔡庄镇东安头村',NULL,NULL,NULL,NULL),(539,'party_group',570,'蔡庄镇西安头村',NULL,NULL,NULL,NULL),(540,'party_group',571,'蔡庄镇刘庄村',NULL,NULL,NULL,NULL),(541,'party_group',572,'蔡庄镇隗村',NULL,NULL,NULL,NULL),(542,'party_group',573,'蔡庄镇马湾村',NULL,NULL,NULL,NULL),(543,'party_group',574,'蔡庄镇高庙寨村',NULL,NULL,NULL,NULL),(544,'party_group',575,'蔡庄镇郭庄村',NULL,NULL,NULL,NULL),(545,'party_group',577,'小寨村',NULL,NULL,NULL,NULL),(546,'party_group',579,'石潭村',NULL,NULL,NULL,NULL),(547,'party_group',580,'前大庄村',NULL,NULL,NULL,NULL),(548,'party_group',581,'张市村',NULL,NULL,NULL,NULL),(549,'party_group',582,'坡庄村',NULL,NULL,NULL,NULL),(550,'party_group',583,'后大庄村',NULL,NULL,NULL,NULL),(551,'party_group',584,'吴岗村',NULL,NULL,NULL,NULL),(552,'party_group',585,'老集村',NULL,NULL,NULL,NULL),(553,'party_group',586,'王老村',NULL,NULL,NULL,NULL),(554,'party_group',587,'陆口村',NULL,NULL,NULL,NULL),(555,'party_group',588,'孔庄村',NULL,NULL,NULL,NULL),(556,'party_group',589,'刘庄村',NULL,NULL,NULL,NULL),(557,'party_group',590,'崔庄村',NULL,NULL,NULL,NULL),(558,'party_group',591,'尹庄村',NULL,NULL,NULL,NULL),(559,'party_group',592,'边岗村',NULL,NULL,NULL,NULL),(560,'party_group',593,'郭家村',NULL,NULL,NULL,NULL),(561,'party_group',594,'南谢村',NULL,NULL,NULL,NULL),(562,'party_group',595,'北谢村',NULL,NULL,NULL,NULL),(563,'party_group',596,'郑岗村',NULL,NULL,NULL,NULL),(564,'party_group',597,'东万村',NULL,NULL,NULL,NULL),(565,'party_group',598,'西万村',NULL,NULL,NULL,NULL),(566,'party_group',599,'沈家村',NULL,NULL,NULL,NULL),(567,'party_group',600,'沙门村',NULL,NULL,NULL,NULL),(568,'party_group',601,'冯岗村',NULL,NULL,NULL,NULL),(569,'party_group',602,'高庄村',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_group`
--

DROP TABLE IF EXISTS `party_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_group` (
  `pg_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `pinyin_name` varchar(50) DEFAULT NULL,
  `num_employees` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pg_id`),
  KEY `FK_jr3` (`party_id`),
  CONSTRAINT `FK_jr3` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_group`
--

LOCK TABLES `party_group` WRITE;
/*!40000 ALTER TABLE `party_group` DISABLE KEYS */;
INSERT INTO `party_group` VALUES (1,1,'尉氏县','wsx',NULL,'尉氏县','',NULL,'2016-02-18 00:28:36',NULL,-2),(2,2,'尉氏县党委','wsxdw',100,'尉氏县党委','123114',NULL,'2016-02-18 00:28:43',NULL,-2),(6,8,'产业聚集区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,9,'十八里镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,10,'南曹乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,11,'城关镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,12,'大桥乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,13,'大营乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,14,'大营镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,15,'大马乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,16,'小陈乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,17,'岗李乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,18,'庄头镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,19,'张市镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,20,'新尉园区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,21,'朱曲镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,22,'水坡镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,23,'永兴镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,24,'洧川镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,25,'蔡庄镇',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,26,'邢庄乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,27,'门楼任乡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,39,'七里头村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,40,'尹庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,41,'芦馆村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,42,'大营村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,43,'梅庄社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,44,'席苏村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,45,'郝寺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,46,'坡徐村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,47,'张寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,48,'要家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,49,'牛集村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,50,'寄庄王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,51,'小西门社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,52,'寺前张社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,53,'南闹店村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,54,'小营村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,55,'马庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,56,'前滹沱村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,57,'东街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,58,'西街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,59,'小东门社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,60,'斗虎营社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,61,'鳌头吕村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,62,'三李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,63,'邢庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,64,'芦墓张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,65,'朱曲镇东街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,66,'蜜蜂赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,67,'董庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,68,'韩庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,69,'葛庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,70,'尚村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,71,'史庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,72,'北丁庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,73,'郭佛村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,74,'安庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,75,'芦馆村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,76,'芦馆村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,77,'屈楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,78,'水黄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,79,'烧酒胡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,80,'明家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,81,'付李庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,82,'大庙杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,83,'赵庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,84,'拐杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,85,'簸箕任村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,86,'岳家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,87,'雷家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,88,'郭新庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,89,'甄家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,90,'王响村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,91,'新庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,92,'大桥村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,93,'大李庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,94,'马庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,95,'许庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,96,'崔家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,97,'孔家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,98,'要井村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,99,'岗东村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,100,'大路王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,101,'大苏村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,102,'冯村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,103,'河湾要村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,104,'大槐树村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,105,'通院村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,106,'岗刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,107,'麦仁店村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,108,'周庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(107,109,'新刘庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,110,'常王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,111,'十里铺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,112,'碾陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,113,'湾里马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,114,'老鸦刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,115,'英内村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,116,'英外村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,117,'鲁湾村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,118,'花桥刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,119,'许寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,120,'董庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,121,'四合村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,122,'仓李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,123,'仓刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,124,'南街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,125,'北街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,126,'北关村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,127,'枣陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,128,'丁庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,129,'纸坊村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,130,'王庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(129,131,'湾里河村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,132,'翟胡同村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,133,'陈庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,134,'宋庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,135,'朱曲镇西街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,136,'朱曲镇周寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,137,'仝庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,138,'沙沃村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,139,'过庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,140,'养马寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,141,'刘春桃村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,142,'桑树庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,143,'张庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,144,'老庄王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,145,'东三赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,146,'中三赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,147,'西三赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,148,'湾李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,149,'关庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,150,'裴寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,151,'花村铺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,152,'七里河村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,153,'姜庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,154,'南街社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,155,'大西门社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,156,'南台社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,157,'寺前刘社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,158,'要庄社区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,159,'后滹沱村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,160,'苏堂村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,161,'催湾村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,162,'刘庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,163,'赵岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,164,'营孜村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,165,'二郎庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,166,'孟家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,167,'蔡庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,168,'锦被岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,169,'申庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(168,170,'十八里村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(169,171,'武家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,172,'金针村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,173,'伏尚村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,174,'巩家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,175,'会庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,176,'赵庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,177,'崔湾村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,178,'万寺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,179,'孟家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(178,180,'凡家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,181,'黎寺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,182,'牛庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,183,'江刘庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,184,'邓家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,185,'周庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,186,'王杜庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,187,'丁家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,188,'石槽李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(187,189,'大王货村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,190,'新代庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,191,'小王货村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(190,192,'杨店村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(191,193,'郑庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,194,'刘合集村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,195,'申刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,196,'田庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,197,'段庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,198,'后双庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,199,'何楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,200,'朱曲镇小寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(199,201,'石庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,202,'庞庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,203,'朱曲镇菜李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,204,'庄头村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,205,'王庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,206,'岗李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(205,207,'袁楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(206,208,'朱曲镇五村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,209,'任庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(208,210,'朱曲镇北街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(209,211,'水坡镇李牧庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(210,212,'水坡镇南玮坞村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,213,'冯庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,214,'水坡镇北玮坞村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,215,'水坡镇西水坡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,216,'水坡镇老李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,217,'水坡镇西杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,218,'水坡镇肖庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,219,'花李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,220,'水坡镇北闹店村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,221,'水坡镇贾寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,222,'水坡镇齐岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,223,'水坡镇李寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,224,'歇马营村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,225,'水坡镇双河府村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,226,'水坡镇苏桥村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,227,'水坡镇马庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,228,'水坡镇冉庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,229,'水坡镇霍寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,230,'水坡镇东水坡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,231,'水坡镇朱岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,232,'大马乡大马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,233,'朱曲镇黄湖村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,234,'朱曲镇苗庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,235,'后孙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,236,'朱曲镇石桥村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,237,'芦医庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,238,'吕家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,239,'南曹村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(238,240,'小陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(239,241,'枣朱村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(240,242,'尚王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,243,'朱曲镇东街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(242,244,'祥符张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(243,245,'椅圈马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,246,'陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(245,247,'朱曲镇菜张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(246,248,'东凡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(247,249,'岗陆村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(248,250,'前孙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,251,'荣村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,252,'高寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(251,253,'水坡镇仝家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,254,'水坡镇瓦岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(253,255,'北曹村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,256,'玉陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(255,257,'代庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(256,258,'高家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(257,259,'窝沈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(258,260,'后张铁村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(259,261,'寺下沈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(260,262,'前张铁村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,263,'孙庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,264,'柴村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,265,'靳村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(264,266,'张同府村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(265,267,'蒋沟村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(266,268,'路庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(267,269,'小寺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(268,270,'孙家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(269,271,'周庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(270,272,'郝家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(271,273,'朱坡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,274,'寨黄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,275,'砖楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(274,276,'许家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(275,277,'肖庄',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(276,278,'史家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(277,279,'马庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(278,280,'五间房李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(279,281,'檀头高村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(280,282,'丁香李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(281,283,'祝家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(282,284,'东郎村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(283,285,'袁庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(284,286,'黄集村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(285,287,'石槽王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(286,288,'坟台村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(287,289,'卢家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(288,290,'何庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(289,291,'后郑村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(290,292,'河沟刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(291,293,'黄家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(292,294,'君李村 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(293,295,'大马乡西王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(294,296,'梁家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(295,297,'杨集村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(296,298,'下赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(297,299,'安家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(298,300,'马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(299,301,'三户赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(300,302,'马庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(301,303,'黑凡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(302,304,'凉马董村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(303,305,'田家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(304,306,'大营村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(305,307,'东戎村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(306,308,'三石村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(307,309,'小石村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(308,310,'张庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(309,311,'凉马胡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(310,312,'榆林村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(311,313,'凉马李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,314,'貊庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,315,'前曹村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,316,'后曹村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(315,317,'于家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(316,318,'文家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(317,319,'魏庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(318,320,'刘家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(319,321,'老鸦田村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(320,322,'裴家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,323,'高庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,324,'赵迪村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,325,'王家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,326,'小范村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(325,327,'郑一村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(326,328,'郑二村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(327,329,'陈家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(328,330,'鸡王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(329,331,'黑高村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(330,332,'魏家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,333,'栗林村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,334,'新庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,335,'三杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,336,'邹家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(335,337,'牛家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(336,338,'韩集村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(337,339,'阮家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(338,340,'大马乡朱庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(339,341,'朱家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(340,342,'马家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(341,343,'大马乡店张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(342,344,'庞杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(343,345,'大马乡石桥马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(344,346,'西郎村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(345,347,'二家张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(346,348,'东黄庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(347,349,'水坡镇东夹河村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(348,350,'水坡镇李岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(349,351,'后于村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(350,352,'水坡镇彭庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(351,353,'大马乡柏岗寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(352,354,'前刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(353,355,'水坡镇西夹河村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,356,'水坡镇横堤村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(355,357,'史桥村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(356,358,'西黄庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(357,359,'中山村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(358,360,'大马乡李家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(359,361,'洼张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(360,362,'水坡镇盆刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(361,363,'水坡镇耿庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(362,364,'水坡镇海清郭村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(363,365,'水坡镇南水坡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(364,366,'大马乡任泽村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(365,367,'产业集聚区七里河村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(366,368,'产业集聚区七里河村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(367,369,'大马乡庙张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(368,370,'朱曲镇花李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(369,371,'凉马胡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(370,372,'朱曲镇仝庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(371,373,'大马乡雁黄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(372,374,'朱曲镇双庙吴村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(373,375,'大马乡郭家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(374,376,'大马乡陈石村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(375,377,'朱曲镇山字村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(376,378,'大马乡马古岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(377,379,'大马乡双岭岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(378,380,'孟家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(379,381,'孟家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(380,382,'孟家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(381,383,'孟家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(382,384,'孟家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(383,385,'朱曲镇胡张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(384,386,'朱曲镇史井村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(385,387,'大马乡岗李村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(386,388,'大马乡八里庙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(387,389,'仓王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(388,390,'朱曲镇窝口赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(389,391,'段庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(390,392,'大马乡井赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(391,393,'大马乡前宫村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(392,394,'西范庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(393,395,'朱曲镇火巴张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(394,396,'东黎岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(395,397,'西黎岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(396,398,'胡家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(397,399,'朱曲镇黄庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(398,400,'占庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(399,401,'后高村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(400,402,'马口村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(401,403,'霍庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(402,404,'前翟村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(403,405,'冉家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(404,406,'袁口村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(405,407,'水寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(406,408,'黄寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(407,409,'老庄师村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(408,410,'金寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(409,411,'朱曲镇刘庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(410,412,'聂家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(411,413,'凌岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,414,'红莲张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,415,'打车周村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,416,'三柳村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(415,417,'朱曲镇秦楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(416,418,'冉村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(417,419,'陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(418,420,'朱曲镇古庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(419,421,'韩佐村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(420,422,'东范庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,423,'王寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,424,'大马乡后宫村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,425,'刘庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,426,'白潭村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(425,427,'朱曲镇后赵村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(426,428,'白楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(427,429,'大马乡牛庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(428,430,'刘符陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,431,'朱曲镇陈庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(430,432,'司马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,433,'大马乡马庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,434,'台子岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,435,'孙留村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,436,'大马乡胡陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(435,437,'乔寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(436,438,'王楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(437,439,'大马乡门张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(438,440,'闫岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(439,441,'大马乡鲁家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(440,442,'朱曲镇米庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(441,443,'前双村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(442,444,'齐庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(443,445,'大马乡庙陈村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(444,446,'后双村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(445,447,'朱曲镇山魏村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(446,448,'大马乡周家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(447,449,'丁岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(448,450,'吴庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(449,451,'唐庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(450,452,'双庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(451,453,'阮庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(452,454,'常岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(453,455,'朱曲镇赵刘村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(454,456,'李岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(455,457,'黄岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(456,458,'后杜柏村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(457,459,'朱曲镇焦庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(458,460,'中杜柏村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(459,461,'朱曲镇卢庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(460,462,'朱曲镇许官寺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(461,463,'门楼任村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(462,464,'朱曲镇毛寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(463,465,'陈家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(464,466,'赵家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,467,'大齐村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(466,468,'郑家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(467,469,'赵存村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(468,470,'李家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(469,471,'卜家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(470,472,'郭潘王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(471,473,'花张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(472,474,'闫前村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(473,475,'新庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(474,476,'闫后村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(475,477,'南袁庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(476,478,'王庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(477,479,'靳老村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(478,480,'史庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(479,481,'江曲村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(480,482,'陈家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,483,'司马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,484,'小齐村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(483,485,'圉村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(484,486,'西贾村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(485,487,'东贾村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(486,488,'后寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(487,489,'睢老庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(488,490,'前马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(489,491,'前张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(490,492,'前张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(491,493,'后马村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(492,494,'中张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(493,495,'钱家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(494,496,'张庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(495,497,'沙沃村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(496,498,'新栗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(497,499,'栗林村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(498,500,'东周杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(499,501,'西周杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(500,502,'文家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(501,503,'蔡家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(502,504,'蔡庄镇留石寺村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(503,505,'蔡庄镇郑坡村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(504,506,'蔡庄镇时村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(505,507,'蔡庄镇南街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(506,508,'蔡庄镇三楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(507,509,'蔡庄镇刘拐村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(508,510,'蔡庄镇北街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(509,511,'蔡庄镇小张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(510,512,'蔡庄镇大张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,513,'蔡庄镇后黄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,514,'蔡庄镇南孟村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,515,'蔡庄镇罗庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,516,'蔡庄镇鹿村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(515,517,'蔡庄镇北孟村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(516,518,'蔡庄镇尚庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(517,519,'庄头镇马家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(518,520,'蔡庄镇水台村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(519,521,'蔡庄镇高庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(520,522,'蔡庄镇吕庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,523,'蔡庄镇前王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,524,'蔡庄镇貊寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,525,'蔡庄镇东街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,526,'蔡庄镇西街村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(525,527,'蔡庄镇大新庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(526,528,'蔡庄镇宋庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(527,529,'蔡庄镇泥张村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(528,530,'蔡庄镇湾孙村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(529,531,'蔡庄镇大朱村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(530,532,'蔡庄镇香王村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,533,'蔡庄镇胡新庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,534,'蔡庄镇瑶台村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,535,'蔡庄镇舍茶岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,536,'蔡庄镇孟楼村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(535,537,'蔡庄镇蛮杨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(536,538,'蔡庄镇东安头村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(537,539,'蔡庄镇西安头村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(538,540,'蔡庄镇刘庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(539,541,'蔡庄镇隗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(540,542,'蔡庄镇马湾村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(541,543,'蔡庄镇高庙寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(542,544,'蔡庄镇郭庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(543,545,'小寨村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(544,546,'石潭村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(545,547,'前大庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(546,548,'张市村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(547,549,'坡庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(548,550,'后大庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(549,551,'吴岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(550,552,'老集村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(551,553,'王老村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(552,554,'陆口村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(553,555,'孔庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(554,556,'刘庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(555,557,'崔庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(556,558,'尹庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(557,559,'边岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(558,560,'郭家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(559,561,'南谢村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(560,562,'北谢村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(561,563,'郑岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(562,564,'东万村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(563,565,'西万村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(564,566,'沈家村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(565,567,'沙门村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(566,568,'冯岗村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(567,569,'高庄村',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `party_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_relationship`
--

DROP TABLE IF EXISTS `party_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_relationship` (
  `party_relationship_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_relationship_type_id` bigint(20) DEFAULT NULL,
  `party_id_from` bigint(20) DEFAULT NULL,
  `party_id_to` bigint(20) DEFAULT NULL,
  `role_type_id_from` bigint(20) DEFAULT NULL,
  `role_type_id_to` bigint(20) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `thru_date` date DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`party_relationship_id`),
  KEY `FK_jr9` (`party_relationship_type_id`),
  CONSTRAINT `FK_jr9` FOREIGN KEY (`party_relationship_type_id`) REFERENCES `party_relationship_type` (`party_relationship_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_relationship`
--

LOCK TABLES `party_relationship` WRITE;
/*!40000 ALTER TABLE `party_relationship` DISABLE KEYS */;
INSERT INTO `party_relationship` VALUES (1,1,1,2,1,1,'2015-08-08',NULL,0,'2015-08-08 18:33:35',NULL,-2,NULL),(2,1,1,3,1,1,'2015-08-25',NULL,0,'2015-08-25 15:27:27',NULL,-2,NULL),(3,1,1,4,1,1,'2015-09-03',NULL,0,'2015-09-03 23:33:37',NULL,-2,NULL),(4,1,3,5,1,1,'2015-09-03',NULL,0,'2015-09-03 23:34:24',NULL,-2,NULL),(5,1,4,6,1,1,'2015-09-03',NULL,0,'2015-09-03 23:34:44',NULL,-2,NULL),(8,2,2,5,1,1,'2015-09-05',NULL,0,'2015-09-05 16:29:25',NULL,-2,NULL),(9,2,2,6,1,1,'2015-09-05',NULL,0,'2015-09-05 16:34:51',NULL,-2,NULL),(10,1,2,7,1,1,'2015-09-05',NULL,0,'2015-09-05 19:45:04',NULL,10,NULL),(11,1,1,8,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(12,1,1,9,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(13,1,1,10,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(14,1,1,11,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(15,1,1,12,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(16,1,1,13,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(17,1,1,14,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(18,1,1,15,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(19,1,1,16,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(20,1,1,17,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(21,1,1,18,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(22,1,1,19,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(23,1,1,20,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(24,1,1,21,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(25,1,1,22,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(26,1,1,23,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(27,1,1,24,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(28,1,1,25,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(29,1,1,26,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(30,1,1,27,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(42,1,9,55,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(43,1,9,56,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(44,1,11,43,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(45,1,11,51,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(46,1,11,52,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(47,1,11,59,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(48,1,11,60,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(49,1,12,44,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(50,1,12,92,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(51,1,12,93,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(52,1,12,94,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(53,1,12,95,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(54,1,12,96,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(55,1,12,97,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(56,1,12,98,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(57,1,12,99,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(58,1,12,100,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(59,1,12,101,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(60,1,12,102,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(61,1,12,103,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(62,1,12,104,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(63,1,12,105,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(64,1,12,106,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(65,1,12,107,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(66,1,12,108,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(67,1,12,109,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(68,1,12,110,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(69,1,12,111,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(70,1,12,112,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(71,1,12,113,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(72,1,12,114,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(73,1,13,42,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(74,1,18,54,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(75,1,21,65,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(76,1,22,46,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(77,1,22,47,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(78,1,22,49,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(79,1,22,53,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(80,1,24,57,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(81,1,24,58,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(82,1,24,115,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(83,1,24,116,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(84,1,24,117,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(85,1,24,118,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(86,1,24,119,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(87,1,24,120,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(88,1,24,121,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(89,1,24,122,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(90,1,26,39,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(91,1,26,40,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(92,1,26,41,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(93,1,26,61,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(94,1,26,62,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(95,1,26,63,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(96,1,26,64,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(97,1,26,66,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(98,1,26,67,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(99,1,26,68,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(100,1,26,69,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(101,1,26,70,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(102,1,26,71,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(103,1,26,72,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(104,1,26,73,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(105,1,26,74,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(106,1,26,75,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(107,1,26,76,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(108,1,26,77,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(109,1,26,78,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(110,1,26,79,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(111,1,26,80,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(112,1,26,81,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(113,1,26,82,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(114,1,26,83,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(115,1,26,84,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(116,1,26,85,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(117,1,26,86,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(118,1,26,87,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(119,1,26,88,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(120,1,26,89,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(121,1,26,90,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(122,1,26,91,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(123,1,27,45,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(124,1,27,48,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(125,1,27,50,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(126,1,8,151,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(127,1,8,152,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(128,1,8,153,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(129,1,8,154,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(130,1,8,155,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(131,1,8,156,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(132,1,8,157,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(133,1,8,158,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(134,1,9,159,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(135,1,9,160,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(136,1,9,161,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(137,1,9,162,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(138,1,9,163,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(139,1,9,164,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(140,1,9,165,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(141,1,9,166,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(142,1,9,167,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(143,1,9,168,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(144,1,9,169,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(145,1,9,170,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(146,1,9,171,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(147,1,9,172,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(148,1,9,173,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(149,1,9,174,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(150,1,9,175,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(151,1,9,176,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(152,1,9,177,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(153,1,9,178,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(154,1,9,179,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(155,1,9,180,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(156,1,9,181,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(157,1,9,182,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(158,1,9,183,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(159,1,9,184,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(160,1,9,185,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(161,1,9,186,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(162,1,9,187,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(163,1,9,188,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(164,1,9,189,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(165,1,9,190,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(166,1,9,191,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(167,1,17,193,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(168,1,17,194,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(169,1,17,195,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(170,1,17,196,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(171,1,17,197,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(172,1,17,199,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(173,1,17,201,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(174,1,17,202,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(175,1,17,205,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(176,1,17,206,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(177,1,18,204,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(178,1,21,135,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(179,1,21,136,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(180,1,21,200,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(181,1,21,203,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(182,1,22,192,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(183,1,23,198,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(184,1,24,123,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(185,1,24,124,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(186,1,24,125,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(187,1,24,126,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(188,1,24,127,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(189,1,24,128,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(190,1,24,129,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(191,1,24,130,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(192,1,24,131,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(193,1,24,132,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(194,1,24,133,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(195,1,24,134,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(196,1,24,137,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(197,1,24,138,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(198,1,24,139,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(199,1,24,140,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(200,1,24,141,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(201,1,24,142,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(202,1,24,143,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(203,1,24,144,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(204,1,24,145,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(205,1,24,146,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(206,1,24,147,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(207,1,24,148,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(208,1,24,149,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(209,1,24,150,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(210,1,10,213,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(211,1,10,235,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(212,1,10,239,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(213,1,10,250,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(214,1,10,251,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(215,1,10,255,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(216,1,10,257,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(217,1,10,260,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(218,1,10,262,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(219,1,10,265,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(220,1,10,267,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(221,1,10,269,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(222,1,10,271,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(223,1,10,273,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(224,1,10,275,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(225,1,10,284,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(226,1,10,288,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(227,1,10,290,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(228,1,14,256,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(229,1,14,270,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(230,1,14,272,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(231,1,14,274,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(232,1,14,276,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(233,1,14,278,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(234,1,14,280,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(235,1,14,281,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(236,1,14,282,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(237,1,14,283,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(238,1,14,286,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(239,1,14,287,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(240,1,14,289,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(241,1,15,232,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(242,1,16,240,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(243,1,17,207,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(244,1,17,209,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(245,1,17,219,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(246,1,17,259,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(247,1,17,261,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(248,1,17,264,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(249,1,17,266,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(250,1,17,268,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(251,1,17,277,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(252,1,17,279,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(253,1,17,285,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(254,1,18,224,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(255,1,18,252,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(256,1,18,258,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(257,1,18,263,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(258,1,20,237,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(259,1,20,238,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(260,1,20,241,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(261,1,20,242,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(262,1,20,244,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(263,1,20,245,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(264,1,20,246,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(265,1,20,248,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(266,1,20,249,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(267,1,21,208,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(268,1,21,210,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(269,1,21,233,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(270,1,21,234,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(271,1,21,236,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(272,1,21,243,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(273,1,21,247,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(274,1,22,211,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(275,1,22,212,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(276,1,22,214,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(277,1,22,215,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(278,1,22,216,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(279,1,22,217,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(280,1,22,218,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(281,1,22,220,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(282,1,22,221,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(283,1,22,222,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(284,1,22,223,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(285,1,22,225,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(286,1,22,226,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(287,1,22,227,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(288,1,22,228,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(289,1,22,229,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(290,1,22,230,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(291,1,22,231,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(292,1,22,253,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(293,1,22,254,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(294,1,8,367,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(295,1,8,368,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(296,1,9,342,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(297,1,10,292,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(298,1,10,300,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(299,1,10,302,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(300,1,10,304,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(301,1,10,311,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(302,1,10,313,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(303,1,10,314,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(304,1,10,319,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(305,1,10,346,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(306,1,10,348,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(307,1,10,351,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(308,1,10,354,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(309,1,10,357,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(310,1,10,358,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(311,1,10,359,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(312,1,10,361,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(313,1,10,371,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(314,1,14,291,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(315,1,14,293,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(316,1,14,294,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(317,1,14,296,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(318,1,14,297,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(319,1,14,298,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(320,1,14,299,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(321,1,14,301,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(322,1,14,303,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(323,1,14,306,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(324,1,15,295,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(325,1,15,340,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(326,1,15,343,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(327,1,15,345,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(328,1,15,353,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(329,1,15,360,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(330,1,15,366,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(331,1,15,369,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(332,1,15,373,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(333,1,17,307,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(334,1,17,308,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(335,1,17,309,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(336,1,17,310,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(337,1,17,312,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(338,1,18,305,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(339,1,18,315,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(340,1,18,316,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(341,1,18,317,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(342,1,18,318,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(343,1,18,320,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(344,1,18,321,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(345,1,18,322,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(346,1,18,323,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(347,1,18,324,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(348,1,18,325,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(349,1,18,326,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(350,1,18,327,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(351,1,18,328,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(352,1,18,329,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(353,1,18,330,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(354,1,18,331,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(355,1,18,332,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(356,1,18,333,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(357,1,18,334,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(358,1,18,335,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(359,1,18,336,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(360,1,18,337,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(361,1,18,338,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(362,1,18,339,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(363,1,18,341,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(364,1,18,344,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(365,1,18,347,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(366,1,21,370,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(367,1,21,372,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(368,1,21,374,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(369,1,22,349,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(370,1,22,350,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(371,1,22,352,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(372,1,22,355,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(373,1,22,356,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(374,1,22,362,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(375,1,22,363,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(376,1,22,364,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(377,1,22,365,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(378,1,9,380,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(379,1,9,381,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(380,1,9,382,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(381,1,9,383,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(382,1,9,384,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(383,1,9,389,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(384,1,15,375,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(385,1,15,376,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(386,1,15,378,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(387,1,15,379,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(388,1,15,387,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(389,1,15,388,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(390,1,15,392,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(391,1,15,393,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(392,1,15,424,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(393,1,15,429,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(394,1,15,433,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(395,1,15,436,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(396,1,15,439,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(397,1,15,441,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(398,1,15,445,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(399,1,15,448,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(400,1,16,453,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(401,1,17,398,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(402,1,17,400,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(403,1,17,403,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(404,1,17,405,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(405,1,17,407,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(406,1,17,409,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(407,1,17,412,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(408,1,17,414,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(409,1,17,415,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(410,1,17,418,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(411,1,17,421,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(412,1,17,425,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(413,1,21,377,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(414,1,21,385,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(415,1,21,386,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(416,1,21,390,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(417,1,21,395,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(418,1,21,399,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(419,1,21,411,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(420,1,21,417,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(421,1,21,420,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(422,1,21,427,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(423,1,21,431,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(424,1,21,442,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(425,1,21,447,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(426,1,21,455,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(427,1,23,391,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(428,1,23,394,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(429,1,23,396,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(430,1,23,397,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(431,1,23,401,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(432,1,23,402,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(433,1,23,404,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(434,1,23,406,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(435,1,23,408,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(436,1,23,410,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(437,1,23,413,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(438,1,23,416,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(439,1,23,419,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(440,1,23,422,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(441,1,23,423,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(442,1,23,426,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(443,1,23,428,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(444,1,23,430,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(445,1,23,432,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(446,1,23,434,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(447,1,23,435,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(448,1,23,437,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(449,1,23,438,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(450,1,23,440,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(451,1,23,443,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(452,1,23,446,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(453,1,23,449,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(454,1,23,450,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(455,1,23,451,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(456,1,23,454,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(457,1,23,456,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(458,1,23,457,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(459,1,23,458,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(460,1,27,444,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(461,1,27,452,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(462,1,16,467,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(463,1,16,477,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(464,1,16,478,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(465,1,16,479,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(466,1,16,480,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(467,1,16,481,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(468,1,16,482,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(469,1,16,483,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(470,1,16,484,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(471,1,16,485,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(472,1,16,486,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(473,1,16,487,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(474,1,16,488,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(475,1,16,489,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(476,1,16,490,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(477,1,16,491,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(478,1,16,492,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(479,1,16,493,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(480,1,16,494,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(481,1,18,519,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(482,1,21,459,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(483,1,21,461,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(484,1,21,462,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(485,1,21,464,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(486,1,23,460,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(487,1,25,504,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(488,1,25,505,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(489,1,25,506,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(490,1,25,507,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(491,1,25,508,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(492,1,25,509,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(493,1,25,510,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(494,1,25,511,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(495,1,25,512,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(496,1,25,513,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(497,1,25,514,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(498,1,25,515,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(499,1,25,516,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(500,1,25,517,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(501,1,25,518,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(502,1,25,520,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(503,1,25,521,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(504,1,25,522,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(505,1,25,523,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(506,1,25,524,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(507,1,25,525,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(508,1,25,526,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(509,1,25,527,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(510,1,25,528,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(511,1,25,529,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(512,1,25,530,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(513,1,25,531,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(514,1,25,532,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(515,1,25,533,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(516,1,25,534,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(517,1,25,535,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(518,1,25,536,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(519,1,25,537,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(520,1,25,538,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(521,1,25,539,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(522,1,25,540,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(523,1,25,541,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(524,1,25,542,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(525,1,27,463,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(526,1,27,465,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(527,1,27,466,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(528,1,27,468,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(529,1,27,469,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(530,1,27,470,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(531,1,27,471,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(532,1,27,472,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(533,1,27,473,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(534,1,27,474,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(535,1,27,475,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(536,1,27,476,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(537,1,27,495,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(538,1,27,496,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(539,1,27,497,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(540,1,27,498,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(541,1,27,499,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(542,1,27,500,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(543,1,27,501,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(544,1,27,502,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(545,1,27,503,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(546,1,19,545,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(547,1,19,546,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(548,1,19,547,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(549,1,19,548,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(550,1,19,549,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(551,1,19,550,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(552,1,19,551,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(553,1,19,552,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(554,1,19,553,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(555,1,19,554,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(556,1,19,555,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(557,1,19,556,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(558,1,19,557,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(559,1,19,558,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(560,1,19,559,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(561,1,19,560,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(562,1,19,561,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(563,1,19,562,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(564,1,19,563,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(565,1,19,564,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(566,1,19,565,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(567,1,19,566,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(568,1,19,567,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(569,1,19,568,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(570,1,19,569,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(571,1,25,543,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL),(572,1,25,544,1,1,'2015-09-03',NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `party_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_relationship_type`
--

DROP TABLE IF EXISTS `party_relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_relationship_type` (
  `party_relationship_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `has_table` int(11) DEFAULT NULL,
  `party_relationship_name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role_type_valid_from` varchar(100) DEFAULT NULL,
  `role_type_valid_to` varchar(100) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`party_relationship_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_relationship_type`
--

LOCK TABLES `party_relationship_type` WRITE;
/*!40000 ALTER TABLE `party_relationship_type` DISABLE KEYS */;
INSERT INTO `party_relationship_type` VALUES (1,NULL,NULL,'组织结构关系','组织结构上下级关系','1','1',NULL,NULL,NULL,NULL),(2,NULL,NULL,'供货商客户关系','供货商客户关系','1','1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `party_relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_role`
--

DROP TABLE IF EXISTS `party_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_role` (
  `pr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_id` bigint(20) DEFAULT NULL,
  `role_type_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `FK_jr4` (`role_type_id`),
  KEY `FK_jr6` (`party_id`),
  CONSTRAINT `FK_jr4` FOREIGN KEY (`role_type_id`) REFERENCES `role_type` (`role_type_id`),
  CONSTRAINT `FK_jr6` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1063 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_role`
--

LOCK TABLES `party_role` WRITE;
/*!40000 ALTER TABLE `party_role` DISABLE KEYS */;
INSERT INTO `party_role` VALUES (1,1,1,'2015-08-08 17:48:43',NULL,-2,NULL),(2,2,1,'2015-08-08 18:33:35',NULL,-2,NULL),(3,3,1,'2015-08-25 15:27:27',NULL,-2,NULL),(4,4,1,'2015-09-03 23:33:37',NULL,-2,NULL),(5,5,1,'2015-09-03 23:34:24',NULL,-2,NULL),(6,6,1,'2015-09-03 23:34:44',NULL,-2,NULL),(7,7,1,'2015-09-05 19:45:04',NULL,10,NULL),(8,8,1,NULL,NULL,NULL,NULL),(9,9,1,NULL,NULL,NULL,NULL),(10,10,1,NULL,NULL,NULL,NULL),(11,11,1,NULL,NULL,NULL,NULL),(12,12,1,NULL,NULL,NULL,NULL),(13,13,1,NULL,NULL,NULL,NULL),(14,14,1,NULL,NULL,NULL,NULL),(15,15,1,NULL,NULL,NULL,NULL),(16,16,1,NULL,NULL,NULL,NULL),(17,17,1,NULL,NULL,NULL,NULL),(18,18,1,NULL,NULL,NULL,NULL),(19,19,1,NULL,NULL,NULL,NULL),(20,20,1,NULL,NULL,NULL,NULL),(21,21,1,NULL,NULL,NULL,NULL),(22,22,1,NULL,NULL,NULL,NULL),(23,23,1,NULL,NULL,NULL,NULL),(24,24,1,NULL,NULL,NULL,NULL),(25,25,1,NULL,NULL,NULL,NULL),(26,26,1,NULL,NULL,NULL,NULL),(27,27,1,NULL,NULL,NULL,NULL),(39,40,1,NULL,NULL,NULL,NULL),(40,41,1,NULL,NULL,NULL,NULL),(41,42,1,NULL,NULL,NULL,NULL),(42,43,1,NULL,NULL,NULL,NULL),(43,44,1,NULL,NULL,NULL,NULL),(44,45,1,NULL,NULL,NULL,NULL),(45,46,1,NULL,NULL,NULL,NULL),(46,47,1,NULL,NULL,NULL,NULL),(47,48,1,NULL,NULL,NULL,NULL),(48,49,1,NULL,NULL,NULL,NULL),(49,50,1,NULL,NULL,NULL,NULL),(50,51,1,NULL,NULL,NULL,NULL),(51,52,1,NULL,NULL,NULL,NULL),(52,53,1,NULL,NULL,NULL,NULL),(53,54,1,NULL,NULL,NULL,NULL),(54,55,1,NULL,NULL,NULL,NULL),(55,56,1,NULL,NULL,NULL,NULL),(56,57,1,NULL,NULL,NULL,NULL),(57,58,1,NULL,NULL,NULL,NULL),(58,59,1,NULL,NULL,NULL,NULL),(59,60,1,NULL,NULL,NULL,NULL),(60,61,1,NULL,NULL,NULL,NULL),(61,62,1,NULL,NULL,NULL,NULL),(62,63,1,NULL,NULL,NULL,NULL),(63,64,1,NULL,NULL,NULL,NULL),(64,65,1,NULL,NULL,NULL,NULL),(65,66,1,NULL,NULL,NULL,NULL),(66,67,1,NULL,NULL,NULL,NULL),(67,68,1,NULL,NULL,NULL,NULL),(68,69,1,NULL,NULL,NULL,NULL),(69,70,1,NULL,NULL,NULL,NULL),(70,71,1,NULL,NULL,NULL,NULL),(71,72,1,NULL,NULL,NULL,NULL),(72,73,1,NULL,NULL,NULL,NULL),(73,74,1,NULL,NULL,NULL,NULL),(74,75,1,NULL,NULL,NULL,NULL),(75,76,1,NULL,NULL,NULL,NULL),(76,77,1,NULL,NULL,NULL,NULL),(77,78,1,NULL,NULL,NULL,NULL),(78,79,1,NULL,NULL,NULL,NULL),(79,80,1,NULL,NULL,NULL,NULL),(80,81,1,NULL,NULL,NULL,NULL),(81,82,1,NULL,NULL,NULL,NULL),(82,83,1,NULL,NULL,NULL,NULL),(83,84,1,NULL,NULL,NULL,NULL),(84,85,1,NULL,NULL,NULL,NULL),(85,86,1,NULL,NULL,NULL,NULL),(86,87,1,NULL,NULL,NULL,NULL),(87,88,1,NULL,NULL,NULL,NULL),(88,89,1,NULL,NULL,NULL,NULL),(89,90,1,NULL,NULL,NULL,NULL),(90,91,1,NULL,NULL,NULL,NULL),(91,92,1,NULL,NULL,NULL,NULL),(92,93,1,NULL,NULL,NULL,NULL),(93,94,1,NULL,NULL,NULL,NULL),(94,95,1,NULL,NULL,NULL,NULL),(95,96,1,NULL,NULL,NULL,NULL),(96,97,1,NULL,NULL,NULL,NULL),(97,98,1,NULL,NULL,NULL,NULL),(98,99,1,NULL,NULL,NULL,NULL),(99,100,1,NULL,NULL,NULL,NULL),(100,101,1,NULL,NULL,NULL,NULL),(101,102,1,NULL,NULL,NULL,NULL),(102,103,1,NULL,NULL,NULL,NULL),(103,104,1,NULL,NULL,NULL,NULL),(104,105,1,NULL,NULL,NULL,NULL),(105,106,1,NULL,NULL,NULL,NULL),(106,107,1,NULL,NULL,NULL,NULL),(107,108,1,NULL,NULL,NULL,NULL),(108,109,1,NULL,NULL,NULL,NULL),(109,110,1,NULL,NULL,NULL,NULL),(110,111,1,NULL,NULL,NULL,NULL),(111,112,1,NULL,NULL,NULL,NULL),(112,113,1,NULL,NULL,NULL,NULL),(113,114,1,NULL,NULL,NULL,NULL),(114,115,1,NULL,NULL,NULL,NULL),(115,116,1,NULL,NULL,NULL,NULL),(116,117,1,NULL,NULL,NULL,NULL),(117,118,1,NULL,NULL,NULL,NULL),(118,119,1,NULL,NULL,NULL,NULL),(119,120,1,NULL,NULL,NULL,NULL),(120,121,1,NULL,NULL,NULL,NULL),(121,122,1,NULL,NULL,NULL,NULL),(122,123,1,NULL,NULL,NULL,NULL),(123,124,1,NULL,NULL,NULL,NULL),(124,125,1,NULL,NULL,NULL,NULL),(125,126,1,NULL,NULL,NULL,NULL),(126,127,1,NULL,NULL,NULL,NULL),(127,128,1,NULL,NULL,NULL,NULL),(128,129,1,NULL,NULL,NULL,NULL),(129,130,1,NULL,NULL,NULL,NULL),(130,131,1,NULL,NULL,NULL,NULL),(131,132,1,NULL,NULL,NULL,NULL),(132,133,1,NULL,NULL,NULL,NULL),(133,134,1,NULL,NULL,NULL,NULL),(134,135,1,NULL,NULL,NULL,NULL),(135,136,1,NULL,NULL,NULL,NULL),(136,137,1,NULL,NULL,NULL,NULL),(137,138,1,NULL,NULL,NULL,NULL),(138,139,1,NULL,NULL,NULL,NULL),(139,140,1,NULL,NULL,NULL,NULL),(140,141,1,NULL,NULL,NULL,NULL),(141,142,1,NULL,NULL,NULL,NULL),(142,143,1,NULL,NULL,NULL,NULL),(143,144,1,NULL,NULL,NULL,NULL),(144,145,1,NULL,NULL,NULL,NULL),(145,146,1,NULL,NULL,NULL,NULL),(146,147,1,NULL,NULL,NULL,NULL),(147,148,1,NULL,NULL,NULL,NULL),(148,149,1,NULL,NULL,NULL,NULL),(149,150,1,NULL,NULL,NULL,NULL),(150,151,1,NULL,NULL,NULL,NULL),(151,152,1,NULL,NULL,NULL,NULL),(152,153,1,NULL,NULL,NULL,NULL),(153,154,1,NULL,NULL,NULL,NULL),(154,155,1,NULL,NULL,NULL,NULL),(155,156,1,NULL,NULL,NULL,NULL),(156,157,1,NULL,NULL,NULL,NULL),(157,158,1,NULL,NULL,NULL,NULL),(158,159,1,NULL,NULL,NULL,NULL),(159,160,1,NULL,NULL,NULL,NULL),(160,161,1,NULL,NULL,NULL,NULL),(161,162,1,NULL,NULL,NULL,NULL),(162,163,1,NULL,NULL,NULL,NULL),(163,164,1,NULL,NULL,NULL,NULL),(164,165,1,NULL,NULL,NULL,NULL),(165,166,1,NULL,NULL,NULL,NULL),(166,167,1,NULL,NULL,NULL,NULL),(167,168,1,NULL,NULL,NULL,NULL),(168,169,1,NULL,NULL,NULL,NULL),(169,170,1,NULL,NULL,NULL,NULL),(170,171,1,NULL,NULL,NULL,NULL),(171,172,1,NULL,NULL,NULL,NULL),(172,173,1,NULL,NULL,NULL,NULL),(173,174,1,NULL,NULL,NULL,NULL),(174,175,1,NULL,NULL,NULL,NULL),(175,176,1,NULL,NULL,NULL,NULL),(176,177,1,NULL,NULL,NULL,NULL),(177,178,1,NULL,NULL,NULL,NULL),(178,179,1,NULL,NULL,NULL,NULL),(179,180,1,NULL,NULL,NULL,NULL),(180,181,1,NULL,NULL,NULL,NULL),(181,182,1,NULL,NULL,NULL,NULL),(182,183,1,NULL,NULL,NULL,NULL),(183,184,1,NULL,NULL,NULL,NULL),(184,185,1,NULL,NULL,NULL,NULL),(185,186,1,NULL,NULL,NULL,NULL),(186,187,1,NULL,NULL,NULL,NULL),(187,188,1,NULL,NULL,NULL,NULL),(188,189,1,NULL,NULL,NULL,NULL),(189,190,1,NULL,NULL,NULL,NULL),(190,191,1,NULL,NULL,NULL,NULL),(191,192,1,NULL,NULL,NULL,NULL),(192,193,1,NULL,NULL,NULL,NULL),(193,194,1,NULL,NULL,NULL,NULL),(194,195,1,NULL,NULL,NULL,NULL),(195,196,1,NULL,NULL,NULL,NULL),(196,197,1,NULL,NULL,NULL,NULL),(197,198,1,NULL,NULL,NULL,NULL),(198,199,1,NULL,NULL,NULL,NULL),(199,200,1,NULL,NULL,NULL,NULL),(200,201,1,NULL,NULL,NULL,NULL),(201,202,1,NULL,NULL,NULL,NULL),(202,203,1,NULL,NULL,NULL,NULL),(203,204,1,NULL,NULL,NULL,NULL),(204,205,1,NULL,NULL,NULL,NULL),(205,206,1,NULL,NULL,NULL,NULL),(206,207,1,NULL,NULL,NULL,NULL),(207,208,1,NULL,NULL,NULL,NULL),(208,209,1,NULL,NULL,NULL,NULL),(209,210,1,NULL,NULL,NULL,NULL),(210,211,1,NULL,NULL,NULL,NULL),(211,212,1,NULL,NULL,NULL,NULL),(212,213,1,NULL,NULL,NULL,NULL),(213,214,1,NULL,NULL,NULL,NULL),(214,215,1,NULL,NULL,NULL,NULL),(215,216,1,NULL,NULL,NULL,NULL),(216,217,1,NULL,NULL,NULL,NULL),(217,218,1,NULL,NULL,NULL,NULL),(218,219,1,NULL,NULL,NULL,NULL),(219,220,1,NULL,NULL,NULL,NULL),(220,221,1,NULL,NULL,NULL,NULL),(221,222,1,NULL,NULL,NULL,NULL),(222,223,1,NULL,NULL,NULL,NULL),(223,224,1,NULL,NULL,NULL,NULL),(224,225,1,NULL,NULL,NULL,NULL),(225,226,1,NULL,NULL,NULL,NULL),(226,227,1,NULL,NULL,NULL,NULL),(227,228,1,NULL,NULL,NULL,NULL),(228,229,1,NULL,NULL,NULL,NULL),(229,230,1,NULL,NULL,NULL,NULL),(230,231,1,NULL,NULL,NULL,NULL),(231,232,1,NULL,NULL,NULL,NULL),(232,233,1,NULL,NULL,NULL,NULL),(233,234,1,NULL,NULL,NULL,NULL),(234,235,1,NULL,NULL,NULL,NULL),(235,236,1,NULL,NULL,NULL,NULL),(236,237,1,NULL,NULL,NULL,NULL),(237,238,1,NULL,NULL,NULL,NULL),(238,239,1,NULL,NULL,NULL,NULL),(239,240,1,NULL,NULL,NULL,NULL),(240,241,1,NULL,NULL,NULL,NULL),(241,242,1,NULL,NULL,NULL,NULL),(242,243,1,NULL,NULL,NULL,NULL),(243,244,1,NULL,NULL,NULL,NULL),(244,245,1,NULL,NULL,NULL,NULL),(245,246,1,NULL,NULL,NULL,NULL),(246,247,1,NULL,NULL,NULL,NULL),(247,248,1,NULL,NULL,NULL,NULL),(248,249,1,NULL,NULL,NULL,NULL),(249,250,1,NULL,NULL,NULL,NULL),(250,251,1,NULL,NULL,NULL,NULL),(251,252,1,NULL,NULL,NULL,NULL),(252,253,1,NULL,NULL,NULL,NULL),(253,254,1,NULL,NULL,NULL,NULL),(254,255,1,NULL,NULL,NULL,NULL),(255,256,1,NULL,NULL,NULL,NULL),(256,257,1,NULL,NULL,NULL,NULL),(257,258,1,NULL,NULL,NULL,NULL),(258,259,1,NULL,NULL,NULL,NULL),(259,260,1,NULL,NULL,NULL,NULL),(260,261,1,NULL,NULL,NULL,NULL),(261,262,1,NULL,NULL,NULL,NULL),(262,263,1,NULL,NULL,NULL,NULL),(263,264,1,NULL,NULL,NULL,NULL),(264,265,1,NULL,NULL,NULL,NULL),(265,266,1,NULL,NULL,NULL,NULL),(266,267,1,NULL,NULL,NULL,NULL),(267,268,1,NULL,NULL,NULL,NULL),(268,269,1,NULL,NULL,NULL,NULL),(269,270,1,NULL,NULL,NULL,NULL),(270,271,1,NULL,NULL,NULL,NULL),(271,272,1,NULL,NULL,NULL,NULL),(272,273,1,NULL,NULL,NULL,NULL),(273,274,1,NULL,NULL,NULL,NULL),(274,275,1,NULL,NULL,NULL,NULL),(275,276,1,NULL,NULL,NULL,NULL),(276,277,1,NULL,NULL,NULL,NULL),(277,278,1,NULL,NULL,NULL,NULL),(278,279,1,NULL,NULL,NULL,NULL),(279,280,1,NULL,NULL,NULL,NULL),(280,281,1,NULL,NULL,NULL,NULL),(281,282,1,NULL,NULL,NULL,NULL),(282,283,1,NULL,NULL,NULL,NULL),(283,284,1,NULL,NULL,NULL,NULL),(284,285,1,NULL,NULL,NULL,NULL),(285,286,1,NULL,NULL,NULL,NULL),(286,287,1,NULL,NULL,NULL,NULL),(287,288,1,NULL,NULL,NULL,NULL),(288,289,1,NULL,NULL,NULL,NULL),(289,290,1,NULL,NULL,NULL,NULL),(290,291,1,NULL,NULL,NULL,NULL),(291,292,1,NULL,NULL,NULL,NULL),(292,293,1,NULL,NULL,NULL,NULL),(293,294,1,NULL,NULL,NULL,NULL),(294,295,1,NULL,NULL,NULL,NULL),(295,296,1,NULL,NULL,NULL,NULL),(296,297,1,NULL,NULL,NULL,NULL),(297,298,1,NULL,NULL,NULL,NULL),(298,299,1,NULL,NULL,NULL,NULL),(299,300,1,NULL,NULL,NULL,NULL),(300,301,1,NULL,NULL,NULL,NULL),(301,302,1,NULL,NULL,NULL,NULL),(302,303,1,NULL,NULL,NULL,NULL),(303,304,1,NULL,NULL,NULL,NULL),(304,305,1,NULL,NULL,NULL,NULL),(305,306,1,NULL,NULL,NULL,NULL),(306,307,1,NULL,NULL,NULL,NULL),(307,308,1,NULL,NULL,NULL,NULL),(308,309,1,NULL,NULL,NULL,NULL),(309,310,1,NULL,NULL,NULL,NULL),(310,311,1,NULL,NULL,NULL,NULL),(311,312,1,NULL,NULL,NULL,NULL),(312,313,1,NULL,NULL,NULL,NULL),(313,314,1,NULL,NULL,NULL,NULL),(314,315,1,NULL,NULL,NULL,NULL),(315,316,1,NULL,NULL,NULL,NULL),(316,317,1,NULL,NULL,NULL,NULL),(317,318,1,NULL,NULL,NULL,NULL),(318,319,1,NULL,NULL,NULL,NULL),(319,320,1,NULL,NULL,NULL,NULL),(320,321,1,NULL,NULL,NULL,NULL),(321,322,1,NULL,NULL,NULL,NULL),(322,323,1,NULL,NULL,NULL,NULL),(323,324,1,NULL,NULL,NULL,NULL),(324,325,1,NULL,NULL,NULL,NULL),(325,326,1,NULL,NULL,NULL,NULL),(326,327,1,NULL,NULL,NULL,NULL),(327,328,1,NULL,NULL,NULL,NULL),(328,329,1,NULL,NULL,NULL,NULL),(329,330,1,NULL,NULL,NULL,NULL),(330,331,1,NULL,NULL,NULL,NULL),(331,332,1,NULL,NULL,NULL,NULL),(332,333,1,NULL,NULL,NULL,NULL),(333,334,1,NULL,NULL,NULL,NULL),(334,335,1,NULL,NULL,NULL,NULL),(335,336,1,NULL,NULL,NULL,NULL),(336,337,1,NULL,NULL,NULL,NULL),(337,338,1,NULL,NULL,NULL,NULL),(338,339,1,NULL,NULL,NULL,NULL),(339,340,1,NULL,NULL,NULL,NULL),(340,341,1,NULL,NULL,NULL,NULL),(341,342,1,NULL,NULL,NULL,NULL),(342,343,1,NULL,NULL,NULL,NULL),(343,344,1,NULL,NULL,NULL,NULL),(344,345,1,NULL,NULL,NULL,NULL),(345,346,1,NULL,NULL,NULL,NULL),(346,347,1,NULL,NULL,NULL,NULL),(347,348,1,NULL,NULL,NULL,NULL),(348,349,1,NULL,NULL,NULL,NULL),(349,350,1,NULL,NULL,NULL,NULL),(350,351,1,NULL,NULL,NULL,NULL),(351,352,1,NULL,NULL,NULL,NULL),(352,353,1,NULL,NULL,NULL,NULL),(353,354,1,NULL,NULL,NULL,NULL),(354,355,1,NULL,NULL,NULL,NULL),(355,356,1,NULL,NULL,NULL,NULL),(356,357,1,NULL,NULL,NULL,NULL),(357,358,1,NULL,NULL,NULL,NULL),(358,359,1,NULL,NULL,NULL,NULL),(359,360,1,NULL,NULL,NULL,NULL),(360,361,1,NULL,NULL,NULL,NULL),(361,362,1,NULL,NULL,NULL,NULL),(362,363,1,NULL,NULL,NULL,NULL),(363,364,1,NULL,NULL,NULL,NULL),(364,365,1,NULL,NULL,NULL,NULL),(365,366,1,NULL,NULL,NULL,NULL),(366,367,1,NULL,NULL,NULL,NULL),(367,368,1,NULL,NULL,NULL,NULL),(368,369,1,NULL,NULL,NULL,NULL),(369,370,1,NULL,NULL,NULL,NULL),(370,371,1,NULL,NULL,NULL,NULL),(371,372,1,NULL,NULL,NULL,NULL),(372,373,1,NULL,NULL,NULL,NULL),(373,374,1,NULL,NULL,NULL,NULL),(374,375,1,NULL,NULL,NULL,NULL),(375,376,1,NULL,NULL,NULL,NULL),(376,377,1,NULL,NULL,NULL,NULL),(377,378,1,NULL,NULL,NULL,NULL),(378,379,1,NULL,NULL,NULL,NULL),(379,380,1,NULL,NULL,NULL,NULL),(380,381,1,NULL,NULL,NULL,NULL),(381,382,1,NULL,NULL,NULL,NULL),(382,383,1,NULL,NULL,NULL,NULL),(383,384,1,NULL,NULL,NULL,NULL),(384,385,1,NULL,NULL,NULL,NULL),(385,386,1,NULL,NULL,NULL,NULL),(386,387,1,NULL,NULL,NULL,NULL),(387,388,1,NULL,NULL,NULL,NULL),(388,389,1,NULL,NULL,NULL,NULL),(389,390,1,NULL,NULL,NULL,NULL),(390,391,1,NULL,NULL,NULL,NULL),(391,392,1,NULL,NULL,NULL,NULL),(392,393,1,NULL,NULL,NULL,NULL),(393,394,1,NULL,NULL,NULL,NULL),(394,395,1,NULL,NULL,NULL,NULL),(395,396,1,NULL,NULL,NULL,NULL),(396,397,1,NULL,NULL,NULL,NULL),(397,398,1,NULL,NULL,NULL,NULL),(398,399,1,NULL,NULL,NULL,NULL),(399,400,1,NULL,NULL,NULL,NULL),(400,401,1,NULL,NULL,NULL,NULL),(401,402,1,NULL,NULL,NULL,NULL),(402,403,1,NULL,NULL,NULL,NULL),(403,404,1,NULL,NULL,NULL,NULL),(404,405,1,NULL,NULL,NULL,NULL),(405,406,1,NULL,NULL,NULL,NULL),(406,407,1,NULL,NULL,NULL,NULL),(407,408,1,NULL,NULL,NULL,NULL),(408,409,1,NULL,NULL,NULL,NULL),(409,410,1,NULL,NULL,NULL,NULL),(410,411,1,NULL,NULL,NULL,NULL),(411,412,1,NULL,NULL,NULL,NULL),(412,413,1,NULL,NULL,NULL,NULL),(413,414,1,NULL,NULL,NULL,NULL),(414,415,1,NULL,NULL,NULL,NULL),(415,416,1,NULL,NULL,NULL,NULL),(416,417,1,NULL,NULL,NULL,NULL),(417,418,1,NULL,NULL,NULL,NULL),(418,419,1,NULL,NULL,NULL,NULL),(419,420,1,NULL,NULL,NULL,NULL),(420,421,1,NULL,NULL,NULL,NULL),(421,422,1,NULL,NULL,NULL,NULL),(422,423,1,NULL,NULL,NULL,NULL),(423,424,1,NULL,NULL,NULL,NULL),(424,425,1,NULL,NULL,NULL,NULL),(425,426,1,NULL,NULL,NULL,NULL),(426,427,1,NULL,NULL,NULL,NULL),(427,428,1,NULL,NULL,NULL,NULL),(428,429,1,NULL,NULL,NULL,NULL),(429,430,1,NULL,NULL,NULL,NULL),(430,431,1,NULL,NULL,NULL,NULL),(431,432,1,NULL,NULL,NULL,NULL),(432,433,1,NULL,NULL,NULL,NULL),(433,434,1,NULL,NULL,NULL,NULL),(434,435,1,NULL,NULL,NULL,NULL),(435,436,1,NULL,NULL,NULL,NULL),(436,437,1,NULL,NULL,NULL,NULL),(437,438,1,NULL,NULL,NULL,NULL),(438,439,1,NULL,NULL,NULL,NULL),(439,440,1,NULL,NULL,NULL,NULL),(440,441,1,NULL,NULL,NULL,NULL),(441,442,1,NULL,NULL,NULL,NULL),(442,443,1,NULL,NULL,NULL,NULL),(443,444,1,NULL,NULL,NULL,NULL),(444,445,1,NULL,NULL,NULL,NULL),(445,446,1,NULL,NULL,NULL,NULL),(446,447,1,NULL,NULL,NULL,NULL),(447,448,1,NULL,NULL,NULL,NULL),(448,449,1,NULL,NULL,NULL,NULL),(449,450,1,NULL,NULL,NULL,NULL),(450,451,1,NULL,NULL,NULL,NULL),(451,452,1,NULL,NULL,NULL,NULL),(452,453,1,NULL,NULL,NULL,NULL),(453,454,1,NULL,NULL,NULL,NULL),(454,455,1,NULL,NULL,NULL,NULL),(455,456,1,NULL,NULL,NULL,NULL),(456,457,1,NULL,NULL,NULL,NULL),(457,458,1,NULL,NULL,NULL,NULL),(458,459,1,NULL,NULL,NULL,NULL),(459,460,1,NULL,NULL,NULL,NULL),(460,461,1,NULL,NULL,NULL,NULL),(461,462,1,NULL,NULL,NULL,NULL),(462,463,1,NULL,NULL,NULL,NULL),(463,464,1,NULL,NULL,NULL,NULL),(464,465,1,NULL,NULL,NULL,NULL),(465,466,1,NULL,NULL,NULL,NULL),(466,467,1,NULL,NULL,NULL,NULL),(467,468,1,NULL,NULL,NULL,NULL),(468,469,1,NULL,NULL,NULL,NULL),(469,470,1,NULL,NULL,NULL,NULL),(470,471,1,NULL,NULL,NULL,NULL),(471,472,1,NULL,NULL,NULL,NULL),(472,473,1,NULL,NULL,NULL,NULL),(473,474,1,NULL,NULL,NULL,NULL),(474,475,1,NULL,NULL,NULL,NULL),(475,476,1,NULL,NULL,NULL,NULL),(476,477,1,NULL,NULL,NULL,NULL),(477,478,1,NULL,NULL,NULL,NULL),(478,479,1,NULL,NULL,NULL,NULL),(479,480,1,NULL,NULL,NULL,NULL),(480,481,1,NULL,NULL,NULL,NULL),(481,482,1,NULL,NULL,NULL,NULL),(482,483,1,NULL,NULL,NULL,NULL),(483,484,1,NULL,NULL,NULL,NULL),(484,485,1,NULL,NULL,NULL,NULL),(485,486,1,NULL,NULL,NULL,NULL),(486,487,1,NULL,NULL,NULL,NULL),(487,488,1,NULL,NULL,NULL,NULL),(488,489,1,NULL,NULL,NULL,NULL),(489,490,1,NULL,NULL,NULL,NULL),(490,491,1,NULL,NULL,NULL,NULL),(491,492,1,NULL,NULL,NULL,NULL),(492,493,1,NULL,NULL,NULL,NULL),(493,494,1,NULL,NULL,NULL,NULL),(494,495,1,NULL,NULL,NULL,NULL),(495,496,1,NULL,NULL,NULL,NULL),(496,497,1,NULL,NULL,NULL,NULL),(497,498,1,NULL,NULL,NULL,NULL),(498,499,1,NULL,NULL,NULL,NULL),(499,500,1,NULL,NULL,NULL,NULL),(500,501,1,NULL,NULL,NULL,NULL),(501,502,1,NULL,NULL,NULL,NULL),(502,503,1,NULL,NULL,NULL,NULL),(503,504,1,NULL,NULL,NULL,NULL),(504,505,1,NULL,NULL,NULL,NULL),(505,506,1,NULL,NULL,NULL,NULL),(506,507,1,NULL,NULL,NULL,NULL),(507,508,1,NULL,NULL,NULL,NULL),(508,509,1,NULL,NULL,NULL,NULL),(509,510,1,NULL,NULL,NULL,NULL),(510,511,1,NULL,NULL,NULL,NULL),(511,512,1,NULL,NULL,NULL,NULL),(512,513,1,NULL,NULL,NULL,NULL),(513,514,1,NULL,NULL,NULL,NULL),(514,515,1,NULL,NULL,NULL,NULL),(515,516,1,NULL,NULL,NULL,NULL),(516,517,1,NULL,NULL,NULL,NULL),(517,518,1,NULL,NULL,NULL,NULL),(518,519,1,NULL,NULL,NULL,NULL),(519,520,1,NULL,NULL,NULL,NULL),(520,521,1,NULL,NULL,NULL,NULL),(521,522,1,NULL,NULL,NULL,NULL),(522,523,1,NULL,NULL,NULL,NULL),(523,524,1,NULL,NULL,NULL,NULL),(524,525,1,NULL,NULL,NULL,NULL),(525,526,1,NULL,NULL,NULL,NULL),(526,527,1,NULL,NULL,NULL,NULL),(527,528,1,NULL,NULL,NULL,NULL),(528,529,1,NULL,NULL,NULL,NULL),(529,530,1,NULL,NULL,NULL,NULL),(530,531,1,NULL,NULL,NULL,NULL),(531,532,1,NULL,NULL,NULL,NULL),(532,533,1,NULL,NULL,NULL,NULL),(533,534,1,NULL,NULL,NULL,NULL),(534,535,1,NULL,NULL,NULL,NULL),(535,536,1,NULL,NULL,NULL,NULL),(536,537,1,NULL,NULL,NULL,NULL),(537,538,1,NULL,NULL,NULL,NULL),(538,539,1,NULL,NULL,NULL,NULL),(539,540,1,NULL,NULL,NULL,NULL),(540,541,1,NULL,NULL,NULL,NULL),(541,542,1,NULL,NULL,NULL,NULL),(542,543,1,NULL,NULL,NULL,NULL),(543,544,1,NULL,NULL,NULL,NULL),(544,545,1,NULL,NULL,NULL,NULL),(545,546,1,NULL,NULL,NULL,NULL),(546,547,1,NULL,NULL,NULL,NULL),(547,548,1,NULL,NULL,NULL,NULL),(548,549,1,NULL,NULL,NULL,NULL),(549,550,1,NULL,NULL,NULL,NULL),(550,551,1,NULL,NULL,NULL,NULL),(551,552,1,NULL,NULL,NULL,NULL),(552,553,1,NULL,NULL,NULL,NULL),(553,554,1,NULL,NULL,NULL,NULL),(554,555,1,NULL,NULL,NULL,NULL),(555,556,1,NULL,NULL,NULL,NULL),(556,557,1,NULL,NULL,NULL,NULL),(557,558,1,NULL,NULL,NULL,NULL),(558,559,1,NULL,NULL,NULL,NULL),(559,560,1,NULL,NULL,NULL,NULL),(560,561,1,NULL,NULL,NULL,NULL),(561,562,1,NULL,NULL,NULL,NULL),(562,563,1,NULL,NULL,NULL,NULL),(563,564,1,NULL,NULL,NULL,NULL),(564,565,1,NULL,NULL,NULL,NULL),(565,566,1,NULL,NULL,NULL,NULL),(566,567,1,NULL,NULL,NULL,NULL),(567,568,1,NULL,NULL,NULL,NULL),(568,569,1,NULL,NULL,NULL,NULL),(1062,39,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `party_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_user`
--

DROP TABLE IF EXISTS `party_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_user` (
  `party_user` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`party_user`),
  KEY `FK_jr5` (`party_id`),
  CONSTRAINT `FK_jr5` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_user`
--

LOCK TABLES `party_user` WRITE;
/*!40000 ALTER TABLE `party_user` DISABLE KEYS */;
INSERT INTO `party_user` VALUES (1,3,10,NULL,NULL,NULL,NULL),(2,7,11,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `party_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `party_id` bigint(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pinyin_name` varchar(50) DEFAULT NULL,
  `personal_title` varchar(20) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `card_id` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `FK_jr7` (`party_id`),
  CONSTRAINT `FK_jr7` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,3,'王菲','wf','','2','423','12',NULL,'2015-09-04 00:41:19',NULL,-2),(2,7,'谢霆锋','xtf','','','','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `price_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `party_id` bigint(20) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `thru_date` datetime DEFAULT NULL,
  `price_type` varchar(30) DEFAULT NULL,
  `price` decimal(18,3) DEFAULT NULL,
  `price_uom_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`price_id`),
  KEY `FK_jr10` (`product_id`),
  CONSTRAINT `FK_jr10` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,NULL,NULL,NULL,'1',203.000,NULL,'2015-08-29 14:22:20','2015-09-26 17:59:25',-2,11),(2,2,NULL,NULL,NULL,'1',120.000,NULL,'2015-08-29 14:22:45','2015-09-04 00:46:49',-2,-2),(3,1,5,'2015-08-31 00:00:00',NULL,'2',204.000,NULL,'2015-09-05 23:37:53',NULL,11,NULL),(4,2,6,'2015-09-01 00:00:00',NULL,'2',130.000,NULL,'2015-09-05 23:38:35',NULL,11,NULL),(5,1,5,'2015-10-06 00:00:00',NULL,'2',123.000,NULL,'2015-10-10 10:20:59',NULL,11,NULL);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `pinyin_name` varchar(50) DEFAULT NULL,
  `weight` decimal(18,2) DEFAULT NULL,
  `stand_uom_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'芥兰','jl',21.00,1,NULL,NULL,NULL,NULL),(2,'奶白菜','nbc',40.00,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reap_dtl`
--

DROP TABLE IF EXISTS `reap_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reap_dtl` (
  `reap_dtl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reap_party_id` bigint(20) DEFAULT NULL,
  `reap_for_party_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `num` decimal(13,2) DEFAULT NULL,
  `uom_id` bigint(20) DEFAULT NULL,
  `reap_date` date DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`reap_dtl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reap_dtl`
--

LOCK TABLES `reap_dtl` WRITE;
/*!40000 ALTER TABLE `reap_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `reap_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (-2,'Default role for all Users','ROLE_USER'),(-1,'Administrator role (can edit Users)','ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_type`
--

DROP TABLE IF EXISTS `role_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_type` (
  `role_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `has_table` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`role_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_type`
--

LOCK TABLES `role_type` WRITE;
/*!40000 ALTER TABLE `role_type` DISABLE KEYS */;
INSERT INTO `role_type` VALUES (1,NULL,NULL,'组织构架成员',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_plan`
--

DROP TABLE IF EXISTS `sale_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_plan` (
  `sale_plan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `facility_id` bigint(20) DEFAULT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sale_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_plan`
--

LOCK TABLES `sale_plan` WRITE;
/*!40000 ALTER TABLE `sale_plan` DISABLE KEYS */;
INSERT INTO `sale_plan` VALUES (7,2,'','2015-09-03','',2,'2015-09-07 11:17:32','2015-09-07 18:15:02',11,11),(8,2,'','2015-09-11','12',2,'2015-09-11 14:22:27','2015-09-21 15:52:55',11,11),(9,2,'','2015-09-22','',2,'2015-09-21 15:32:36','2015-09-21 15:49:49',11,11),(10,2,'','2015-09-23','ssdf',2,'2015-09-21 15:54:03','2015-09-21 15:55:04',11,11),(11,2,'','2015-09-24','',2,'2015-09-21 15:57:37','2015-09-21 15:57:59',11,11),(12,2,'','2015-09-25','',2,'2015-09-21 16:01:54','2015-09-21 16:02:10',11,11);
/*!40000 ALTER TABLE `sale_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_plan_dtl`
--

DROP TABLE IF EXISTS `sale_plan_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_plan_dtl` (
  `sale_plan_dtl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sale_plan_id` bigint(20) DEFAULT NULL,
  `facility_id_from` bigint(20) DEFAULT NULL,
  `facility_id_to` bigint(20) DEFAULT NULL,
  `to_sequence_id` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `num` decimal(13,2) DEFAULT NULL,
  `uom_id` bigint(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sale_plan_dtl_id`),
  KEY `FK_jr14` (`sale_plan_id`),
  CONSTRAINT `FK_jr14` FOREIGN KEY (`sale_plan_id`) REFERENCES `sale_plan` (`sale_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_plan_dtl`
--

LOCK TABLES `sale_plan_dtl` WRITE;
/*!40000 ALTER TABLE `sale_plan_dtl` DISABLE KEYS */;
INSERT INTO `sale_plan_dtl` VALUES (1,7,2,3,0,1,12.00,NULL,'2015-09-07 11:17:32','2015-09-07 16:16:38',11,11),(2,7,2,4,1,1,0.00,NULL,'2015-09-07 11:17:32',NULL,11,NULL),(3,7,2,3,0,2,20.00,NULL,'2015-09-07 11:17:32','2015-09-07 16:16:17',11,11),(4,7,2,4,1,2,0.00,NULL,'2015-09-07 11:17:32',NULL,11,NULL),(5,8,2,3,0,1,1.00,NULL,'2015-09-11 14:22:27','2015-09-11 14:26:19',11,11),(6,8,2,4,1,1,22.00,NULL,'2015-09-11 14:22:27','2015-09-11 14:26:09',11,11),(7,8,2,3,0,2,10.50,NULL,'2015-09-11 14:22:27',NULL,11,NULL),(8,8,2,4,1,2,10.50,NULL,'2015-09-11 14:22:27',NULL,11,NULL),(9,9,2,3,0,1,11.00,NULL,'2015-09-21 15:32:36','2015-09-21 15:34:31',11,11),(10,9,2,4,1,1,12.00,NULL,'2015-09-21 15:32:36','2015-09-21 15:34:25',11,11),(11,9,2,3,0,2,1.00,NULL,'2015-09-21 15:32:36','2015-09-21 15:34:04',11,11),(12,9,2,4,1,2,20.00,NULL,'2015-09-21 15:32:36','2015-09-21 15:33:59',11,11),(13,10,2,3,0,1,15.00,NULL,'2015-09-21 15:54:03','2015-09-21 15:54:26',11,11),(14,10,2,4,1,1,8.00,NULL,'2015-09-21 15:54:03','2015-09-21 15:54:44',11,11),(15,10,2,3,0,2,2.00,NULL,'2015-09-21 15:54:03','2015-09-21 15:54:11',11,11),(16,10,2,4,1,2,19.00,NULL,'2015-09-21 15:54:03','2015-09-21 15:54:20',11,11),(17,11,2,3,0,1,11.50,NULL,'2015-09-21 15:57:37',NULL,11,NULL),(18,11,2,4,1,1,11.50,NULL,'2015-09-21 15:57:37',NULL,11,NULL),(19,11,2,3,0,2,10.50,NULL,'2015-09-21 15:57:37',NULL,11,NULL),(20,11,2,4,1,2,10.50,NULL,'2015-09-21 15:57:37',NULL,11,NULL),(21,12,2,3,0,1,11.50,NULL,'2015-09-21 16:01:54',NULL,11,NULL),(22,12,2,4,1,1,11.50,NULL,'2015-09-21 16:01:54',NULL,11,NULL),(23,12,2,3,0,2,10.50,NULL,'2015-09-21 16:01:54',NULL,11,NULL),(24,12,2,4,1,2,10.50,NULL,'2015-09-21 16:01:54',NULL,11,NULL);
/*!40000 ALTER TABLE `sale_plan_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_car`
--

DROP TABLE IF EXISTS `ship_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship_car` (
  `ship_car_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_card_id` varchar(30) DEFAULT NULL,
  `con_name` varchar(30) DEFAULT NULL,
  `con_phone` varchar(20) DEFAULT NULL,
  `type_name` varchar(30) DEFAULT NULL,
  `load_weight` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ship_car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_car`
--

LOCK TABLES `ship_car` WRITE;
/*!40000 ALTER TABLE `ship_car` DISABLE KEYS */;
INSERT INTO `ship_car` VALUES (1,'豫N FK111','贷款的可','1213123','123','1110'),(2,'豫A FK111','复苏','钱23','32','323223');
/*!40000 ALTER TABLE `ship_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `shipment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sale_plan_id` bigint(20) DEFAULT NULL,
  `ship_car_id` bigint(20) DEFAULT NULL,
  `facility_id_from` bigint(20) DEFAULT NULL,
  `facility_id_to` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `num` decimal(13,2) DEFAULT NULL,
  `uom_id` bigint(20) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `FK_jr13` (`sale_plan_id`),
  KEY `FK_jr15` (`ship_car_id`),
  CONSTRAINT `FK_jr13` FOREIGN KEY (`sale_plan_id`) REFERENCES `sale_plan` (`sale_plan_id`),
  CONSTRAINT `FK_jr15` FOREIGN KEY (`ship_car_id`) REFERENCES `ship_car` (`ship_car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,7,NULL,2,3,1,12.00,NULL,'2015-09-08','2015-09-07 11:17:32','2015-09-07 16:16:38',11,11),(2,7,2,2,4,1,12.00,NULL,'2015-09-08','2015-09-07 11:17:32','2015-09-07 17:53:25',11,11),(3,7,NULL,2,3,2,23.00,NULL,'2015-09-08','2015-09-07 11:17:32','2015-09-07 17:26:24',11,11),(4,7,NULL,2,4,2,13.00,NULL,'2015-09-08','2015-09-07 11:17:32','2015-09-07 17:26:30',11,11),(5,8,NULL,2,3,1,1.00,NULL,'2015-09-21','2015-09-11 14:22:27','2015-09-11 14:26:19',11,11),(6,8,NULL,2,4,1,22.00,NULL,'2015-09-21','2015-09-11 14:22:27','2015-09-11 14:26:09',11,11),(7,8,NULL,2,3,2,10.50,NULL,'2015-09-21','2015-09-11 14:22:27',NULL,11,NULL),(8,8,NULL,2,4,2,10.50,NULL,'2015-09-21','2015-09-11 14:22:27',NULL,11,NULL),(9,9,1,2,3,1,11.00,NULL,'2015-09-21','2015-09-21 15:32:36','2015-09-21 15:49:38',11,11),(10,9,1,2,4,1,12.00,NULL,'2015-09-21','2015-09-21 15:32:36','2015-09-21 15:49:46',11,11),(11,9,1,2,3,2,1.00,NULL,'2015-09-21','2015-09-21 15:32:36','2015-09-21 15:49:41',11,11),(12,9,1,2,4,2,20.00,NULL,'2015-09-21','2015-09-21 15:32:36','2015-09-21 15:49:44',11,11),(16,10,NULL,2,3,1,15.00,NULL,'2015-09-21','2015-09-21 15:54:03','2015-09-21 15:54:26',11,11),(17,10,NULL,2,4,1,8.00,NULL,'2015-09-21','2015-09-21 15:54:03','2015-09-21 15:54:44',11,11),(18,10,NULL,2,3,2,2.00,NULL,'2015-09-21','2015-09-21 15:54:03','2015-09-21 15:54:11',11,11),(19,10,NULL,2,4,2,19.00,NULL,'2015-09-21','2015-09-21 15:54:03','2015-09-21 15:54:20',11,11),(23,11,NULL,2,3,1,11.50,NULL,'2015-09-21','2015-09-21 15:57:37',NULL,11,NULL),(24,11,NULL,2,4,1,11.50,NULL,'2015-09-21','2015-09-21 15:57:37',NULL,11,NULL),(25,11,NULL,2,3,2,10.50,NULL,'2015-09-21','2015-09-21 15:57:37',NULL,11,NULL),(26,11,NULL,2,4,2,10.50,NULL,'2015-09-21','2015-09-21 15:57:37',NULL,11,NULL),(30,12,NULL,2,3,1,11.50,NULL,'2015-09-21','2015-09-21 16:01:54',NULL,11,NULL),(31,12,NULL,2,4,1,11.50,NULL,'2015-09-21','2015-09-21 16:01:54',NULL,11,NULL),(32,12,NULL,2,3,2,10.50,NULL,'2015-09-21','2015-09-21 16:01:54',NULL,11,NULL),(33,12,NULL,2,4,2,10.50,NULL,'2015-09-21','2015-09-21 16:01:54',NULL,11,NULL);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_item`
--

DROP TABLE IF EXISTS `status_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_item` (
  `status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_type_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(20) DEFAULT NULL,
  `sequence_id` int(11) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `FK_jr2` (`status_type_id`),
  CONSTRAINT `FK_jr2` FOREIGN KEY (`status_type_id`) REFERENCES `status_type` (`status_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_item`
--

LOCK TABLES `status_item` WRITE;
/*!40000 ALTER TABLE `status_item` DISABLE KEYS */;
INSERT INTO `status_item` VALUES (1,1,'',NULL,'未出库','2015-09-06 11:55:12',NULL,11,NULL),(2,1,'',NULL,'已出库','2015-09-06 11:55:23',NULL,11,NULL);
/*!40000 ALTER TABLE `status_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_type`
--

DROP TABLE IF EXISTS `status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_type` (
  `status_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `has_table` int(11) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `sequence_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`status_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_type`
--

LOCK TABLES `status_type` WRITE;
/*!40000 ALTER TABLE `status_type` DISABLE KEYS */;
INSERT INTO `status_type` VALUES (1,NULL,NULL,'出库计划状态',NULL,'2015-09-06 11:54:48',NULL,11,NULL);
/*!40000 ALTER TABLE `status_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_valid_change`
--

DROP TABLE IF EXISTS `status_valid_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_valid_change` (
  `svc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id_from` bigint(20) DEFAULT NULL,
  `status_id_to` bigint(20) DEFAULT NULL,
  `condition_expression` varchar(30) DEFAULT NULL,
  `transition_name` varchar(30) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`svc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_valid_change`
--

LOCK TABLES `status_valid_change` WRITE;
/*!40000 ALTER TABLE `status_valid_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_valid_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uom` (
  `uom_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uom_type_id` bigint(20) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pinyin_name` varchar(50) DEFAULT NULL,
  `sequence_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uom_id`),
  KEY `FK_jr1` (`uom_type_id`),
  CONSTRAINT `FK_jr1` FOREIGN KEY (`uom_type_id`) REFERENCES `uom_type` (`uom_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` VALUES (1,1,'Kg','千克','qk',NULL,NULL,NULL,NULL,NULL),(2,1,'g','克',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_conversion`
--

DROP TABLE IF EXISTS `uom_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uom_conversion` (
  `uom_conversion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uom_id_from` bigint(20) DEFAULT NULL,
  `uom_id_to` bigint(20) DEFAULT NULL,
  `conversion_factor` double DEFAULT NULL,
  `rounding_mode` varchar(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uom_conversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_conversion`
--

LOCK TABLES `uom_conversion` WRITE;
/*!40000 ALTER TABLE `uom_conversion` DISABLE KEYS */;
INSERT INTO `uom_conversion` VALUES (1,1,2,1000,'',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `uom_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_type`
--

DROP TABLE IF EXISTS `uom_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uom_type` (
  `uom_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `has_table` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  `created_by_user` bigint(20) DEFAULT NULL,
  `last_updated_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uom_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_type`
--

LOCK TABLES `uom_type` WRITE;
/*!40000 ALTER TABLE `uom_type` DISABLE KEYS */;
INSERT INTO `uom_type` VALUES (1,NULL,NULL,'重量',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `uom_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`),
  CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (-3,-2),(-1,-2),(-3,-1),(-2,-1),(10,-1),(11,-1);
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

-- Dump completed on 2016-02-20  0:30:18
