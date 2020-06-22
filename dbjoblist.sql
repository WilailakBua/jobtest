-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: joblist
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
INSERT INTO `list` VALUES (1,'2020-06-20'),(2,'2020-06-20'),(3,'2020-06-21'),(4,'2020-06-21'),(5,'2020-06-21'),(6,'2020-06-21'),(7,'2020-06-21'),(8,'2020-06-21'),(9,'2020-06-21'),(10,'2020-06-21'),(11,'2020-06-21'),(12,'2020-06-21'),(13,'2020-06-21'),(14,'2020-06-21'),(15,'2020-06-21'),(16,'2020-06-21'),(17,'2020-06-22'),(18,'2020-06-22'),(19,'2020-06-22');
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_detail`
--

DROP TABLE IF EXISTS `list_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_detail` (
  `idlist` int NOT NULL,
  `list` varchar(1000) NOT NULL,
  `listdate` date NOT NULL,
  `liststatus` varchar(45) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`idlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_detail`
--

LOCK TABLES `list_detail` WRITE;
/*!40000 ALTER TABLE `list_detail` DISABLE KEYS */;
INSERT INTO `list_detail` VALUES (1,'read a book','2020-06-20','new',1),(2,'buy some fruit','2020-06-20','cancel',1),(3,'eat some fruit','2020-06-20','cancel',2),(4,'eat some food','2020-06-21','cancel',2),(5,'paris','2020-06-21','cancel',14),(6,'london','2020-06-21','complete',14),(7,'meet friends','2020-06-21','complete',15),(8,'buy milk','2020-06-21','new',16),(9,'buy apple','2020-06-22','new',17),(10,'buy apple','2020-06-22','cancel',18),(11,'buy banana','2020-06-22','new',19);
/*!40000 ALTER TABLE `list_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22 22:00:58
