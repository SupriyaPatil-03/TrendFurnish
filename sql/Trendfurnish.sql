-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: trendfurnish
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlogin` (
  `emailid` varchar(50) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES ('admin@gmail.com','12345');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brand` varchar(80) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `dimensions` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `productimg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (11,'yashchavan12@gmail.com','Dimarva Modern Sideboard Cabinet for Living Room','Dimarva','Walnut Finish','Living Room','36D x 173W x 86.5H Centimeters>',14000,1,14000,'20.jpg'),(12,'yashchavan12@gmail.com','Wood Dining Table Without Chair','SNAP FURNITURE','Brown','Dining Room','86.4D x 114.3W x 76.2H Centimeters>',46199,1,46199,'36.jpg'),(19,'priyanka0328@gmail.com','Homeand Office Desk Made Pre Laminated Board with Drawers ','Lakdi The Furniture Co ','Brown','Bed Room','48 x 18 x 30 Inch>',5300,1,5300,'39.jpg'),(21,'vijaypatil29@gmail.com','Director Table for Home and Office Desk Luxury Design','Lakdi The Furniture Co','Grey','Office Furniture','78D x 180W x 78H Centimeters>',28000,3,84000,'40.jpg'),(27,'pallavik10@gmail.com','Modern Bedside Table with 3 Shelves,Bed Side Table Wooden Organizer Stand','Yookeer','Brown','Bed Room','25D x 40W x 50H Centimeters>',929,2,1858,'25.jpg'),(34,'supriya03@gmail.com','Patio Folding Coffee Table/Tea Table','ETIQUETTE ART ','Light Walnut','Dining Room','38D x 38W x 38H Centimeters>',550,3,1650,'35.jpg');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('Pradnya Sanjeev More','mpradnya04@gmail.com','9865472103','I want to know if there is white color available in TV stand Shelf'),('Supriya Vijay Patil','supriya03@gmail.com','7854123652','Do you offer design services?'),('Vijay Mahadev Patil','vijaypatil29@gmail.com','7854236951',' Do you offer delivery services?');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `orderno` int NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (3,'Satara','9874512036'),(5,'patan','7845962301'),(6,'Satara','9865472103'),(7,'Karad','7745123650'),(8,'Pune','8854210369'),(9,'Pune','8794562315'),(10,'Mumbai','9645120325'),(13,'satara','9865472103'),(14,'sangali','7745123650'),(15,'sangali','9874512036'),(16,'pune','7854123652'),(17,'Satara','7854123652'),(18,'Satara','9875486216');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `emailid` varchar(50) DEFAULT NULL,
  `msg` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES ('vijaypatil29@gmail.com','Nice products'),('mpradnya04@gmail.com','Furniture have really good quality '),('sanjaypatil06@gmail.com','I have ordered Back Leatherette Wooden Base Handle Office Chair which is very comfortable and very useful also its quality is really good'),('nilamghadge0922@gmail.com','The quality of the furniture is outstanding! My new dining set arrived on time and was super easy to assemble. Will definitely buy again!'),('supriya03@gmail.com','Great customer service and timely delivery; TrendFurnish made furnishing my home hassle-free!');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdet`
--

