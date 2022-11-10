-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: courtneybowehoteldb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomId` int NOT NULL AUTO_INCREMENT,
  `RoomNum` int NOT NULL,
  `RoomType` int NOT NULL,
  `PriceGroup` int NOT NULL,
  `AmenitiesType` int NOT NULL,
  `RoomFloor` int NOT NULL,
  `AdaAccessible` int NOT NULL,
  `StandardOccupancy` int NOT NULL,
  `MaxOccupancy` int NOT NULL,
  PRIMARY KEY (`RoomId`),
  KEY `fk_Room_RoomType` (`RoomType`),
  KEY `fk_Room_PriceGroup` (`PriceGroup`),
  KEY `fk_Room_AmenitiesType` (`AmenitiesType`),
  CONSTRAINT `fk_Room_AmenitiesType` FOREIGN KEY (`AmenitiesType`) REFERENCES `amenitiesgroup` (`AmenitiesGroupId`),
  CONSTRAINT `fk_Room_PriceGroup` FOREIGN KEY (`PriceGroup`) REFERENCES `pricegroup` (`PriceGroupId`),
  CONSTRAINT `fk_Room_RoomType` FOREIGN KEY (`RoomType`) REFERENCES `roomtype` (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,201,2,4,3,2,0,2,4),(2,202,2,3,1,2,1,2,4),(3,203,2,4,3,2,0,2,4),(4,204,2,3,1,2,1,2,4),(5,205,1,2,4,2,0,2,2),(6,206,1,1,2,2,1,2,2),(7,207,1,2,4,2,0,2,2),(8,208,1,1,2,2,1,2,2),(9,301,2,4,3,3,0,2,4),(10,302,2,3,1,3,1,2,4),(11,303,2,4,3,3,0,2,4),(12,304,2,3,1,3,1,2,4),(13,305,1,2,4,3,0,2,2),(14,306,1,1,2,3,1,2,2),(15,307,1,2,4,3,0,2,2),(16,308,1,1,2,3,1,2,2),(17,401,3,5,5,4,1,3,8),(18,402,3,5,5,4,1,3,8);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 18:21:24
