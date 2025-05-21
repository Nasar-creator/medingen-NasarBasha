-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: medingen
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `alternatives`
--

DROP TABLE IF EXISTS `alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alternatives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text,
  `discount` text,
  `brand` varchar(255) DEFAULT NULL,
  `composition` text,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `alternatives_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternatives`
--

LOCK TABLES `alternatives` WRITE;
/*!40000 ALTER TABLE `alternatives` DISABLE KEYS */;
INSERT INTO `alternatives` VALUES (1,NULL,'DOLOWIN PLUS TAB',95.00,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','75','MICRO LABS LIMITED','Paracetamol 650'),(2,NULL,'DOLOWIN PLUS TAB',95.00,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','75','MICRO LABS LIMITED','Paracetamol 650'),(3,NULL,'DOLOWIN PLUS TAB',95.00,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','75','MICRO LABS LIMITED','Paracetamol 650'),(4,NULL,'DOLOWIN PLUS TAB',95.00,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','75','MICRO LABS LIMITED','Paracetamol 650'),(5,NULL,'DOLOWIN PLUS TAB',95.00,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','75','MICRO LABS LIMITED','Paracetamol 650'),(6,NULL,'DOLOWIN PLUS TAB',95.00,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','75','MICRO LABS LIMITED','Paracetamol 650');
/*!40000 ALTER TABLE `alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,1,'What is the dosage for this medicine?','Please follow your doctor’s prescription for correct dosage.','2025-05-21 20:51:14'),(2,1,'Can I take this medicine on an empty stomach?','It is recommended to take this medicine after food unless advised otherwise.','2025-05-21 20:51:14'),(3,1,'Are there any side effects?','Common side effects include nausea and dizziness. Consult your doctor if they persist.','2025-05-21 20:51:14'),(4,1,'Is this medicine safe during pregnancy?','Consult your doctor before using this medicine if you are pregnant.','2025-05-21 20:51:14'),(5,1,'How should I store this medicine?','Store it in a cool and dry place away from sunlight.','2025-05-21 20:51:14'),(6,1,'What is the dosage for this medicine?','Please follow your doctor’s prescription for correct dosage.','2025-05-21 21:32:08'),(7,1,'Can I take this medicine on an empty stomach?','It is recommended to take this medicine after food unless advised otherwise.','2025-05-21 21:32:08'),(8,1,'Are there any side effects?','Common side effects include nausea and dizziness. Consult your doctor if they persist.','2025-05-21 21:32:08'),(9,1,'Is this medicine safe during pregnancy?','Consult your doctor before using this medicine if you are pregnant.','2025-05-21 21:32:08'),(10,1,'How should I store this medicine?','Store it in a cool and dry place away from sunlight.','2025-05-21 21:32:08');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `about` text,
  `uses` text,
  `working` text,
  `side_effects` text,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `medicines_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `composition` text,
  `discount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'UDIVIL 300MG TABLTS 15\'S','MICRO LABS LIMITED',NULL,34.00,NULL,'MedBrand','Paracetamol 500mg',15),(2,'Dolo 650','Micro Labs','Pain reliever and fever reducer',20.50,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','MedBrand','Paracetamol 500mg',15),(3,'Dolo 650','Micro Labs','Pain reliever and fever reducer',20.50,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','MedBrand','Paracetamol 500mg',15),(4,'Dolo 650','Micro Labs','Pain reliever and fever reducer',20.50,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','MedBrand','Paracetamol 500mg',15),(5,'Crocin 500','GSK','Effective for mild to moderate pain',18.00,'https://res.cloudinary.com/db4wknrol/image/upload/v1747773548/alternativeimage2_mgysja.jpg','MedBrand','Paracetamol 500mg',30);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsalts`
--

DROP TABLE IF EXISTS `productsalts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsalts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `salt_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `salt_id` (`salt_id`),
  CONSTRAINT `productsalts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `productsalts_ibfk_2` FOREIGN KEY (`salt_id`) REFERENCES `salts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsalts`
--

LOCK TABLES `productsalts` WRITE;
/*!40000 ALTER TABLE `productsalts` DISABLE KEYS */;
INSERT INTO `productsalts` VALUES (1,1,1),(111,1,1),(112,1,1),(114,4,1),(115,4,1),(116,5,1),(222,3,1),(223,2,2);
/*!40000 ALTER TABLE `productsalts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (34,1,4.5,'Very effective for pain relief.'),(35,1,4.5,'Very effective for pain relief.'),(40,2,3.5,'Works okay but took longer than expected.'),(41,2,4,'Good product, recommended.'),(42,2,3.5,'Works okay but took longer than expected.'),(43,2,4,'Good product, recommended.'),(44,3,2,'Did not work well for me.'),(45,3,4.5,'Good value for money.'),(46,4,5,'Best medicine I have tried so far.'),(47,4,3,'Average results, might try something else.'),(48,5,4,'Effective and affordable.'),(49,5,4.2,'Good quality, helped with symptoms.');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salts`
--

DROP TABLE IF EXISTS `salts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `salts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salts`
--

LOCK TABLES `salts` WRITE;
/*!40000 ALTER TABLE `salts` DISABLE KEYS */;
INSERT INTO `salts` VALUES (1,NULL,'Paracetamol 650'),(2,NULL,'Aceclofenac'),(3,NULL,'Chlorzoxazone'),(4,NULL,'Serratiopeptidase'),(5,NULL,'Rabeprazole');
/*!40000 ALTER TABLE `salts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test@example.com','123456');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-22  3:57:15
