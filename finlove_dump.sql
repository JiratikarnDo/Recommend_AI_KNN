-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: finlove
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `blocked_chats`
--

DROP TABLE IF EXISTS `blocked_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_chats` (
  `blockID` int NOT NULL AUTO_INCREMENT,
  `user1ID` int NOT NULL,
  `user2ID` int DEFAULT NULL,
  `matchID` int NOT NULL,
  `isBlocked` tinyint(1) DEFAULT '1',
  `blockTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`blockID`),
  KEY `user1ID` (`user1ID`),
  KEY `user2ID` (`user2ID`),
  KEY `matchID` (`matchID`),
  CONSTRAINT `blocked_chats_ibfk_1` FOREIGN KEY (`user1ID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `blocked_chats_ibfk_2` FOREIGN KEY (`user2ID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `blocked_chats_ibfk_3` FOREIGN KEY (`matchID`) REFERENCES `matches` (`matchID`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_chats`
--

LOCK TABLES `blocked_chats` WRITE;
/*!40000 ALTER TABLE `blocked_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocked_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `chatID` int NOT NULL AUTO_INCREMENT,
  `matchID` int NOT NULL,
  `senderID` int NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastBackupTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`chatID`),
  KEY `matchID` (`matchID`),
  KEY `senderID` (`senderID`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`matchID`) REFERENCES `matches` (`matchID`),
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`senderID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (118,32,123,'สวัสดีครับ','2024-11-02 10:41:06',NULL),(119,32,123,'ชื่อเหมือนกันเลย','2024-11-02 10:41:11',NULL),(120,32,133,'สวัสดีค่ะ','2024-11-02 10:41:40',NULL),(122,33,129,'สวีสดีจ้าา','2024-11-08 15:29:34',NULL),(123,33,129,'สวัส*','2024-11-08 15:29:41',NULL),(124,35,139,'หวัดดีค่ะ','2024-11-12 04:37:04',NULL),(125,35,137,'หวัดดีฮ๊าฟฟู้ววว','2024-11-12 04:37:20',NULL),(126,35,137,'น้องชื่อไรฮ๊าฟ','2024-11-12 04:37:25',NULL),(127,35,139,'ชื่อ น้ำ คั้บบ','2024-11-12 04:37:36',NULL),(128,36,123,'สวัสดีครับ','2024-11-19 14:43:36',NULL),(129,36,123,'สวัสดีครับแม่','2024-11-19 14:44:25',NULL),(130,36,142,'HELLo','2024-11-19 14:44:45',NULL),(131,32,123,'ฮัลโหล','2024-12-07 14:43:58',NULL);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_chats`
--

DROP TABLE IF EXISTS `deleted_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleted_chats` (
  `deleteID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `matchID` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `deleteTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deleteID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_chats`
--

LOCK TABLES `deleted_chats` WRITE;
/*!40000 ALTER TABLE `deleted_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `educationID` int NOT NULL AUTO_INCREMENT,
  `EducationName` varchar(255) NOT NULL,
  PRIMARY KEY (`educationID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'มัธยมศึกษา'),(2,'ปริญญาตรี'),(3,'ปริญญาโท'),(4,'ปริญญาเอก'),(5,'กำลังทำงาน');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `empID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `phonenumber` char(10) DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `imageFile` varchar(100) DEFAULT NULL,
  `positionID` tinyint DEFAULT NULL,
  `loginAttempt` tinyint DEFAULT '0',
  `lastAttemptTime` datetime DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  PRIMARY KEY (`empID`),
  UNIQUE KEY `username` (`username`),
  KEY `positionID` (`positionID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (2,'ปริญ','วรกมล','0898763723',1,'parin@hotmail.com','admin','$2b$12$wyVTHmMTyd2NZ6cz9heMcezolwQR7LSQcXrRpu1zYHbejRvJrjI5u','img2.png',1,0,NULL,1),(3,'สมชาย','หารณรงค์','0862134496',1,'somchai@gmail.com','ant','$2a$10$9PA9zeFRXx1U1zSnhODMw..X87PmIqN8axlC6JaP0fhxEO8OYN3Ti','img3.jpg',2,0,NULL,1),(4,'กาญจนา','กิ่งแก้ว','0868927364',1,'karnjana@gmail.com','karnjana','$2a$10$9PA9zeFRXx1U1zSnhODMw..X87PmIqN8axlC6JaP0fhxEO8OYN3Ti','img4.jpg',2,0,NULL,1),(5,'ขนิษฐา','กองแก้ว','0893524367',1,'khanitha@hotmail.com','khanitha','$2a$10$9PA9zeFRXx1U1zSnhODMw..X87PmIqN8axlC6JaP0fhxEO8OYN3Ti','1729529584219-wp9463344-loki-and-sylvie-wallpapers.jpg',2,0,NULL,1),(6,'พิเชษ','เจตจำนงค์','0896789076',1,'pichet@hotmail.com','pichet','$2a$10$9PA9zeFRXx1U1zSnhODMw..X87PmIqN8axlC6JaP0fhxEO8OYN3Ti','img6.jpg',2,0,NULL,1),(7,'นิดา','แสนสุข','0897658261',1,'nida@gmail.com','nida','$2a$10$9PA9zeFRXx1U1zSnhODMw..X87PmIqN8axlC6JaP0fhxEO8OYN3Ti','img7.jpg',2,0,NULL,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `GenderID` int NOT NULL AUTO_INCREMENT,
  `Gender_Name` varchar(255) NOT NULL,
  PRIMARY KEY (`GenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Other');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `goalID` int NOT NULL AUTO_INCREMENT,
  `goalName` varchar(255) NOT NULL,
  PRIMARY KEY (`goalID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (1,'หาคู่รักที่จริงใจ'),(2,'หาคู่เดทช่วงสั้นๆ'),(3,'หาเพื่อนใหม่'),(4,'ยังไม่แน่ใจ');
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interestgender`
--

DROP TABLE IF EXISTS `interestgender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interestgender` (
  `interestGenderID` int NOT NULL AUTO_INCREMENT,
  `interestGenderName` varchar(255) NOT NULL,
  PRIMARY KEY (`interestGenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interestgender`
--

LOCK TABLES `interestgender` WRITE;
/*!40000 ALTER TABLE `interestgender` DISABLE KEYS */;
INSERT INTO `interestgender` VALUES (1,'Male'),(2,'Female'),(3,'Other');
/*!40000 ALTER TABLE `interestgender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `matchID` int NOT NULL AUTO_INCREMENT,
  `user1ID` int NOT NULL,
  `user2ID` int NOT NULL,
  `matchDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isBlocked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`matchID`),
  KEY `fk_user1` (`user1ID`),
  KEY `fk_user2` (`user2ID`),
  CONSTRAINT `fk_user1` FOREIGN KEY (`user1ID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `fk_user2` FOREIGN KEY (`user2ID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (32,123,133,'2024-11-02 10:40:53',0),(33,129,132,'2024-11-08 15:29:24',0),(34,123,139,'2024-11-09 05:27:34',0),(35,137,139,'2024-11-12 04:36:51',0),(36,142,123,'2024-11-19 14:43:04',0);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `positionID` tinyint NOT NULL,
  `positionName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`positionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Admin'),(2,'Employee');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `PreferenceID` int NOT NULL AUTO_INCREMENT,
  `PreferenceNames` varchar(255) NOT NULL,
  PRIMARY KEY (`PreferenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,'ฟุตบอล'),(2,'ภาพยนตร์'),(3,'ท่องเที่ยว'),(4,'อนิเมชั่น'),(5,'ช็อปปิ้ง'),(6,'เล่นดนตรี'),(7,'เล่นกีฬา'),(8,'เล่นเกม'),(9,'อ่านหนังสือ'),(10,'ปาร์ตี้'),(11,'สายควัน'),(12,'ออกกำลังกาย'),(13,'ตกปลา'),(14,'รักสัตว์'),(15,'ของหวาน'),(16,'ถ่ายรูป');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `reportID` int NOT NULL,
  `reportType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'ก่อกวน/ปั่นป่วน'),(2,'ไม่ตอบสนอง'),(3,'ข้อมูลเท็จ');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phonenumber` varchar(10) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `home` varchar(255) DEFAULT NULL,
  `DateBirth` date DEFAULT NULL,
  `imageFile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `GenderID` int DEFAULT NULL,
  `educationID` int DEFAULT NULL,
  `goalID` int DEFAULT NULL,
  `interestGenderID` int DEFAULT NULL,
  `loginAttempt` tinyint NOT NULL DEFAULT '0',
  `lastAttemptTime` timestamp NULL DEFAULT NULL,
  `pinCode` varchar(10) DEFAULT NULL,
  `pinCodeExpiration` datetime DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `verify` tinyint DEFAULT '0',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `educationID` (`educationID`),
  KEY `goalID` (`goalID`),
  KEY `interestGenderID` (`interestGenderID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`educationID`) REFERENCES `education` (`educationID`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`goalID`) REFERENCES `goal` (`goalID`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`interestGenderID`) REFERENCES `interestgender` (`interestGenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (120,'Flukey','$2b$10$lgaIMdviz9UPYtR2ro8ajuIqyhqah6aFXPHnmHnrJXeLECMJGjDCe','ทนชัย','บัวรง','ฟลัก','thanachai.bua@rmutto.ac.th','0896586458',199,'บ้าน','2004-10-26','d91dfab9-0ac0-4254-a400-79a5b257662d.jpg',1,2,1,2,0,'2024-10-31 06:28:33',NULL,NULL,1,1),(121,'new','$2b$10$jfjqIDUtTTPqH3vf731ADeYLdwPAXaS0VOfHMYUyzmJCKKfdQG26.','ธวัชชัย','กรีเวก','นิว','tawatchai.kee@rmutto.ac.th','0922732903',175,'ลาดพร้าว63','2004-04-05','image7000707563503606090.jpg',1,2,3,2,2,'2024-11-14 07:20:39',NULL,NULL,1,0),(122,'mark','$2b$10$r9/Zfxa07c/k3tA1KXR6bOqLliE7Q/eEFejmHXJxvyZcaworsMBiK','สิทธินนท์','สิงห์พะเนา','มาร์ค','sittinon.sin@rmutto.ac.th','0999463125',175,'ลาดพร้าว','2003-12-11','052fad33-ff4c-4120-971d-444a07fe0ffa.jpg',1,2,4,2,0,'2024-11-13 23:08:48',NULL,NULL,1,0),(123,'beamdota','$2b$10$p07TiELppYG2Yfi7sLbCh.pjnl4ydaLXtKahszlthA62stcI9gO66','vorrapat','kobsinkha','beam','9beamdota@gmail.com','0855240541',171,'78 bankok','2004-07-08','7846f0ac-ebad-44e3-952e-271f1b9ac9bb.jpg',1,2,1,2,0,'2024-12-17 00:40:27','8377','2024-12-12 10:45:00',1,0),(124,'first','$2b$10$ZeLYhpWNCj6dFTDu5pX/Wu6HnhpTIYNOjjktiE19GGBshpUmZhNXu','Ananchai','Kamtom','first','frist519@gmail.com','0649083637',171,'54/101','2002-01-19','image3578457392566033464.jpg',1,2,3,2,0,NULL,NULL,NULL,1,0),(125,'yammy','$2b$10$PNq2C3TGdFXBQfXiGdO.bOMAT7zBYVl78GwoRzFP4GTRq2CWToXoK','ralinthip','sakunain','yam','yam17.tuesday@gmail.com','0834526953',153,'ราชมงคล','2004-02-03','image3184228084906191281.jpg',2,2,3,2,0,'2024-10-28 08:13:38',NULL,NULL,1,0),(128,'kittipob','$2b$10$YvWnr1e85A58rahL0vZ6CeFaRJLlxacw40B3Wjdxq0B8dKIrVpcJa','kittipob','jirapanichakul','nack','kittipob242@gmail.com','0800262835',187,'rmutto','2003-09-22','17b6689f-4501-48ef-8ca3-c2faba18453c.jpg',1,2,3,2,0,'2024-10-28 10:04:25',NULL,NULL,1,1),(129,'wmmyo123','$2b$10$s9okBbtH1hPbNjzzJvoRVO3OxSFXQScvCu6j1yxPcihohcdZLsBJC','Jiratikarn','Prisricram','Dodo','wmmyo123@gmail.com','0958884525',175,'219 Phathum Tanee','2003-12-07','image6929627347264205590.jpg',1,2,1,2,2,'2024-12-12 08:11:41','2822','2024-12-12 09:11:28',1,1),(131,'ddo','$2b$10$dJUjGv.21oCsUhsdyzJTnefs1vYhWxy6ql6d0hDL4jbU3UniLpu6S','Deam','Boom\n','Deam','wmmm','0957676123',155,'รัชดา 12','2001-11-30','image937150831387493179.jpg',2,5,1,1,0,'2024-11-02 08:58:05',NULL,NULL,1,0),(132,'ddd','$2b$10$KKkwDlSA7PGKPH2MjCF/a.GldwZ4wcBtXpLvhGz8usq1dmEllmi9W','Post','Mintra','Post','mms','0996457251',150,'ดินแดง พิเศษ','1995-11-02','da0ba0b9-792c-4fc0-b795-ebe7eaf0d129.jpg',2,2,1,1,1,'2024-12-12 08:16:11',NULL,NULL,1,0),(133,'b_heeeeem','$2b$10$iK4KpCLYgAveezKs.yqu8e/7G3QWE5YQwjVCSkf3R31Oc1GAGNfwe','Aiya','Samukamdee','beam','warrapas@gmail.com','0652315864',162,'bangkok thailand','2005-11-02','image866446947249169384.jpg',2,2,4,1,0,'2024-12-06 13:43:24',NULL,NULL,1,1),(136,'Pikachu','$2b$10$Z3XvEq5pw0BHPvFb0duFK.zniWi3e94lwQyJMXck5qNZoH9qEo.22','Sumalee','Ungkanaporn','Jahja','vorrapat.kob@rmutto.ac.th','0654231957',156,'Uthaithani Thailand ','2005-10-05','image5449393643356849262.jpg',2,2,1,1,0,'2024-12-04 15:20:22',NULL,NULL,1,1),(137,'pppd79944','$2b$10$kyF3t40Vhn55tLZxYJaArOlEjj0s9bHiB199UBxcxfC9GpwNwRZpy','jiratikarn','Pri','Do','pppd79944@gmail.com','0957676122',175,'219','2003-12-07','d3665816-0260-4c12-ba0b-33174095e719.jpg',1,2,1,2,0,'2024-12-15 17:23:40','7392','2024-11-10 18:19:49',1,1),(139,'beamdotaha','$2b$10$zHyMk34vh.//o47ARaNAzO1yCH34QT1SzY67j0P565ZuKX9ci1LC2','Umaporn','pantitha','nam','kobsinkha@gmail.com','0546132791',151,'-','2001-11-01','image726466149322236145.jpg',2,2,1,1,0,'2024-11-19 15:01:53',NULL,NULL,1,0),(140,'Abc','$2b$10$hh2IV0fggyy9S8sREb6QI.x4kqP5v24Kw1bgbjOII753l1tPPK4uC','a','b','Gun','h','0675464984',666,'ไม่บอก','1946-11-14','image8311829710312484561.jpg',1,2,1,2,0,'2024-11-14 07:22:05',NULL,NULL,1,0),(141,'y1459663','$2b$10$xEE9ob5epRbw7w3WR4tqC.nDiohbqSB5k71mUuVBXVhmawUN.M5j.','ญาณิศา','เธอกิ่ง','ลูกหมี','y1459663@gmail.com','0917546502',163,'วรุณพร','2001-11-15','image4500842852189487671.jpg',2,1,1,1,0,'2024-11-15 10:58:14',NULL,NULL,1,0),(142,'fifanoy1524','$2b$10$AQridv8sqSBwPQeG6e2DpOUYqBH7Aw0ZnhlI4qo23WMPsbdQQWuvC','วงเดือน','กอบสินค้า','bow','fifanoy1524@gmail.com','0886824680',160,'กรุงเทพมหานคร','1991-11-19','d271c01f-b779-4c20-8ab1-ffd2c8ac54e8.jpg',2,4,3,1,0,'2024-11-19 14:49:06',NULL,NULL,1,0),(145,'hdhdndnrh','$2b$10$GIgpamduxefUcofhkoMISuWPONKtg/khD05ivkLkfnmExRA/BjJ9W','fhdjdjj','dhhdjdhdj','djfnjdjd','bdjdndbdg@gmail.com','0943154673',597,'นัแแยอบิบิรืรหาำทห','2005-12-05','image7863372577605653369.jpg',3,3,3,2,0,NULL,NULL,NULL,1,0),(146,'test001','$2b$10$htN1m88VJ3MEG6tsyHGMQehS8My2GX8UdbNkDrNUDdtc6K1fLfUkq','vafbqfh','sgnsgnwgn','Fhrwjfajt','wrhwrhrwh×=&×/@gmail.com','4595494594',459,'สพรสพ่สพีใพีวะา','1996-12-05','image6510275093595976991.jpg',1,5,3,2,0,'2024-12-05 04:47:56',NULL,NULL,1,0),(147,'yo','$2b$10$CvGa.gfTYxI9AyyqR./zoOxK6EuCfquBJYO4QftxtlRu8rwrM6.4K','may','o','you','tunyong0970628198@gmail.com','0655141911',156,'-','2001-12-07','image4448153665137454450.jpg',2,2,3,2,4,'2024-12-07 09:10:30',NULL,NULL,1,0),(148,'secusz','$2b$10$20oIe0GX3mQhQIy6rndMnOszdbKvyV3Spj315j/b8F5To2QZrcLTS','David','De ge a','ผมเดเกอาครับ','beamdotaha@gmail.com','----------',171,'เกษตรศาตร์','2003-12-12','image8460420416408046422.jpg',1,2,3,1,0,'2024-12-12 08:53:07',NULL,NULL,1,0),(149,'basza','$2b$10$CWRzMRJq1N9bhcwxwUF7IuY2rWMUOlM5eGF/bI67XJRYu6NLJtZT.','หลุยส์','ซัวเรส','ซัวซัว','ahahhajaj@gmail.com','0855240541',184,'camnu','1998-12-12','image6926422035656404668.jpg',1,5,1,2,0,'2024-12-12 08:32:33',NULL,NULL,1,0),(150,'testtest1','$2b$10$s7hjiKY6ztc7Z5Y0PhrVIuQocEkwDWnyUD/fSVDoDY6JDfhIKFfmO','Areeya','Sarangul','Yaya','beamgams@gmail.com','..........',161,'-','2003-09-09','image4991435190685603098.jpg',2,2,1,1,0,'2024-12-12 08:36:56',NULL,NULL,1,0),(151,'fifaufa','$2b$10$XsxgkfrelIuJUWgwph07Y.xggAsL8knh1BpsutWyORTPUUm2h0i/i','Unanda','Roysarb','Mink','Gumairurururuur@gmail.com','..........',158,'กรุงเทพมหานคร','2004-01-16','image2323217824118950274.jpg',2,2,1,1,0,'2024-12-12 08:40:38',NULL,NULL,1,0),(152,'Julyy','$2b$10$an83PXKKvW2t5I50/Y.ztegeyd1.l/YZcv1hJe5wz65KNMq3f5pZS','Julyy','tanyabun','June\n','Yumaiwail@gmail.com','..........',159,'บางเขน กรุงเทพมหานคร','2005-09-06','image7634904141158402668.jpg',2,2,1,1,0,'2024-12-12 08:46:44',NULL,NULL,1,0),(153,'Akapol','$2b$10$Tpz9X9/0xzPmI3niv46us.Qww706UIeeNWVfnnPGEejIq1.RvDHxW','Akapol','suksena','Pol\n','Akapolpipi@gmail.com','..........',171,'กรุงเทพมหานคร','2003-09-11','image2323137966430519707.jpg',1,2,1,2,0,'2024-12-12 09:07:02',NULL,NULL,1,0),(154,'basmono','$2b$10$dRKys5.EQzptJBhcTM3LseSMsrmQFhmCbpoYlZwBdZM3IsegeyO5K','tathep','phaijarturat','Bass\n','tattap-f@rmutp.ac.th','..........',191,'กรุงเทพมหานคร พระนคร','2003-06-10','image7891775742629872588.jpg',1,2,1,2,0,'2024-12-12 09:10:33',NULL,NULL,1,0),(155,'denim','$2b$10$1aPqE3VVQDLEutjL2smkMOrUyJ5mG2UC276eLk21XJ6UNpS3ge8VC','Peerakrit','jiamjira','Denim_ss','nimpeerakit113@gmail.com','..........',174,'ป้อมปราบ กทม.','2004-09-07','image2413364495105990696.jpg',1,2,1,2,0,'2024-12-12 10:26:45',NULL,NULL,1,0),(156,'noodleman','$2b$10$SyA3Y1/0vILDO234x61Bw.obPaJwuOkXM1qfGZ7e3MEIrFRhfkcGy','นายเกรียงไกร','ขายมาม่า','มาม่า','xtxngmama@gmail.con','0656134625',178,'บ้าน','2006-11-01','01c8bd9c-ebce-4b6f-8209-4a8db879ec18.jpg',1,2,1,1,0,'2024-12-13 05:18:37',NULL,NULL,1,0),(157,'ppao5217','$2b$10$.Pg7ko2NY.KQKW1bb32oUerrjE/biMzNt79R7.oCXCfWwS4xF72Dq','นิชา','ไม่บอก','เปาคับบ','ppao5217@gmail.com','0888888888',160,'มทร.ตะวันออก','2005-09-17','image7310063654908907166.jpg',2,2,1,1,0,'2024-12-15 10:03:30',NULL,NULL,1,0),(158,'Sirasak','$2b$10$L9.1cBNLalRYzV/oFjAZ6OQ3z.d3zyL.V5f3ceg9lLmK./kZZndNW','sirasak','nakbalee','De_dee','Sirasak.nakbalee@gmail.com','0855555555',171,'มทร.ตะวันออก จักรพงษ์','2004-03-11','image3392520053403314983.jpg',1,2,3,2,0,'2024-12-15 10:21:06',NULL,NULL,1,0),(159,'chasom','$2b$10$ZTccA2/mmZqVBvjhHefCk.8aBKOoDkW.E7AzWIgx7WNgtnZY8CiJ2','sasicha','phromkhot\n\n','som\n\n','Sasicha5894@gmail.com','0845807816',160,'สถานีดับเพลิงสวนมะลิ\n','2003-12-27','image74074717029307489.jpg',2,5,1,1,0,NULL,NULL,NULL,1,0),(160,'savevenjer','$2b$10$NbxsI9NjavdHbNInZrax0OuEfNb7L.4KQmAkfK4Pme5pLDzCNUaSG','Akaradesh','prentanyakorn','Save','savevenjer@gmail.com','0953251580',191,'KMUTNB / IT','2005-06-14','image1901847553226580626.jpg',1,2,4,2,0,'2024-12-15 14:16:24',NULL,NULL,1,0),(161,'frist519','$2b$10$ds8P8d4M45JQenwF3DZCU..a5QiqVqA7n3ewJgccRKXtaNZ8CBgSm','Ananchai','Kamtom','firstxx','first1a2b3c@gmail.com','0649083637',173,'rmutto','2002-01-19','image6645534351892482843.jpg',1,2,3,2,0,'2024-12-15 15:03:31',NULL,NULL,1,0),(162,'bawonsak','$2b$10$qDkfUccqhGhpSAmCM44yK.YjPxAm3/M4HSMloQjmd1SNz23Zu8QzO','Bawonsak','Srimak','โอ๊ค','bawonsak@gmail.com','0953761244',176,'คลอง 6 บ้านเลขที่ 235','2003-03-12','image1791102485293480730.jpg',1,2,3,2,0,'2024-12-15 16:33:51',NULL,NULL,1,0),(163,'sasipuk2334','$2b$10$zO1y0mVprdwDx4tAVlYsROyry8YZboWYvZ.JCl4KF82NvGIVjKsJa','Sasipuk','Saifa','สายฟ้า','sasipuk_23@gmail.com','0957316486',175,'คลอง 4 หมู่บ้านหวังทอง บ้านเลขที่ 789','2003-05-01','image5286610225317247904.jpg',1,2,2,2,0,NULL,NULL,NULL,1,0),(164,'mos2547','$2b$10$CT.ij47ddxuJ46QQ7r99buK5TDIQ72B/JVTKm79XxMJjJL9nlDvB.','Mos','Kittawut','มอส','krinm2667@gmail.com','0972164990',170,'คลอง 1 ลำลูกกา หมู่บ้านรำสีเขียว 190','2004-07-09','image8051942360438966706.jpg',1,2,2,2,0,NULL,NULL,NULL,1,0),(165,'ploytangg','$2b$10$1HZgnIEXiGJLy6e67mcAf..pAN2kvHuMC7lYUI5rXBycmhgpqzJrC','kittiwanin','Tongpinim','Ploy','kittiwanin@gmail.com','0946231259',150,'คลอง 3 ลำลูกกา หมู่บ้านลำสามแก้ว บ้านเลขที่ 255 หมู่ 8 ','2001-07-23','image7622656677867590201.jpg',2,2,3,1,0,'2024-12-15 16:49:09',NULL,NULL,1,0),(166,'mixchotika123','$2b$10$iNR3f2TIEnORLZ.2bnqY3.uZ0BuYXEvBXq2e/MAXwukXLS3UEEUqO','Chotika','Jamjumras','Mix','mixchotika1@gmail.com','0942136457',160,'Plum ตึก A1 ห้อง 244','2003-10-22','image2634377692494068750.jpg',2,2,3,1,0,NULL,NULL,NULL,1,0),(167,'araya2199','$2b$10$UPFp1Oc4XNgW/x8QBteX0erj0z25PO6X9PsDOqnAg1yv8A11CSQ2u','Araya','Sroifa','เบนซ์','araya2655@gmail.com','0942253164',165,'ลุมพินี ตึก A1 ห้อง 521','2003-06-08','image8878859620337572925.jpg',2,2,3,1,0,NULL,NULL,NULL,1,0),(168,'pangone1255','$2b$10$tGGFzbUXXOsFWTcOa95A2Om1OgGzFEaCoF4fG3g57et3UcyNtrcNC','ป้างเหงี่ย','เวียงแกวิจิสัย','มากิ','pangpon1558@gmail.com','0944312578',150,'คลอง 5 ลำลูกกา หมู่บ้านวังน้ำคำ 244','2005-09-20','image3456040538192129794.jpg',2,2,1,1,0,NULL,NULL,NULL,1,0),(169,'pingfishman','$2b$10$dFt2/a.BYiug3Od168m1ou/NZJ0hzdQ6MsoRS8ckARF5efR/cYavO','Sivaras','Chantaprateep','ปิ้งค์','sivaras_289@gmail.com','0946238885',160,'คลอง 1 ลำลูกกา 264 ซ.วรัณตนา','2003-04-15','image7092698613370772797.jpg',2,1,1,1,0,NULL,NULL,NULL,1,0),(170,'ranin647','$2b$10$C5FywnZMJlO.bBYHl9BbK.SggM6PmS9jLVZnJ1xjVB3icXMpeaDGW','สาคร','นามเวช','สาคร','raninpon@gmail.com','0932554613',165,'สาลูกกา คลอง 1 ซ.7 บ้านเลขที่ 675','1996-10-23','image7512994429115116767.jpg',1,1,1,2,0,NULL,NULL,NULL,1,0),(171,'stinp44','$2b$10$9RhNLRKZdIMdJo6rYMsDyeQ5oPaK2Zp57jf2olW1ZuNkV9D2T.vMa','Sthang','Dhitishaya','เพลง','stinp44@gmail.com','0945333207',150,'รัชดา 14 บ้านเลขที่ 400','2004-12-02','image117838418098875083.jpg',2,2,2,1,0,NULL,NULL,NULL,1,0),(172,'pimpim','$2b$10$2PxOkU2RFu8Z/II0OJ2Wq.XRMoAJux/QhHGrQECYtd728fYl5nDvC','พิมพ์ลภัส','วะนา','พิมพ์','pimpimpong@gmail.com','0965223711',157,'รัชดาภิเษก 11 บ้านเลขที่ 312','2003-06-18','image7405491549832184658.jpg',2,2,1,1,0,'2024-12-16 15:58:23',NULL,NULL,1,0),(173,'sakina155','$2b$10$e5YXYSYVG6othHZgJFv4fO/YGjnLhCgJv1BEWNY2Pqj7KZB.mkfp.','ธัญพร','ซอหมัด','ซากี','sakina_155@gmail.com','0956623188',150,'รัชดา 13 บ้านเลขที่ 450','2003-09-18','image5387883308173493041.jpg',2,2,1,1,0,'2024-12-16 16:09:17',NULL,NULL,1,0),(174,'ping134','$2b$10$KqIWQ61tvavbtjYEiYLZKu4saczaMjxV09euupwQrD/2Rsf2nvrUq','พรรณภษา','เวียงแกวิจิตร\n','เพราะพริ้ง','ping_134@gmail.com','0611571791',155,'บ้าน','2003-06-21','image1467515917743199267.jpg',2,5,1,1,0,'2024-12-16 16:16:06',NULL,NULL,1,0),(175,'ball133','$2b$10$8Fkgfu22lPD3buHDhAL.PeVj6d/xNs8xRsyqPfTL6o1LXESq9vif6','ธวัชชัย','ไพเราะ','บอล','ballball123@gmail.com','0931708845',170,'บ้าน','2004-05-09','image5466004338823172650.jpg',1,5,1,2,0,'2024-12-16 16:23:09',NULL,NULL,1,0),(176,'noey1234','$2b$10$HC612cOJ./bAUAhDM1Qvu.ACHk7Ts2A6z/ZJEkdz0u1gwJQyDyrLS','ปภาวี','ศรีมาก','เนย','noeynoey1234@gmail.com','0966431611',156,'รัชดาภิเษก 16 บ้านเลขที่ 234','2004-10-20','image616139212676274473.jpg',2,2,1,1,0,NULL,NULL,NULL,1,0),(177,'oatchaone','$2b$10$V8wFd6XbgIrid6k2MiyhzuQ7gBngAiXyH83ypOdOiAC8Vf1rzX1zW','Oatcha','Chanukah','ฟิวเจอร์','oatcha@gmail.com','0995322316',155,'คลอง 1 ลุมพินีทาวน์ B2 ห้อง 200','2003-11-04','image833717854178169290.jpg',2,2,3,1,0,NULL,NULL,NULL,1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdislike`
--

DROP TABLE IF EXISTS `userdislike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdislike` (
  `dislikeID` int NOT NULL AUTO_INCREMENT,
  `dislikerID` int NOT NULL,
  `dislikedID` int NOT NULL,
  PRIMARY KEY (`dislikeID`),
  KEY `userdislike_ibfk_1` (`dislikerID`),
  KEY `userdislike_ibfk_2` (`dislikedID`),
  CONSTRAINT `userdislike_ibfk_1` FOREIGN KEY (`dislikerID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `userdislike_ibfk_2` FOREIGN KEY (`dislikedID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdislike`
--

LOCK TABLES `userdislike` WRITE;
/*!40000 ALTER TABLE `userdislike` DISABLE KEYS */;
INSERT INTO `userdislike` VALUES (84,125,120),(85,125,121),(86,125,122),(95,125,123),(96,125,124),(106,128,120),(107,128,121),(108,128,122),(109,128,123),(110,128,124),(111,128,125),(117,120,121),(118,120,122),(119,120,123),(120,120,124),(121,120,125),(124,120,128),(129,122,128),(133,129,121),(134,129,122),(136,129,124),(137,129,125),(143,129,120),(144,129,128),(152,122,120),(153,122,121),(154,122,123),(155,122,124),(156,122,125),(157,122,129),(165,131,120),(166,131,121),(167,131,122),(168,131,123),(169,131,124),(170,131,125),(171,131,128),(172,131,129),(194,133,120),(201,136,129),(203,129,136),(205,137,123),(206,137,129),(241,139,129),(252,140,132),(253,140,133),(254,140,136),(255,140,139),(257,141,133),(258,141,136),(259,141,139),(260,141,120),(262,141,140),(263,137,131),(264,137,132),(265,137,133),(267,142,120),(270,139,140),(271,133,129),(272,133,137),(273,133,140),(274,133,121),(275,133,124),(276,133,146),(277,133,122),(279,149,132),(280,149,139),(281,150,140),(286,152,137),(288,152,129),(289,153,131),(290,153,136),(291,154,132),(292,154,150),(293,154,151),(294,154,152),(295,155,139),(296,156,131),(297,156,132),(298,156,139),(299,156,123),(300,156,129),(301,156,137),(302,156,140),(303,156,149),(304,156,153),(305,156,154),(306,156,155),(307,137,151),(308,137,152),(309,123,132),(310,123,152),(311,157,140),(313,158,142),(314,161,147),(315,162,125),(316,165,148),(317,165,158),(318,165,162),(319,137,168),(320,137,169),(321,172,162),(322,172,120),(323,172,153),(324,172,154),(325,173,120),(326,173,153),(327,173,154),(328,173,156),(329,173,140),(330,173,170),(331,174,123),(332,174,129),(333,174,137),(334,174,140),(335,174,155),(336,174,156),(337,174,170),(338,175,132),(339,175,139),(340,175,152),(341,175,169),(342,175,174),(343,123,169),(344,123,174);
/*!40000 ALTER TABLE `userdislike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlike`
--

DROP TABLE IF EXISTS `userlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlike` (
  `likeID` int NOT NULL AUTO_INCREMENT,
  `likerID` int NOT NULL,
  `likedID` int NOT NULL,
  PRIMARY KEY (`likeID`),
  KEY `likerID` (`likerID`),
  KEY `likedID` (`likedID`),
  CONSTRAINT `userlike_ibfk_1` FOREIGN KEY (`likerID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `userlike_ibfk_2` FOREIGN KEY (`likedID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlike`
--

LOCK TABLES `userlike` WRITE;
/*!40000 ALTER TABLE `userlike` DISABLE KEYS */;
INSERT INTO `userlike` VALUES (591,151,137),(592,151,129),(593,152,123),(594,152,123),(595,152,123),(597,152,123),(598,152,149),(599,152,123),(600,155,132),(601,155,152),(602,157,153),(603,161,125);
/*!40000 ALTER TABLE `userlike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `UserID` int NOT NULL,
  `PreferenceID` int NOT NULL,
  PRIMARY KEY (`UserID`,`PreferenceID`),
  KEY `PreferenceID` (`PreferenceID`),
  CONSTRAINT `userpreferences_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `userpreferences_ibfk_2` FOREIGN KEY (`PreferenceID`) REFERENCES `preferences` (`PreferenceID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (124,1),(128,1),(147,1),(149,1),(152,1),(161,1),(122,2),(142,2),(145,2),(146,2),(152,2),(157,2),(158,2),(160,2),(166,2),(167,2),(169,2),(170,2),(171,2),(173,2),(122,3),(136,3),(139,3),(140,3),(141,3),(148,3),(150,3),(153,3),(157,3),(158,3),(159,3),(160,3),(163,3),(165,3),(166,3),(167,3),(168,3),(170,3),(171,3),(173,3),(121,4),(123,4),(124,4),(125,4),(133,4),(140,4),(145,4),(146,4),(155,4),(161,4),(162,4),(164,4),(169,4),(170,4),(174,4),(177,4),(125,5),(136,5),(147,5),(157,5),(159,5),(121,6),(129,6),(131,6),(132,6),(137,6),(151,6),(158,6),(168,6),(123,7),(129,7),(132,7),(137,7),(149,7),(152,7),(154,7),(155,7),(156,7),(160,7),(175,7),(121,8),(122,8),(123,8),(124,8),(129,8),(132,8),(133,8),(137,8),(139,8),(140,8),(145,8),(146,8),(148,8),(155,8),(156,8),(161,8),(162,8),(163,8),(164,8),(169,8),(174,8),(175,8),(177,8),(125,9),(141,9),(147,9),(131,10),(148,10),(153,10),(156,10),(159,10),(163,10),(164,10),(171,10),(150,11),(154,11),(139,12),(149,12),(131,14),(136,14),(150,14),(151,14),(162,14),(165,14),(172,14),(173,14),(174,14),(176,14),(142,15),(151,15),(154,15),(172,15),(176,15),(177,15),(120,16),(133,16),(141,16),(142,16),(153,16),(165,16),(166,16),(167,16),(168,16),(172,16),(176,16);
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userreport`
--

DROP TABLE IF EXISTS `userreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userreport` (
  `userreportID` int NOT NULL AUTO_INCREMENT,
  `reporterID` int NOT NULL,
  `reportedID` int NOT NULL,
  `reportID` int NOT NULL,
  PRIMARY KEY (`userreportID`),
  KEY `reporterID` (`reporterID`),
  KEY `reportedID` (`reportedID`),
  KEY `reportID` (`reportID`),
  CONSTRAINT `userreport_ibfk_1` FOREIGN KEY (`reporterID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `userreport_ibfk_2` FOREIGN KEY (`reportedID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `userreport_ibfk_3` FOREIGN KEY (`reportID`) REFERENCES `report` (`reportID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userreport`
--

LOCK TABLES `userreport` WRITE;
/*!40000 ALTER TABLE `userreport` DISABLE KEYS */;
INSERT INTO `userreport` VALUES (28,128,128,1),(29,120,120,3);
/*!40000 ALTER TABLE `userreport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17  4:13:17
