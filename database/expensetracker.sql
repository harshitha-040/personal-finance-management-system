-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: expense_tracker
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `amount` decimal(19,4) NOT NULL,
  `month_year` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `budgets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color_hex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'Salary','INCOME','briefcase','#10b981'),(2,NULL,'Food','EXPENSE','utensils','#f59e0b'),(3,NULL,'Shopping','EXPENSE','shopping-bag','#3b82f6'),(4,NULL,'Housing','EXPENSE','home','#ef4444'),(5,NULL,'Entertainment','EXPENSE','film','#8b5cf6'),(6,1,'Transport','EXPENSE',NULL,NULL),(7,1,'Health','EXPENSE',NULL,NULL),(8,1,'Bills','EXPENSE',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `amount` decimal(19,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `transaction_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `idx_transactions_user_date` (`user_id`,`transaction_date` DESC),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,2,15.0000,'EXPENSE','2026-06-13','coffee','','2026-06-13 07:48:49','2026-06-13 07:58:38'),(2,1,1,50000.0000,'INCOME','2026-06-13','June Salary','','2026-06-13 07:58:15',NULL),(3,1,2,325.0000,'EXPENSE','2026-06-13','Biryani','','2026-06-13 08:18:36',NULL),(4,1,2,450.0000,'EXPENSE','2026-06-13','fruits','','2026-06-13 08:18:58',NULL),(5,1,6,1500.0000,'EXPENSE','2026-06-13','travel','','2026-06-13 08:19:37',NULL),(6,1,3,5000.0000,'EXPENSE','2026-06-13','shoping','','2026-06-13 08:19:55',NULL),(7,1,5,2575.0000,'EXPENSE','2026-06-13','party','','2026-06-13 08:20:10',NULL),(8,1,7,7500.0000,'EXPENSE','2026-06-13','general checkup','','2026-06-13 08:20:33',NULL),(9,1,1,50000.0000,'INCOME','2026-06-13','Salary','','2026-06-13 10:15:34','2026-06-13 10:17:44'),(10,1,1,50000.0000,'INCOME','2026-05-13','Salary','','2026-06-13 10:16:10',NULL),(11,1,8,20000.0000,'EXPENSE','2026-05-13','phone emi','','2026-06-13 10:16:35',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('FREE','PREMIUM','ADMIN') DEFAULT 'FREE',
  `account_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'harshitha@gmail.com','harshitha','$2a$10$nTGBWhHzmo7mP648xkl7o.SfBX2o9hzsSxEIw6waRpDlXrYbJ0pv6','PREMIUM','ACTIVE','2026-06-12 14:37:58','2026-06-13 07:29:27',NULL),(2,'jona@gmail.com','jona','$2a$10$eGDcKHMXr8GRRcwyHLj89e.1TZd1/sZpZIEoYeyVSYWT3Gncu/0hu','PREMIUM','ACTIVE','2026-06-12 14:38:34','2026-06-12 15:14:19',NULL),(3,'ramana@gmail.com','ramana','$2a$10$ZdxXtPbb4FFdyvnQG98jkupOXI0FjZhsrC8RLBUBhMabBdhZgI8N.','FREE','ACTIVE','2026-06-12 14:45:30','2026-06-12 14:45:30',NULL),(4,'ramanajajula@gmail.com','ramana','$2a$10$WUfh3Ir377s52UkfmOwOl.xlM7L1T95bjhkn80C0uFlBWgf8ZJeje','PREMIUM','ACTIVE','2026-06-12 14:49:05','2026-06-12 14:54:13',NULL),(5,'okugtc@gmail.com','yhgr','$2a$10$fhTJsbYco7bAmDfEsdtHgeGR6Hpqjsx76fYnjYh98mfUxhANCw9/6','PREMIUM','ACTIVE','2026-06-12 15:03:07','2026-06-12 15:04:29',NULL),(6,'pro-test@gmail.com','pro','$2a$10$Ugcm6pHaBpNSc62dJPiYjeOEq3P7UMLK80qrPWyYeY9SblmQXsE1C','PREMIUM','ACTIVE','2026-06-12 15:12:57','2026-06-12 15:12:57',NULL),(7,'abhi@gmail.com','abhi','$2a$10$1ar1xjKpXaDCrZfwvjZQPeMg.zZEptaMY4mauBu81CpkZaxarpu6O','PREMIUM','ACTIVE','2026-06-12 15:17:07','2026-06-12 15:17:07',NULL),(8,'nwe@gmail.com','nwe','$2a$10$0Cr24z4FauOg0S/vDrssHOtgnbgSWFYNcB8wNAY3rrbiQlC2Jq732','PREMIUM','ACTIVE','2026-06-13 07:12:44','2026-06-13 07:12:44',NULL);
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

-- Dump completed on 2026-06-15 13:50:26
