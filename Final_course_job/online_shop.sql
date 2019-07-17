-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: online_shop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street_id` int(11) NOT NULL,
  `house_number_id` int(11) NOT NULL,
  `housing_id` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `flat_id` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `description_id` int(11) DEFAULT NULL,
  `user_id_created` int(11) DEFAULT NULL,
  `date_of_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `description_type_id` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `address_fk` (`street_id`),
  KEY `address_fk_1` (`house_number_id`),
  KEY `address_fk_2` (`housing_id`),
  KEY `address_fk_3` (`post_id`),
  KEY `address_fk_4` (`flat_id`),
  KEY `address_fk_5` (`office_id`),
  KEY `address_fk_6` (`user_id_created`),
  CONSTRAINT `address_fk` FOREIGN KEY (`street_id`) REFERENCES `streets` (`id`),
  CONSTRAINT `address_fk_1` FOREIGN KEY (`house_number_id`) REFERENCES `houses` (`id`),
  CONSTRAINT `address_fk_2` FOREIGN KEY (`housing_id`) REFERENCES `housings` (`id`),
  CONSTRAINT `address_fk_3` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `address_fk_4` FOREIGN KEY (`flat_id`) REFERENCES `flats` (`id`),
  CONSTRAINT `address_fk_5` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  CONSTRAINT `address_fk_6` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,12,14,NULL,2,6,NULL,18,1,'2019-07-10 17:15:00',1),(2,33,4,2,7,14,NULL,20,1,'2019-07-10 17:16:27',1),(6,23,7,NULL,12,NULL,88,22,1,'2019-07-10 17:18:57',1),(7,100,17,NULL,12,NULL,88,22,1,'2019-07-10 17:19:12',1),(8,100,17,3,12,3,88,21,1,'2019-07-10 17:19:51',1),(9,100,17,3,12,5,88,20,1,'2019-07-10 17:20:02',1),(10,100,12,3,12,15,88,20,1,'2019-07-10 17:20:11',1),(11,100,12,23,12,15,88,20,1,'2019-07-10 17:20:14',1),(12,100,12,23,8,NULL,88,20,1,'2019-07-10 17:20:28',1),(13,19,12,23,8,2,88,19,1,'2019-07-10 17:20:42',1),(14,56,12,2,8,2,88,19,1,'2019-07-10 17:20:55',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `address_descr_check_ins` BEFORE INSERT ON `address` FOR EACH ROW begin
if ((select id from descriptions d where d.description_type_id = 1 and new.description_id = d.id limit 1) is null)
then
signal sqlstate '45000' SET MESSAGE_TEXT = 'В таблице description должно быть значение!';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `address_user_ins` BEFORE INSERT ON `address` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `address_descr_check_upd` BEFORE UPDATE ON `address` FOR EACH ROW begin
if ((select id from descriptions d where d.description_type_id = 1 and new.description_id = d.id limit 1) is null)
then
signal sqlstate '45000' SET MESSAGE_TEXT = 'В таблице description должно быть значение!';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `address_user_upd` BEFORE UPDATE ON `address` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `buckets`
--

DROP TABLE IF EXISTS `buckets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buckets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(16,4) NOT NULL,
  `quantity` mediumint(9) NOT NULL DEFAULT '0',
  `total_amount` decimal(18,4) GENERATED ALWAYS AS ((((`quantity` * `price`) * (100 - `discount`)) / 100)) VIRTUAL NOT NULL,
  `discount` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `buckets_fk` (`product_id`),
  KEY `buckets_fk_1` (`order_id`),
  CONSTRAINT `buckets_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `buckets_fk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buckets`
--

LOCK TABLES `buckets` WRITE;
/*!40000 ALTER TABLE `buckets` DISABLE KEYS */;
INSERT INTO `buckets` (`id`, `order_id`, `product_id`, `price`, `quantity`, `discount`) VALUES (2,4,1,7400.0000,2,0),(3,4,5,2290.0000,1,10),(4,4,7,39800.0000,1,40),(5,5,11,1570.0000,23,5),(6,5,1,7400.0000,3,15),(7,6,7,39800.0000,1,0),(8,7,2,2470.0000,1,0),(9,7,2,2470.0000,1,0),(10,7,2,2470.0000,1,0),(11,8,4,1170.0000,4,13),(12,8,4,1170.0000,4,17),(13,9,10,21340.0000,1,7),(14,9,11,1570.0000,1,8),(15,10,6,700.0000,3,0),(16,10,8,1225.0000,1,10),(17,11,9,19000.0000,2,30),(18,12,4,1170.0000,1,0),(19,13,11,1570.0000,2,0),(20,13,7,39800.0000,1,2),(21,14,2,2470.0000,1,0),(22,14,3,1439.0000,1,0),(23,15,7,39800.0000,4,12),(24,16,2,2470.0000,1,2),(25,16,2,2470.0000,1,2),(26,16,2,2470.0000,1,2),(27,17,1,7400.0000,5,0),(28,17,11,1570.0000,1,0),(29,18,3,1439.0000,1,70),(30,19,9,19000.0000,2,14),(31,19,2,2470.0000,1,5),(32,20,5,2290.0000,1,0),(33,20,6,700.0000,1,0),(34,21,9,19000.0000,3,16),(35,22,11,1570.0000,8,0),(36,22,1,7400.0000,3,10),(37,23,1,7400.0000,1,5),(38,23,2,2470.0000,1,0),(39,23,3,1439.0000,1,0),(40,23,4,1170.0000,1,0);
/*!40000 ALTER TABLE `buckets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `price_ins` BEFORE INSERT ON `buckets` FOR EACH ROW begin
	declare price decimal(16,4);
	set price = (select p.price from products p where p.id = new.product_id limit 1);
if (price is null) or (price <0 ) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Ошибка цены';
end if;
	set new.price = price;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `clients_whitout_address`
--

DROP TABLE IF EXISTS `clients_whitout_address`;
/*!50001 DROP VIEW IF EXISTS `clients_whitout_address`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `clients_whitout_address` AS SELECT 
 1 AS `id клиетна`,
 1 AS `Описание клиента`,
 1 AS `Адрес`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_created` int(11) NOT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `short_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_type_fk` (`user_id_created`),
  CONSTRAINT `customer_type_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type`
--

LOCK TABLES `customer_type` WRITE;
/*!40000 ALTER TABLE `customer_type` DISABLE KEYS */;
INSERT INTO `customer_type` VALUES (1,1,'2019-07-10 17:08:48','Частное лицо'),(2,1,'2019-07-10 17:09:08','ОАО'),(3,1,'2019-07-10 17:09:11','ЗАО'),(4,1,'2019-07-10 17:09:19','ИП'),(5,1,'2019-07-10 17:09:27','Частная компания'),(6,1,'2019-07-10 17:09:37','Предприниматель');
/*!40000 ALTER TABLE `customer_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_type_user_ins` BEFORE INSERT ON `customer_type` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_type_user_upd` BEFORE UPDATE ON `customer_type` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type_id` int(11) NOT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id_created` int(11) NOT NULL,
  `description_id` int(11) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `description_type_id` smallint(6) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `customers_fk` (`customer_type_id`),
  KEY `customers_fk_1` (`user_id_created`),
  CONSTRAINT `customers_fk` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`id`),
  CONSTRAINT `customers_fk_1` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,1,'2019-07-10 18:07:51',1,23,1,3),(2,1,'2019-07-10 18:08:13',1,24,2,3),(3,1,'2019-07-10 18:08:17',1,24,3,3),(4,1,'2019-07-10 18:08:20',1,24,4,3),(5,1,'2019-07-10 18:08:23',1,25,4,3),(6,1,'2019-07-10 18:08:31',1,26,15,3),(7,2,'2019-07-10 18:09:22',1,25,22,3),(8,2,'2019-07-10 18:09:32',1,26,72,3),(9,3,'2019-07-10 18:10:11',1,23,45,3),(10,3,'2019-07-10 18:10:24',1,24,52,3),(11,4,'2019-07-10 18:10:33',1,26,34,3),(12,5,'2019-07-10 18:11:06',1,27,90,3);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customers_user_ins` BEFORE INSERT ON `customers` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customers_descr_check_ins` BEFORE INSERT ON `customers` FOR EACH ROW begin
if ((select id from descriptions d where d.description_type_id = 3 and new.description_id = d.id limit 1) is null)
then
signal sqlstate '45000' SET MESSAGE_TEXT = 'В таблице description должно быть значение!';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customers_user_upd` BEFORE UPDATE ON `customers` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customers_descr_check_upd` BEFORE UPDATE ON `customers` FOR EACH ROW begin
if ((select id from descriptions d where d.description_type_id = 3 and new.description_id = d.id limit 1) is null)
then
signal sqlstate '45000' SET MESSAGE_TEXT = 'В таблице description должно быть значение!';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `descriptions`
--

DROP TABLE IF EXISTS `descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `descriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Описание недоступно',
  `description_type_id` int(11) NOT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`description_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50500 PARTITION BY RANGE  COLUMNS(description_type_id,id)
(PARTITION address VALUES LESS THAN (1,MAXVALUE) ENGINE = InnoDB,
 PARTITION product VALUES LESS THAN (2,MAXVALUE) ENGINE = InnoDB,
 PARTITION customer VALUES LESS THAN (3,MAXVALUE) ENGINE = InnoDB,
 PARTITION `status` VALUES LESS THAN (4,MAXVALUE) ENGINE = InnoDB,
 PARTITION house VALUES LESS THAN (5,MAXVALUE) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions`
--

LOCK TABLES `descriptions` WRITE;
/*!40000 ALTER TABLE `descriptions` DISABLE KEYS */;
INSERT INTO `descriptions` VALUES (18,'Частный дом',1,'2019-07-10 16:58:11'),(19,'Квартира со злой собакой',1,'2019-07-10 16:58:14'),(20,'Частный дом',1,'2019-07-10 16:58:15'),(21,'Вход со двора',1,'2019-07-10 16:58:16'),(22,'Предварительно звонить по телефону 555-11-35',1,'2019-07-10 16:58:17'),(7,'рекомендуемый возраст: с 6 месяцев до 3 лет\r\nмеханизм \"книжка\", складывается одной рукой\r\n4 колеса\r\nвес коляски 6.3 кг\r\nнагрузка до 20 кг\r\nвозможность установки прогулочного блока\r\nпятиточечные ремни безопасности\r\nкапюшон из ткани\r\nрезиновые колеса\r\nпружинная амортизация\r\nкорзина для покупок, съемные колеса\r\nустойчива в сложенном виде',2,'2019-07-10 13:45:05'),(8,'фитнес-браслет\r\nвлагозащищенный\r\nсенсорный AMOLED-экран, 0.95\"\r\nуведомление о входящем звонке\r\nсовместимость с Android, iOS\r\nмониторинг сна, калорий, физ. активности\r\nустойчивое к царапинам стекло\r\nвес: 22.1 г',2,'2019-07-10 13:46:03'),(9,'для девочки, для мальчика\r\nот 5 лет\r\nдвигатель\r\nпластик\r\nучебно-методический комплекс',2,'2019-07-10 13:46:43'),(10,'безударная дрель-шуруповерт\r\nсъемный аккумулятор 2 А⋅ч, 18 В\r\nвес 2 кг\r\nкрутящий момент 63 Н·м\r\nбыстрозажимной патрон\r\nдиаметр патрона 1.5 - 13 мм\r\nв комплекте дополнительный аккумулятор, кейс',2,'2019-07-10 13:47:08'),(11,'видеорегистратор\r\nзапись видео 1920×1080 при 30 к/с\r\nугол обзора 130°\r\nбез экрана\r\nдатчик удара (G-сенсор)\r\nработа от аккумулятора (до 1.17 ч)\r\nподдержка карт памяти microSD (microSDHC)\r\nвстроенный микрофон',2,'2019-07-10 13:47:29'),(12,'фильтр\r\nфункции: очистка от свободного хлора\r\nдля холодной воды\r\nкалендарь замены фильтра',2,'2019-07-10 13:48:06'),(13,'фотокамера с поддержкой сменных объективов\r\nбайонет Canon EF-M\r\nматрица 25.8 МП (APS-C)\r\nсъемка видео 4K\r\nповоротный сенсорный экран 3\"\r\nWi-Fi, Bluetooth\r\nвес без элементов питания и объектива 387 г',2,'2019-07-10 13:48:33'),(14,'разработчик: Rockstar North\r\nиздатель в России: 1С-Софтклаб\r\nлокализация: русский (интерфейс и субтитры)\r\nвозрастное ограничение: 18+\r\nрелиз состоялся в 2015 г',2,'2019-07-10 13:48:58'),(15,'смартфон с Android 8.1\r\nподдержка двух SIM-карт\r\nэкран 6.5\", разрешение 2340x1080\r\nдвойная камера 20 МП/2 МП, автофокус\r\nпамять 128 Гб, слот для карты памяти\r\n3G, 4G LTE, LTE-A, Wi-Fi, Bluetooth, NFC, GPS, ГЛОНАСС\r\nобъем оперативной памяти 4 Гб\r\nаккумулятор 3750 мА⋅ч\r\nвес 175 г, ШxВxТ 76.60x160.40x7.80 мм',2,'2019-07-10 13:49:22'),(16,'настенная сплит-система\r\nобогрев и охлаждение\r\nмощность охлаждения 2600 Вт / обогрева 2700 Вт\r\nрежим вентиляции, поддержания температуры, ночной, осушения воздуха\r\nпотребляемая мощность при охлаждении 780 Вт / обогреве 730 Вт',2,'2019-07-10 13:49:48'),(17,'количество элементов: 187 шт\r\nдиаметр подключения: 1/2\" (13 мм)\r\nдлина шланга: 18 м\r\nвысота подъема: 2 м\r\nплощадь полива: 18 м²',2,'2019-07-10 13:50:06'),(23,'Мужчина 35+, женат',3,'2019-07-10 17:01:54'),(24,'Женщина, домохозяйка, 40+ имеет слонность к завышению',3,'2019-07-10 17:02:43'),(25,'Ребенок, 8+ заказывает всякую чушь за счет родителей',3,'2019-07-10 17:03:17'),(26,'Семейная пара, есть злая собака, осторожно кусается!',3,'2019-07-10 17:03:54'),(27,'Фантомас, его ни кто не видел, просит осталять заказ у входной двери',3,'2019-07-10 17:04:22'),(1,'Новый',4,'2019-07-10 13:31:09'),(2,'В пути',4,'2019-07-10 13:31:09'),(3,'Ждет оплаты',4,'2019-07-10 13:31:09'),(4,'Готов к выдаче',4,'2019-07-10 13:31:09'),(5,'Завершен',4,'2019-07-10 13:31:09'),(6,'Отменен',4,'2019-07-10 13:31:09');
/*!40000 ALTER TABLE `descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flats`
--

DROP TABLE IF EXISTS `flats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flat_number` int(11) NOT NULL,
  `user_id_created` int(11) NOT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flats_un` (`flat_number`),
  KEY `flats_fk` (`user_id_created`),
  CONSTRAINT `flats_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flats`
--

LOCK TABLES `flats` WRITE;
/*!40000 ALTER TABLE `flats` DISABLE KEYS */;
INSERT INTO `flats` VALUES (1,34,1,'2019-07-10 15:47:49'),(2,144,1,'2019-07-10 15:47:49'),(3,112,1,'2019-07-10 15:47:49'),(4,614,1,'2019-07-10 15:47:49'),(5,212,1,'2019-07-10 15:47:49'),(6,513,1,'2019-07-10 15:47:49'),(7,512,1,'2019-07-10 15:47:49'),(8,415,1,'2019-07-10 15:47:49'),(9,8133,1,'2019-07-10 15:47:49'),(10,1182,1,'2019-07-10 15:47:49'),(11,312,1,'2019-07-10 15:47:49'),(12,2142,1,'2019-07-10 15:47:49'),(13,3187,1,'2019-07-10 15:47:49'),(14,615,1,'2019-07-10 15:47:49'),(15,5310,1,'2019-07-10 15:47:49'),(16,491,1,'2019-07-10 15:47:49'),(17,371,1,'2019-07-10 15:47:49'),(18,301,1,'2019-07-10 15:47:49'),(19,161,1,'2019-07-10 15:47:49'),(20,251,1,'2019-07-10 15:47:49'),(21,812,1,'2019-07-10 15:47:49'),(22,1196,1,'2019-07-10 15:47:49'),(23,2213,1,'2019-07-10 15:47:49'),(24,111,1,'2019-07-10 15:47:49'),(25,5011,1,'2019-07-10 15:47:49');
/*!40000 ALTER TABLE `flats` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `flats_user_ins` BEFORE INSERT ON `flats` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `flats_user_upd` BEFORE UPDATE ON `flats` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_number` int(11) NOT NULL,
  `user_id_created` int(11) NOT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description_id` int(11) DEFAULT NULL,
  `description_type_id` varchar(100) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `houses_un` (`house_number`),
  KEY `houses_fk` (`user_id_created`),
  CONSTRAINT `houses_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES (1,34,1,'2019-07-10 15:46:21',NULL,'5'),(2,144,1,'2019-07-10 15:46:21',NULL,'5'),(3,12,1,'2019-07-10 15:46:21',NULL,'5'),(4,64,1,'2019-07-10 15:46:21',NULL,'5'),(5,22,1,'2019-07-10 15:46:21',NULL,'5'),(6,53,1,'2019-07-10 15:46:21',NULL,'5'),(7,52,1,'2019-07-10 15:46:21',NULL,'5'),(8,45,1,'2019-07-10 15:46:21',NULL,'5'),(9,833,1,'2019-07-10 15:46:21',NULL,'5'),(10,182,1,'2019-07-10 15:46:21',NULL,'5'),(11,32,1,'2019-07-10 15:46:21',NULL,'5'),(12,242,1,'2019-07-10 15:46:21',NULL,'5'),(13,387,1,'2019-07-10 15:46:21',NULL,'5'),(14,65,1,'2019-07-10 15:46:21',NULL,'5'),(15,530,1,'2019-07-10 15:46:21',NULL,'5'),(16,49,1,'2019-07-10 15:46:21',NULL,'5'),(17,37,1,'2019-07-10 15:46:21',NULL,'5'),(18,30,1,'2019-07-10 15:46:21',NULL,'5'),(19,16,1,'2019-07-10 15:46:21',NULL,'5'),(20,25,1,'2019-07-10 15:46:21',NULL,'5'),(21,82,1,'2019-07-10 15:46:21',NULL,'5'),(22,196,1,'2019-07-10 15:46:21',NULL,'5'),(23,223,1,'2019-07-10 15:46:21',NULL,'5'),(24,11,1,'2019-07-10 15:46:21',NULL,'5'),(25,501,1,'2019-07-10 15:46:21',NULL,'5');
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `houses_user_ins` BEFORE INSERT ON `houses` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `houses_user_upd` BEFORE UPDATE ON `houses` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `housings`
--

DROP TABLE IF EXISTS `housings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `housings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `housing_number` int(11) NOT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `housings_un` (`housing_number`),
  KEY `housings_fk` (`user_id_created`),
  CONSTRAINT `housings_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housings`
--

LOCK TABLES `housings` WRITE;
/*!40000 ALTER TABLE `housings` DISABLE KEYS */;
INSERT INTO `housings` VALUES (1,4,'2019-07-10 15:43:22',1),(2,14,'2019-07-10 15:43:22',1),(3,12,'2019-07-10 15:43:22',1),(4,6,'2019-07-10 15:43:22',1),(5,22,'2019-07-10 15:43:22',1),(6,5,'2019-07-10 15:43:22',1),(7,52,'2019-07-10 15:43:22',1),(8,45,'2019-07-10 15:43:22',1),(9,83,'2019-07-10 15:43:22',1),(10,82,'2019-07-10 15:43:22',1),(11,3,'2019-07-10 15:43:22',1),(12,24,'2019-07-10 15:43:22',1),(13,87,'2019-07-10 15:43:22',1),(14,65,'2019-07-10 15:43:22',1),(15,520,'2019-07-10 15:43:22',1),(16,49,'2019-07-10 15:43:22',1),(17,37,'2019-07-10 15:43:22',1),(18,30,'2019-07-10 15:43:22',1),(19,1,'2019-07-10 15:43:22',1),(20,2,'2019-07-10 15:43:22',1),(21,8,'2019-07-10 15:43:22',1),(22,16,'2019-07-10 15:43:22',1),(23,223,'2019-07-10 15:43:22',1),(24,11,'2019-07-10 15:43:22',1),(25,50,'2019-07-10 15:43:22',1);
/*!40000 ALTER TABLE `housings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `housings_user_ins` BEFORE INSERT ON `housings` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `housings_user_upd` BEFORE UPDATE ON `housings` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_number` int(11) DEFAULT NULL,
  `date_of_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offices_un` (`office_number`),
  KEY `offices_fk` (`user_id_created`),
  CONSTRAINT `offices_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (61,87757,'2019-07-10 14:06:41',1),(62,0,'2019-07-10 14:06:41',1),(63,6,'2019-07-10 14:06:41',1),(64,4639,'2019-07-10 14:06:41',1),(65,180094,'2019-07-10 14:06:41',1),(66,107202,'2019-07-10 14:06:41',1),(67,693,'2019-07-10 14:06:41',1),(68,69057,'2019-07-10 14:06:41',1),(69,2221,'2019-07-10 14:06:41',1),(70,5,'2019-07-10 14:06:41',1),(71,524664,'2019-07-10 14:06:41',1),(72,45402,'2019-07-10 14:06:41',1),(73,835669,'2019-07-10 14:06:41',1),(74,821,'2019-07-10 14:06:41',1),(75,36605,'2019-07-10 14:06:41',1),(76,264,'2019-07-10 14:06:41',1),(77,8388607,'2019-07-10 14:06:41',1),(78,65,'2019-07-10 14:06:41',1),(79,5890,'2019-07-10 14:06:41',1),(80,4319,'2019-07-10 14:06:41',1),(81,307,'2019-07-10 14:06:41',1),(82,3537080,'2019-07-10 14:06:41',1),(83,10427,'2019-07-10 14:06:41',1),(84,21176,'2019-07-10 14:06:41',1),(85,52,'2019-07-10 14:06:41',1),(86,816897,'2019-07-10 14:06:41',1),(87,2232702,'2019-07-10 14:06:41',1),(88,1,'2019-07-10 14:06:41',1),(89,552000,'2019-07-10 14:06:41',1);
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `offices_user_ins` BEFORE INSERT ON `offices` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `offices_user_upd` BEFORE UPDATE ON `offices` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_order` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `status_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_fk` (`customer_id`),
  KEY `orders_status_id_idx` (`status_id`,`customer_id`,`date_of_order`) USING BTREE,
  CONSTRAINT `orders_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_fk_11` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,'2019-07-10 20:17:39',1,1),(5,'2019-07-10 20:17:46',1,1),(6,'2019-07-10 20:17:49',2,1),(7,'2019-07-10 20:17:52',3,1),(8,'2019-07-10 20:17:53',3,1),(9,'2019-07-10 20:17:53',3,1),(10,'2019-07-10 20:18:00',4,1),(11,'2019-07-10 20:18:00',4,1),(12,'2019-07-10 20:18:00',4,1),(15,'2019-07-10 20:18:13',5,1),(21,'2019-07-10 20:18:28',2,2),(22,'2019-07-10 20:18:29',2,2),(16,'2019-07-10 20:18:15',5,2),(17,'2019-07-10 20:18:17',5,3),(13,'2019-07-10 20:18:03',4,4),(18,'2019-07-10 20:18:18',5,4),(23,'2019-07-10 20:18:33',1,5),(20,'2019-07-10 20:18:23',3,5),(14,'2019-07-10 20:18:10',5,5),(19,'2019-07-10 20:18:20',5,5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_post_office` varchar(100) DEFAULT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id_created` int(11) NOT NULL,
  `post_index` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_un` (`post_index`),
  KEY `posts_fk` (`user_id_created`),
  CONSTRAINT `posts_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Schamberger, Smith and Koch','2019-07-09 20:24:28',1,12024),(2,'Medhurst-Barrows','2019-07-09 20:24:28',1,82476),(3,'Mayer-Senger','2019-07-09 20:24:28',1,61398),(4,'Rath Inc','2019-07-09 20:24:28',1,68849),(5,'Wiegand, Wolf and Howe','2019-07-09 20:24:28',1,99502),(6,'Mraz, VonRueden and Wilderman','2019-07-09 20:24:28',1,60669),(7,'Littel-Schowalter','2019-07-09 20:24:28',1,61490),(8,'Bogan Ltd','2019-07-09 20:24:28',1,44568),(9,'Willms-Rodriguez','2019-07-09 20:24:28',1,15112),(10,'Greenfelder LLC','2019-07-09 20:24:28',1,28554),(11,'Feeney and Sons','2019-07-09 20:24:28',1,47291),(12,'Yundt-Brakus','2019-07-09 20:24:28',1,91829),(13,'Kshlerin-Powlowski','2019-07-09 20:24:28',1,81375),(14,'Lindgren and Sons','2019-07-09 20:24:28',1,904),(15,'Volkman Inc','2019-07-09 20:25:08',1,11030),(16,'Stoltenberg, Bechtelar and Baumbach','2019-07-09 20:25:11',1,10489),(17,'Hauck, Legros and Padberg','2019-07-10 14:00:46',1,42523),(18,'Bahringer, Sauer and Cassin','2019-07-10 14:00:46',1,26545),(19,'Bruen, Dibbert and Bode','2019-07-10 14:00:46',1,7647),(20,'Leannon-Orn','2019-07-10 14:00:46',1,97342),(21,'Hamill, Abbott and Erdman','2019-07-10 14:00:46',1,28003),(22,'Kuhic, Beier and Bashirian','2019-07-10 14:00:46',1,35905),(23,'Wisoky Group','2019-07-10 14:00:46',1,82190),(24,'Connelly-Moen','2019-07-10 14:00:46',1,41843),(25,'Johnson Group','2019-07-10 14:00:46',1,6827),(26,'Bernier and Sons','2019-07-10 14:00:46',1,97435),(27,'Cassin-Smitham','2019-07-10 14:00:46',1,62640),(28,'Abshire-Kutch','2019-07-10 14:00:46',1,79403),(29,'Gibson, Breitenberg and Dickinson','2019-07-10 14:00:46',1,54010),(30,'Wolf, Schuster and Kilback','2019-07-10 14:00:46',1,28901),(31,'Armstrong Ltd','2019-07-10 14:00:46',1,98176),(32,'Goyette-Strosin','2019-07-10 14:00:46',1,92278),(33,'Balistreri-Runte','2019-07-10 14:00:46',1,42909),(34,'Gleichner LLC','2019-07-10 14:00:46',1,82208),(35,'Cummings-Homenick','2019-07-10 14:00:46',1,55946),(36,'Stoltenberg-Robel','2019-07-10 14:00:46',1,60420),(37,'Frami PLC','2019-07-10 14:00:46',1,7641),(38,'Romaguera PLC','2019-07-10 14:00:46',1,41498),(39,'Hills-Jast','2019-07-10 14:00:46',1,72912),(40,'Rodriguez-Jast','2019-07-10 14:00:46',1,1524),(41,'Swift-Weissnat','2019-07-10 14:00:46',1,34845),(42,'Kub, Kerluke and Lemke','2019-07-10 14:00:46',1,72522),(43,'Lubowitz, Bayer and Larkin','2019-07-10 14:00:46',1,99283),(44,'Mosciski, Weimann and Beer','2019-07-10 14:00:46',1,62534),(45,'Senger-Waelchi','2019-07-10 14:00:46',1,83603),(46,'Auer, Terry and Jakubowski','2019-07-10 14:00:46',1,45563),(47,'Berge-Corwin','2019-07-10 14:00:46',1,48034),(48,'Boehm-Boyle','2019-07-10 14:00:46',1,75974),(49,'West, Crist and Romaguera','2019-07-10 14:00:46',1,3903),(50,'Nolan-Goodwin','2019-07-10 14:00:46',1,82935),(51,'Treutel and Sons','2019-07-10 14:00:46',1,98840),(52,'Klocko, Tromp and Will','2019-07-10 14:00:46',1,44154),(53,'Kunde and Sons','2019-07-10 14:00:46',1,26879),(54,'Haley, Yost and Langosh','2019-07-10 14:00:46',1,69652),(55,'Cronin, Kuvalis and Larkin','2019-07-10 14:00:46',1,99342),(56,'Feeney, West and Leffler','2019-07-10 14:00:46',1,35712),(57,'Mayer-Schuppe','2019-07-10 14:00:46',1,69684),(58,'Glover-Haag','2019-07-10 14:00:46',1,76501),(59,'Ward Inc','2019-07-10 14:00:46',1,46126),(60,'Heller-Schmidt','2019-07-10 14:00:46',1,92053),(61,'Auer-Sauer','2019-07-10 14:00:46',1,68714),(62,'Crist-Johns','2019-07-10 14:00:46',1,29540),(63,'West Ltd','2019-07-10 14:00:46',1,38524),(64,'Vandervort and Sons','2019-07-10 14:00:46',1,74516),(65,'Dooley, Stroman and Trantow','2019-07-10 14:00:46',1,96348),(66,'Abernathy, Cassin and Wilderman','2019-07-10 14:00:46',1,6874),(67,'Prohaska and Sons','2019-07-10 14:00:46',1,73842),(68,'O\'Keefe, Ebert and McDermott','2019-07-10 14:00:46',1,7998),(69,'Prosacco LLC','2019-07-10 14:00:46',1,86465),(70,'Abshire, Padberg and Schaefer','2019-07-10 14:00:46',1,85218),(71,'Walker, Kovacek and Donnelly','2019-07-10 14:00:46',1,7825),(72,'O\'Kon Inc','2019-07-10 14:00:46',1,68157),(73,'Ruecker, Stracke and Rosenbaum','2019-07-10 14:00:46',1,24985),(74,'Rau LLC','2019-07-10 14:00:46',1,68822),(75,'Kerluke and Sons','2019-07-10 14:00:46',1,52470),(76,'Morissette, Raynor and Gorczany','2019-07-10 14:00:46',1,41667),(77,'Ortiz-Konopelski','2019-07-10 14:00:46',1,43599),(78,'Morar, Reilly and Mueller','2019-07-10 14:00:46',1,98283),(79,'Ledner, Hoppe and Farrell','2019-07-10 14:00:46',1,53784),(80,'Veum, Hackett and Will','2019-07-10 14:00:46',1,60486),(81,'Hegmann Ltd','2019-07-10 14:00:46',1,24995),(82,'Jast-Ratke','2019-07-10 14:00:46',1,58024),(83,'Weissnat Inc','2019-07-10 14:00:46',1,48474),(84,'Adams, Weissnat and Ryan','2019-07-10 14:00:46',1,31641),(85,'Leffler-McCullough','2019-07-10 14:00:46',1,10241),(86,'Stoltenberg, White and Roberts','2019-07-10 14:00:46',1,13791),(87,'Bernhard-Johnson','2019-07-10 14:00:46',1,41929),(88,'Strosin Inc','2019-07-10 14:00:46',1,19754),(89,'Ferry, Boyer and Cronin','2019-07-10 14:00:46',1,95085),(90,'Greenholt, Witting and Thompson','2019-07-10 14:00:46',1,96261),(91,'Mante-Greenholt','2019-07-10 14:00:46',1,57212),(92,'Crooks-Murray','2019-07-10 14:00:46',1,37664),(93,'Welch-Ebert','2019-07-10 14:00:46',1,26546),(94,'Murray, Ebert and Gusikowski','2019-07-10 14:00:46',1,9832),(95,'Effertz, Jacobson and Howe','2019-07-10 14:00:46',1,9096),(96,'D\'Amore, Hand and Hauck','2019-07-10 14:00:46',1,36445),(97,'Schmidt, Krajcik and Gusikowski','2019-07-10 14:00:46',1,52017),(98,'Bradtke, Graham and Schuppe','2019-07-10 14:00:46',1,90834),(99,'Johnson-Tillman','2019-07-10 14:00:46',1,90234),(100,'Berge Ltd','2019-07-10 14:00:46',1,42258),(101,'Tromp LLC','2019-07-10 14:00:46',1,55083),(102,'Schiller Inc','2019-07-10 14:00:46',1,53951),(103,'Prohaska-O\'Conner','2019-07-10 14:00:46',1,70011),(104,'Stehr, Hermann and Abshire','2019-07-10 14:00:46',1,94266),(105,'Rogahn Inc','2019-07-10 14:00:46',1,51095),(106,'Marks, Auer and Hettinger','2019-07-10 14:00:46',1,38954),(107,'Okuneva Inc','2019-07-10 14:00:46',1,44080),(108,'Jones-Brakus','2019-07-10 14:00:46',1,30720),(109,'O\'Reilly, Denesik and Ferry','2019-07-10 14:00:46',1,83014),(110,'Herman, Jenkins and Hirthe','2019-07-10 14:00:46',1,87619),(111,'White and Sons','2019-07-10 14:00:46',1,4563),(112,'Goodwin-Ritchie','2019-07-10 14:00:46',1,76137),(113,'Cole and Sons','2019-07-10 14:00:46',1,1101),(114,'Haley, Treutel and Borer','2019-07-10 14:00:46',1,19844),(115,'Gulgowski-Conroy','2019-07-10 14:00:46',1,41672),(116,'Hodkiewicz Inc','2019-07-10 14:00:46',1,93792);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `posts_user_ins` BEFORE INSERT ON `posts` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `posts_user_upd` BEFORE UPDATE ON `posts` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `user_id_created` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description_id` int(11) DEFAULT NULL,
  `description_typr_id` smallint(6) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `products_fk` (`user_id_created`),
  FULLTEXT KEY `products_name_idx` (`name`),
  CONSTRAINT `products_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,7400.0000,1,'Прогулочная коляска Yoya Plus 3',7,2),(2,2470.0000,1,'Браслет Xiaomi Mi Band 4',8,2),(3,1439.0000,1,'Электронный конструктор Знаток 180 схем',9,2),(4,1170.0000,1,'Дрель-шуруповерт BOSCH GSR 18-2-LI Plus 2.0Ah x2 Case',10,2),(5,2290.0000,1,'Видеорегистратор Xiaomi 70mai Dash Cam Midrive D01',11,2),(6,700.0000,1,'Фильтр Аквафор Орлеан',12,2),(7,39800.0000,1,'Фотоаппарат Canon EOS M50 Kit',13,2),(8,1225.0000,1,'Grand Theft Auto V',14,2),(9,19000.0000,1,'Смартфон Honor 8S',15,2),(10,21340.0000,1,'Сплит-система Jax ACM-10HE',16,2),(11,1570.0000,1,'Жук Набор капельного полива от емкости на 60 растений',17,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_user_ins` BEFORE INSERT ON `products` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_user_upd` BEFORE UPDATE ON `products` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `show_all_orders`
--

DROP TABLE IF EXISTS `show_all_orders`;
/*!50001 DROP VIEW IF EXISTS `show_all_orders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `show_all_orders` AS SELECT 
 1 AS `Номер заказа`,
 1 AS `Дата заказа`,
 1 AS `Сумма заказа`,
 1 AS `Количество позиций`,
 1 AS `Статус заказа`,
 1 AS `Тип покупателя`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statuses` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_id_created` int(11) NOT NULL,
  `date_of_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `description_id` int(11) NOT NULL,
  `description_type_id` smallint(6) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `statuses_fk` (`description_id`),
  KEY `statuses_fk1` (`user_id_created`),
  CONSTRAINT `statuses_fk1` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,1,'2019-07-09 19:20:30',1,4),(2,1,'2019-07-09 19:20:38',2,4),(3,1,'2019-07-09 19:20:42',3,4),(4,1,'2019-07-09 19:20:45',4,4),(5,1,'2019-07-09 19:20:47',5,4),(6,1,'2019-07-09 19:20:49',6,4);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `statuses_user_ins` BEFORE INSERT ON `statuses` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `statuses_descr_check_ins` BEFORE INSERT ON `statuses` FOR EACH ROW begin
if ((select id from descriptions d where d.description_type_id = 4 and new.description_id = d.id limit 1) is null)
then
signal sqlstate '45000' SET MESSAGE_TEXT = 'В таблице description должно быть значение!';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `statuses_user_upd` BEFORE UPDATE ON `statuses` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `statuses_descr_check_upd` BEFORE UPDATE ON `statuses` FOR EACH ROW begin
if ((select id from descriptions d where d.description_type_id = 4 and new.description_id = d.id limit 1) is null)
then
signal sqlstate '45000' SET MESSAGE_TEXT = 'В таблице description должно быть значение!';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `streets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street_name` varchar(256) NOT NULL,
  `user_id_created` int(11) NOT NULL,
  `date_of_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `streets_un` (`street_name`),
  KEY `streets_fk` (`user_id_created`),
  CONSTRAINT `streets_fk` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,'Abshire Lake',1,'2019-07-09 19:10:18'),(2,'Alfredo Point',1,'2019-07-09 19:10:18'),(3,'Anderson Haven',1,'2019-07-09 19:10:18'),(4,'Angus Springs',1,'2019-07-09 19:10:18'),(5,'Antonietta Estates',1,'2019-07-09 19:10:18'),(6,'Arden Mill',1,'2019-07-09 19:10:18'),(7,'Ari Meadow',1,'2019-07-09 19:10:18'),(8,'Audie Corners',1,'2019-07-09 19:10:18'),(9,'Baumbach Loaf',1,'2019-07-09 19:10:18'),(10,'Baumbach Mission',1,'2019-07-09 19:10:18'),(11,'Bayer Extensions',1,'2019-07-09 19:10:18'),(12,'Bertrand Brook',1,'2019-07-09 19:10:18'),(13,'Billie Islands',1,'2019-07-09 19:10:18'),(14,'Bins Dam',1,'2019-07-09 19:10:18'),(15,'Brigitte Meadow',1,'2019-07-09 19:10:18'),(16,'Brooke Gardens',1,'2019-07-09 19:10:18'),(17,'Clara Flats',1,'2019-07-09 19:10:18'),(18,'Cleveland Junction',1,'2019-07-09 19:10:18'),(19,'Collins Gateway',1,'2019-07-09 19:10:18'),(20,'Corene Points',1,'2019-07-09 19:10:18'),(21,'Cormier Light',1,'2019-07-09 19:10:18'),(22,'Cristopher Ford',1,'2019-07-09 19:10:18'),(23,'Delfina Island',1,'2019-07-09 19:10:18'),(24,'Ebert Road',1,'2019-07-09 19:10:18'),(25,'Emard Divide',1,'2019-07-09 19:10:18'),(26,'Emard Motorway',1,'2019-07-09 19:10:18'),(27,'Erick Valleys',1,'2019-07-09 19:10:18'),(28,'Erin Forges',1,'2019-07-09 19:10:19'),(29,'Felix Bypass',1,'2019-07-09 19:10:19'),(30,'Fidel Lock',1,'2019-07-09 19:10:19'),(31,'Friesen Mission',1,'2019-07-09 19:10:19'),(32,'Gabrielle River',1,'2019-07-09 19:10:19'),(33,'Gerardo Prairie',1,'2019-07-09 19:10:19'),(34,'Glover Spur',1,'2019-07-09 19:10:19'),(35,'Greenfelder Fields',1,'2019-07-09 19:10:19'),(36,'Harvey Pike',1,'2019-07-09 19:10:19'),(37,'Hayes Glens',1,'2019-07-09 19:10:19'),(38,'Heloise Via',1,'2019-07-09 19:10:19'),(39,'Homenick Skyway',1,'2019-07-09 19:10:19'),(40,'Howell Views',1,'2019-07-09 19:10:19'),(41,'Hyatt Plaza',1,'2019-07-09 19:10:19'),(42,'Hyman Groves',1,'2019-07-09 19:10:19'),(43,'Irving Tunnel',1,'2019-07-09 19:10:19'),(44,'Jannie Shore',1,'2019-07-09 19:10:19'),(45,'Jenkins Branch',1,'2019-07-09 19:10:19'),(46,'Joanne Islands',1,'2019-07-09 19:10:19'),(47,'Joannie Manor',1,'2019-07-09 19:10:19'),(48,'Joseph Green',1,'2019-07-09 19:10:19'),(49,'Katheryn Alley',1,'2019-07-09 19:10:19'),(50,'Kelley Plains',1,'2019-07-09 19:10:19'),(51,'Kemmer Roads',1,'2019-07-09 19:10:19'),(52,'King Plains',1,'2019-07-09 19:10:19'),(53,'Kovacek Meadow',1,'2019-07-09 19:10:19'),(54,'Kreiger Via',1,'2019-07-09 19:10:19'),(55,'Kuhic Junctions',1,'2019-07-09 19:10:19'),(56,'Kuhlman Roads',1,'2019-07-09 19:10:19'),(57,'Laron Springs',1,'2019-07-09 19:10:19'),(58,'Leanne Plaza',1,'2019-07-09 19:10:19'),(59,'Lelia Grove',1,'2019-07-09 19:10:19'),(60,'Lionel Station',1,'2019-07-09 19:10:19'),(61,'Little Ways',1,'2019-07-09 19:10:19'),(62,'Mable Lake',1,'2019-07-09 19:10:19'),(63,'Malinda Dam',1,'2019-07-09 19:10:19'),(64,'Marisa Expressway',1,'2019-07-09 19:10:19'),(65,'Mason Road',1,'2019-07-09 19:10:19'),(66,'Misty Walks',1,'2019-07-09 19:10:19'),(67,'Moen Burgs',1,'2019-07-09 19:10:19'),(68,'Mosciski Island',1,'2019-07-09 19:10:19'),(69,'Okuneva Hollow',1,'2019-07-09 19:10:19'),(70,'Ottis Mills',1,'2019-07-09 19:10:19'),(71,'Ozella Divide',1,'2019-07-09 19:10:19'),(72,'Quitzon Forges',1,'2019-07-09 19:10:19'),(73,'Rachel River',1,'2019-07-09 19:10:19'),(74,'Rau Wall',1,'2019-07-09 19:10:19'),(75,'Rebekah Knoll',1,'2019-07-09 19:10:19'),(76,'Reinger Fall',1,'2019-07-09 19:10:19'),(77,'Rene Plains',1,'2019-07-09 19:10:19'),(78,'Rex Drive',1,'2019-07-09 19:10:19'),(79,'Rita Throughway',1,'2019-07-09 19:10:19'),(80,'Rodriguez Knolls',1,'2019-07-09 19:10:19'),(81,'Rogers Loop',1,'2019-07-09 19:10:19'),(82,'Rohan Manor',1,'2019-07-09 19:10:19'),(83,'Roob Park',1,'2019-07-09 19:10:19'),(84,'Runolfsdottir Alley',1,'2019-07-09 19:10:19'),(85,'Samir Hills',1,'2019-07-09 19:10:19'),(86,'Schultz Spring',1,'2019-07-09 19:10:19'),(87,'Shanon Walks',1,'2019-07-09 19:10:19'),(88,'Smitham Port',1,'2019-07-09 19:10:19'),(89,'Swift Burgs',1,'2019-07-09 19:10:19'),(90,'Tania Crossroad',1,'2019-07-09 19:10:19'),(91,'Terrell Tunnel',1,'2019-07-09 19:10:19'),(92,'Thaddeus Fords',1,'2019-07-09 19:10:19'),(93,'Walter Spring',1,'2019-07-09 19:10:19'),(94,'Waters Springs',1,'2019-07-09 19:10:19'),(95,'Whitney Common',1,'2019-07-09 19:10:19'),(96,'Wunsch Lake',1,'2019-07-09 19:10:19'),(97,'Xander Ridges',1,'2019-07-09 19:10:19'),(98,'Yost Via',1,'2019-07-09 19:10:19'),(99,'Zola Prairie',1,'2019-07-09 19:10:19'),(100,'Zulauf Flat',1,'2019-07-09 19:10:19');
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `streets_user_ins` BEFORE INSERT ON `streets` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
else
	set new.user_id_created = user_id;
end if;
	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `streets_user_upd` BEFORE UPDATE ON `streets` FOR EACH ROW begin
	declare cur_user varchar(125);
	declare user_id int;
	set cur_user = user();
	set user_id = (select id from users u where login = user() limit 1);
if (user_id is null) then 
	signal sqlstate '45000' SET MESSAGE_TEXT = 'Незарегестрированный пользователь';
end if;
	set new.user_id_created = user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `date_of_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `login` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_un` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dmitriy','Ivanov','2019-07-09 18:16:50','root@localhost');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `clients_whitout_address`
--

/*!50001 DROP VIEW IF EXISTS `clients_whitout_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clients_whitout_address` AS select `c`.`id` AS `id клиетна`,`d`.`description` AS `Описание клиента`,concat(`p`.`post_index`,', ',`s`.`street_name`,', ',`h`.`house_number`) AS `Адрес` from ((((((`customers` `c` join `descriptions` `d` on(((`c`.`description_id` = `d`.`id`) and (`c`.`description_type_id` = `d`.`description_type_id`)))) left join `address` `a` on((`c`.`address_id` = `a`.`id`))) left join `streets` `s` on((`a`.`street_id` = `s`.`id`))) left join `houses` `h` on((`a`.`house_number_id` = `h`.`id`))) left join `flats` `f` on((`a`.`flat_id` = `f`.`id`))) left join `posts` `p` on((`a`.`post_id` = `p`.`id`))) where isnull(`s`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_all_orders`
--

/*!50001 DROP VIEW IF EXISTS `show_all_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_all_orders` AS select `o`.`id` AS `Номер заказа`,concat(`o`.`date_of_order`) AS `Дата заказа`,sum(`b`.`total_amount`) AS `Сумма заказа`,sum(`b`.`quantity`) AS `Количество позиций`,`d`.`description` AS `Статус заказа`,`ct`.`short_description` AS `Тип покупателя` from ((((((`orders` `o` join `buckets` `b` on((`o`.`id` = `b`.`order_id`))) join `statuses` `s` on((`o`.`status_id` = `s`.`id`))) join `descriptions` `d` on(((`s`.`description_id` = `d`.`id`) and (`s`.`description_type_id` = `d`.`description_type_id`)))) join `customers` `c` on((`o`.`customer_id` = `c`.`customer_type_id`))) join `customer_type` `ct` on((`c`.`customer_type_id` = `ct`.`id`))) left join `address` `a` on((`c`.`address_id` = `a`.`id`))) group by `o`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-11 17:27:50
