-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rbm
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Участок 1',NULL,'2023-03-23 21:21:49'),(2,'Участок 2',NULL,NULL),(3,'Участок 3',NULL,NULL),(4,'Участок 4',NULL,NULL),(7,'Мастер','2023-04-24 16:31:26','2023-04-24 16:31:26'),(8,'Заречное','2023-04-24 16:44:56','2023-04-24 16:44:56'),(9,'Алматы','2023-04-27 08:15:54','2023-04-27 08:15:54');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachmentable`
--

DROP TABLE IF EXISTS `attachmentable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachmentable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attachmentable_type` varchar(255) NOT NULL,
  `attachmentable_id` int(10) unsigned NOT NULL,
  `attachment_id` int(10) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `original_name` text NOT NULL,
  `mime` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `path` text NOT NULL,
  `description` text DEFAULT NULL,
  `alt` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `disk` varchar(255) NOT NULL DEFAULT 'public',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `telegram_id` varchar(50) NOT NULL,
  `driver_no` varchar(20) NOT NULL,
  `car_no` varchar(20) NOT NULL,
  `area_id` int(11) NOT NULL DEFAULT 0,
  `place_id` int(11) NOT NULL DEFAULT 0,
  `lat` decimal(10,8) NOT NULL DEFAULT 0.00000000,
  `lng` decimal(11,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Andrew','andrew@mail.com','+1111111111','4059415651','34663','65734',4,35,47.83139400,35.13762500,NULL,'2023-04-19 10:25:00'),(2,'Иванов Иван','driver@mail.com','+333333333','6273720116','54323','4567',2,15,44.77400200,67.65693056,'2023-03-24 19:46:50','2023-04-19 11:05:47'),(3,'Досаев Батырбек','driver@mail.com','+333333333','10000001','234234','345234',2,19,47.81765600,35.21803300,'2023-03-25 20:23:28','2023-04-08 15:23:10'),(4,'Жакапов Аман','aman@mail.com','+555555555','10000002','5555','5555',3,24,47.84804400,35.19231300,'2023-03-31 08:06:30','2023-04-08 15:05:29'),(5,'Генжебаев Мухит','genzhebaev_mukhit@mail.com','+7777777','10000003','777','777',4,39,47.87438800,35.05828600,'2023-03-31 08:07:36','2023-04-08 15:02:46'),(13,'Makenzo_707','udefined@mail.com','+77012314923','457783949','0','707',1,5,42.36337100,69.62345500,'2023-04-19 17:23:52','2023-04-25 15:13:56'),(14,'Andrey','udefined@mail.com','555555555','405941565','0','0',1,8,44.75939455,67.64602453,'2023-04-20 21:24:53','2023-04-23 20:50:33'),(17,'Айза','udefined@mail.com','+77072843226','718520719','0','0',7,44,42.37587500,69.66266500,'2023-04-24 16:35:20','2023-04-24 17:41:59'),(18,'Zhanna','udefined@mail.com','+77029722235','5286899175','0','0',8,47,42.52910400,67.58336900,'2023-04-24 16:43:21','2023-04-26 05:04:22'),(19,'Фролов А.А.','udefined@mail.com','+77019405840','956528931','Борт 10','Toyota 505',9,50,43.22688300,76.96652700,'2023-04-27 08:11:08','2023-04-27 08:39:27');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `fill_color` varchar(10) DEFAULT NULL,
  `latlng_center` varchar(100) DEFAULT NULL,
  `latlng_lb` varchar(50) DEFAULT NULL,
  `latlng_lt` varchar(50) DEFAULT NULL,
  `latlng_rt` varchar(50) DEFAULT NULL,
  `latlng_rb` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Бур агрегат № 1',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'УОС',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Компрессор',NULL,'2023-03-24 19:31:01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'РВР','2023-03-21 16:31:28','2023-03-24 19:31:08',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Шламник','2023-03-24 19:31:23','2023-03-24 19:31:23',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Водозабор','2023-03-24 19:31:34','2023-03-24 19:31:34',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Глинстанция','2023-03-24 19:31:44','2023-03-24 19:31:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'База','2023-03-24 19:31:55','2023-03-24 19:31:55',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Заправка','2023-03-24 19:32:01','2023-03-24 19:32:01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Септик','2023-03-24 19:32:08','2023-03-24 19:32:08',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Бур агрегат №1','2023-03-24 19:32:34','2023-03-24 19:32:34',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'УОС','2023-03-24 19:32:43','2023-03-24 19:32:43',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Компрессор','2023-03-24 19:32:53','2023-03-24 19:32:53',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'РВМ','2023-03-24 19:33:13','2023-03-24 19:33:13',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'Шламонакопитель','2023-03-24 19:33:20','2023-04-26 22:09:15',2,'#00ff80','#408080','44.77400200000002, 67.6569305595236','44.773895, 67.655493','44.774916, 67.656759','44.774170, 67.658400','44.772966, 67.657113'),(16,'Водозабор','2023-03-24 19:33:27','2023-03-24 19:33:27',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Глинстанция','2023-03-24 19:33:35','2023-03-24 19:33:35',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'База','2023-03-24 19:33:44','2023-03-24 19:33:44',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Заправка','2023-03-24 19:33:52','2023-03-24 19:33:52',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'Септик','2023-03-24 19:33:59','2023-03-24 19:33:59',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'Бур агрегат №1','2023-03-24 19:35:34','2023-03-24 19:35:34',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'УОС','2023-03-24 19:35:43','2023-03-24 19:35:43',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Компрессор','2023-03-24 19:35:52','2023-03-24 19:35:52',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'РВМ','2023-03-24 19:36:02','2023-03-24 19:36:02',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'Шламник','2023-03-24 19:36:15','2023-03-24 19:36:15',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'Водозабор','2023-03-24 19:36:23','2023-03-24 19:36:23',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'Глинстанция','2023-03-24 19:36:30','2023-03-24 19:36:30',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'База','2023-03-24 19:36:38','2023-03-24 19:36:38',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'Заправка','2023-03-24 19:36:49','2023-03-24 19:36:49',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'Септик','2023-03-24 19:36:58','2023-03-24 19:36:58',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'Бур агрегат №1','2023-03-24 19:37:11','2023-03-24 19:37:11',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'УОС','2023-03-24 19:37:22','2023-03-24 19:37:22',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'Компрессор','2023-03-24 19:37:30','2023-03-24 19:37:30',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'РВМ','2023-03-24 19:37:49','2023-03-24 19:37:49',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'Шламонакопитель','2023-03-24 19:37:57','2023-04-26 22:06:12',4,'#b71e02','#8080ff','44.79817787549735, 67.72020027116405','44.797394, 67.719009','44.798741, 67.718913','44.798749, 67.721423','44.797417, 67.721541'),(36,'Водозабор','2023-03-24 19:38:06','2023-03-24 19:38:06',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'Глинстанция','2023-03-24 19:38:13','2023-03-24 19:38:13',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'База','2023-03-24 19:38:20','2023-03-24 19:38:20',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'Заправка','2023-03-24 19:38:28','2023-03-24 19:38:28',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'Септик','2023-03-24 19:38:36','2023-03-24 19:38:36',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'Стоматология','2023-04-24 16:34:14','2023-04-24 16:34:14',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'Заправка','2023-04-24 16:34:26','2023-04-24 16:34:26',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'Аптека','2023-04-24 16:34:38','2023-04-24 16:34:38',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'Кайтпас-1609','2023-04-24 16:35:04','2023-04-24 16:35:04',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'Сайман','2023-04-24 16:39:27','2023-04-24 16:39:27',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'АБК','2023-04-24 16:45:37','2023-04-24 16:45:37',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'Вахтовый','2023-04-24 16:45:51','2023-04-24 16:45:51',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'СПОРТ зал','2023-04-24 16:46:03','2023-04-24 16:46:03',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Тырысыптур котен','2023-04-24 16:46:17','2023-04-24 16:46:17',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'Офис U1','2023-04-27 08:18:28','2023-04-27 08:18:28',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(51,'Дом Артем','2023-04-27 08:18:57','2023-04-27 08:18:57',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(52,'Аптека','2023-04-27 08:19:19','2023-04-27 08:19:19',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(53,'Школа детей','2023-04-27 08:19:38','2023-04-27 08:19:38',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(54,'Супермаркет','2023-04-27 08:20:15','2023-04-27 08:20:15',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(55,'Работа супруги','2023-04-27 08:20:37','2023-04-27 08:20:37',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com',NULL,'$2y$10$MfhpeQjxFmsaoGWCKiU6PujOKt7YgXOyuMf.MvtV8joTnnq8zFkVi','B3RoMK3EYspagZNwwnfcdGnPFhNEjau439somKIH6EdvMXYZ4m3VL704dZvb','2023-03-20 20:20:51','2023-03-21 15:13:45','{\"platform.index\": true, \"platform.systems.roles\": true, \"platform.systems.users\": true, \"platform.systems.attachment\": true}'),(2,'dispatcher1','dispatcher1@mail.com',NULL,'$2y$10$St5K6.OK/72l8CUaIrPJKuyIdiFobIJymRMrjW84X.adfuGM2lHvG','oB7AVmNmc98KThiV6XB7MdWTnqg5kBy2OsSgtXjxwYBEFbgTgJ0OxTleZnIv','2023-03-21 14:36:41','2023-03-21 14:36:41','{\"platform.index\": \"0\", \"platform.systems.roles\": \"0\", \"platform.systems.users\": \"0\", \"platform.systems.attachment\": \"0\"}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (50,12,2,47.83138800,35.13757600,'2023-04-19 16:41:44','2023-04-19 16:41:51'),(51,13,1,42.37587500,69.66266500,'2023-04-20 20:37:28','2023-04-20 20:37:35'),(52,13,8,42.37587500,69.66266500,'2023-04-20 20:39:31','2023-04-20 20:39:34'),(53,14,27,47.83138800,35.13757600,'2023-04-20 21:26:31','2023-04-20 21:26:44'),(54,13,3,42.36343300,69.64075300,'2023-04-21 05:14:55','2023-04-21 05:15:03'),(55,13,9,42.38331400,69.64361100,'2023-04-21 05:15:31','2023-04-21 05:16:22'),(56,13,8,42.36658000,69.66452200,'2023-04-21 05:17:37','2023-04-21 05:18:50'),(57,13,6,42.37570600,69.66284900,'2023-04-21 05:20:32','2023-04-21 05:20:38'),(58,13,5,41.32875700,69.27635200,'2023-04-23 15:07:40','2023-04-23 15:07:44'),(59,13,9,41.32877800,69.27634200,'2023-04-23 15:07:52','2023-04-23 15:08:07'),(60,14,22,47.83138800,35.13757600,'2023-04-23 20:50:27','2023-04-23 20:50:33'),(61,13,6,42.36311800,69.62404400,'2023-04-24 14:06:42','2023-04-24 14:06:48'),(62,17,41,42.37587500,69.66266500,'2023-04-24 16:37:36','2023-04-24 16:37:47'),(63,18,48,42.52911300,67.58339800,'2023-04-24 16:48:26','2023-04-24 16:51:24'),(64,17,45,42.36910800,69.64437300,'2023-04-24 16:56:02','2023-04-24 16:56:11'),(65,17,42,42.37217400,69.64577200,'2023-04-24 17:30:52','2023-04-24 17:31:00'),(66,17,43,42.37253300,69.64770400,'2023-04-24 17:33:47','2023-04-24 17:33:51'),(67,18,46,42.52907400,67.58335200,'2023-04-24 17:35:14','2023-04-24 17:35:33'),(68,17,44,42.37587500,69.66266500,'2023-04-24 17:41:55','2023-04-24 17:41:59'),(69,18,47,42.52908700,67.58331200,'2023-04-24 18:00:21','2023-04-25 06:47:50'),(70,13,9,42.37587500,69.66266500,'2023-04-25 06:44:42','2023-04-25 06:44:47'),(71,18,46,42.52907400,67.58335200,'2023-04-25 06:48:21','2023-04-25 07:13:54'),(72,13,6,42.37587500,69.66266500,'2023-04-25 07:14:19','2023-04-25 07:14:22'),(73,18,46,42.52913800,67.58331700,'2023-04-25 08:15:14','2023-04-25 09:38:57'),(74,18,47,42.52909600,67.58334000,'2023-04-25 09:47:26','2023-04-25 11:15:08'),(75,18,47,42.52971700,67.58554700,'2023-04-25 11:53:28','2023-04-25 11:53:47'),(76,13,5,42.36337100,69.62345500,'2023-04-25 15:13:50','2023-04-25 15:13:56'),(77,18,47,42.52942900,67.57881800,'2023-04-25 17:59:56','2023-04-25 18:28:15'),(78,18,48,NULL,NULL,'2023-04-25 18:28:18','2023-04-25 18:28:18'),(79,18,48,42.52895800,67.57938500,'2023-04-25 18:28:26','2023-04-25 20:40:41'),(80,18,47,42.52910400,67.58336900,'2023-04-26 05:04:04','2023-04-26 05:04:22'),(81,19,50,43.22688300,76.96652700,'2023-04-27 08:38:49','2023-04-27 08:39:27');
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

-- Dump completed on 2023-04-27 12:32:35
