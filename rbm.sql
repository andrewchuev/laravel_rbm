-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: rbm
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.2

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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Участок 1',NULL,'2023-03-23 21:21:49'),(2,'Участок 2',NULL,NULL),(3,'Участок 3',NULL,NULL),(4,'Участок 4',NULL,NULL);
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachmentable`
--

DROP TABLE IF EXISTS `attachmentable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachmentable` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attachmentable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachmentable_id` int unsigned NOT NULL,
  `attachment_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attachmentable_attachmentable_type_attachmentable_id_index` (`attachmentable_type`,`attachmentable_id`),
  KEY `attachmentable_attachment_id_foreign` (`attachment_id`),
  CONSTRAINT `attachmentable_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachmentable`
--

LOCK TABLES `attachmentable` WRITE;
/*!40000 ALTER TABLE `attachmentable` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachmentable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `user_id` bigint unsigned DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `driver_no` int NOT NULL,
  `car_no` int NOT NULL,
  `area_id` int NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `place_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Andrew','andrew@mail.com','+1111111111','405941565',NULL,'2023-04-14 22:39:07',34663,65734,4,47.83139400,35.13762500,32),(2,'Иванов Иван','driver@mail.com','+333333333','6273720116','2023-03-24 19:46:50','2023-04-08 15:25:17',54323,4567,1,47.86081500,35.19334200,12),(3,'Досаев Батырбек','driver@mail.com','+333333333','10000001','2023-03-25 20:23:28','2023-04-08 15:23:10',234234,345234,2,47.81765600,35.21803300,19),(4,'Жакапов Аман','aman@mail.com','+555555555','10000002','2023-03-31 08:06:30','2023-04-08 15:05:29',5555,5555,3,47.84804400,35.19231300,24),(5,'Генжебаев Мухит','genzhebaev_mukhit@mail.com','+7777777','10000003','2023-03-31 08:07:36','2023-04-08 15:02:46',777,777,4,47.87438800,35.05828600,39);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2015_04_12_000000_create_orchid_users_table',1),(4,'2015_10_19_214424_create_orchid_roles_table',1),(5,'2015_10_19_214425_create_orchid_role_users_table',1),(6,'2016_08_07_125128_create_orchid_attachmentstable_table',1),(7,'2017_09_17_125801_create_notifications_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2023_03_21_140805_create_drivers_table',2),(11,'2023_03_21_140827_create_places_table',2),(13,'2023_03_21_192645_create_visits_table',3),(14,'2023_03_23_200459_add_carno_and_driverno_to_drivers_table',4),(15,'2023_03_23_200750_change_chatid_type_in_drivers_table',5),(16,'2023_03_23_201302_create_areas_table',6),(17,'2023_03_23_201424_add_area_id_to_places_table',6),(18,'2023_03_23_202720_add_area_id_to_drivers_table',7),(19,'2023_03_23_202948_remove_place_id_from_drivers_table',8),(21,'2023_04_08_093739_add_last_location_place_and_point_to_drivers',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Бур агрегат № 1',NULL,NULL,1),(2,'УОС',NULL,NULL,1),(3,'Компрессор',NULL,'2023-03-24 19:31:01',1),(4,'РВР','2023-03-21 16:31:28','2023-03-24 19:31:08',1),(5,'Шламник','2023-03-24 19:31:23','2023-03-24 19:31:23',1),(6,'Водозабор','2023-03-24 19:31:34','2023-03-24 19:31:34',1),(7,'Глинстанция','2023-03-24 19:31:44','2023-03-24 19:31:44',1),(8,'База','2023-03-24 19:31:55','2023-03-24 19:31:55',1),(9,'Заправка','2023-03-24 19:32:01','2023-03-24 19:32:01',1),(10,'Септик','2023-03-24 19:32:08','2023-03-24 19:32:08',1),(11,'Бур агрегат №1','2023-03-24 19:32:34','2023-03-24 19:32:34',2),(12,'УОС','2023-03-24 19:32:43','2023-03-24 19:32:43',2),(13,'Компрессор','2023-03-24 19:32:53','2023-03-24 19:32:53',2),(14,'РВМ','2023-03-24 19:33:13','2023-03-24 19:33:13',2),(15,'Шламник','2023-03-24 19:33:20','2023-03-24 19:33:20',2),(16,'Водозабор','2023-03-24 19:33:27','2023-03-24 19:33:27',2),(17,'Глинстанция','2023-03-24 19:33:35','2023-03-24 19:33:35',2),(18,'База','2023-03-24 19:33:44','2023-03-24 19:33:44',2),(19,'Заправка','2023-03-24 19:33:52','2023-03-24 19:33:52',2),(20,'Септик','2023-03-24 19:33:59','2023-03-24 19:33:59',2),(21,'Бур агрегат №1','2023-03-24 19:35:34','2023-03-24 19:35:34',3),(22,'УОС','2023-03-24 19:35:43','2023-03-24 19:35:43',3),(23,'Компрессор','2023-03-24 19:35:52','2023-03-24 19:35:52',3),(24,'РВМ','2023-03-24 19:36:02','2023-03-24 19:36:02',3),(25,'Шламник','2023-03-24 19:36:15','2023-03-24 19:36:15',3),(26,'Водозабор','2023-03-24 19:36:23','2023-03-24 19:36:23',3),(27,'Глинстанция','2023-03-24 19:36:30','2023-03-24 19:36:30',3),(28,'База','2023-03-24 19:36:38','2023-03-24 19:36:38',3),(29,'Заправка','2023-03-24 19:36:49','2023-03-24 19:36:49',3),(30,'Септик','2023-03-24 19:36:58','2023-03-24 19:36:58',3),(31,'Бур агрегат №1','2023-03-24 19:37:11','2023-03-24 19:37:11',4),(32,'УОС','2023-03-24 19:37:22','2023-03-24 19:37:22',4),(33,'Компрессор','2023-03-24 19:37:30','2023-03-24 19:37:30',4),(34,'РВМ','2023-03-24 19:37:49','2023-03-24 19:37:49',4),(35,'Шламник','2023-03-24 19:37:57','2023-03-24 19:37:57',4),(36,'Водозабор','2023-03-24 19:38:06','2023-03-24 19:38:06',4),(37,'Глинстанция','2023-03-24 19:38:13','2023-03-24 19:38:13',4),(38,'База','2023-03-24 19:38:20','2023-03-24 19:38:20',4),(39,'Заправка','2023-03-24 19:38:28','2023-03-24 19:38:28',4),(40,'Септик','2023-03-24 19:38:36','2023-03-24 19:38:36',4);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_role_id_foreign` (`role_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrator','Administrator','{\"platform.map\": \"1\", \"platform.areas\": \"1\", \"platform.index\": \"1\", \"platform.places\": \"1\", \"platform.visits\": \"1\", \"platform.drivers\": \"1\", \"platform.systems.roles\": \"1\", \"platform.systems.users\": \"1\", \"platform.systems.attachment\": \"1\"}','2023-03-21 14:35:00','2023-04-09 20:49:00'),(2,'dispatcher','Dispatcher','{\"platform.index\": \"1\", \"platform.systems.roles\": \"0\", \"platform.systems.users\": \"0\", \"platform.systems.attachment\": \"1\"}','2023-03-21 14:35:39','2023-03-21 14:35:39');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com',NULL,'$2y$10$MfhpeQjxFmsaoGWCKiU6PujOKt7YgXOyuMf.MvtV8joTnnq8zFkVi','1yju1jMGj9HdLlP6ZgH2TXskcbrLiX9L2qdTIOSSSf0U24L362Q303cpkGxS','2023-03-20 20:20:51','2023-03-21 15:13:45','{\"platform.index\": true, \"platform.systems.roles\": true, \"platform.systems.users\": true, \"platform.systems.attachment\": true}'),(2,'dispatcher1','dispatcher1@mail.com',NULL,'$2y$10$St5K6.OK/72l8CUaIrPJKuyIdiFobIJymRMrjW84X.adfuGM2lHvG','oB7AVmNmc98KThiV6XB7MdWTnqg5kBy2OsSgtXjxwYBEFbgTgJ0OxTleZnIv','2023-03-21 14:36:41','2023-03-21 14:36:41','{\"platform.index\": \"0\", \"platform.systems.roles\": \"0\", \"platform.systems.users\": \"0\", \"platform.systems.attachment\": \"0\"}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int NOT NULL,
  `place_id` int NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (15,5,39,47.87438800,35.05828600,'2023-04-08 15:02:46','2023-04-08 15:02:46'),(16,4,24,47.84804400,35.19231300,'2023-04-08 15:05:29','2023-04-08 15:05:29'),(17,3,19,47.81765600,35.21803300,'2023-04-08 15:23:10','2023-04-08 15:23:10'),(18,2,12,47.86081500,35.19334200,'2023-04-08 15:25:17','2023-04-08 15:25:17'),(19,1,3,47.85460200,35.13572800,'2023-04-08 15:25:25','2023-04-08 15:25:25'),(20,1,3,47.81153300,35.18688700,'2023-04-09 20:58:25','2023-04-09 20:58:25'),(21,1,3,47.85460200,35.13572800,'2023-04-09 20:59:31','2023-04-09 20:59:31'),(22,1,4,47.81153300,35.18688700,'2023-04-09 21:00:06','2023-04-09 21:00:06'),(23,1,1,47.83133500,35.13756400,'2023-04-09 22:19:10','2023-04-09 22:19:10'),(24,1,1,47.83133500,35.13756400,'2023-04-10 23:29:52','2023-04-10 23:29:52'),(25,1,0,47.83133500,35.13756400,'2023-04-10 23:30:45','2023-04-10 23:30:45'),(26,1,0,47.83131600,35.13754300,'2023-04-10 23:32:51','2023-04-10 23:32:51'),(27,1,38,47.83133500,35.13756400,'2023-04-10 23:33:04','2023-04-10 23:33:04'),(28,1,32,47.83134900,35.13753500,'2023-04-10 23:35:54','2023-04-10 23:35:54'),(29,1,39,47.83134900,35.13753500,'2023-04-10 23:36:42','2023-04-10 23:36:42'),(30,1,37,47.83133500,35.13756400,'2023-04-12 18:17:43','2023-04-12 18:17:43'),(31,1,39,47.83133500,35.13756400,'2023-04-12 18:23:36','2023-04-12 18:23:36'),(32,1,33,47.83133500,35.13756400,'2023-04-12 21:43:22','2023-04-12 21:43:22'),(33,1,3,47.85460200,35.13572800,'2023-04-12 21:45:28','2023-04-12 21:45:28'),(34,1,31,47.83138800,35.13757600,'2023-04-14 22:04:53','2023-04-14 22:04:53'),(35,1,38,47.83138800,35.13757600,'2023-04-14 22:35:58','2023-04-14 22:35:58'),(36,1,35,47.83139400,35.13762500,'2023-04-14 22:38:59','2023-04-14 22:38:59'),(37,1,32,47.83139400,35.13762500,'2023-04-14 22:39:07','2023-04-14 22:39:07');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18 16:47:34
