-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bikestore_db
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
-- Dumping data for table `admin_type`
--

LOCK TABLES `admin_type` WRITE;
/*!40000 ALTER TABLE `admin_type` DISABLE KEYS */;
INSERT INTO `admin_type` VALUES (1000,'Tech Admin','Mantenimiento, Actualizaciones, Seguridad','2021-02-17 15:00:00','2021-02-17 15:00:00'),(2000,'Super Admin','Modificar el Website, Administrativo, Maneja otros Admin','2021-02-17 15:01:03','2021-02-17 15:00:00'),(3000,'Store Manager','Agregar y editar productos, manejar inventario, Procesar ordenes','2021-02-17 15:01:20','2021-02-17 15:00:00'),(4000,'Customer Service','Feedback, Soporte al Usuario, Quejas','2021-02-17 15:01:45','2021-02-17 15:00:00'),(5000,'Payment Admin','Manejar transacciones,  Devoluciones, Chargebacks','2021-02-17 15:02:10','2021-02-17 15:00:00');
/*!40000 ALTER TABLE `admin_type` ENABLE KEYS */;
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

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (1,1,4,1,'2022-02-28 20:10:48','2022-02-28 20:44:30'),(2,2,7,1,'2022-02-28 20:12:24','2022-02-28 20:44:30'),(3,2,11,1,'2022-05-18 18:18:06','2022-05-18 20:15:56'),(4,3,3,2,'2022-06-16 16:12:58','2022-06-16 17:56:15'),(5,4,14,1,'2022-11-26 17:26:58','2022-11-26 17:56:15'),(6,5,4,1,'2023-01-02 21:25:03','2023-01-02 21:45:16');
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ondelete_admin_log`
--

LOCK TABLES `ondelete_admin_log` WRITE;
/*!40000 ALTER TABLE `ondelete_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ondelete_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,3,644.98,1,'2022-02-28 20:44:30','2022-02-28 20:44:30'),(2,5,499.99,2,'2022-11-26 17:56:15','2022-11-26 17:56:15');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,4,1,'2022-02-28 20:44:30','2022-02-28 20:44:30'),(2,1,7,1,'2022-02-28 20:44:30','2022-02-28 20:44:30'),(3,2,14,1,'2022-11-26 17:56:15','2022-11-26 17:56:15');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (1,111111,684.98,'Master Card','Succeed','2022-02-28 20:44:30','2022-02-28 20:44:30'),(2,111112,549.98,'Paypal','Succeed','2022-11-26 17:55:15','2022-02-28 20:43:30');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Bicicleta Trek','Trek Urbana para amantes de bicicletas','2020',499.99,100,105,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(2,'Electra Bike Model M','Electra Bike para amantes de bicicletas','2021',699.99,600,101,'2020-07-25 14:56:59','2021-08-08 11:56:59',NULL),(3,'Llanta de respuesto','Llanta de respuesto bicicleta Trek','2022',59.99,1000,103,'2020-07-25 14:56:59','2021-08-08 11:56:59',NULL),(4,'Luz Led','Luz Led exploradora para Bicicleta','2019',44.99,900,102,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(5,'Bicicleta Cannondale','Cannondale Urbana para amantes de bicicletas','2022',499.99,100,104,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(6,'Bicicleta Giant','Giant Urbana para amantes de bicicletas','2023',499.99,100,107,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(7,'Electra Bike Model T','Electra Bike para amantes de bicicletas','2023',499.99,600,106,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(8,'Casco SK1 Verde Agua','Los cascos Sk1 están diseñados para el uso urbano y se adaptan perfectamente a las modalidades de ciclismo urbano, skate y patinaje.','2021',44.99,900,108,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(9,'Specialized Sirrus 2.0 Step-Through 2022 Hybrid Bike','Comfortable, ergonomically designed Body Geometry touchpoints are there to take the sting out of longer rides','2022',499.99,300,109,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(10,'Giant Talon 2 Mountain Bike','Giant\'s new lightweight ALUXX aluminium frame that features a classic hardtail design, Talon is a perfect choice for XC or light trail terrain','2021',499.00,200,110,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(11,'Giant Contend AR 4 2022 Road Bike','Some road are smooth, others are rough.','2022',1049.00,400,111,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(12,'Brompton C Line Explore High Handlebar Folding Bike','Compact and robust, it\'s a seriously engineered bike that is fun to ride.','2022',499.99,500,112,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(13,'Liv Alight 3 Disc 2022 Women\'s Hybrid Bike','Redesigned with a fast and fresh look, the Alight 3 Disc is equipped with touchpoints to maximise comfort.','2022',549.99,800,113,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(14,'Frog 40 Kids Bike - 14 Inch','The Frog 40 is an easier rolling, lighter weight 14 inch-wheel kids\' bike for ages 3 - 4 years','2021',499.99,1100,114,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(15,'Genesis Day One 2023 Adventure Road Bike','The Day One is a combination of super-commuter, meets touring, meets gravel bike','2023',899.99,700,115,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(16,'Giant Contend SL 1 2021 Road Bike','Get ready to increase your road riding mileage. This lightweight, smooth-riding bike is all the motivation you will need.','2021',949.99,100,117,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(17,'Giant Contend AR 2 2021 Adventure Road Bike','Expand your idea of road riding and unlock new routes thanks to this versatile all-rounder.','2021',1049.99,100,116,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(18,'Liv Avail 2 Women\'s 2021 Road Bike','Lightweight and balanced, the modern endurance geometry is designed for the female for and delivers a smooth all-day riding experience.','2021',649.99,800,118,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(19,'Liv Langma Advanced 1+ Disc 2022 Women\'s Road Bike','Whether you\'re in it for the love of the climb, the rush of the descent, or the next PR, the Langma Advanced Disc is ready with its re-engineered lightweight aero frame.','2022',3149.00,800,119,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(20,'Liv Langma Advanced 1+ Disc 2022 Women\'s Road Bike','Since its introduction, Levo has set the bar every other e-MTB aims for, and the new Levo raises that bar again.','2022',8000.00,600,120,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(21,'Specialized Turbo Vado SL 4.0 2023 Electric Bike','The Turbo Vado SL 4.0 is best for workouts, riding beyond the beaten path and last-minute adventures. All you need to do is get on and go.','2022',2800.00,600,121,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(22,'Whyte Clifton 2022 Electric Bike','Clifton comes equipped with 650b wheels and 47c RoadPlus, WTB Byway tyres offering greater comfort, better grip and increased security on rough urban roads and light off-road rides.','2022',2799.00,600,122,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(23,'Frog 62 Kids Bike - 24 Inch','The Frog 62 is an easier rolling, lighter weight 24 inch wheel kids\' bike.','2022',445.00,1100,123,'2023-02-26 05:17:41','2023-02-26 05:17:41',NULL),(24,'Frog Tadpole Kids Balance Bike','Frog have a winning knack for creating lighter weight, better spec\'d but still competitively priced kids\' bikes, which are easier to ride.','2022',210.00,1100,125,'2020-08-25 14:56:59','2021-08-25 11:56:59',NULL),(25,'Whyte 909 X 2023 Mountain Bike','For 2023 Whyte have stepped things up again by offering the ultimte Enduro hardtail with Sram GX AXS Eagle wireless shifting.','2023',3500.00,200,124,'2023-02-26 05:17:41','2023-02-26 05:17:41',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (100,'Road Bikes','Bicicletas de Ruta para amantes de bicicletas','2020-08-25 11:56:59','2022-08-25 11:56:59',NULL),(200,'Mountain Bikes','Bicicletas de Montaña para amantes de bicicletas','2020-08-25 11:58:49','2022-10-29 09:51:59',NULL),(300,'Hybrid/commuter Bikes','Bicicletas Hibridas para amantes de bicicletas','2020-08-25 12:10:49','2022-10-29 09:51:59',NULL),(400,'Gravel Road Bikes','Bicicletas de Gravel para amantes de bicicletas','2021-01-21 12:20:49','2022-10-29 09:51:59',NULL),(500,'Folding Bikes','Bicicletas Plegables para amantes de bicicletas','2022-08-09 12:25:15','2022-10-29 09:51:59',NULL),(600,'Electric Bikes','Bicicletas Electricas para amantes de bicicletas','2020-08-25 12:26:15','2022-10-29 09:51:59',NULL),(700,'Touring Bikes','Bicicletas de turismo para amantes de bicicletas','2021-04-25 12:29:31','2022-10-29 09:51:59',NULL),(800,'Women\'s Bikes','Bicicletas para mujeres para amantes de bicicletas','2021-05-30 12:31:18','2022-10-29 09:51:59',NULL),(900,'Accesorios','Accesorios para Bicicletas','2020-08-25 12:32:11','2022-10-29 09:51:59',NULL),(1000,'Respuestos','Repuestos para Bicicletas','2020-08-25 12:32:35','2022-11-15 09:51:59',NULL),(1100,'Kid\'s Bikes','Bicicletas para niños','2020-08-25 12:49:35','2022-11-18 09:01:59',NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_category_discount`
--

LOCK TABLES `product_category_discount` WRITE;
/*!40000 ALTER TABLE `product_category_discount` DISABLE KEYS */;
INSERT INTO `product_category_discount` VALUES (1,'Descuento de Navidad','Descuento sobre productos seleccionados dia de navidad',1100,25.00,0,'2021-12-08 20:31:18','2024-12-25 20:31:18','2022-12-02 14:15:05',NULL),(2,'Descuento dia de Pascuas','Descuento sobre productos seleccionados dia de Pascuas',200,15.00,0,'2021-04-08 17:31:45','2024-12-25 20:31:18','2022-04-02 14:15:35',NULL),(3,'Descuento de Black Friday','Descuento sobre productos seleccionados para Black Friday',500,29.99,0,'2021-11-09 17:51:45','2024-12-25 20:31:18','2022-11-02 14:15:35',NULL),(4,'Descuento de Cyber Monday','Descuento sobre productos seleccionados para Cyber Monday',600,14.25,1,'2021-04-08 21:21:45','2024-12-25 20:31:18','2023-01-02 14:15:35',NULL);
/*!40000 ALTER TABLE `product_category_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` VALUES (101,4,'2020-08-25 11:56:59','2022-08-26 00:56:59',NULL),(102,2,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(103,1,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(104,5,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(105,2,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(106,4,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(107,3,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(108,6,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(109,10,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(110,3,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(111,14,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(112,5,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(113,3,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(114,6,'2020-08-25 11:56:59','2022-11-26 00:56:59',NULL),(115,3,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(116,9,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(117,6,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(118,2,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(119,5,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(120,4,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(121,3,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(122,2,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(123,2,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(124,8,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL),(125,4,'2020-08-25 11:58:59','2022-11-26 00:59:59',NULL);
/*!40000 ALTER TABLE `product_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shopping_session`
--

LOCK TABLES `shopping_session` WRITE;
/*!40000 ALTER TABLE `shopping_session` DISABLE KEYS */;
INSERT INTO `shopping_session` VALUES (1,3,644.98,'2022-02-28 20:05:08','2022-02-28 20:44:30'),(2,4,1069.00,'2022-05-18 18:18:06','2022-05-18 20:15:56'),(3,1,0.00,'2022-06-16 16:12:58','2022-06-16 17:56:15'),(4,5,449.99,'2022-11-26 17:26:58','2022-11-26 17:56:15'),(5,2,46.83,'2023-01-02 21:25:03','2023-01-02 21:45:16');
/*!40000 ALTER TABLE `shopping_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `update_user_log`
--

LOCK TABLES `update_user_log` WRITE;
/*!40000 ALTER TABLE `update_user_log` DISABLE KEYS */;
INSERT INTO `update_user_log` VALUES (1,21,'stressed','(303) 875-3589','(303) 875-3589','2023-02-28 18:55:26'),(2,21,'rainderp','(303) 875-3589','(303) 875-3589','2023-02-28 18:56:24'),(3,21,'clothedninja32','(303) 875-3589','(303) 875-3589','2023-02-28 18:56:45');
/*!40000 ALTER TABLE `update_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (1,3,'76 rue Pierre De Coubertin','Toulouse','France','+33-468-139-42'),(2,2,'General Parra 694 Providencia (2)2364017, Región Metropolitana de Santiago','Santiago','Chile','+56-486-680-85'),(3,4,'Cnel Ramon L. Falcon 3256','Buenos Aires','Argentina','+54-498-388-23'),(4,5,' 3098 Aviation Way','Dallas','USA','+1-687-687-32'),(5,1,'Bridge st Donegal','Killybegs','Ireland','+353-856-578-45');
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_payment`
--

LOCK TABLES `user_payment` WRITE;
/*!40000 ALTER TABLE `user_payment` DISABLE KEYS */;
INSERT INTO `user_payment` VALUES (1,3,'Credit Card','Master Card','7538-7852-3596-9822','2024-08-01'),(2,2,'Credit Card','Visa','1568-3599-0028-2866','2026-11-01'),(3,5,'Online Transfer','Paypal','Dfirrelli@mail.com','9999-12-31');
/*!40000 ALTER TABLE `user_payment` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 11:45:52
