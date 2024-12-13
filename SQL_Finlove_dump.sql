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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (120,'Flukey','$2b$10$lgaIMdviz9UPYtR2ro8ajuIqyhqah6aFXPHnmHnrJXeLECMJGjDCe','ทนชัย','บัวรง','ฟลัก','thanachai.bua@rmutto.ac.th','0896586458',199,'บ้าน','2004-10-26','d91dfab9-0ac0-4254-a400-79a5b257662d.jpg',1,2,1,2,0,'2024-10-31 06:28:33',NULL,NULL,1,1),(121,'new','$2b$10$jfjqIDUtTTPqH3vf731ADeYLdwPAXaS0VOfHMYUyzmJCKKfdQG26.','ธวัชชัย','กรีเวก','นิว','tawatchai.kee@rmutto.ac.th','0922732903',175,'ลาดพร้าว63','2004-04-05','image7000707563503606090.jpg',1,2,3,2,2,'2024-11-14 07:20:39',NULL,NULL,1,0),(122,'mark','$2b$10$r9/Zfxa07c/k3tA1KXR6bOqLliE7Q/eEFejmHXJxvyZcaworsMBiK','สิทธินนท์','สิงห์พะเนา','มาร์ค','sittinon.sin@rmutto.ac.th','0999463125',175,'ลาดพร้าว','2003-12-11','052fad33-ff4c-4120-971d-444a07fe0ffa.jpg',1,2,4,2,0,'2024-11-13 23:08:48',NULL,NULL,1,0),(123,'beamdota','$2b$10$p07TiELppYG2Yfi7sLbCh.pjnl4ydaLXtKahszlthA62stcI9gO66','vorrapat','kobsinkha','beam','9beamdota@gmail.com','0855240541',171,'78 bankok','2004-07-08','7846f0ac-ebad-44e3-952e-271f1b9ac9bb.jpg',1,2,1,2,0,'2024-12-11 04:41:41',NULL,NULL,1,0),(124,'first','$2b$10$ZeLYhpWNCj6dFTDu5pX/Wu6HnhpTIYNOjjktiE19GGBshpUmZhNXu','Ananchai','Kamtom','first','frist519@gmail.com','0649083637',171,'54/101','2002-01-19','image3578457392566033464.jpg',1,2,3,2,0,NULL,NULL,NULL,1,0),(125,'yammy','$2b$10$PNq2C3TGdFXBQfXiGdO.bOMAT7zBYVl78GwoRzFP4GTRq2CWToXoK','ralinthip','sakunain','yam','yam17.tuesday@gmail.com','0834526953',153,'ราชมงคล','2004-02-03','image3184228084906191281.jpg',2,2,3,2,0,'2024-10-28 08:13:38',NULL,NULL,1,0),(128,'kittipob','$2b$10$YvWnr1e85A58rahL0vZ6CeFaRJLlxacw40B3Wjdxq0B8dKIrVpcJa','kittipob','jirapanichakul','nack','kittipob242@gmail.com','0800262835',187,'rmutto','2003-09-22','17b6689f-4501-48ef-8ca3-c2faba18453c.jpg',1,2,3,2,0,'2024-10-28 10:04:25',NULL,NULL,1,1),(129,'wmmyo123','$2b$10$s9okBbtH1hPbNjzzJvoRVO3OxSFXQScvCu6j1yxPcihohcdZLsBJC','Jiratikarn','Prisricram','Dodo','wmmyo123@gmail.com','0958884525',175,'219 Phathum Tanee','2003-12-07','image6929627347264205590.jpg',1,2,1,2,1,'2024-11-15 08:44:49','2050','2024-11-07 17:50:30',1,1),(131,'ddo','$2b$10$dJUjGv.21oCsUhsdyzJTnefs1vYhWxy6ql6d0hDL4jbU3UniLpu6S','Deam','Boom\n','Deam','wmmm','0957676123',155,'รัชดา 12','2001-11-30','image937150831387493179.jpg',2,5,1,1,0,'2024-11-02 08:58:05',NULL,NULL,1,0),(132,'ddd','$2b$10$KKkwDlSA7PGKPH2MjCF/a.GldwZ4wcBtXpLvhGz8usq1dmEllmi9W','Post','Mintra','Post','mms','0996457251',150,'ดินแดง พิเศษ','1995-11-02','da0ba0b9-792c-4fc0-b795-ebe7eaf0d129.jpg',2,2,1,1,0,'2024-11-13 19:24:14',NULL,NULL,1,0),(133,'b_heeeeem','$2b$10$iK4KpCLYgAveezKs.yqu8e/7G3QWE5YQwjVCSkf3R31Oc1GAGNfwe','Aiya','Samukamdee','beam','warrapas@gmail.com','0652315864',162,'bangkok thailand','2005-11-02','image866446947249169384.jpg',2,2,4,1,0,'2024-12-06 13:43:24',NULL,NULL,1,1),(136,'Pikachu','$2b$10$Z3XvEq5pw0BHPvFb0duFK.zniWi3e94lwQyJMXck5qNZoH9qEo.22','Sumalee','Ungkanaporn','Jahja','vorrapat.kob@rmutto.ac.th','0654231957',156,'Uthaithani Thailand ','2005-10-05','image5449393643356849262.jpg',2,2,1,1,0,'2024-12-04 15:20:22',NULL,NULL,1,1),(137,'pppd79944','$2b$10$kyF3t40Vhn55tLZxYJaArOlEjj0s9bHiB199UBxcxfC9GpwNwRZpy','ji','Pri','Do','pppd79944@gmail.com','0957676122',175,'219','2003-12-07','d3665816-0260-4c12-ba0b-33174095e719.jpg',1,2,1,2,0,'2024-11-19 14:11:39','7392','2024-11-10 18:19:49',1,1),(139,'beamdotaha','$2b$10$zHyMk34vh.//o47ARaNAzO1yCH34QT1SzY67j0P565ZuKX9ci1LC2','Umaporn','pantitha','nam','kobsinkha@gmail.com','0546132791',151,'-','2001-11-01','image726466149322236145.jpg',2,2,1,1,0,'2024-11-19 15:01:53',NULL,NULL,1,0),(140,'Abc','$2b$10$hh2IV0fggyy9S8sREb6QI.x4kqP5v24Kw1bgbjOII753l1tPPK4uC','a','b','Gun','h','0675464984',666,'ไม่บอก','1946-11-14','image8311829710312484561.jpg',1,2,1,2,0,'2024-11-14 07:22:05',NULL,NULL,1,0),(141,'y1459663','$2b$10$xEE9ob5epRbw7w3WR4tqC.nDiohbqSB5k71mUuVBXVhmawUN.M5j.','ญาณิศา','เธอกิ่ง','ลูกหมี','y1459663@gmail.com','0917546502',163,'วรุณพร','2001-11-15','image4500842852189487671.jpg',2,1,1,1,0,'2024-11-15 10:58:14',NULL,NULL,1,0),(142,'fifanoy1524','$2b$10$AQridv8sqSBwPQeG6e2DpOUYqBH7Aw0ZnhlI4qo23WMPsbdQQWuvC','วงเดือน','กอบสินค้า','bow','fifanoy1524@gmail.com','0886824680',160,'กรุงเทพมหานคร','1991-11-19','d271c01f-b779-4c20-8ab1-ffd2c8ac54e8.jpg',2,4,3,1,0,'2024-11-19 14:49:06',NULL,NULL,1,0),(145,'hdhdndnrh','$2b$10$GIgpamduxefUcofhkoMISuWPONKtg/khD05ivkLkfnmExRA/BjJ9W','fhdjdjj','dhhdjdhdj','djfnjdjd','bdjdndbdg@gmail.com','0943154673',597,'นัแแยอบิบิรืรหาำทห','2005-12-05','image7863372577605653369.jpg',3,3,3,2,0,NULL,NULL,NULL,1,0),(146,'test001','$2b$10$htN1m88VJ3MEG6tsyHGMQehS8My2GX8UdbNkDrNUDdtc6K1fLfUkq','vafbqfh','sgnsgnwgn','Fhrwjfajt','wrhwrhrwh×=&×/@gmail.com','4595494594',459,'สพรสพ่สพีใพีวะา','1996-12-05','image6510275093595976991.jpg',1,5,3,2,0,'2024-12-05 04:47:56',NULL,NULL,1,0),(147,'yo','$2b$10$CvGa.gfTYxI9AyyqR./zoOxK6EuCfquBJYO4QftxtlRu8rwrM6.4K','may','o','you','tunyong0970628198@gmail.com','0655141911',156,'-','2001-12-07','image4448153665137454450.jpg',2,2,3,2,4,'2024-12-07 09:10:30',NULL,NULL,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdislike`
--

LOCK TABLES `userdislike` WRITE;
/*!40000 ALTER TABLE `userdislike` DISABLE KEYS */;
INSERT INTO `userdislike` VALUES (84,125,120),(85,125,121),(86,125,122),(95,125,123),(96,125,124),(106,128,120),(107,128,121),(108,128,122),(109,128,123),(110,128,124),(111,128,125),(117,120,121),(118,120,122),(119,120,123),(120,120,124),(121,120,125),(124,120,128),(129,122,128),(133,129,121),(134,129,122),(136,129,124),(137,129,125),(143,129,120),(144,129,128),(152,122,120),(153,122,121),(154,122,123),(155,122,124),(156,122,125),(157,122,129),(165,131,120),(166,131,121),(167,131,122),(168,131,123),(169,131,124),(170,131,125),(171,131,128),(172,131,129),(194,133,120),(201,136,129),(203,129,136),(205,137,123),(206,137,129),(241,139,129),(252,140,132),(253,140,133),(254,140,136),(255,140,139),(257,141,133),(258,141,136),(259,141,139),(260,141,120),(262,141,140),(263,137,131),(264,137,132),(265,137,133),(267,142,120),(270,139,140),(271,133,129),(272,133,137),(273,133,140),(274,133,121),(275,133,124),(276,133,146),(277,133,122);
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
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlike`
--

LOCK TABLES `userlike` WRITE;
/*!40000 ALTER TABLE `userlike` DISABLE KEYS */;
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
INSERT INTO `userpreferences` VALUES (124,1),(128,1),(147,1),(122,2),(142,2),(145,2),(146,2),(122,3),(136,3),(139,3),(140,3),(141,3),(121,4),(123,4),(124,4),(125,4),(133,4),(140,4),(145,4),(146,4),(125,5),(136,5),(147,5),(121,6),(129,6),(131,6),(132,6),(137,6),(123,7),(129,7),(132,7),(137,7),(121,8),(122,8),(123,8),(124,8),(129,8),(132,8),(133,8),(137,8),(139,8),(140,8),(145,8),(146,8),(125,9),(141,9),(147,9),(131,10),(139,12),(131,14),(136,14),(142,15),(120,16),(133,16),(141,16),(142,16);
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

-- Dump completed on 2024-12-11  8:28:06
