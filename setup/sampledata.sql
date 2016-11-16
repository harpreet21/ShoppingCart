-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: shopping
-- ------------------------------------------------------
-- Server version	5.6.29

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
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `PID` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BOOKIMAGE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `PTYPE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (121,'Learn how to implement design patterns in Java: each pattern in Java Design Patterns is a complete implementation and the output is generated using Eclipse, making the code accessible to all.','http://it-ebooks.info/images/ebooks/6/java_design_patterns.jpg','Java Design Pattern',25,'book'),(123,'From Unit Testing to Automated Web Tests teaches you a method to build production-worthy, scalable, and well performing Web-enabled applications.','http://media.techtarget.com/tss/static/books/prenticeHall/JavaTestingAndDesign/images/JTDBig.jpg','Java Testing and Design',12,'book'),(124,'Spring in Action, Fourth Edition is a hands-on guide to the Spring Framework, updated for version 4. It covers the latest features, tools, and practices including Spring MVC, REST, Security, Web Flow, and more.','https://images-na.ssl-images-amazon.com/images/I/51gHy16h5TL._SX397_BO1,204,203,200_.jpg','Spring In Action',52,'book'),(142,'Want to add more interactivity and polish to your websites? Discover how jQuery can help you build complex scripting functionality in just a few lines of code.','http://it-ebooks.info/images/ebooks/3/head_first_jquery.jpg','Head First jQuery',50,'book'),(144,'This book will get you way up to speed on the technology you\'ll know it so well, in fact, that you can pass the brand new J2EE 1.5 exam. If that\'s what you want to do, that is.','http://it-ebooks.info/images/ebooks/3/head_first_servlets_and_jsp_2nd_edition.jpg','Head First Servlets and JSP, 2nd Edition',60,'book');
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-15 22:56:08
