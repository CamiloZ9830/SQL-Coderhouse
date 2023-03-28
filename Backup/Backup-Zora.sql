-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bikestore_db
-- ------------------------------------------------------
-- Server version	8.0.31

/*
   Backup de los datos de las tablas:
      *bikestore_db.users
      *bikestore_db.product
      *bikestore_db.order_details
      *bikestore_db.admin_user
*/

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
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Bicicleta Trek','Trek Urbana para amantes de bicicletas','2020',499.99,100,105,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(2,'Electra Bike Model M','Electra Bike para amantes de bicicletas','2021',699.99,600,101,'2020-07-25 14:56:59','2021-08-08 11:56:59',NULL),(3,'Llanta de respuesto','Llanta de respuesto bicicleta Trek','2022',59.99,1000,103,'2020-07-25 14:56:59','2021-08-08 11:56:59',NULL),(4,'Luz Led','Luz Led exploradora para Bicicleta','2019',44.99,900,102,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(5,'Bicicleta Cannondale','Cannondale Urbana para amantes de bicicletas','2022',499.99,100,104,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(6,'Bicicleta Giant','Giant Urbana para amantes de bicicletas','2023',499.99,100,107,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(7,'Electra Bike Model T','Electra Bike para amantes de bicicletas','2023',499.99,600,106,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(8,'Casco SK1 Verde Agua','Los cascos Sk1 están diseñados para el uso urbano y se adaptan perfectamente a las modalidades de ciclismo urbano, skate y patinaje.','2021',44.99,900,108,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(9,'Specialized Sirrus 2.0 Step-Through 2022 Hybrid Bike','Comfortable, ergonomically designed Body Geometry touchpoints are there to take the sting out of longer rides','2022',499.99,300,109,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(10,'Giant Talon 2 Mountain Bike','Giant\'s new lightweight ALUXX aluminium frame that features a classic hardtail design, Talon is a perfect choice for XC or light trail terrain','2021',499.00,200,110,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(11,'Giant Contend AR 4 2022 Road Bike','Some road are smooth, others are rough.','2022',1049.00,400,111,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(12,'Brompton C Line Explore High Handlebar Folding Bike','Compact and robust, it\'s a seriously engineered bike that is fun to ride.','2022',499.99,500,112,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(13,'Liv Alight 3 Disc 2022 Women\'s Hybrid Bike','Redesigned with a fast and fresh look, the Alight 3 Disc is equipped with touchpoints to maximise comfort.','2022',549.99,800,113,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(14,'Frog 40 Kids Bike - 14 Inch','The Frog 40 is an easier rolling, lighter weight 14 inch-wheel kids\' bike for ages 3 - 4 years','2021',499.99,1100,114,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(15,'Genesis Day One 2023 Adventure Road Bike','The Day One is a combination of super-commuter, meets touring, meets gravel bike','2023',899.99,700,115,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(16,'Giant Contend SL 1 2021 Road Bike','Get ready to increase your road riding mileage. This lightweight, smooth-riding bike is all the motivation you will need.','2021',949.99,100,117,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(17,'Giant Contend AR 2 2021 Adventure Road Bike','Expand your idea of road riding and unlock new routes thanks to this versatile all-rounder.','2021',1049.99,100,116,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(18,'Liv Avail 2 Women\'s 2021 Road Bike','Lightweight and balanced, the modern endurance geometry is designed for the female for and delivers a smooth all-day riding experience.','2021',649.99,800,118,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(19,'Liv Langma Advanced 1+ Disc 2022 Women\'s Road Bike','Whether you\'re in it for the love of the climb, the rush of the descent, or the next PR, the Langma Advanced Disc is ready with its re-engineered lightweight aero frame.','2022',3149.00,800,119,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(20,'Liv Langma Advanced 1+ Disc 2022 Women\'s Road Bike','Since its introduction, Levo has set the bar every other e-MTB aims for, and the new Levo raises that bar again.','2022',8000.00,600,120,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(21,'Specialized Turbo Vado SL 4.0 2023 Electric Bike','The Turbo Vado SL 4.0 is best for workouts, riding beyond the beaten path and last-minute adventures. All you need to do is get on and go.','2022',2800.00,600,121,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(22,'Whyte Clifton 2022 Electric Bike','Clifton comes equipped with 650b wheels and 47c RoadPlus, WTB Byway tyres offering greater comfort, better grip and increased security on rough urban roads and light off-road rides.','2022',2799.00,600,122,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(23,'Frog 62 Kids Bike - 24 Inch','The Frog 62 is an easier rolling, lighter weight 24 inch wheel kids\' bike.','2022',445.00,1100,123,'2023-02-26 05:17:41','2023-02-26 05:17:41',NULL),(24,'Frog Tadpole Kids Balance Bike','Frog have a winning knack for creating lighter weight, better spec\'d but still competitively priced kids\' bikes, which are easier to ride.','2022',210.00,1100,125,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(25,'Whyte 909 X 2023 Mountain Bike','For 2023 Whyte have stepped things up again by offering the ultimte Enduro hardtail with Sram GX AXS Eagle wireless shifting.','2023',3500.00,200,124,'2023-02-26 05:17:41','2023-02-26 05:17:41',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'penelopeg90','abc@123456','Penelope','Guiness','+353-856-578-45','2020-08-25 14:56:59','2021-08-25 11:56:59'),(2,'vivi6680','trc5656','Vivien','Rodriguez','+56-486-680-85','2020-08-25 14:56:59','2021-08-25 11:56:59'),(3,'rose_82','8256@asgt','Helen','Olivier','+33-468-139-42','2020-08-25 14:56:59','2021-08-25 11:56:59'),(4,'cris9230','864ajm@156','Cristian','Lollobrigida','+54-498-388-23','2020-08-25 14:56:59','2021-08-25 11:56:59'),(5,'dfirrelli88','Tghfgh58','David','Firrelli','+1-687-687-32','2020-08-25 14:56:59','2021-08-25 11:56:59'),(6,'poultrycomet','cowboy92','Olivia','Cruz','(390) 865-7608','2023-02-11 07:33:45','2023-02-11 23:42:10'),(7,'kingfutourist','checkers','Lee','Castillo','(776) 239-0943','2023-02-11 11:10:28','2023-02-11 23:42:10'),(8,'wandollar1562','momo','Robert','Pena','(736) 536-5532','2023-02-11 23:42:10','2023-02-11 23:42:10'),(12,'guineafowl','leng','Dianne','Douglas','(470) 783-2510','2023-02-28 18:53:40',NULL),(13,'twinkling','beavis1','Joyce','Castro','(696) 204-9416','2023-02-28 18:53:40',NULL),(14,'farflung','pegasus','Elaine','Allen','(627) 714-2582','2023-02-28 18:53:40',NULL),(15,'drag','bobbob','Cindy','Vasquez','(900) 817-3804','2023-02-28 18:53:40',NULL),(16,'singe','darkman','Stacy','Montgomery','(656) 996-9135','2023-02-28 18:53:40',NULL),(17,'carrots','underwear','Shannon','Hart','(867) 387-2991','2023-02-28 18:53:40',NULL),(18,'brring','auto','Alyssa','Ramos','(892) 574-7772','2023-02-28 18:53:40',NULL),(19,'nonstop','safety','Ricardo','Vargas','(890) 360-2006','2023-02-28 18:53:40',NULL),(20,'forked','lincoln','nonstop','Weaver','(960) 701-2316','2023-02-28 18:53:40',NULL),(21,'clothedninja32','r@inderp','Jordan','Silva','(303) 875-3589','2023-02-28 18:53:40',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `old_user_info` AFTER UPDATE ON `users` FOR EACH ROW INSERT INTO update_user_log (id_user, old_username, old_password, old_telephone, modified_at) 
VALUES (NEW.id, OLD.username, OLD.user_password, OLD.telephone, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,3,644.98,1,'2022-02-28 20:44:30','2022-02-28 20:44:30'),(2,5,499.99,2,'2022-11-26 17:56:15','2022-11-26 17:56:15');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'wiltedkoala','gracie','Rafael','Neal',4000,'2023-02-16 04:41:36','2021-05-05 14:55:21','2021-05-05 14:55:21'),(2,'pizzamoney','knock','Gabriella','Beck',3000,'2023-02-18 02:45:32','2021-05-05 23:55:21','2021-05-05 23:55:21'),(3,'competetabasco','iwantu','Jack','Hernandez',5000,'2023-02-18 02:45:32','2021-05-05 23:55:21','2021-05-05 23:55:21'),(4,'olliegainful','nancy1','Tonya','Medina',2000,'2023-02-18 23:45:22','2021-05-05 23:55:21','2021-05-05 23:55:21'),(5,'taxpayerclam','phyllis','Seth','Mendoza',1000,'2023-02-18 23:45:22','2021-05-05 23:55:21','2021-05-05 23:55:21');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondelete_admin` BEFORE DELETE ON `admin_user` FOR EACH ROW INSERT INTO ondelete_admin_log (id_admin, username, ad_password, first_name, last_name, admin_type_id, last_login, created_at) 
VALUES (OLD.id, OLD.username, OLD.ad_password, OLD.first_name, OLD.last_name, OLD.type_id, OLD.last_login, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 12:15:32
