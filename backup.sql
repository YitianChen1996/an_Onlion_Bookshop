-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: BookShop_Database
-- ------------------------------------------------------
-- Server version	5.7.15-1

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
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `ownerID` varchar(12) DEFAULT NULL,
  `bookname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES ('2014302666','江泽民传'),('2014302637','江泽民传'),('2014302636','论备胎的自我修养'),('2014302638','华莱士回忆录');
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book`
--

DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book` (
  `bookname` varchar(30) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `ownerID` varchar(12) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `pictureURL` varchar(150) DEFAULT 'http://localhost:8080/index/imgs/imgsb.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES ('华莱士回忆录','（美）华莱士','2014302637','中信出版社',255,'这是一本个人回忆录。华莱士的职业生涯始于20世纪40年代，持续了长达60多年的个人辉煌。','http://localhost:8080/index/imgs/hualaishi.jpg'),('江泽民传','蛤蛤蛤','2014302638','蛤蛤蛤',100,'苟利国家生死以','http://localhost:8080/index/imgs/imgsb.jpg'),('金瓶梅','兰陵笑笑生','2014302638','人民日报出版社',20,'《金瓶梅》是中国第一部文人独立创作的长篇白话世情章回小说','http://localhost:8080/index/imgs/金瓶梅.jpeg'),('论备胎的自我修养','周星驰','2014302638','人民日报出版社',30,'备胎的重要性与自我修养','http://localhost:8080/index/imgs/论备胎的自我修养.jpeg'),('JAVA从入门到放弃','大佬','2014302636','人民邮电出版社',50,'JAVA是世界上最好的语言（转发此条5毛钱）','http://localhost:8080/index/imgs/JAVA.jpeg'),('高等数学','挂科难','2014302637','高等教育出版社',20,'高数好难要挂了','http://localhost:8080/index/imgs/高数.jpeg');
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `studentID` varchar(12) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `emailaddr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2014302636','123','吃瓜群众','123@qq.com'),('2014302637','18980848315','陈绎天','644199325@qq.com'),('2014302638','140033','hubo','1725493464@qq.com'),('2014302666','123','我也不知道是谁','789@qq.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-01 22:32:46
