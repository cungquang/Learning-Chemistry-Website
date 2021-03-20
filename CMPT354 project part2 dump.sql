-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: chemistry
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `balanceequation`
--

DROP TABLE IF EXISTS `balanceequation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `balanceequation` (
  `QuestionID` int NOT NULL,
  PRIMARY KEY (`QuestionID`),
  UNIQUE KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `balanceequation_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `practicequestion` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balanceequation`
--

LOCK TABLES `balanceequation` WRITE;
/*!40000 ALTER TABLE `balanceequation` DISABLE KEYS */;
INSERT INTO `balanceequation` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `balanceequation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choice` (
  `QuestionID` int NOT NULL,
  `ChoiceID` char(3) NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Explanation` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`QuestionID`,`ChoiceID`),
  CONSTRAINT `choice_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `multiplechoice` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (4,'A','HCl',NULL),(4,'B','H2SO4',NULL),(4,'C','H3PO4',NULL),(4,'D','HBr',NULL),(5,'A','Flammabe substance',NULL),(5,'B','Supporter gas of combustion',NULL),(5,'C','Ignition temperature',NULL),(5,'D','Presence of fire','The presence of fire is not necessary as long as ignition temperature is reached');
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compound`
--

DROP TABLE IF EXISTS `compound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compound` (
  `CompoundName` varchar(30) NOT NULL,
  `ChemicalFormula` varchar(10) NOT NULL,
  `AtomicNumber` int DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `MeltingPoint` int DEFAULT NULL,
  `BoilingPoint` int DEFAULT NULL,
  `Appearance` varchar(100) DEFAULT NULL,
  `MolecularWeight` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ChemicalFormula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compound`
--

LOCK TABLES `compound` WRITE;
/*!40000 ALTER TABLE `compound` DISABLE KEYS */;
INSERT INTO `compound` VALUES ('Calcium','Ca',20,'Solid',842,1484,'Null gray, silver; with a pale yellow tint','40.078u'),('Calcium Carbonate','CaCO3',NULL,'Solid',1339,NULL,'Fine white powder; chalky taste','100.09u'),('Calcium Oxide','CaO',NULL,'Solid',2613,2850,'White to pale yellow/brown powder','56.077u'),('Carbon Dioxide','CO2',NULL,NULL,-57,NULL,'Colorless gas','44.009u'),('Hydrogen','H',1,'Gas',-259,-253,'Colorless gas','1.008u'),('Hydrogen Hydroxide','H2O',NULL,'Liquid',0,100,'White crystalline solid, almost colorless liquid with a hint of blue, colorless gas','18.015u'),('Magnesium','Mg',12,'Solid',650,1107,'A silvery-white metal that ignites easily in air and burns with a bright light.','24.305u'),('Oxygen','O',8,NULL,-219,-183,'Colorless gas','15.999u');
/*!40000 ALTER TABLE `compound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discuss` (
  `PostID` int NOT NULL,
  `UserID` char(50) NOT NULL,
  `CreatorName` char(200) NOT NULL,
  PRIMARY KEY (`PostID`,`UserID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE,
  CONSTRAINT `discuss_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `registeruser` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (1,'Frank2012','Lei'),(1,'George123','George'),(2,'Jason054','Jason'),(2,'Peter238','Peter'),(5,'Frank2012','Lei');
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipaddress`
--

DROP TABLE IF EXISTS `ipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipaddress` (
  `IPAddress` char(50) NOT NULL,
  `UserID` char(50) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID` (`UserID`),
  CONSTRAINT `ipaddress_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `registeruser` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipaddress`
--

LOCK TABLES `ipaddress` WRITE;
/*!40000 ALTER TABLE `ipaddress` DISABLE KEYS */;
INSERT INTO `ipaddress` VALUES ('192.168.2.0','Frank2012'),('162.16.215.3','George123'),('132.122.70.8','Jason054'),('238.17.204.32','Mary007'),('182.138.1.5','Peter238');
/*!40000 ALTER TABLE `ipaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learn`
--

DROP TABLE IF EXISTS `learn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learn` (
  `UserID` char(50) NOT NULL,
  `QuestionID` int NOT NULL,
  PRIMARY KEY (`UserID`,`QuestionID`),
  UNIQUE KEY `UserID` (`UserID`,`QuestionID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `learn_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `registeruser` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `learn_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `practicequestion` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learn`
--

LOCK TABLES `learn` WRITE;
/*!40000 ALTER TABLE `learn` DISABLE KEYS */;
INSERT INTO `learn` VALUES ('Jason054',1),('Frank2012',2),('Frank2012',3),('Frank2012',4),('Peter238',5);
/*!40000 ALTER TABLE `learn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplechoice`
--

DROP TABLE IF EXISTS `multiplechoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplechoice` (
  `QuestionID` int NOT NULL,
  PRIMARY KEY (`QuestionID`),
  UNIQUE KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `multiplechoice_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `practicequestion` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplechoice`
--

LOCK TABLES `multiplechoice` WRITE;
/*!40000 ALTER TABLE `multiplechoice` DISABLE KEYS */;
INSERT INTO `multiplechoice` VALUES (4),(5);
/*!40000 ALTER TABLE `multiplechoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `PostID` int NOT NULL,
  `PostTitle` char(200) DEFAULT NULL,
  `PostContent` varchar(600) NOT NULL,
  `PostDate` date NOT NULL,
  `PostTime` time NOT NULL,
  PRIMARY KEY (`PostID`),
  UNIQUE KEY `PostID` (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Chris Post','By Chris Liu','2021-03-19','17:59:19'),(2,'Frank Post','By Frank Dong','2021-03-19','17:59:19'),(3,'John Post','By John Minh','2021-03-19','17:59:19'),(4,'Xixuan Post','By Xixuan','2021-03-19','17:59:19'),(5,'Hong Post','By Hong','2021-03-19','17:59:19');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practicequestion`
--

DROP TABLE IF EXISTS `practicequestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practicequestion` (
  `QuestionID` int NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Solution` varchar(500) NOT NULL,
  `Difficulty` char(50) NOT NULL,
  PRIMARY KEY (`QuestionID`),
  UNIQUE KEY `QuestionID` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practicequestion`
--

LOCK TABLES `practicequestion` WRITE;
/*!40000 ALTER TABLE `practicequestion` DISABLE KEYS */;
INSERT INTO `practicequestion` VALUES (1,'Zn(s) + Hcl(aq) -> ZnCl2(aq) + H2(g)','Zn(s) + 2Hcl(aq) -> ZnCl2(aq) + H2(g)','easy'),(2,'Al(s) + H2SO4(aq) -> Al2(SO4)3(aq) + H2(g)','2Al(s) + 3H2SO4(aq) -> Al2(SO4)3(aq) + 3H2(g)','medium'),(3,'NaOH(aq) + FeCl3(aq) -> NaCl(aq) + Fe(OH)3(s)','3NaOH(aq) + FeCl3(aq) -> 3NaCl(aq) + Fe(OH)3(s)','medium'),(4,'Which one of the following is not a strong acid ?','C','easy'),(5,'Which one of the following is not the necessary condition for combustion reaction ?','D','medium');
/*!40000 ALTER TABLE `practicequestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produces`
--

DROP TABLE IF EXISTS `produces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produces` (
  `ReactantFormula` varchar(30) NOT NULL,
  `ProductFormula` varchar(30) NOT NULL,
  `ChemicalEquation` varchar(100) NOT NULL,
  `ReactionCondition` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ReactantFormula`,`ProductFormula`),
  KEY `ProductFormula` (`ProductFormula`),
  CONSTRAINT `produces_ibfk_1` FOREIGN KEY (`ReactantFormula`) REFERENCES `compound` (`ChemicalFormula`) ON DELETE CASCADE,
  CONSTRAINT `produces_ibfk_2` FOREIGN KEY (`ProductFormula`) REFERENCES `compound` (`ChemicalFormula`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produces`
--

LOCK TABLES `produces` WRITE;
/*!40000 ALTER TABLE `produces` DISABLE KEYS */;
INSERT INTO `produces` VALUES ('Ca','CaCO3','CaO + CO2 -> CaCO3',NULL),('Ca','CaO','2Ca + O2 -> 2CaO',NULL),('CO2','CaCO3','CaO + CO2 -> CaCO3',NULL),('H','H2O','2H2 + O2 -> 2H2O',NULL),('O','CaO','2Ca + O2 -> 2CaO',NULL),('O','H2O','2H2 + O2 -> 2H2O',NULL);
/*!40000 ALTER TABLE `produces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registeruser`
--

DROP TABLE IF EXISTS `registeruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registeruser` (
  `UserID` char(50) NOT NULL,
  `FirstName` char(50) NOT NULL,
  `LastName` char(50) NOT NULL,
  `Email` char(100) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeruser`
--

LOCK TABLES `registeruser` WRITE;
/*!40000 ALTER TABLE `registeruser` DISABLE KEYS */;
INSERT INTO `registeruser` VALUES ('Frank2012','Lei','Dong','frankdong2012@gmail.com'),('George123','George','Smith','gsmite0202@sfu.ca'),('Jason054','Jason','Lee','jlee9806@sfu.ca'),('Mary007','Mary','James','mjames9712@gmail.com'),('Peter238','Peter','Allan','pallan9910@gmail.com');
/*!40000 ALTER TABLE `registeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replycomment`
--

DROP TABLE IF EXISTS `replycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replycomment` (
  `CommentID` int NOT NULL,
  `PostID` int NOT NULL,
  `EditorName` char(200) DEFAULT 'Anonymous',
  `Content` varchar(500) DEFAULT NULL,
  `CommentDate` date NOT NULL,
  `CommentTime` time NOT NULL,
  PRIMARY KEY (`CommentID`,`PostID`),
  KEY `Comment` (`PostID`),
  CONSTRAINT `replycomment_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replycomment`
--

LOCK TABLES `replycomment` WRITE;
/*!40000 ALTER TABLE `replycomment` DISABLE KEYS */;
INSERT INTO `replycomment` VALUES (1,2,'Lei','Hello World','2021-03-19','17:59:20'),(2,2,'George','Hello World','2021-03-19','17:59:20'),(3,3,'Peter','Hello World','2021-03-19','17:59:20'),(4,1,'Mary','Hello World','2021-03-19','17:59:20'),(5,5,'Jason','Hello World','2021-03-19','17:59:20');
/*!40000 ALTER TABLE `replycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search` (
  `CompoundFormula` varchar(30) NOT NULL,
  `UserID` char(50) NOT NULL,
  PRIMARY KEY (`CompoundFormula`,`UserID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `search_ibfk_1` FOREIGN KEY (`CompoundFormula`) REFERENCES `compound` (`ChemicalFormula`) ON DELETE CASCADE,
  CONSTRAINT `search_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `registeruser` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES ('Ca','Frank2012'),('O','George123'),('CaCO3','Mary007'),('H2O','Mary007'),('CaO','Peter238');
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchhistory`
--

DROP TABLE IF EXISTS `searchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchhistory` (
  `CompoundFormula` varchar(30) NOT NULL,
  `UserID` char(50) NOT NULL,
  `KeywordHistory` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CompoundFormula`,`UserID`),
  CONSTRAINT `searchhistory_ibfk_1` FOREIGN KEY (`CompoundFormula`, `UserID`) REFERENCES `search` (`CompoundFormula`, `UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchhistory`
--

LOCK TABLES `searchhistory` WRITE;
/*!40000 ALTER TABLE `searchhistory` DISABLE KEYS */;
INSERT INTO `searchhistory` VALUES ('Ca','Frank2012','Ca CaCO3'),('CaCO3','Mary007','CaCO3 Ca CO2'),('CaO','Peter238','Ca O2'),('H2O','Mary007','H2 O2'),('O','George123','O2 H2O');
/*!40000 ALTER TABLE `searchhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-19 18:03:17
