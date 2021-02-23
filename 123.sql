-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: team3
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advanced`
--

DROP TABLE IF EXISTS `advanced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advanced` (
  `advanced_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '高級展間會員ID',
  `advance_img_path` varchar(45) NOT NULL COMMENT '''高級展間封面圖片路徑''',
  PRIMARY KEY (`advanced_id`),
  KEY `member_id3_idx` (`member_id`),
  CONSTRAINT `member_id5` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advanced`
--

LOCK TABLES `advanced` WRITE;
/*!40000 ALTER TABLE `advanced` DISABLE KEYS */;
/*!40000 ALTER TABLE `advanced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background`
--

DROP TABLE IF EXISTS `background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `background` (
  `background_id` int NOT NULL AUTO_INCREMENT,
  `bg_img_path` varchar(45) NOT NULL,
  `bg_category` int NOT NULL,
  PRIMARY KEY (`background_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background`
--

LOCK TABLES `background` WRITE;
/*!40000 ALTER TABLE `background` DISABLE KEYS */;
INSERT INTO `background` VALUES (1,'1',1);
/*!40000 ALTER TABLE `background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidding_list`
--

DROP TABLE IF EXISTS `bidding_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidding_list` (
  `bidding_id` int NOT NULL AUTO_INCREMENT,
  `work_id` int NOT NULL COMMENT '競標的展品ID',
  `member_id` int NOT NULL COMMENT '競標品作者ID',
  `bidding_time` datetime NOT NULL COMMENT '競標時間',
  `start_price` int NOT NULL COMMENT '起始價格',
  `now_price` int NOT NULL COMMENT '目前價格',
  `bidding_verify` int NOT NULL COMMENT '競標品審核',
  `bidding_exhibition` int NOT NULL COMMENT '競標品是否上架',
  `member_id_win` int DEFAULT NULL COMMENT '得標者ID',
  PRIMARY KEY (`bidding_id`),
  KEY `memberid71_idx` (`member_id`),
  KEY `workid7_idx` (`work_id`),
  CONSTRAINT `memberid71` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `workid7` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidding_list`
--

LOCK TABLES `bidding_list` WRITE;
/*!40000 ALTER TABLE `bidding_list` DISABLE KEYS */;
INSERT INTO `bidding_list` VALUES (1,1,1,'2020-10-10 00:00:00',1,1,1,1,1);
/*!40000 ALTER TABLE `bidding_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidding_message`
--

DROP TABLE IF EXISTS `bidding_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidding_message` (
  `bidding_message_id` int NOT NULL AUTO_INCREMENT,
  `work_id` int NOT NULL COMMENT '競標品ID',
  `member_id` int NOT NULL COMMENT '留言者ID',
  `bidding_messages` varchar(250) NOT NULL COMMENT '留言內容',
  `message_time` datetime NOT NULL COMMENT '留言時間',
  PRIMARY KEY (`bidding_message_id`),
  KEY `work_id51_idx` (`work_id`),
  KEY `member_id51_idx` (`member_id`),
  CONSTRAINT `member_id6` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `work_id6` FOREIGN KEY (`work_id`) REFERENCES `bidding_list` (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidding_message`
--

LOCK TABLES `bidding_message` WRITE;
/*!40000 ALTER TABLE `bidding_message` DISABLE KEYS */;
INSERT INTO `bidding_message` VALUES (1,1,1,'1','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `bidding_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidding_price`
--

DROP TABLE IF EXISTS `bidding_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidding_price` (
  `bidding_price_id` int NOT NULL AUTO_INCREMENT,
  `work_id` int NOT NULL COMMENT '競標品ID',
  `member_id` int NOT NULL COMMENT '競標者ID',
  `bidding_price` int NOT NULL COMMENT '競標價格',
  `bidding_time` datetime NOT NULL COMMENT '競標時間',
  PRIMARY KEY (`bidding_price_id`),
  KEY `work_id71_idx` (`work_id`),
  KEY `member_id71_idx` (`member_id`),
  CONSTRAINT `member_id71` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `work_id71` FOREIGN KEY (`work_id`) REFERENCES `bidding_list` (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidding_price`
--

LOCK TABLES `bidding_price` WRITE;
/*!40000 ALTER TABLE `bidding_price` DISABLE KEYS */;
INSERT INTO `bidding_price` VALUES (1,1,1,1,'2020-10-10 00:00:00');
/*!40000 ALTER TABLE `bidding_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `collection_id` int NOT NULL AUTO_INCREMENT,
  `work_id` int NOT NULL,
  `collection_subject` int NOT NULL,
  PRIMARY KEY (`collection_id`),
  KEY `work_id_idx` (`work_id`),
  CONSTRAINT `work_id` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,1,1);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_list`
--

DROP TABLE IF EXISTS `like_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_list` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `work_id` int NOT NULL COMMENT '展品ID',
  `member_id` int NOT NULL COMMENT '按讚者ID',
  `like` int NOT NULL COMMENT '是否按讚',
  PRIMARY KEY (`like_id`),
  KEY `work_id2_idx` (`work_id`),
  KEY `member_id2_idx` (`member_id`),
  CONSTRAINT `member_id2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `work_id2` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_list`
--

LOCK TABLES `like_list` WRITE;
/*!40000 ALTER TABLE `like_list` DISABLE KEYS */;
INSERT INTO `like_list` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `like_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manger_member`
--

DROP TABLE IF EXISTS `Manger_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manger_member` (
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT '管理者編號',
  `Name` varchar(45) NOT NULL COMMENT '''姓名''',
  `Account` varchar(45) NOT NULL COMMENT '''帳號''',
  `Password` varchar(45) NOT NULL COMMENT '''密碼''',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manger_member`
--

LOCK TABLES `Manger_member` WRITE;
/*!40000 ALTER TABLE `Manger_member` DISABLE KEYS */;
INSERT INTO `Manger_member` VALUES (1,'henry','henry','123');
/*!40000 ALTER TABLE `Manger_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL COMMENT '會員編號',
  `name` varchar(45) NOT NULL COMMENT '''會員姓名''',
  `en_name` varchar(45) DEFAULT NULL COMMENT '''英文姓名''',
  `account` varchar(45) NOT NULL COMMENT '''帳號''',
  `password` varchar(45) NOT NULL COMMENT '''密碼''',
  `email` varchar(45) NOT NULL COMMENT '''信箱''',
  `level` int NOT NULL COMMENT '會員等級',
  `blacklist` int NOT NULL COMMENT '黑名單',
  `introduction` varchar(255) DEFAULT NULL COMMENT '''自介''',
  `join_date` datetime NOT NULL COMMENT '加入日期',
  `bidding_giveup` int DEFAULT NULL COMMENT '棄標次數',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'henry',NULL,'henry','123','henry@gmail.com',1,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',1),(2,'a',NULL,'abc','123','abc@gmail.com',1,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(3,'b',NULL,'abc','123','abc@gmail.com',1,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(4,'c',NULL,'abc','123','abc@gmail.com',2,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(5,'d',NULL,'abc','123','abc@gmail.com',1,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(6,'e',NULL,'abc','123','abc@gmail.com',1,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(7,'f',NULL,'abc','123','abc@gmail.com',2,2,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(8,'g',NULL,'abc','123','abc@gmail.com',1,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(9,'h',NULL,'abc','123','abc@gmail.com',2,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(10,'i',NULL,'abc','123','abc@gmail.com',1,1,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL),(11,'j',NULL,'abc','123','abc@gmail.com',1,2,'中華民國創建於西元1912年，是亞洲第一個民主共和國。民國38年12月7日，中華民國政府播遷來臺，轄有臺灣本島及其附屬島嶼、澎湖群島、金門群島、馬祖列島、東沙群島、中沙群島、南沙群島等地，有效管轄土地面積3萬6,197.067平方公里。','2020-10-10 00:00:00',NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcard`
--

DROP TABLE IF EXISTS `postcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postcard` (
  `postcard_id` int NOT NULL AUTO_INCREMENT COMMENT '明信片素材id',
  `postcard_name` varchar(45) NOT NULL COMMENT '''素材名稱''',
  `postcard_img_path` varchar(45) NOT NULL COMMENT '''圖片路徑''',
  `postcard_exhibition` int NOT NULL COMMENT '是否上架',
  `postcard_category` int NOT NULL COMMENT '素材種類',
  PRIMARY KEY (`postcard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcard`
--

LOCK TABLES `postcard` WRITE;
/*!40000 ALTER TABLE `postcard` DISABLE KEYS */;
INSERT INTO `postcard` VALUES (1,'1','1',1,1);
/*!40000 ALTER TABLE `postcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscripition`
--

DROP TABLE IF EXISTS `subscripition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscripition` (
  `subscripition_id` int NOT NULL AUTO_INCREMENT,
  `fans_id` int NOT NULL COMMENT '訂閱者ID',
  `subscribed_id` int NOT NULL COMMENT '被訂閱者ID',
  PRIMARY KEY (`subscripition_id`),
  KEY `member_id4_idx` (`fans_id`),
  KEY `member_id8_idx` (`subscribed_id`),
  CONSTRAINT `member_id4` FOREIGN KEY (`fans_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `member_id8` FOREIGN KEY (`subscribed_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscripition`
--

LOCK TABLES `subscripition` WRITE;
/*!40000 ALTER TABLE `subscripition` DISABLE KEYS */;
INSERT INTO `subscripition` VALUES (1,1,1);
/*!40000 ALTER TABLE `subscripition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work` (
  `work_id` int NOT NULL COMMENT '作品ID',
  `work_name` varchar(45) NOT NULL COMMENT '''作品名稱''',
  `member_id` int NOT NULL COMMENT '會員ID',
  `work_introduce` varchar(250) DEFAULT NULL COMMENT '''作品簡介''',
  `img_path` varchar(45) NOT NULL COMMENT '''圖片路徑''',
  `work_score` int DEFAULT NULL COMMENT '作品評分',
  `like_num` int DEFAULT NULL COMMENT '按讚數',
  `exhibition` int NOT NULL COMMENT '上架',
  `verify` int NOT NULL COMMENT '''審核',
  `visitors` int DEFAULT NULL COMMENT '瀏覽人數',
  `exhibition_time` int DEFAULT NULL COMMENT '上架時間',
  PRIMARY KEY (`work_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,'1',1,'1','1',1,1,1,1,1,0),(2,'1',1,'1','1',1,1,1,1,1,1),(3,'1',1,'1','1',1,1,1,1,1,1),(4,'1',2,'1','1',1,1,1,1,1,1),(5,'1',2,'1','1',1,1,1,1,1,1),(6,'1',2,'1','1',1,1,1,1,1,1),(7,'1',3,'1','1',1,1,1,1,1,1),(8,'1',4,'1','1',1,1,1,1,1,1),(9,'1',5,'1','1',1,1,1,1,1,1),(10,'1',2,'1','1',1,1,1,1,1,1),(11,'1',3,'1','1',1,1,1,1,1,1);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_message`
--

DROP TABLE IF EXISTS `work_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `work_id` int NOT NULL COMMENT '展品ID',
  `message_text` varchar(255) NOT NULL COMMENT '''留言內容''',
  `member_id` int NOT NULL COMMENT '留言者ID',
  `message_time` datetime NOT NULL COMMENT '留言時間',
  `message_port` int NOT NULL COMMENT '檢舉留言',
  PRIMARY KEY (`message_id`),
  KEY `work_id1_idx` (`work_id`),
  KEY `member_id1_idx` (`member_id`),
  CONSTRAINT `member_id1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `work_id1` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_message`
--

LOCK TABLES `work_message` WRITE;
/*!40000 ALTER TABLE `work_message` DISABLE KEYS */;
INSERT INTO `work_message` VALUES (1,1,'1',1,'2020-10-10 00:00:00',1);
/*!40000 ALTER TABLE `work_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'team3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-23 14:23:05
