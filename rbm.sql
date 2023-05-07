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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Участок 1',NULL,'2023-03-23 21:21:49'),(2,'Участок 2',NULL,NULL),(3,'Участок 3',NULL,NULL),(4,'Участок 4',NULL,NULL),(7,'Мастер','2023-04-24 16:31:26','2023-04-24 16:31:26'),(8,'Заречное','2023-04-24 16:44:56','2023-04-24 16:44:56'),(9,'Алматы','2023-04-27 08:15:54','2023-04-27 08:15:54'),(10,'Участок 1 и 3','2023-04-30 19:21:28','2023-04-30 19:21:28'),(11,'Участок 2 и 4','2023-04-30 19:23:34','2023-04-30 19:23:34'),(12,'Мастер 16-20','2023-05-01 06:42:23','2023-05-01 06:42:23'),(13,'Мастер 5-13','2023-05-01 06:46:33','2023-05-01 06:46:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Andrew','andrew@mail.com','+1111111111','4059415651','34663','65734',4,35,47.83139400,35.13762500,NULL,'2023-04-19 10:25:00'),(13,'Makenzo_707','udefined@mail.com','+77012314923','457783949','КРАЗ 505','Ч 253 ЧМ',12,91,43.25126800,76.93210700,'2023-04-19 17:23:52','2023-05-03 13:19:11'),(14,'Andrey','udefined@mail.com','555555555','405941565','0','0',1,8,44.75939455,67.64602453,'2023-04-20 21:24:53','2023-04-23 20:50:33'),(18,'Zhanna','udefined@mail.com','+77029722235','5286899175','0','0',8,47,42.52910400,67.58336900,'2023-04-24 16:43:21','2023-04-26 05:04:22'),(19,'Фролов А.А.','udefined@mail.com','+77019405840','956528931','Борт 10','Toyota 505',9,50,43.22689700,76.96632900,'2023-04-27 08:11:08','2023-04-28 11:22:39'),(20,'Акбузаев Беисенбек','udefined@mail.com','+77024740509','5809331130','КРАЗ 25','H1677',10,57,44.74556100,67.65568800,'2023-04-30 19:07:51','2023-05-03 15:24:41'),(21,'Досаев Батырбек','udefined@mail.com','+77782705286','5904004358','КРАЗ 777','КРАЗ 777',11,74,44.75831100,67.64582500,'2023-05-01 06:01:30','2023-05-01 07:01:29'),(22,'Коржумбаев Рамиль','udefined@mail.com','+77022574901','6096587895','БА-16-20','БА-16-20',12,91,44.76824400,67.66286900,'2023-05-01 06:36:45','2023-05-04 20:09:27'),(23,'Асанов Дмитрий','udefined@mail.com','+77781521778','5911452071','БА-5-13','БА-5-13',13,93,44.78656000,67.72169700,'2023-05-01 06:41:51','2023-05-04 08:31:26'),(24,'Куаныш Абилов','udefined@mail.com','+77024808435','5947124770','КРАЗ 16','Н2028',11,82,0.00000000,0.00000000,'2023-05-01 06:42:13','2023-05-04 20:22:59'),(25,'Айдар Махметжанов','udefined@mail.com','+77756218058','6176118815','КРАЗ 25','H1677',10,58,0.00000000,0.00000000,'2023-05-01 07:05:17','2023-05-03 22:09:23'),(26,'Манас Костаншаев','udefined@mail.com','+77789422842','2128571587','КРАЗ 16','Н2028',11,82,44.78808800,67.69762700,'2023-05-01 08:32:54','2023-05-03 12:40:13'),(27,'Ильяс','udefined@mail.com','','5331782314','0','0',0,0,0.00000000,0.00000000,'2023-05-01 12:20:46','2023-05-01 12:20:46'),(28,'Ғани Кусанов','udefined@mail.com','+77026265782','6258512708','КРАЗ 23','Н2023',11,63,44.72129000,67.67029300,'2023-05-02 08:26:44','2023-05-04 16:00:07'),(29,'Галымжан Арыстанов','udefined@mail.com','+77754276414','5214884978','КРАЗ 20','Н1335',11,72,44.75831300,67.64600200,'2023-05-02 13:41:38','2023-05-02 17:11:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Бур агрегат № 1',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'УОС',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Компрессор',NULL,'2023-03-24 19:31:01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'РВР','2023-03-21 16:31:28','2023-03-24 19:31:08',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Шламник','2023-03-24 19:31:23','2023-03-24 19:31:23',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Водозабор','2023-03-24 19:31:34','2023-03-24 19:31:34',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Глинстанция','2023-03-24 19:31:44','2023-03-24 19:31:44',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'База','2023-03-24 19:31:55','2023-03-24 19:31:55',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Заправка','2023-03-24 19:32:01','2023-03-24 19:32:01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Септик','2023-03-24 19:32:08','2023-03-24 19:32:08',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Бур агрегат №1','2023-03-24 19:32:34','2023-03-24 19:32:34',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'УОС','2023-03-24 19:32:43','2023-03-24 19:32:43',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Компрессор','2023-03-24 19:32:53','2023-03-24 19:32:53',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'РВМ','2023-03-24 19:33:13','2023-03-24 19:33:13',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'Шламонакопитель','2023-03-24 19:33:20','2023-04-26 22:09:15',2,'#00ff80','#408080','44.77400200000002, 67.6569305595236','44.773895, 67.655493','44.774916, 67.656759','44.774170, 67.658400','44.772966, 67.657113'),(16,'Водозабор','2023-03-24 19:33:27','2023-03-24 19:33:27',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Глинстанция','2023-03-24 19:33:35','2023-03-24 19:33:35',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'База','2023-03-24 19:33:44','2023-03-24 19:33:44',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Заправка','2023-03-24 19:33:52','2023-03-24 19:33:52',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'Септик','2023-03-24 19:33:59','2023-03-24 19:33:59',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'Бур агрегат №1','2023-03-24 19:35:34','2023-03-24 19:35:34',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'УОС','2023-03-24 19:35:43','2023-03-24 19:35:43',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Компрессор','2023-03-24 19:35:52','2023-03-24 19:35:52',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'РВМ','2023-03-24 19:36:02','2023-03-24 19:36:02',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'Шламник','2023-03-24 19:36:15','2023-03-24 19:36:15',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'Водозабор','2023-03-24 19:36:23','2023-03-24 19:36:23',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'Глинстанция','2023-03-24 19:36:30','2023-03-24 19:36:30',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'База','2023-03-24 19:36:38','2023-03-24 19:36:38',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'Заправка','2023-03-24 19:36:49','2023-03-24 19:36:49',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'Септик','2023-03-24 19:36:58','2023-03-24 19:36:58',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'Бур агрегат №1','2023-03-24 19:37:11','2023-03-24 19:37:11',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'УОС','2023-03-24 19:37:22','2023-03-24 19:37:22',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'Компрессор','2023-03-24 19:37:30','2023-03-24 19:37:30',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'РВМ','2023-03-24 19:37:49','2023-03-24 19:37:49',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'Шламонакопитель','2023-03-24 19:37:57','2023-04-26 22:06:12',4,'#b71e02','#8080ff','44.79817787549735, 67.72020027116405','44.797394, 67.719009','44.798741, 67.718913','44.798749, 67.721423','44.797417, 67.721541'),(36,'Водозабор','2023-03-24 19:38:06','2023-03-24 19:38:06',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'Глинстанция','2023-03-24 19:38:13','2023-03-24 19:38:13',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'База','2023-03-24 19:38:20','2023-03-24 19:38:20',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'Заправка','2023-03-24 19:38:28','2023-03-24 19:38:28',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'Септик','2023-03-24 19:38:36','2023-03-24 19:38:36',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'Стоматология','2023-04-24 16:34:14','2023-04-24 16:34:14',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'Заправка','2023-04-24 16:34:26','2023-04-24 16:34:26',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'Аптека','2023-04-24 16:34:38','2023-04-24 16:34:38',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'Кайтпас-1609','2023-04-24 16:35:04','2023-04-24 16:35:04',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'Сайман','2023-04-24 16:39:27','2023-04-24 16:39:27',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'АБК','2023-04-24 16:45:37','2023-04-24 16:45:37',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'Вахтовый','2023-04-24 16:45:51','2023-04-24 16:45:51',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'СПОРТ зал','2023-04-24 16:46:03','2023-04-24 16:46:03',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Тырысыптур котен','2023-04-24 16:46:17','2023-04-24 16:46:17',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'Офис U1','2023-04-27 08:18:28','2023-04-27 08:18:28',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(51,'Дом Артем','2023-04-27 08:18:57','2023-04-27 08:18:57',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(52,'Аптека','2023-04-27 08:19:19','2023-04-27 08:19:19',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(53,'Школа детей','2023-04-27 08:19:38','2023-04-27 08:19:38',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(54,'Супермаркет','2023-04-27 08:20:15','2023-04-27 08:20:15',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(55,'Работа супруги','2023-04-27 08:20:37','2023-04-27 08:20:37',9,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(56,'БА-8','2023-04-30 19:25:27','2023-04-30 19:25:27',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(57,'БА-10','2023-04-30 19:26:02','2023-04-30 19:26:02',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(58,'БА-17','2023-04-30 19:26:23','2023-04-30 19:26:23',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(59,'БА-25','2023-04-30 19:26:44','2023-04-30 19:26:44',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(60,'БА-2','2023-04-30 19:27:47','2023-04-30 19:27:47',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(61,'БА-4','2023-04-30 19:28:30','2023-04-30 19:28:30',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(62,'БА-11','2023-04-30 19:28:51','2023-04-30 19:28:51',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(63,'БА-12','2023-04-30 19:29:10','2023-04-30 19:29:10',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(64,'БА-14','2023-04-30 19:29:39','2023-04-30 19:29:39',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(65,'Водозабор 1 уч','2023-04-30 20:05:03','2023-04-30 20:29:01',10,'#eb0f1a','#000000',NULL,NULL,NULL,NULL,NULL),(66,'Шламонакопитель 1 уч','2023-04-30 20:29:32','2023-04-30 20:29:32',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(67,'Водозабор 3 уч','2023-04-30 20:30:06','2023-04-30 20:30:06',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(68,'Шламонакопитель 3 уч','2023-04-30 20:30:37','2023-04-30 20:30:37',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(69,'Глинстанция','2023-04-30 21:05:24','2023-04-30 21:05:24',10,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(70,'Шламонакопитель 2 уч','2023-04-30 21:52:41','2023-04-30 21:52:41',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(71,'Водозабор 2 уч','2023-04-30 21:53:06','2023-04-30 21:53:06',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(72,'Шламонакопитель 4 уч','2023-04-30 21:53:35','2023-04-30 21:53:35',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(73,'Водозабор 4 уч','2023-04-30 21:54:06','2023-04-30 21:54:06',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(74,'Глинстанция','2023-04-30 21:54:55','2023-04-30 21:54:55',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(75,'БА-5','2023-04-30 21:55:29','2023-04-30 21:55:29',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(76,'БА-13','2023-04-30 21:55:54','2023-04-30 21:55:54',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(77,'БА-15','2023-04-30 21:56:15','2023-04-30 21:56:15',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(78,'БА-6','2023-04-30 21:56:54','2023-04-30 21:56:54',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(79,'БА-16','2023-04-30 21:57:19','2023-04-30 21:57:19',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(80,'БА-18','2023-04-30 21:57:37','2023-04-30 21:57:37',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(81,'БА-20','2023-04-30 21:57:54','2023-04-30 21:57:54',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(82,'БА-22','2023-04-30 21:58:15','2023-04-30 21:58:15',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(83,'БА-23','2023-04-30 21:58:31','2023-04-30 21:58:31',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(84,'БА-26','2023-04-30 21:58:48','2023-04-30 21:58:48',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(85,'БА-27','2023-04-30 21:59:04','2023-04-30 21:59:04',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(86,'БА-27','2023-04-30 21:59:24','2023-04-30 21:59:24',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(87,'БА-28','2023-04-30 21:59:38','2023-04-30 21:59:38',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(88,'БА-24','2023-04-30 21:59:55','2023-04-30 21:59:55',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(89,'БА-30','2023-04-30 22:00:12','2023-04-30 22:00:12',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(90,'БА-31','2023-04-30 22:00:26','2023-04-30 22:00:26',11,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(91,'Мастер БА-16','2023-05-01 06:44:09','2023-05-01 06:44:09',12,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(92,'Мастер БА-20','2023-05-01 06:44:26','2023-05-01 06:44:26',12,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(93,'Мастер БА-13','2023-05-01 06:53:45','2023-05-01 06:53:45',13,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL),(94,'Мастер БА-5','2023-05-01 06:54:02','2023-05-01 06:54:02',13,'#563d7c','#000000',NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (50,12,2,47.83138800,35.13757600,'2023-04-19 16:41:44','2023-04-19 16:41:51'),(51,13,1,42.37587500,69.66266500,'2023-04-20 20:37:28','2023-04-20 20:37:35'),(52,13,8,42.37587500,69.66266500,'2023-04-20 20:39:31','2023-04-20 20:39:34'),(53,14,27,47.83138800,35.13757600,'2023-04-20 21:26:31','2023-04-20 21:26:44'),(54,13,3,42.36343300,69.64075300,'2023-04-21 05:14:55','2023-04-21 05:15:03'),(55,13,9,42.38331400,69.64361100,'2023-04-21 05:15:31','2023-04-21 05:16:22'),(56,13,8,42.36658000,69.66452200,'2023-04-21 05:17:37','2023-04-21 05:18:50'),(57,13,6,42.37570600,69.66284900,'2023-04-21 05:20:32','2023-04-21 05:20:38'),(58,13,5,41.32875700,69.27635200,'2023-04-23 15:07:40','2023-04-23 15:07:44'),(59,13,9,41.32877800,69.27634200,'2023-04-23 15:07:52','2023-04-23 15:08:07'),(60,14,22,47.83138800,35.13757600,'2023-04-23 20:50:27','2023-04-23 20:50:33'),(61,13,6,42.36311800,69.62404400,'2023-04-24 14:06:42','2023-04-24 14:06:48'),(62,17,41,42.37587500,69.66266500,'2023-04-24 16:37:36','2023-04-24 16:37:47'),(63,18,48,42.52911300,67.58339800,'2023-04-24 16:48:26','2023-04-24 16:51:24'),(64,17,45,42.36910800,69.64437300,'2023-04-24 16:56:02','2023-04-24 16:56:11'),(65,17,42,42.37217400,69.64577200,'2023-04-24 17:30:52','2023-04-24 17:31:00'),(66,17,43,42.37253300,69.64770400,'2023-04-24 17:33:47','2023-04-24 17:33:51'),(67,18,46,42.52907400,67.58335200,'2023-04-24 17:35:14','2023-04-24 17:35:33'),(68,17,44,42.37587500,69.66266500,'2023-04-24 17:41:55','2023-04-24 17:41:59'),(69,18,47,42.52908700,67.58331200,'2023-04-24 18:00:21','2023-04-25 06:47:50'),(70,13,9,42.37587500,69.66266500,'2023-04-25 06:44:42','2023-04-25 06:44:47'),(71,18,46,42.52907400,67.58335200,'2023-04-25 06:48:21','2023-04-25 07:13:54'),(72,13,6,42.37587500,69.66266500,'2023-04-25 07:14:19','2023-04-25 07:14:22'),(73,18,46,42.52913800,67.58331700,'2023-04-25 08:15:14','2023-04-25 09:38:57'),(74,18,47,42.52909600,67.58334000,'2023-04-25 09:47:26','2023-04-25 11:15:08'),(75,18,47,42.52971700,67.58554700,'2023-04-25 11:53:28','2023-04-25 11:53:47'),(76,13,5,42.36337100,69.62345500,'2023-04-25 15:13:50','2023-04-25 15:13:56'),(77,18,47,42.52942900,67.57881800,'2023-04-25 17:59:56','2023-04-25 18:28:15'),(78,18,48,NULL,NULL,'2023-04-25 18:28:18','2023-04-25 18:28:18'),(79,18,48,42.52895800,67.57938500,'2023-04-25 18:28:26','2023-04-25 20:40:41'),(80,18,47,42.52910400,67.58336900,'2023-04-26 05:04:04','2023-04-26 05:04:22'),(81,19,50,43.22688300,76.96652700,'2023-04-27 08:38:49','2023-04-27 08:39:27'),(82,19,52,NULL,NULL,'2023-04-27 16:07:50','2023-04-27 16:07:50'),(83,19,52,43.24220200,76.93830500,'2023-04-27 16:08:22','2023-04-27 16:08:41'),(84,13,1,42.37586700,69.66263600,'2023-04-27 19:31:29','2023-04-27 19:31:32'),(85,13,2,42.37586700,69.66263600,'2023-04-27 19:31:37','2023-04-27 19:31:41'),(86,13,1,42.37586700,69.66263600,'2023-04-27 19:31:49','2023-04-27 19:31:54'),(87,13,3,42.37586700,69.66263600,'2023-04-27 19:31:58','2023-04-27 19:32:04'),(88,13,5,42.37586700,69.66263600,'2023-04-27 19:32:08','2023-04-27 19:32:11'),(89,13,6,42.37586700,69.66263600,'2023-04-27 19:32:17','2023-04-27 19:32:22'),(90,13,7,42.37586700,69.66263600,'2023-04-27 19:32:26','2023-04-27 19:32:30'),(91,13,8,42.37586700,69.66263600,'2023-04-27 19:32:36','2023-04-27 19:32:40'),(92,13,9,42.37586700,69.66263600,'2023-04-27 19:32:45','2023-04-27 19:32:49'),(93,13,10,42.37586700,69.66263600,'2023-04-27 19:32:52','2023-04-27 19:32:54'),(94,13,7,42.37586700,69.66263600,'2023-04-27 19:32:58','2023-04-27 19:33:01'),(95,13,7,42.37586700,69.66263600,'2023-04-27 19:33:04','2023-04-27 19:33:08'),(96,13,6,42.37586700,69.66263600,'2023-04-27 19:33:12','2023-04-27 19:33:14'),(97,13,4,42.37586700,69.66263600,'2023-04-27 19:33:18','2023-04-27 19:33:21'),(98,19,50,43.22689700,76.96632900,'2023-04-28 11:22:27','2023-04-28 11:22:39'),(99,13,56,42.37586700,69.66263600,'2023-04-30 21:07:38','2023-04-30 21:07:44'),(100,13,84,NULL,NULL,'2023-04-30 22:04:51','2023-04-30 22:04:51'),(101,13,90,42.37586700,69.66263600,'2023-04-30 22:05:06','2023-04-30 22:05:13'),(102,13,70,42.37586700,69.66263600,'2023-04-30 22:08:19','2023-04-30 22:08:24'),(103,21,87,44.75862200,67.64568100,'2023-05-01 06:06:14','2023-05-01 06:07:04'),(104,21,71,NULL,NULL,'2023-05-01 06:11:11','2023-05-01 06:11:11'),(105,21,72,NULL,NULL,'2023-05-01 06:11:12','2023-05-01 06:11:12'),(106,21,74,NULL,NULL,'2023-05-01 06:11:12','2023-05-01 06:11:12'),(107,21,79,NULL,NULL,'2023-05-01 06:11:14','2023-05-01 06:11:14'),(108,21,90,44.75852700,67.64570100,'2023-05-01 06:11:16','2023-05-01 06:11:20'),(109,21,74,44.75853900,67.64565800,'2023-05-01 06:11:42','2023-05-01 06:11:52'),(110,21,72,44.75853900,67.64565800,'2023-05-01 06:12:17','2023-05-01 06:12:25'),(111,21,73,44.75853900,67.64565800,'2023-05-01 06:12:38','2023-05-01 06:12:42'),(112,21,79,44.75831100,67.64582500,'2023-05-01 06:42:42','2023-05-01 06:42:46'),(113,22,91,44.76824400,67.66286900,'2023-05-01 06:46:12','2023-05-04 20:09:27'),(114,21,74,NULL,NULL,'2023-05-01 07:01:29','2023-05-01 07:01:29'),(115,23,93,NULL,NULL,'2023-05-01 07:05:55','2023-05-01 07:05:55'),(116,23,94,NULL,NULL,'2023-05-01 07:06:00','2023-05-01 07:06:00'),(117,20,58,44.74331500,67.66049500,'2023-05-01 12:19:57','2023-05-01 12:21:20'),(118,20,58,44.74330700,67.66046500,'2023-05-01 12:21:43','2023-05-01 12:21:49'),(119,26,78,NULL,NULL,'2023-05-01 12:29:09','2023-05-01 12:29:09'),(120,26,78,44.78593900,67.69698900,'2023-05-01 12:29:41','2023-05-01 12:29:47'),(121,20,57,44.74561100,67.65672200,'2023-05-01 13:46:37','2023-05-01 13:46:55'),(122,20,68,44.74561100,67.65672200,'2023-05-01 13:47:17','2023-05-01 13:47:24'),(123,20,66,44.73692700,67.64835500,'2023-05-01 14:15:23','2023-05-01 14:15:44'),(124,20,65,44.74535600,67.65024300,'2023-05-01 14:30:19','2023-05-01 14:30:26'),(125,26,81,44.78566900,67.69952000,'2023-05-01 14:55:15','2023-05-01 14:55:40'),(126,20,59,44.74351700,67.66282300,'2023-05-01 14:59:56','2023-05-01 15:00:02'),(127,26,78,44.78808300,67.69752300,'2023-05-01 15:15:30','2023-05-01 15:15:36'),(128,20,56,44.74299800,67.66078500,'2023-05-01 15:22:00','2023-05-01 15:22:06'),(129,26,70,44.77348200,67.66590000,'2023-05-01 15:47:40','2023-05-01 15:47:48'),(130,20,60,44.72440400,67.67734500,'2023-05-01 15:54:23','2023-05-01 15:54:29'),(131,20,62,44.72403700,67.67738000,'2023-05-01 16:01:11','2023-05-01 16:01:18'),(132,20,56,44.74298300,67.66047500,'2023-05-01 16:16:17','2023-05-01 16:16:23'),(133,20,69,44.75675500,67.64963300,'2023-05-01 16:53:03','2023-05-01 16:53:10'),(134,25,56,NULL,NULL,'2023-05-01 18:24:23','2023-05-01 18:24:23'),(135,25,59,NULL,NULL,'2023-05-01 18:51:08','2023-05-01 18:51:08'),(136,25,58,NULL,NULL,'2023-05-01 19:35:08','2023-05-01 19:35:08'),(137,25,65,NULL,NULL,'2023-05-01 19:57:39','2023-05-01 19:57:39'),(138,25,58,NULL,NULL,'2023-05-01 20:15:52','2023-05-01 20:15:52'),(139,25,65,NULL,NULL,'2023-05-01 21:28:13','2023-05-01 21:28:13'),(140,25,58,NULL,NULL,'2023-05-01 21:49:14','2023-05-01 21:49:14'),(141,25,59,NULL,NULL,'2023-05-01 21:58:44','2023-05-01 21:58:44'),(142,25,56,NULL,NULL,'2023-05-01 22:25:04','2023-05-01 22:25:04'),(143,25,59,NULL,NULL,'2023-05-02 00:48:04','2023-05-02 00:48:04'),(144,25,59,NULL,NULL,'2023-05-02 01:10:13','2023-05-02 01:10:13'),(145,25,56,NULL,NULL,'2023-05-02 01:25:36','2023-05-02 01:25:36'),(146,25,65,NULL,NULL,'2023-05-02 02:46:22','2023-05-02 02:46:22'),(147,25,56,NULL,NULL,'2023-05-02 03:07:48','2023-05-02 03:07:48'),(148,25,58,NULL,NULL,'2023-05-02 03:16:07','2023-05-02 03:16:07'),(149,25,56,NULL,NULL,'2023-05-02 03:31:42','2023-05-02 03:31:42'),(150,25,69,NULL,NULL,'2023-05-02 04:06:32','2023-05-02 04:06:32'),(151,20,56,NULL,NULL,'2023-05-02 05:18:02','2023-05-02 05:18:02'),(152,20,56,44.72517600,67.65292400,'2023-05-02 05:18:35','2023-05-02 05:18:40'),(153,20,58,44.74298800,67.66135700,'2023-05-02 05:39:28','2023-05-02 05:39:33'),(154,20,56,44.74309000,67.66101500,'2023-05-02 06:18:54','2023-05-02 06:19:04'),(155,20,56,44.74292100,67.66104200,'2023-05-02 06:37:23','2023-05-02 06:37:28'),(156,20,56,44.74331100,67.66117000,'2023-05-02 06:59:36','2023-05-02 06:59:44'),(157,23,94,44.78665100,67.72097100,'2023-05-02 07:35:35','2023-05-02 07:35:47'),(158,20,59,44.74313000,67.66244500,'2023-05-02 07:45:59','2023-05-02 07:46:04'),(159,23,93,44.76070900,67.64628000,'2023-05-02 07:55:43','2023-05-02 07:55:52'),(160,20,59,44.74291900,67.66267300,'2023-05-02 08:06:21','2023-05-02 08:06:30'),(161,20,66,44.73482800,67.64358300,'2023-05-02 08:24:40','2023-05-02 08:24:44'),(162,28,61,NULL,NULL,'2023-05-02 08:34:45','2023-05-02 08:34:45'),(163,28,61,44.74155000,67.65375700,'2023-05-02 08:35:24','2023-05-02 08:35:34'),(164,20,65,44.74301200,67.65014700,'2023-05-02 08:39:48','2023-05-02 08:39:53'),(165,23,94,NULL,NULL,'2023-05-02 08:41:46','2023-05-02 08:41:46'),(166,23,94,44.78706600,67.72023500,'2023-05-02 08:41:47','2023-05-02 08:41:58'),(167,20,59,44.74339900,67.66267900,'2023-05-02 08:55:12','2023-05-02 08:55:21'),(168,28,61,44.72425900,67.67831400,'2023-05-02 09:17:25','2023-05-02 09:17:31'),(169,20,65,44.74520000,67.65022700,'2023-05-02 09:25:46','2023-05-02 09:25:52'),(170,28,67,44.72216500,67.68536600,'2023-05-02 09:31:36','2023-05-02 09:31:44'),(171,20,56,44.74316900,67.66050900,'2023-05-02 09:39:35','2023-05-02 09:39:40'),(172,28,63,44.72129000,67.67029300,'2023-05-02 09:42:49','2023-05-02 09:42:55'),(173,20,58,44.74293000,67.66107200,'2023-05-02 10:11:22','2023-05-02 10:11:27'),(174,20,65,44.74512700,67.65023400,'2023-05-02 10:22:18','2023-05-02 10:22:24'),(175,20,58,44.74313000,67.66124000,'2023-05-02 10:36:29','2023-05-02 10:36:34'),(176,20,65,44.74301200,67.65014700,'2023-05-02 11:33:22','2023-05-02 11:33:26'),(177,20,59,44.74349400,67.66265900,'2023-05-02 11:49:14','2023-05-02 11:49:19'),(178,20,57,44.74577300,67.65701800,'2023-05-02 12:25:05','2023-05-02 12:25:10'),(179,20,56,44.74328900,67.66238800,'2023-05-02 13:17:53','2023-05-02 13:18:01'),(180,29,75,NULL,NULL,'2023-05-02 13:49:27','2023-05-02 13:49:27'),(181,29,75,44.78635500,67.72064600,'2023-05-02 13:50:43','2023-05-02 13:50:57'),(182,29,75,44.78668800,67.72066600,'2023-05-02 13:51:21','2023-05-02 13:51:32'),(183,29,72,44.75831300,67.64600200,'2023-05-02 13:51:59','2023-05-02 17:11:19'),(184,20,57,44.74590100,67.65676600,'2023-05-02 14:16:27','2023-05-02 14:16:32'),(185,13,93,43.22692300,76.96606100,'2023-05-02 14:35:06','2023-05-02 14:35:09'),(186,13,65,43.22692300,76.96606100,'2023-05-02 14:38:26','2023-05-02 14:38:29'),(187,20,65,44.74515700,67.65025200,'2023-05-02 14:41:24','2023-05-02 14:41:29'),(188,20,56,44.74305700,67.66064400,'2023-05-02 15:06:18','2023-05-02 15:06:23'),(189,25,66,NULL,NULL,'2023-05-02 17:25:02','2023-05-02 17:25:02'),(190,25,65,NULL,NULL,'2023-05-02 17:41:47','2023-05-02 17:41:47'),(191,25,57,NULL,NULL,'2023-05-02 18:01:25','2023-05-02 18:01:25'),(192,25,57,NULL,NULL,'2023-05-02 18:42:37','2023-05-02 18:42:37'),(193,25,58,NULL,NULL,'2023-05-02 18:42:42','2023-05-02 18:42:42'),(194,25,56,NULL,NULL,'2023-05-02 19:46:13','2023-05-02 19:46:13'),(195,25,66,NULL,NULL,'2023-05-02 20:21:04','2023-05-02 20:21:04'),(196,25,65,NULL,NULL,'2023-05-02 21:49:30','2023-05-02 21:49:30'),(197,25,56,NULL,NULL,'2023-05-02 22:15:56','2023-05-02 22:15:56'),(198,25,58,NULL,NULL,'2023-05-02 23:21:08','2023-05-02 23:21:08'),(199,25,66,NULL,NULL,'2023-05-02 23:54:20','2023-05-02 23:54:20'),(200,25,65,NULL,NULL,'2023-05-03 00:09:57','2023-05-03 00:09:57'),(201,25,58,NULL,NULL,'2023-05-03 00:40:30','2023-05-03 00:40:30'),(202,25,69,NULL,NULL,'2023-05-03 02:51:59','2023-05-03 02:51:59'),(203,25,58,NULL,NULL,'2023-05-03 03:31:41','2023-05-03 03:31:41'),(204,25,65,NULL,NULL,'2023-05-03 03:40:04','2023-05-03 03:40:04'),(205,25,56,NULL,NULL,'2023-05-03 03:54:38','2023-05-03 03:54:38'),(206,25,58,NULL,NULL,'2023-05-03 04:07:19','2023-05-03 04:07:19'),(207,23,94,44.76070900,67.64628000,'2023-05-03 04:56:21','2023-05-03 04:56:34'),(208,23,94,44.78677600,67.72097000,'2023-05-03 04:58:09','2023-05-03 04:58:20'),(209,20,66,44.74301200,67.65014700,'2023-05-03 05:19:14','2023-05-03 05:19:23'),(210,20,65,44.74512200,67.65013100,'2023-05-03 05:29:55','2023-05-03 05:30:00'),(211,20,56,44.74312800,67.66088700,'2023-05-03 05:42:55','2023-05-03 05:43:01'),(212,20,58,44.74296800,67.66154600,'2023-05-03 06:01:07','2023-05-03 06:01:11'),(213,20,62,NULL,NULL,'2023-05-03 06:14:01','2023-05-03 06:14:01'),(214,20,57,44.74563300,67.65670900,'2023-05-03 06:14:44','2023-05-03 06:14:48'),(215,20,66,44.74301200,67.65014700,'2023-05-03 06:30:10','2023-05-03 06:30:14'),(216,20,65,44.74510900,67.65017400,'2023-05-03 06:42:05','2023-05-03 06:42:09'),(217,20,57,44.74581700,67.65578800,'2023-05-03 06:53:16','2023-05-03 06:53:20'),(218,20,59,44.75132800,67.64940800,'2023-05-03 08:44:17','2023-05-03 08:44:25'),(219,20,57,44.74566000,67.65680000,'2023-05-03 09:00:33','2023-05-03 09:00:37'),(220,20,66,44.73704900,67.64842600,'2023-05-03 09:23:11','2023-05-03 09:23:16'),(221,20,65,44.74525700,67.65033600,'2023-05-03 11:08:00','2023-05-03 11:08:06'),(222,20,57,44.74554400,67.65562700,'2023-05-03 11:32:37','2023-05-03 11:32:42'),(223,20,58,44.74303000,67.66115600,'2023-05-03 12:17:18','2023-05-03 12:17:23'),(224,26,73,44.78807500,67.69766900,'2023-05-03 12:39:55','2023-05-03 12:40:02'),(225,26,82,44.78808800,67.69762700,'2023-05-03 12:40:08','2023-05-03 12:40:13'),(226,20,68,44.73758500,67.67241800,'2023-05-03 12:46:06','2023-05-03 12:46:11'),(227,20,58,44.74306200,67.66135000,'2023-05-03 12:54:55','2023-05-03 12:55:00'),(228,20,66,44.74301200,67.65014700,'2023-05-03 13:15:40','2023-05-03 13:15:43'),(229,13,91,43.25126800,76.93210700,'2023-05-03 13:19:08','2023-05-03 13:19:11'),(230,20,65,44.74301200,67.65014700,'2023-05-03 13:25:32','2023-05-03 13:25:36'),(231,20,58,44.74311800,67.66266400,'2023-05-03 13:52:04','2023-05-03 13:52:09'),(232,20,56,44.74296300,67.66084000,'2023-05-03 14:03:22','2023-05-03 14:03:26'),(233,20,57,44.74556100,67.65568800,'2023-05-03 15:24:35','2023-05-03 15:24:41'),(234,25,69,NULL,NULL,'2023-05-03 16:51:45','2023-05-03 16:51:45'),(235,25,57,NULL,NULL,'2023-05-03 17:20:54','2023-05-03 17:20:54'),(236,24,72,NULL,NULL,'2023-05-03 17:48:08','2023-05-03 17:48:08'),(237,24,73,NULL,NULL,'2023-05-03 18:15:55','2023-05-03 18:15:55'),(238,25,59,NULL,NULL,'2023-05-03 18:40:19','2023-05-03 18:40:19'),(239,24,82,NULL,NULL,'2023-05-03 18:42:20','2023-05-03 18:42:20'),(240,25,56,NULL,NULL,'2023-05-03 18:58:26','2023-05-03 18:58:26'),(241,25,66,NULL,NULL,'2023-05-03 19:20:33','2023-05-03 19:20:33'),(242,24,71,NULL,NULL,'2023-05-03 19:23:37','2023-05-03 19:23:37'),(243,25,65,NULL,NULL,'2023-05-03 19:36:55','2023-05-03 19:36:55'),(244,25,58,NULL,NULL,'2023-05-03 19:54:27','2023-05-03 19:54:27'),(245,25,56,NULL,NULL,'2023-05-03 20:22:56','2023-05-03 20:22:56'),(246,24,76,NULL,NULL,'2023-05-03 20:29:03','2023-05-03 20:29:03'),(247,25,69,NULL,NULL,'2023-05-03 20:58:18','2023-05-03 20:58:18'),(248,25,56,NULL,NULL,'2023-05-03 21:21:33','2023-05-03 21:21:33'),(249,24,74,NULL,NULL,'2023-05-03 21:25:08','2023-05-03 21:25:08'),(250,25,58,NULL,NULL,'2023-05-03 22:09:23','2023-05-03 22:09:23'),(251,24,78,NULL,NULL,'2023-05-03 22:39:17','2023-05-03 22:39:17'),(252,24,78,NULL,NULL,'2023-05-03 23:12:12','2023-05-03 23:12:12'),(253,24,70,NULL,NULL,'2023-05-03 23:37:29','2023-05-03 23:37:29'),(254,24,71,NULL,NULL,'2023-05-03 23:58:23','2023-05-03 23:58:23'),(255,24,83,NULL,NULL,'2023-05-04 00:21:30','2023-05-04 00:21:30'),(256,24,78,NULL,NULL,'2023-05-04 01:46:07','2023-05-04 01:46:07'),(257,24,70,NULL,NULL,'2023-05-04 02:29:46','2023-05-04 02:29:46'),(258,24,78,NULL,NULL,'2023-05-04 03:19:25','2023-05-04 03:19:25'),(259,24,78,NULL,NULL,'2023-05-04 03:19:25','2023-05-04 03:19:25'),(260,24,70,NULL,NULL,'2023-05-04 04:09:28','2023-05-04 04:09:28'),(261,28,67,NULL,NULL,'2023-05-04 06:21:25','2023-05-04 06:21:25'),(262,28,67,NULL,NULL,'2023-05-04 06:22:56','2023-05-04 06:22:56'),(263,28,61,NULL,NULL,'2023-05-04 06:50:47','2023-05-04 06:50:47'),(264,28,64,NULL,NULL,'2023-05-04 06:58:02','2023-05-04 06:58:02'),(265,28,68,NULL,NULL,'2023-05-04 07:17:22','2023-05-04 07:17:22'),(266,28,68,NULL,NULL,'2023-05-04 08:01:58','2023-05-04 08:01:58'),(267,28,67,NULL,NULL,'2023-05-04 08:14:50','2023-05-04 08:14:50'),(268,23,93,44.76878900,67.66482200,'2023-05-04 08:28:10','2023-05-04 08:30:23'),(269,23,93,44.78656000,67.72169700,'2023-05-04 08:31:18','2023-05-04 08:31:26'),(270,28,64,NULL,NULL,'2023-05-04 08:36:35','2023-05-04 08:36:35'),(271,28,67,NULL,NULL,'2023-05-04 08:58:59','2023-05-04 08:58:59'),(272,28,61,NULL,NULL,'2023-05-04 09:38:15','2023-05-04 09:38:15'),(273,28,64,NULL,NULL,'2023-05-04 09:50:35','2023-05-04 09:50:35'),(274,28,60,NULL,NULL,'2023-05-04 10:28:08','2023-05-04 10:28:08'),(275,28,67,NULL,NULL,'2023-05-04 10:28:35','2023-05-04 10:28:35'),(276,28,60,NULL,NULL,'2023-05-04 10:57:13','2023-05-04 10:57:13'),(277,28,64,NULL,NULL,'2023-05-04 11:58:19','2023-05-04 11:58:19'),(278,28,67,NULL,NULL,'2023-05-04 11:59:55','2023-05-04 11:59:55'),(279,28,64,NULL,NULL,'2023-05-04 12:38:26','2023-05-04 12:38:26'),(280,28,68,NULL,NULL,'2023-05-04 13:06:40','2023-05-04 13:06:40'),(281,28,67,NULL,NULL,'2023-05-04 13:38:10','2023-05-04 13:38:10'),(282,28,61,NULL,NULL,'2023-05-04 14:10:45','2023-05-04 14:10:45'),(283,28,61,NULL,NULL,'2023-05-04 14:30:16','2023-05-04 14:30:16'),(284,28,68,NULL,NULL,'2023-05-04 15:02:59','2023-05-04 15:02:59'),(285,28,64,NULL,NULL,'2023-05-04 15:17:25','2023-05-04 15:17:25'),(286,28,63,NULL,NULL,'2023-05-04 16:00:07','2023-05-04 16:00:07'),(287,24,83,NULL,NULL,'2023-05-04 17:04:29','2023-05-04 17:04:29'),(288,24,70,NULL,NULL,'2023-05-04 17:32:09','2023-05-04 17:32:09'),(289,24,83,NULL,NULL,'2023-05-04 17:54:26','2023-05-04 17:54:26'),(290,24,70,NULL,NULL,'2023-05-04 18:26:04','2023-05-04 18:26:04'),(291,24,71,NULL,NULL,'2023-05-04 19:59:09','2023-05-04 19:59:09'),(292,24,82,NULL,NULL,'2023-05-04 20:22:59','2023-05-04 20:22:59');
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

-- Dump completed on 2023-05-04 19:01:42