DROP TABLE IF EXISTS `orderdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdet` (
  `ordno` int NOT NULL,
  `id` varchar(45) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`ordno`,`id`),
  CONSTRAINT `fk_orderdet_ordermst` FOREIGN KEY (`ordno`) REFERENCES `ordermst` (`ordno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdet`
--

LOCK TABLES `orderdet` WRITE;
/*!40000 ALTER TABLE `orderdet` DISABLE KEYS */;
INSERT INTO `orderdet` VALUES (3,'13',1),(5,'10',2),(6,'1',2),(7,'15',1),(8,'17',1),(9,'7',1),(10,'22',1),(13,'24',2),(14,'16',2),(15,'26',1),(16,'4',6),(17,'32',1),(17,'33',1),(18,'35',1);
/*!40000 ALTER TABLE `orderdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermst`
--

DROP TABLE IF EXISTS `ordermst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordermst` (
  `odt` datetime DEFAULT NULL,
  `ordno` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ordno`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermst`
--

LOCK TABLES `ordermst` WRITE;
/*!40000 ALTER TABLE `ordermst` DISABLE KEYS */;
INSERT INTO `ordermst` VALUES ('2025-05-06 16:08:44',3,'ankitapawar2240@gmail.com','12000'),('2025-05-06 16:19:04',5,'aaravpatil07@gmail.com','1100'),('2025-05-06 16:28:41',6,'mpradnya04@gmail.com','4000'),('2025-05-06 17:33:28',7,'bhavanachavan26@gmail.com','2499'),('2025-05-07 13:07:36',8,'nilamghadge0922@gmail.com','3999'),('2025-05-11 17:28:56',9,'sanjaypatil06@gmail.com','48300'),('2025-05-13 11:23:33',10,'anujpanaskar01@gmail.com','27800'),('2025-05-13 18:55:15',13,'mpradnya04@gmail.com','65998'),('2025-05-13 19:57:13',14,'bhavanachavan26@gmail.com','1858'),('2025-05-13 20:08:21',15,'ankitapawar2240@gmail.com','689'),('2025-05-17 15:47:30',16,'supriya03@gmail.com','15588'),('2025-05-18 23:26:31',17,'supriya03@gmail.com','60199'),('2025-06-28 06:44:07',18,'bhavanachavan26@gmail.com','929');
/*!40000 ALTER TABLE `ordermst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `amount` int NOT NULL,
  `method` varchar(45) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ordno` int NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`amount`),
  KEY `fk_payment_ordermst` (`ordno`),
  CONSTRAINT `fk_payment_ordermst` FOREIGN KEY (`ordno`) REFERENCES `ordermst` (`ordno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (689,'Cash on Delivery','palus,sangali','ankitapawar2240@gmail.com',15,'2025-05-13 20:08:21'),(929,'Cash on Delivery','Sagarbazar,in front of HQ Hospital, Satara','bhavanachavan26@gmail.com',18,'2025-06-28 06:44:07'),(1100,'Cash on Delivery','ramapur,in front of school, patan','aaravpatil07@gmail.com',5,'2025-03-03 00:00:00'),(1858,'Cash on Delivery','palus,sangali','bhavanachavan26@gmail.com',14,'2025-05-09 20:08:21'),(2499,'Cash on Delivery','Malkapur,near D Mart, Karad','bhavanachavan26@gmail.com',7,'2025-09-05 00:00:00'),(3999,'Cash on Delivery','chikhali pune','nilamghadge0922@gmail.com',8,'2025-02-04 00:00:00'),(4000,'Cash on Delivery','sai nivas colony,satara','mpradnya04@gmail.com',6,'2025-08-13 00:00:00'),(12000,'Cash on Delivery','Ravivar peth Satara','ankitapawar2240@gmail.com',3,'2025-05-11 00:00:00'),(15588,'Cash on Delivery','Narhe,pune','supriya03@gmail.com',16,'2025-05-17 15:47:31'),(27800,'Cash on Delivery','Parel,Mumbai','anujpanaskar01@gmail.com',10,'2025-05-01 00:00:00'),(48300,'Cash on Delivery','Pune narhe near JSPM college','sanjaypatil06@gmail.com',9,'2025-05-13 00:00:00'),(60199,'Cash on Delivery','Wadhe, Sai Nivara, Satara. Pin- 415001','supriya03@gmail.com',17,'2025-05-18 23:26:31'),(65998,'Cash on Delivery','bail bazar,satara','mpradnya04@gmail.com',13,'2025-05-13 00:00:00');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `brand` varchar(80) NOT NULL,
  `color` varchar(45) NOT NULL,
  `dimensions` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `productimg` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Co Director Office Table for Boss & Executive','Lakdi The Furniture Co','Brown','180D x 98.3W x 31.2H Centimeters',40999,'Office Furniture','10.jpg'),(2,'Coffee Table for Home with Storage for Living Room','MODERN FURNITURE SHEESHAM','RK-CCT-31-Honey','55D x 110W x 35H Centimeters',2000,'Living Room','11.jpg'),(3,'Lukzer 7-Section Storage Organizer','Lukzer','Dark Brown','93D x 28W x 70H Centimeters',3750,'Storage & Organization','12.jpg'),(4,'Wooden King Size Bed','SONA ART & CRAFTS','Dark Brown','2.08L x 1.9W x 1.06H Meters',29999,'Bed Room','13.webp'),(5,'Office Best High Back Leatherette Wooden Base Handle Office Chair','Lakdi The Furniture Co','Black','66D x 68.6W x 121.9H Centimeters',2598,'Office Furniture','12.webp'),(6,'Bedroom Wooden Vanities For Home Solid Wood Bedroom Furniture','Ganpati Arts','Natural Finish','45D x 50W x 187H Centimeters',17899,'Bed Room','14.jpg'),(7,'4 Seater Dining Table Set with Chair for Home and Kitchen','PC Wood Furniture','Dark Brown','114.3 x 76.2 x 76.2 Centimeters',16999,'Dining Room','15.jpg'),(8,'Dimarva Modern Sideboard Cabinet ','Dimarva','Walnut Finish','36D x 173W x 86.5H Centimeters',14000,'Living Room','20.jpg'),(9,'Wooden Wall Mount Floating Rack Shelves Wall Cabinet','Extend Crafts','Dark Brown','10D x 81W x 81H Centimeters',689,'Living Room','21.jpg'),(10,'Solid Sheesham Wood 6 Seater Sofa Set For Living Room','AS Furniture Arts ','Chocolate','56D x 179W x 40H Centimeters',27800,'Living Room','22.jpg'),(11,'Solid Sheesham Wood Wooden Centre Table Coffee Table Center Table Teapoy ','JH DECORE ','Walnut Finish','Length (34 Inches) x Width (18 Inches) x Height (17 Inches)',2999,'Living Room','23.jpg'),(12,'TV Stand Shelf | TV Units for Living Room | TV Cabinet for Living Room ','Spyder Craft','Classic Brown ','M5 Leg 180 cm, Assembly - 48 Cm 35 Cm',7199,'Living Room','24.jpg'),(13,'Modern Bedside Table with 3 Shelves,Bed Side Table Wooden Organizer Stand','Yookeer','Brown','25D x 40W x 50H Centimeters',929,'Bed Room','25.jpg'),(14,'Dressing Table With Mirror And Open Shelf','VIKI Engineered Wood','Frosty White','15D x 60W x 80H Centimeters',2499,'Bed Room','27.jpg'),(15,'Vanity Stools - Velvet Round Ottoman Modern Dressing Stool','NEUMARK','Black','33D x 33W x 46H cm',2499,'Bed Room','26.jpg'),(16,'Rectangular Tufted Storage Ottoman Bench Sofa Couch Bonded Leather Footstool','BULKWOOD','Brown','45D x 85W x 42H Centimeters',4799,'Bed Room','28.jpg'),(17,'3 Door with Shelf Wall Mounted Kitchen Cabinet','DIVYSA CORP','Red','27D x 90W x 62H Centimeters',3999,'Dining Room','31.jpg'),(18,'Dining Chair | Padded Seat | Kitchen & Dining Room Furniture ','ROSE','Black','36D x 36W x 96H Centimeters',250,'Dining Room','29.jpg'),(19,'Solid Sheesham Wood Mandai Crockery Cabinet Extra Large','ANGEL FURNITURE ','Walnut FInish','142D x 47W x 175H Centimeters',32999,'Dining Room','33.jpg'),(20,'Wooden Sideboard Cabinet & Chest of Drawers with 4 Drawer and 3 Shelve Storage','FangZin','Brown','40D x 112W x 76H Centimeters',12000,'Storage & Organization','32.jpg'),(21,'Wooden Sideboard Cabinet ','Furnitell','B-Grey','40D x 120W x 78H Centimeters',8000,'Storage & Organization','34.jpg'),(22,'Wood Dining Table Without Chair','SNAP FURNITURE','Brown','86.4D x 114.3W x 76.2H Centimeters',46199,'Dining Room','36.jpg'),(23,' Buffet Sideboard with 3 Doors, Dining Room Furniture','Madesa','Brown','42D x 119W x 76H Centimeters',2000,'Storage & Organization','30.webp'),(24,'Lindsay Engineered Wood 4 Door Wardrobe Drawers and Mirror','Amazon Brand - Solimo ','Wenge','45D x 150W x 183H Centimeters',15499,'Storage & Organization','37.jpg'),(25,'Patio Folding Coffee Table/Tea Table','ETIQUETTE ART ','Light Walnut','38D x 38W x 38H Centimeters',550,'Dining Room','35.jpg'),(26,'Homeand Office Desk Made Pre Laminated Board with Drawers ','Lakdi The Furniture Co ','Brown','48 x 18 x 30 Inch',5300,'Bed Room','39.jpg'),(27,'Baltimore Solid Sheesham Wood Tall Crockery Cabinet | Book Shelf with Glass Door ','ANGEL FURNITURE ','Walnut Finish','35D x 55W x 180H Centimeters',9500,'Storage & Organization','38.jpg'),(28,'Electric Height Adjustable Desk | 100 Kg Weight Capacity','JIN OFFICE','White','76.2D x 121.9W x 121.9H Centimeters',12999,'Office Furniture','42.jpg'),(29,'Wooden Cabinet - 3 Tier Engineered Wood Storage Cabinet','ABOUT SPACE ','Walnut','38.5D x 38W x 100.5H Centimeters',3500,'Office Furniture','41.webp'),(30,'Director Table for Desk Luxury Design','Lakdi The Furniture Co','Grey','78D x 180W x 78H Centimeters',28000,'Office Furniture','40.jpg'),(31,'White Performance Fabric Sofa by goop is Designed to Combine Style and Practicality','Lakdi The Furniture Co','White','0.95D x 2.38W x 0.78H Meters',48300,'Office Furniture','43.jpg'),(32,'Multipurpose Wall Mounted Storage Cabinet with Mirror','Happer','Champagne Gold','13.3D x 35W x 54.5H Centimeters',999,'Bed Room','47.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `emailid` varchar(50) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('Aarav Sachin Patil','Satara','Male','7845962301','aaravpatil07@gmail.com','12345'),('Ankita Vijay Pawar','Sangali','Female','9874512036','ankitapawar2240@gmail.com','12345'),('Anuj Jaywant Panaskar','Mumbai','Male','9645120325','anujpanaskar01@gmail.com','12345'),('Bhavana Yogesh Chavan','Karad','Female','7745123650','bhavanachavan26@gmail.com','12345'),('Pradnya Sanjeev More','Satara','Female','9865472103','mpradnya04@gmail.com','12345'),('Nikhil Rajendra Barkade','Satara','Male','7854123975','nikhilbarkade@gmail.com','12345'),('Nikita Nitin Gaikwad','Satara','Female','9874562310','nikitagaikwad08@gmail.com','12345'),('Nilam Ganesh Ghadge','Pune','Female','8854210369','nilamghadge0922@gmail.com','12345'),('Pallavi Karan Kalbande','Pune','Male','8457231065','pallavik10@gmail.com','12345'),('Priyanka Dinesh Thorat','Satara','Female','9985621436','priyanka0328@gmail.com','12345'),('Sanjay Vijay Patil','Pune','Male','9564851230','sanjaypatil06@gmail.com','12345'),('Somnath Mahesh Phalle','Karad','Male','9987451260','somaphalle01@gmail.com','12345'),('Supriya Vijay Patil','Patan','Female','7854123652','supriya03@gmail.com','12345'),('Vijay Mahadev Patil','Pune','Male','7854236951','vijaypatil29@gmail.com','12345'),('Yash Yogesh Chavan','Karad','Male','8574621450','yashchavan12@gmail.com','12345');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `order_id` int NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `order_date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `status_title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`,`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES (9,'sanjaypatil06@gmail.com','White Performance Fabric Sofa by goop is Designed to Combine Style and Practicality','2025-05-13','Pune','Out for Delivery','Your product will be delivered soon!','2025-05-18 06:08:37'),(15,'ankitapawar2240@gmail.com','Wooden Wall Mount Floating Rack Shelves Wall Bracket Cabinet','2025-05-04','pune','Shipped','Your order has been shipped','2025-05-17 17:17:32'),(17,'supriya03@gmail.com','Wood Dining Table Without Chair   and    Dimarva Modern Sideboard Cabinet for Living Room','2025-03-12','Pune ','Out for Delivery','Your order will be delivered Soon!','2025-03-20 18:18:20');
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-28  6:55:10
