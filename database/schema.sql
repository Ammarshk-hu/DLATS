-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: dlats
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(30) DEFAULT 'Admin',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'RTO Admin','[admin@dlats.com](mailto:admin@dlats.com)','admin123','Admin','2026-09-27 21:18:22'),(2,'Verification Officer','[officer@dlats.com](mailto:officer@dlats.com)','officer123','Officer','2026-09-27 21:18:22');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `application_no` varchar(30) NOT NULL,
  `user_id` int NOT NULL,
  `class_id` int NOT NULL,
  `application_type` varchar(50) NOT NULL,
  `application_date` date NOT NULL,
  `current_status` varchar(50) NOT NULL DEFAULT 'Application Submitted',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`application_id`),
  UNIQUE KEY `application_no` (`application_no`),
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `vehicle_class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'DL202600101',1,3,'New Driving License','2026-09-10','Application Verification','2026-09-27 21:13:24'),(2,'DL202600102',2,2,'New Driving License','2026-09-11','Application Submitted','2026-09-27 21:13:24');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_status`
--

DROP TABLE IF EXISTS `application_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `application_id` int NOT NULL,
  `admin_id` int DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`),
  KEY `application_id` (`application_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `application_status_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`),
  CONSTRAINT `application_status_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_status`
--

LOCK TABLES `application_status` WRITE;
/*!40000 ALTER TABLE `application_status` DISABLE KEYS */;
INSERT INTO `application_status` VALUES (10,1,NULL,'Application Submitted','Application submitted successfully','2026-09-27 21:18:36'),(11,1,1,'Application Verification','Application is under verification','2026-09-27 21:18:36'),(12,2,NULL,'Application Submitted','Application submitted successfully','2026-09-27 21:18:36');
/*!40000 ALTER TABLE `application_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driving_test`
--

DROP TABLE IF EXISTS `driving_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driving_test` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `application_id` int NOT NULL,
  `test_date` date DEFAULT NULL,
  `test_time` time DEFAULT NULL,
  `test_location` varchar(150) DEFAULT NULL,
  `result` varchar(20) DEFAULT 'Scheduled',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `driving_test_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driving_test`
--

LOCK TABLES `driving_test` WRITE;
/*!40000 ALTER TABLE `driving_test` DISABLE KEYS */;
INSERT INTO `driving_test` VALUES (1,1,'2026-10-15','10:30:00','RTO Mumbai','Scheduled','Driving test scheduled'),(2,1,'2026-10-15','10:30:00','RTO Mumbai','Scheduled','Driving test scheduled');
/*!40000 ALTER TABLE `driving_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `license_id` int NOT NULL AUTO_INCREMENT,
  `application_id` int NOT NULL,
  `license_number` varchar(30) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `license_status` varchar(20) DEFAULT 'Active',
  PRIMARY KEY (`license_id`),
  UNIQUE KEY `application_id` (`application_id`),
  UNIQUE KEY `license_number` (`license_number`),
  CONSTRAINT `license_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (1,1,'MH01DL20261001','2026-11-01','2046-11-01','Active');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Rahul Sharma','[rahul@example.com](mailto:rahul@example.com)','rahul123','9876543210','2000-05-15','Male','Andheri West','Mumbai','Maharashtra','400058','2026-09-27 21:11:54'),(2,'Priya Patil','[priya@example.com](mailto:priya@example.com)','priya123','9876501234','1999-08-20','Female','Kothrud','Pune','Maharashtra','411038','2026-09-27 21:11:54');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_class`
--

DROP TABLE IF EXISTS `vehicle_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_code` varchar(20) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_code` (`class_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_class`
--

LOCK TABLES `vehicle_class` WRITE;
/*!40000 ALTER TABLE `vehicle_class` DISABLE KEYS */;
INSERT INTO `vehicle_class` VALUES (1,'MCWOG','Motorcycle Without Gear','Two wheeler without gear'),(2,'MCWG','Motorcycle With Gear','Two wheeler with gear'),(3,'LMV','Light Motor Vehicle','Cars and other light motor vehicles'),(4,'HMV','Heavy Motor Vehicle','Heavy motor vehicles');
/*!40000 ALTER TABLE `vehicle_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-05 18:28:49
