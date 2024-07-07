-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: my_factory
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `address`
--
CREATE DATABASE IF NOT EXISTS my_factory;
USE my_factory;


DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CONTACT_PERSON` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `FAX_NUMBER` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LINE_ONE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `LINE_TWO` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `MOBILE_NUMBER` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `PHONE_NUMBER` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `POSITION` int DEFAULT NULL,
  `POSTAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CONTACT_ID` bigint NOT NULL,
  `COUNTRY_ID` bigint NOT NULL,
  `ADDRESS_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ADDRESS_CONTACT` (`CONTACT_ID`),
  KEY `FK_ADDRESS_COUNTRY` (`COUNTRY_ID`),
  KEY `FK_ADDRESS_ADDRESS_TYPE` (`ADDRESS_TYPE_ID`),
  CONSTRAINT `FK_ADDRESS_ADDRESS_TYPE` FOREIGN KEY (`ADDRESS_TYPE_ID`) REFERENCES `address_type` (`ID`),
  CONSTRAINT `FK_ADDRESS_CONTACT` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contact` (`ID`),
  CONSTRAINT `FK_ADDRESS_COUNTRY` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_type`
--

DROP TABLE IF EXISTS `address_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_type` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_ADDRESS_TYPE_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_ADDRESS_TYPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_type`
--

LOCK TABLES `address_type` WRITE;
/*!40000 ALTER TABLE `address_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset` (
  `ASSET_TYPE` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IMAGE_UUID` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `SUPERVISOR` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TREE_POSITION` int DEFAULT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_ASSET_CODE` (`CLIENT_ID`,`CODE`),
  CONSTRAINT `FK_ASSET_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES ('FACTORY',5,_binary '','2024-06-26 07:23:21.362031','2024-06-26 07:23:21.362031',NULL,1,'REAP-2',NULL,NULL,NULL,'RedApplePlus','ENABLED',NULL,NULL,1),('SECTION',6,_binary '','2024-06-26 07:29:18.491884','2024-06-26 07:29:18.491884',NULL,1,'RAP-SEC1',NULL,NULL,NULL,'Final Section','ENABLED',NULL,NULL,1),('PRODUCTION_LINE_GENERIC',7,_binary '','2024-06-26 07:33:43.248640','2024-06-26 07:33:43.248640',NULL,1,'RAP5-SEC6-LIN','','',NULL,'Final line','ENABLED','',NULL,1),('WORKSTATION_GENERIC',8,_binary '','2024-06-26 08:08:46.827197','2024-06-26 08:08:46.827197',NULL,1,'super dry',NULL,'super dry',NULL,'super dry','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',9,_binary '','2024-06-27 06:55:26.039831','2024-06-27 06:55:26.039831',NULL,1,'362500',NULL,NULL,NULL,'CTOLVISUALSANEARMARCAREMBALAR','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',10,_binary '','2024-06-28 06:39:42.686582','2024-06-28 06:39:42.686582',NULL,1,'365800',NULL,NULL,NULL,'CTOLVISUALSANEARMARCAREMBALAR','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',11,_binary '','2024-06-28 06:40:00.573613','2024-06-28 06:40:00.573613',NULL,1,'335100',NULL,NULL,NULL,'ESTAMPACION','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',12,_binary '','2024-06-28 07:11:49.169834','2024-06-28 07:11:49.169834',NULL,1,'313000',NULL,NULL,NULL,'CORTE EN SIERRA','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',13,_binary '','2024-06-28 11:28:24.816601','2024-06-28 11:28:24.816601',NULL,1,'332050',NULL,NULL,NULL,'ESTAMPACION','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',14,_binary '','2024-06-28 11:28:26.649619','2024-06-28 11:28:26.649619',NULL,1,'311500',NULL,NULL,NULL,'CORTE EN CIZALLA','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',15,_binary '','2024-06-28 11:28:28.319621','2024-06-28 11:28:28.319621',NULL,1,'362600',NULL,NULL,NULL,'CTOLVISUALSANEARMARCAREMBALAR','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',16,_binary '','2024-06-28 11:28:28.785626','2024-06-28 11:28:28.785626',NULL,1,'332150',NULL,NULL,NULL,'ESTAMPACION','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',17,_binary '','2024-06-28 11:28:29.226640','2024-06-28 11:28:29.226640',NULL,1,'312500',NULL,NULL,NULL,'CORTE EN SIERRA','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',18,_binary '','2024-06-28 11:29:55.622440','2024-06-28 11:29:55.622440',NULL,1,'362300',NULL,NULL,NULL,'CTOLVISUALSANEARMARCAREMBALAR','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',19,_binary '','2024-06-28 11:29:56.059447','2024-06-28 11:29:56.059447',NULL,1,'332075',NULL,NULL,NULL,'ESTAMPACION','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',20,_binary '','2024-06-28 11:29:58.815454','2024-06-28 11:29:58.815454',NULL,1,'313500',NULL,NULL,NULL,'CORTE EN SIERRA','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',21,_binary '','2024-06-28 11:30:00.074469','2024-06-28 11:30:00.074469',NULL,1,'314000',NULL,NULL,NULL,'CORTE EN SIERRA','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',22,_binary '','2024-06-28 11:30:05.208493','2024-06-28 11:30:05.208493',NULL,1,'366500',NULL,NULL,NULL,'CONTROL VISUAL Y FPI','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',23,_binary '','2024-06-28 11:30:05.664500','2024-06-28 11:30:05.664500',NULL,1,'345000',NULL,NULL,NULL,'TT ENVEJECIMIENTO','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',24,_binary '','2024-06-28 11:30:06.478497','2024-06-28 11:30:06.478497',NULL,1,'312600',NULL,NULL,NULL,'CORTE EN SIERRA','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',25,_binary '','2024-06-28 11:30:16.484560','2024-06-28 11:30:16.484560',NULL,1,'315000',NULL,NULL,NULL,'CORTE SEPARACIÓN','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',26,_binary '','2024-06-28 11:30:16.935571','2024-06-28 11:30:16.935571',NULL,1,'364000',NULL,NULL,NULL,'REPASO','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',27,_binary '','2024-06-28 11:30:37.479683','2024-06-28 11:30:37.479683',NULL,1,'362400',NULL,NULL,NULL,'CTOLVISUALSANEARMARCAREMBALAR','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',28,_binary '','2024-06-28 11:30:37.898679','2024-06-28 11:30:37.898679',NULL,1,'332100',NULL,NULL,NULL,'ESTAMPACION','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',29,_binary '','2024-07-02 06:05:04.284118','2024-07-02 06:05:04.284118',NULL,1,'352000',NULL,NULL,NULL,'GRANALLADO FULGOR','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',30,_binary '','2024-07-02 06:05:14.271857','2024-07-02 06:05:14.271857',NULL,1,'333000',NULL,NULL,NULL,'ESTAMPACION','ENABLED',NULL,NULL,1),('WORKSTATION_GENERIC',31,_binary '','2024-07-02 06:05:14.681853','2024-07-02 06:05:14.681853',NULL,1,'311000',NULL,NULL,NULL,'CORTE EN SIERRA','ENABLED',NULL,NULL,1);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_activity_time`
--

DROP TABLE IF EXISTS `asset_activity_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_activity_time` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `BEGIN_AT` datetime(6) NOT NULL,
  `DURATION` bigint NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ASSET_ACTIVITY_TIME_ASSET` (`ASSET_ID`),
  CONSTRAINT `FK_ASSET_ACTIVITY_TIME_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_activity_time`
--

LOCK TABLES `asset_activity_time` WRITE;
/*!40000 ALTER TABLE `asset_activity_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_activity_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_calendar`
--

DROP TABLE IF EXISTS `asset_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_calendar` (
  `ASSET_ID` bigint NOT NULL,
  `CALENDAR_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ASSET_ID`,`CALENDAR_ID`),
  KEY `FK_ASSET_CALENDAR_CALENDAR` (`CALENDAR_ID`),
  CONSTRAINT `FK_ASSET_CALENDAR_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_ASSET_CALENDAR_CALENDAR` FOREIGN KEY (`CALENDAR_ID`) REFERENCES `calendar` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_calendar`
--

LOCK TABLES `asset_calendar` WRITE;
/*!40000 ALTER TABLE `asset_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_consumable`
--

DROP TABLE IF EXISTS `asset_consumable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_consumable` (
  `ASSET_ID` bigint NOT NULL,
  `CONSUMABLE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ASSET_ID`,`CONSUMABLE_ID`),
  KEY `FK_ASSET_CONSUMABLE_CONSUMABLE` (`CONSUMABLE_ID`),
  CONSTRAINT `FK_ASSET_CONSUMABLE_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_ASSET_CONSUMABLE_CONSUMABLE` FOREIGN KEY (`CONSUMABLE_ID`) REFERENCES `material_consumable` (`MATERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_consumable`
--

LOCK TABLES `asset_consumable` WRITE;
/*!40000 ALTER TABLE `asset_consumable` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_consumable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_factory`
--

DROP TABLE IF EXISTS `asset_factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_factory` (
  `AREA` int DEFAULT NULL,
  `ASSET_ID` bigint NOT NULL,
  PRIMARY KEY (`ASSET_ID`),
  CONSTRAINT `FK_FACTORY_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_factory`
--

LOCK TABLES `asset_factory` WRITE;
/*!40000 ALTER TABLE `asset_factory` DISABLE KEYS */;
INSERT INTO `asset_factory` VALUES (NULL,5);
/*!40000 ALTER TABLE `asset_factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_family`
--

DROP TABLE IF EXISTS `asset_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_family` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IMAGE_UUID` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_ASSET_FAMILY_NAME` (`CLIENT_ID`,`NAME`),
  KEY `FK_ASSET_FAMILY_PARENT` (`PARENT_ID`),
  CONSTRAINT `FK_ASSET_FAMILY_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_ASSET_FAMILY_PARENT` FOREIGN KEY (`PARENT_ID`) REFERENCES `asset_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_family`
--

LOCK TABLES `asset_family` WRITE;
/*!40000 ALTER TABLE `asset_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_family_consumable`
--

DROP TABLE IF EXISTS `asset_family_consumable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_family_consumable` (
  `ASSET_FAMILY_ID` bigint NOT NULL,
  `CONSUMABLE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ASSET_FAMILY_ID`,`CONSUMABLE_ID`),
  KEY `FK_ASSET_FAMILY_CONSUMABLE_CONSUMABLE` (`CONSUMABLE_ID`),
  CONSTRAINT `FK_ASSET_FAMILY_CONSUMABLE_ASSET_FAMILY` FOREIGN KEY (`ASSET_FAMILY_ID`) REFERENCES `asset_family` (`ID`),
  CONSTRAINT `FK_ASSET_FAMILY_CONSUMABLE_CONSUMABLE` FOREIGN KEY (`CONSUMABLE_ID`) REFERENCES `material_consumable` (`MATERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_family_consumable`
--

LOCK TABLES `asset_family_consumable` WRITE;
/*!40000 ALTER TABLE `asset_family_consumable` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_family_consumable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_family_custom_field`
--

DROP TABLE IF EXISTS `asset_family_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_family_custom_field` (
  `ASSET_FAMILY_ID` bigint NOT NULL,
  `CUSTOM_FIELD_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `MANDATORY` bit(1) NOT NULL,
  `POSITION` int NOT NULL,
  PRIMARY KEY (`ASSET_FAMILY_ID`,`CUSTOM_FIELD_ID`),
  KEY `FK_AFCF_CUSTOM_FIELD` (`CUSTOM_FIELD_ID`),
  CONSTRAINT `FK_AFCF_ASSET_FAMILY` FOREIGN KEY (`ASSET_FAMILY_ID`) REFERENCES `asset_family` (`ID`),
  CONSTRAINT `FK_AFCF_CUSTOM_FIELD` FOREIGN KEY (`CUSTOM_FIELD_ID`) REFERENCES `custom_field` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_family_custom_field`
--

LOCK TABLES `asset_family_custom_field` WRITE;
/*!40000 ALTER TABLE `asset_family_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_family_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_family_stop_type`
--

DROP TABLE IF EXISTS `asset_family_stop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_family_stop_type` (
  `ASSET_FAMILY_ID` bigint NOT NULL,
  `STOP_TYPE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ASSET_FAMILY_ID`,`STOP_TYPE_ID`),
  KEY `FK_ASSET_FAMILY_STOP_TYPE_STOP_TYPE` (`STOP_TYPE_ID`),
  CONSTRAINT `FK_ASSET_FAMILY_STOP_TYPE_ASSET_FAMILY` FOREIGN KEY (`ASSET_FAMILY_ID`) REFERENCES `asset_family` (`ID`),
  CONSTRAINT `FK_ASSET_FAMILY_STOP_TYPE_STOP_TYPE` FOREIGN KEY (`STOP_TYPE_ID`) REFERENCES `stop_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_family_stop_type`
--

LOCK TABLES `asset_family_stop_type` WRITE;
/*!40000 ALTER TABLE `asset_family_stop_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_family_stop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_field_value`
--

DROP TABLE IF EXISTS `asset_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_field_value` (
  `ASSET_ID` bigint NOT NULL,
  `CUSTOM_FIELD_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`ASSET_ID`,`CUSTOM_FIELD_ID`),
  KEY `FK_AFV_CUSTOM_FIELD` (`CUSTOM_FIELD_ID`),
  CONSTRAINT `FK_AFV_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_AFV_CUSTOM_FIELD` FOREIGN KEY (`CUSTOM_FIELD_ID`) REFERENCES `custom_field` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_field_value`
--

LOCK TABLES `asset_field_value` WRITE;
/*!40000 ALTER TABLE `asset_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_location`
--

DROP TABLE IF EXISTS `asset_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_location` (
  `ASSET_ID` bigint NOT NULL,
  `LOCATION_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ASSET_ID`,`LOCATION_ID`),
  KEY `FK_ASSET_LOCATION_LOCATION` (`LOCATION_ID`),
  CONSTRAINT `FK_ASSET_LOCATION_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_ASSET_LOCATION_LOCATION` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_location`
--

LOCK TABLES `asset_location` WRITE;
/*!40000 ALTER TABLE `asset_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_membership`
--

DROP TABLE IF EXISTS `asset_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_membership` (
  `ASSET_FAMILY_ID` bigint NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ASSET_FAMILY_ID`,`ASSET_ID`),
  KEY `FK_ASSET_MEMBERSHIP_ASSET` (`ASSET_ID`),
  CONSTRAINT `FK_ASSET_MEMBERSHIP_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_ASSET_MEMBERSHIP_ASSET_FAMILY` FOREIGN KEY (`ASSET_FAMILY_ID`) REFERENCES `asset_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_membership`
--

LOCK TABLES `asset_membership` WRITE;
/*!40000 ALTER TABLE `asset_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_production_line`
--

DROP TABLE IF EXISTS `asset_production_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_production_line` (
  `ASSET_ID` bigint NOT NULL,
  `SECTION_ID` bigint NOT NULL,
  PRIMARY KEY (`ASSET_ID`),
  KEY `FK_PRODUCTION_LINE_SECTION` (`SECTION_ID`),
  CONSTRAINT `FK_PRODUCTION_LINE_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_PRODUCTION_LINE_SECTION` FOREIGN KEY (`SECTION_ID`) REFERENCES `asset_section` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_production_line`
--

LOCK TABLES `asset_production_line` WRITE;
/*!40000 ALTER TABLE `asset_production_line` DISABLE KEYS */;
INSERT INTO `asset_production_line` VALUES (7,6);
/*!40000 ALTER TABLE `asset_production_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_production_line_command_center`
--

DROP TABLE IF EXISTS `asset_production_line_command_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_production_line_command_center` (
  `CONTRACTED_WATTS` decimal(15,6) DEFAULT NULL,
  `COUNTER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CUPS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `OBSERVATIONS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `RATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TELEMETRY_CONNECTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TELEMETRY_PROTOCOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `VOLTAGE` decimal(15,6) DEFAULT NULL,
  `PRODUCTION_LINE_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCTION_LINE_ID`),
  CONSTRAINT `FK_COMMAND_CENTER_PRODUCTION_LINE` FOREIGN KEY (`PRODUCTION_LINE_ID`) REFERENCES `asset_production_line` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_production_line_command_center`
--

LOCK TABLES `asset_production_line_command_center` WRITE;
/*!40000 ALTER TABLE `asset_production_line_command_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_production_line_command_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_production_line_generic`
--

DROP TABLE IF EXISTS `asset_production_line_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_production_line_generic` (
  `PRODUCTION_LINE_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCTION_LINE_ID`),
  CONSTRAINT `FK_GENERIC_PRODUCTION_LINE` FOREIGN KEY (`PRODUCTION_LINE_ID`) REFERENCES `asset_production_line` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_production_line_generic`
--

LOCK TABLES `asset_production_line_generic` WRITE;
/*!40000 ALTER TABLE `asset_production_line_generic` DISABLE KEYS */;
INSERT INTO `asset_production_line_generic` VALUES (7);
/*!40000 ALTER TABLE `asset_production_line_generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_property`
--

DROP TABLE IF EXISTS `asset_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_property` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `MEASURE_UNIT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AP_CLIENT` (`CLIENT_ID`),
  KEY `FK_AP_MEASURE_UNIT` (`MEASURE_UNIT_ID`),
  CONSTRAINT `FK_AP_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_AP_MEASURE_UNIT` FOREIGN KEY (`MEASURE_UNIT_ID`) REFERENCES `measure_unit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_property`
--

LOCK TABLES `asset_property` WRITE;
/*!40000 ALTER TABLE `asset_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_property_cost`
--

DROP TABLE IF EXISTS `asset_property_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_property_cost` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DATA_INSTANT` datetime(6) NOT NULL,
  `VALUE` double NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  `ASSET_PROPERTY_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_APC_DATE` (`ASSET_ID`,`ASSET_PROPERTY_ID`,`DATA_INSTANT`),
  KEY `FK_APC_ASSET_PROPERTY` (`ASSET_PROPERTY_ID`),
  CONSTRAINT `FK_APC_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_APC_ASSET_PROPERTY` FOREIGN KEY (`ASSET_PROPERTY_ID`) REFERENCES `asset_property` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_property_cost`
--

LOCK TABLES `asset_property_cost` WRITE;
/*!40000 ALTER TABLE `asset_property_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_property_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_property_data`
--

DROP TABLE IF EXISTS `asset_property_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_property_data` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DATA_INSTANT` datetime(6) NOT NULL,
  `TOTAL_VALUE` double NOT NULL,
  `VALUE` double NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  `ASSET_PROPERTY_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_APD_DATE` (`ASSET_ID`,`ASSET_PROPERTY_ID`,`DATA_INSTANT`),
  KEY `FK_APD_ASSET_PROPERTY` (`ASSET_PROPERTY_ID`),
  CONSTRAINT `FK_APD_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_APD_ASSET_PROPERTY` FOREIGN KEY (`ASSET_PROPERTY_ID`) REFERENCES `asset_property` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_property_data`
--

LOCK TABLES `asset_property_data` WRITE;
/*!40000 ALTER TABLE `asset_property_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_property_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_section`
--

DROP TABLE IF EXISTS `asset_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_section` (
  `ASSET_ID` bigint NOT NULL,
  `FACTORY_ID` bigint NOT NULL,
  PRIMARY KEY (`ASSET_ID`),
  KEY `FK_SECTION_FACTORY` (`FACTORY_ID`),
  CONSTRAINT `FK_SECTION_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_SECTION_FACTORY` FOREIGN KEY (`FACTORY_ID`) REFERENCES `asset_factory` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_section`
--

LOCK TABLES `asset_section` WRITE;
/*!40000 ALTER TABLE `asset_section` DISABLE KEYS */;
INSERT INTO `asset_section` VALUES (6,5);
/*!40000 ALTER TABLE `asset_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_status_history`
--

DROP TABLE IF EXISTS `asset_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_status_history` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `BEGIN_AT` datetime(6) NOT NULL,
  `NOTIFIED_AT` datetime(6) DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ASSET_STATUS_HISTORY_ASSET` (`ASSET_ID`),
  CONSTRAINT `FK_ASSET_STATUS_HISTORY_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_status_history`
--

LOCK TABLES `asset_status_history` WRITE;
/*!40000 ALTER TABLE `asset_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_status_notification`
--

DROP TABLE IF EXISTS `asset_status_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_status_notification` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DURATION` int DEFAULT NULL,
  `OPTIONAL_RECIPIENTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_ASSET_STATUS` (`ASSET_ID`,`STATUS`),
  CONSTRAINT `FK_ASSET_STATUS_NOTIFICATION_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_status_notification`
--

LOCK TABLES `asset_status_notification` WRITE;
/*!40000 ALTER TABLE `asset_status_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_status_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_stop`
--

DROP TABLE IF EXISTS `asset_stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_stop` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `COMMENTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `FROM_DATE_TIME` datetime(6) NOT NULL,
  `UNTIL_DATE_TIME` datetime(6) DEFAULT NULL,
  `ASSET_ID` bigint NOT NULL,
  `STOP_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ASSET_STOP_ASSET` (`ASSET_ID`),
  KEY `FK_ASSET_STOP_STOP_TYPE` (`STOP_TYPE_ID`),
  CONSTRAINT `FK_ASSET_STOP_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_ASSET_STOP_STOP_TYPE` FOREIGN KEY (`STOP_TYPE_ID`) REFERENCES `stop_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_stop`
--

LOCK TABLES `asset_stop` WRITE;
/*!40000 ALTER TABLE `asset_stop` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_tool`
--

DROP TABLE IF EXISTS `asset_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_tool` (
  `BRAND` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CALIBRATED_AT` datetime(6) DEFAULT NULL,
  `COMMENTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEFAULT_COST` decimal(26,3) DEFAULT NULL,
  `DISABLED_AT` datetime(6) DEFAULT NULL,
  `ENERGY_CONSUMPTION` int DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `HOMOLOGATED_AT` datetime(6) DEFAULT NULL,
  `IS_VIRTUAL` bit(1) NOT NULL,
  `LENGTH` int DEFAULT NULL,
  `MAINTENANCE_AT` datetime(6) DEFAULT NULL,
  `MANUFACTURER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `MODEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `POWER` int DEFAULT NULL,
  `RECEIVED_AT` datetime(6) DEFAULT NULL,
  `REPAIRED_AT` datetime(6) DEFAULT NULL,
  `SERIAL_NUMBER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `ASSET_ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ASSET_ID`),
  KEY `FK_TOOL_PARENT` (`PARENT_ID`),
  CONSTRAINT `FK_TOOL_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_TOOL_PARENT` FOREIGN KEY (`PARENT_ID`) REFERENCES `asset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_tool`
--

LOCK TABLES `asset_tool` WRITE;
/*!40000 ALTER TABLE `asset_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_tool_generic`
--

DROP TABLE IF EXISTS `asset_tool_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_tool_generic` (
  `TOOL_ID` bigint NOT NULL,
  PRIMARY KEY (`TOOL_ID`),
  CONSTRAINT `FK_GENERIC_TOOL` FOREIGN KEY (`TOOL_ID`) REFERENCES `asset_tool` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_tool_generic`
--

LOCK TABLES `asset_tool_generic` WRITE;
/*!40000 ALTER TABLE `asset_tool_generic` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_tool_generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_tool_mold`
--

DROP TABLE IF EXISTS `asset_tool_mold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_tool_mold` (
  `MAX_REFERENCE` int NOT NULL,
  `MAX_UNITS` int NOT NULL,
  `MOLD_ID` bigint NOT NULL,
  PRIMARY KEY (`MOLD_ID`),
  CONSTRAINT `FK_MOLD_TOOL` FOREIGN KEY (`MOLD_ID`) REFERENCES `asset_tool` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_tool_mold`
--

LOCK TABLES `asset_tool_mold` WRITE;
/*!40000 ALTER TABLE `asset_tool_mold` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_tool_mold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_user_group`
--

DROP TABLE IF EXISTS `asset_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_user_group` (
  `ASSET_ID` bigint NOT NULL,
  `USER_GROUP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ASSET_ID`,`USER_GROUP_ID`),
  CONSTRAINT `FK_ASSET_USER_GROUP_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_user_group`
--

LOCK TABLES `asset_user_group` WRITE;
/*!40000 ALTER TABLE `asset_user_group` DISABLE KEYS */;
INSERT INTO `asset_user_group` VALUES (5,92,_binary '','2024-06-26 07:23:21.451033','2024-06-26 07:23:21.451033',NULL,1),(5,93,_binary '','2024-06-26 07:23:21.459035','2024-06-26 07:23:21.459035',NULL,1),(5,94,_binary '','2024-06-26 07:23:21.459035','2024-06-26 07:23:21.459035',NULL,1);
/*!40000 ALTER TABLE `asset_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `asset_user_group_view`
--

DROP TABLE IF EXISTS `asset_user_group_view`;
/*!50001 DROP VIEW IF EXISTS `asset_user_group_view`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `asset_user_group_view` AS SELECT
 1 AS `ASSET_ID`,
 1 AS `ASSET_CODE`,
 1 AS `ASSET_PARENT_ID`,
 1 AS `USER_GROUP_IDS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `asset_workstation`
--

DROP TABLE IF EXISTS `asset_workstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_workstation` (
  `ASSIGNABLE` bit(1) NOT NULL,
  `CONCURRENT_ORDERS` bigint NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `PRODUCTION_LINE_ID` bigint NOT NULL,
  PRIMARY KEY (`ASSET_ID`),
  KEY `FK_WORKSTATION_PARENT` (`PARENT_ID`),
  KEY `FK_WORKSTATION_PRODUCTION_LINE` (`PRODUCTION_LINE_ID`),
  CONSTRAINT `FK_WORKSTATION_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`),
  CONSTRAINT `FK_WORKSTATION_PARENT` FOREIGN KEY (`PARENT_ID`) REFERENCES `asset_workstation` (`ASSET_ID`),
  CONSTRAINT `FK_WORKSTATION_PRODUCTION_LINE` FOREIGN KEY (`PRODUCTION_LINE_ID`) REFERENCES `asset_production_line` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_workstation`
--

LOCK TABLES `asset_workstation` WRITE;
/*!40000 ALTER TABLE `asset_workstation` DISABLE KEYS */;
INSERT INTO `asset_workstation` VALUES (_binary '',1,8,NULL,7),(_binary '',1,9,NULL,7),(_binary '',1,10,NULL,7),(_binary '',1,11,NULL,7),(_binary '',1,12,NULL,7),(_binary '',1,13,NULL,7),(_binary '',1,14,NULL,7),(_binary '',1,15,NULL,7),(_binary '',1,16,NULL,7),(_binary '',1,17,NULL,7),(_binary '',1,18,NULL,7),(_binary '',1,19,NULL,7),(_binary '',1,20,NULL,7),(_binary '',1,21,NULL,7),(_binary '',1,22,NULL,7),(_binary '',1,23,NULL,7),(_binary '',1,24,NULL,7),(_binary '',1,25,NULL,7),(_binary '',1,26,NULL,7),(_binary '',1,27,NULL,7),(_binary '',1,28,NULL,7),(_binary '',1,29,NULL,7),(_binary '',1,30,NULL,7),(_binary '',1,31,NULL,7);
/*!40000 ALTER TABLE `asset_workstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_workstation_generic`
--

DROP TABLE IF EXISTS `asset_workstation_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_workstation_generic` (
  `WORKSTATION_ID` bigint NOT NULL,
  PRIMARY KEY (`WORKSTATION_ID`),
  CONSTRAINT `FK_GENERIC_WORKSTATION` FOREIGN KEY (`WORKSTATION_ID`) REFERENCES `asset_workstation` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_workstation_generic`
--

LOCK TABLES `asset_workstation_generic` WRITE;
/*!40000 ALTER TABLE `asset_workstation_generic` DISABLE KEYS */;
INSERT INTO `asset_workstation_generic` VALUES (8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31);
/*!40000 ALTER TABLE `asset_workstation_generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_workstation_machine`
--

DROP TABLE IF EXISTS `asset_workstation_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_workstation_machine` (
  `BRAND` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CALIBRATED_AT` datetime(6) DEFAULT NULL,
  `COMMENTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEFAULT_COST` decimal(26,3) DEFAULT NULL,
  `DISABLED_AT` datetime(6) DEFAULT NULL,
  `ENERGY_CONSUPTION` int DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `HOMOLOGATED_AT` datetime(6) DEFAULT NULL,
  `LENGTH` int DEFAULT NULL,
  `MAINTENANCE_AT` datetime(6) DEFAULT NULL,
  `MANUFACTURER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `MODEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `POWER` int DEFAULT NULL,
  `RECEIVED_AT` datetime(6) DEFAULT NULL,
  `REPAIRED_AT` datetime(6) DEFAULT NULL,
  `SERIAL_NUMBER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `WEIGHT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `WORKSTATION_ID` bigint NOT NULL,
  PRIMARY KEY (`WORKSTATION_ID`),
  CONSTRAINT `FK_MACHINE_WORKSTATION` FOREIGN KEY (`WORKSTATION_ID`) REFERENCES `asset_workstation` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_workstation_machine`
--

LOCK TABLES `asset_workstation_machine` WRITE;
/*!40000 ALTER TABLE `asset_workstation_machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_workstation_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_workstation_machine_generic`
--

DROP TABLE IF EXISTS `asset_workstation_machine_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_workstation_machine_generic` (
  `MACHINE_ID` bigint NOT NULL,
  PRIMARY KEY (`MACHINE_ID`),
  CONSTRAINT `FK_GENERIC_MACHINE` FOREIGN KEY (`MACHINE_ID`) REFERENCES `asset_workstation_machine` (`WORKSTATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_workstation_machine_generic`
--

LOCK TABLES `asset_workstation_machine_generic` WRITE;
/*!40000 ALTER TABLE `asset_workstation_machine_generic` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_workstation_machine_generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_workstation_machine_luminarie`
--

DROP TABLE IF EXISTS `asset_workstation_machine_luminarie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_workstation_machine_luminarie` (
  `AMPERAGE` decimal(15,6) DEFAULT NULL,
  `DEVICE` int DEFAULT NULL,
  `LUMINARIE_GROUP` int DEFAULT NULL,
  `LUMINARIE_CLASS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `MAC` bigint DEFAULT NULL,
  `PATTERN` int DEFAULT NULL,
  `WATTS` decimal(15,6) DEFAULT NULL,
  `MACHINE_ID` bigint NOT NULL,
  PRIMARY KEY (`MACHINE_ID`),
  CONSTRAINT `FK_LUMINARIE_MACHINE` FOREIGN KEY (`MACHINE_ID`) REFERENCES `asset_workstation_machine` (`WORKSTATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_workstation_machine_luminarie`
--

LOCK TABLES `asset_workstation_machine_luminarie` WRITE;
/*!40000 ALTER TABLE `asset_workstation_machine_luminarie` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_workstation_machine_luminarie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_sequence`
--

DROP TABLE IF EXISTS `batch_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_sequence` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `SEQUENCE_VALUE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_BATCH_SEQUENCE_NAME` (`CLIENT_ID`,`NAME`),
  UNIQUE KEY `UIDX_BATCH_SEQUENCE_VALUE` (`CLIENT_ID`,`SEQUENCE_VALUE`),
  CONSTRAINT `FK_BATCH_SEQUENCE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_sequence`
--

LOCK TABLES `batch_sequence` WRITE;
/*!40000 ALTER TABLE `batch_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `COLOR` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_EXCLUDED` bit(1) NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CALENDAR_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_CALENDAR_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event`
--

DROP TABLE IF EXISTS `calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `FROM_DATE_TIME` datetime(6) NOT NULL,
  `HIGHLIGHTED` bit(1) NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `UNTIL_DATE_TIME` datetime(6) NOT NULL,
  `CALENDAR_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CALENDAR_EVENT_DATES` (`CALENDAR_ID`,`FROM_DATE_TIME`,`UNTIL_DATE_TIME`),
  CONSTRAINT `FK_CALENDAR_EVENT_CALENDAR` FOREIGN KEY (`CALENDAR_ID`) REFERENCES `calendar` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event`
--

LOCK TABLES `calendar_event` WRITE;
/*!40000 ALTER TABLE `calendar_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event_time_interval`
--

DROP TABLE IF EXISTS `calendar_event_time_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event_time_interval` (
  `CALENDAR_EVENT_ID` bigint NOT NULL,
  `TIME_INTERVAL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`CALENDAR_EVENT_ID`,`TIME_INTERVAL_ID`),
  KEY `FK_TICE_TIME_INTERVAL` (`TIME_INTERVAL_ID`),
  CONSTRAINT `FK_TICE_CALENDAR_EVENT` FOREIGN KEY (`CALENDAR_EVENT_ID`) REFERENCES `calendar_event` (`ID`),
  CONSTRAINT `FK_TICE_TIME_INTERVAL` FOREIGN KEY (`TIME_INTERVAL_ID`) REFERENCES `time_interval` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event_time_interval`
--

LOCK TABLES `calendar_event_time_interval` WRITE;
/*!40000 ALTER TABLE `calendar_event_time_interval` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event_time_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CLIENT_NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,_binary '','2021-09-12 00:00:00.000000','2021-09-12 00:00:00.000000',0,1,'Soincon DEV','Desarrollo');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_prefix`
--

DROP TABLE IF EXISTS `code_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_prefix` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `ACRONYM` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `IS_DEFAULT` bit(1) NOT NULL,
  `LAST_PREFIX_VALUE` bigint NOT NULL,
  `PREFIX_TARGET` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CODE_PREFIX_ACRONYM` (`CLIENT_ID`,`ACRONYM`),
  CONSTRAINT `FK_CODE_PREFIX_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_prefix`
--

LOCK TABLES `code_prefix` WRITE;
/*!40000 ALTER TABLE `code_prefix` DISABLE KEYS */;
/*!40000 ALTER TABLE `code_prefix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `CONTACT_TYPE` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CARD_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DEFAULT_PAYMENT_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CONTACT_NAME` (`CLIENT_ID`,`CONTACT_TYPE`,`NAME`),
  CONSTRAINT `FK_CONTACT_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_customer`
--

DROP TABLE IF EXISTS `contact_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_customer` (
  `DEFAULT_DISCOUNT` decimal(8,5) DEFAULT NULL,
  `CONTACT_ID` bigint NOT NULL,
  PRIMARY KEY (`CONTACT_ID`),
  CONSTRAINT `FK_CUSTOMER_CONTACT` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contact` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_customer`
--

LOCK TABLES `contact_customer` WRITE;
/*!40000 ALTER TABLE `contact_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_sector`
--

DROP TABLE IF EXISTS `contact_sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_sector` (
  `CONTACT_ID` bigint NOT NULL,
  `SECTOR_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`CONTACT_ID`,`SECTOR_ID`),
  KEY `FK_CONTACT_SECTOR_SECTOR` (`SECTOR_ID`),
  CONSTRAINT `FK_CONTACT_SECTOR_CONTACT` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contact` (`ID`),
  CONSTRAINT `FK_CONTACT_SECTOR_SECTOR` FOREIGN KEY (`SECTOR_ID`) REFERENCES `sector` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_sector`
--

LOCK TABLES `contact_sector` WRITE;
/*!40000 ALTER TABLE `contact_sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_supplier`
--

DROP TABLE IF EXISTS `contact_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_supplier` (
  `WEBSITE` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTACT_ID` bigint NOT NULL,
  PRIMARY KEY (`CONTACT_ID`),
  CONSTRAINT `FK_SUPPLIER_CONTACT` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contact` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_supplier`
--

LOCK TABLES `contact_supplier` WRITE;
/*!40000 ALTER TABLE `contact_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_tag`
--

DROP TABLE IF EXISTS `contact_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_tag` (
  `CONTACT_ID` bigint NOT NULL,
  `TAG_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`CONTACT_ID`,`TAG_ID`),
  KEY `FK_CONTACT_TAG_TAG` (`TAG_ID`),
  CONSTRAINT `FK_CONTACT_TAG_CONTACT` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contact` (`ID`),
  CONSTRAINT `FK_CONTACT_TAG_TAG` FOREIGN KEY (`TAG_ID`) REFERENCES `tag` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_tag`
--

LOCK TABLES `contact_tag` WRITE;
/*!40000 ALTER TABLE `contact_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_guideline`
--

DROP TABLE IF EXISTS `control_guideline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_guideline` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `CUSTOM_CONTROL_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CONTROL_GUIDELINE_CODE` (`CLIENT_ID`,`CODE`),
  KEY `FK_CONTROL_GUIDELINE_CUSTOM_CONTROL` (`CUSTOM_CONTROL_ID`),
  CONSTRAINT `FK_CONTROL_GUIDELINE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_CONTROL_GUIDELINE_CUSTOM_CONTROL` FOREIGN KEY (`CUSTOM_CONTROL_ID`) REFERENCES `custom_control` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_guideline`
--

LOCK TABLES `control_guideline` WRITE;
/*!40000 ALTER TABLE `control_guideline` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_guideline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_list`
--

DROP TABLE IF EXISTS `control_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_list` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CONTROL_LIST_NAME` (`CLIENT_ID`,`NAME`),
  UNIQUE KEY `UIDX_CONTROL_LIST_CODE` (`CLIENT_ID`,`CODE`),
  CONSTRAINT `FK_CONTROL_LIST_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_list`
--

LOCK TABLES `control_list` WRITE;
/*!40000 ALTER TABLE `control_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_list_application`
--

DROP TABLE IF EXISTS `control_list_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_list_application` (
  `APPLICATION_ID` bigint NOT NULL,
  `CONTROL_LIST_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`APPLICATION_ID`,`CONTROL_LIST_ID`),
  KEY `FK_CLAP_CONTROL_LIST` (`CONTROL_LIST_ID`),
  CONSTRAINT `FK_CLAP_CONTROL_LIST` FOREIGN KEY (`CONTROL_LIST_ID`) REFERENCES `control_list` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_list_application`
--

LOCK TABLES `control_list_application` WRITE;
/*!40000 ALTER TABLE `control_list_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_list_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_list_guideline`
--

DROP TABLE IF EXISTS `control_list_guideline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_list_guideline` (
  `CONTROL_GUIDELINE_ID` bigint NOT NULL,
  `CONTROL_LIST_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `IS_MANDATORY` bit(1) NOT NULL,
  `POSITION` int DEFAULT NULL,
  PRIMARY KEY (`CONTROL_GUIDELINE_ID`,`CONTROL_LIST_ID`),
  KEY `FK_CONTROL_LIST_GUIDELINE_CONTROL_LIST` (`CONTROL_LIST_ID`),
  CONSTRAINT `FK_CONTROL_LIST_GUIDELINE_CONTROL_GUIDELINE` FOREIGN KEY (`CONTROL_GUIDELINE_ID`) REFERENCES `control_guideline` (`ID`),
  CONSTRAINT `FK_CONTROL_LIST_GUIDELINE_CONTROL_LIST` FOREIGN KEY (`CONTROL_LIST_ID`) REFERENCES `control_list` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_list_guideline`
--

LOCK TABLES `control_list_guideline` WRITE;
/*!40000 ALTER TABLE `control_list_guideline` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_list_guideline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_list_template`
--

DROP TABLE IF EXISTS `control_list_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_list_template` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DEFAULT_TRIGGER_PARAMETER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_MANDATORY` bit(1) NOT NULL,
  `POSITION` int DEFAULT NULL,
  `CONTROL_LIST_ID` bigint NOT NULL,
  `CONTROL_TEMPLATE_ID` bigint NOT NULL,
  `CONTROL_TRIGGER_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CONTROL_LIST_TEMPLATE_CONTROL_LIST` (`CONTROL_LIST_ID`),
  KEY `FK_CONTROL_LIST_TEMPLATE_CONTROL_TEMPLATE` (`CONTROL_TEMPLATE_ID`),
  KEY `FK_CONTROL_LIST_TEMPLATE_CONTROL_TRIGGER` (`CONTROL_TRIGGER_ID`),
  CONSTRAINT `FK_CONTROL_LIST_TEMPLATE_CONTROL_LIST` FOREIGN KEY (`CONTROL_LIST_ID`) REFERENCES `control_list` (`ID`),
  CONSTRAINT `FK_CONTROL_LIST_TEMPLATE_CONTROL_TEMPLATE` FOREIGN KEY (`CONTROL_TEMPLATE_ID`) REFERENCES `control_template` (`ID`),
  CONSTRAINT `FK_CONTROL_LIST_TEMPLATE_CONTROL_TRIGGER` FOREIGN KEY (`CONTROL_TRIGGER_ID`) REFERENCES `control_trigger` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_list_template`
--

LOCK TABLES `control_list_template` WRITE;
/*!40000 ALTER TABLE `control_list_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_list_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_template`
--

DROP TABLE IF EXISTS `control_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_template` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CONTROL_TEMPLATE_NAME` (`CLIENT_ID`,`NAME`),
  UNIQUE KEY `UIDX_CONTROL_TEMPLATE_CODE` (`CLIENT_ID`,`CODE`),
  CONSTRAINT `FK_CONTROL_TEMPLATE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_template`
--

LOCK TABLES `control_template` WRITE;
/*!40000 ALTER TABLE `control_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_trigger`
--

DROP TABLE IF EXISTS `control_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_trigger` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DISPLAY_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CONTROL_TRIGGER_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_CONTROL_TRIGGER_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_trigger`
--

LOCK TABLES `control_trigger` WRITE;
/*!40000 ALTER TABLE `control_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_trigger_application`
--

DROP TABLE IF EXISTS `control_trigger_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_trigger_application` (
  `APPLICATION_ID` bigint NOT NULL,
  `CONTROL_TRIGGER_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`APPLICATION_ID`,`CONTROL_TRIGGER_ID`),
  KEY `FK_CTAP_CONTROL_TRIGGER` (`CONTROL_TRIGGER_ID`),
  CONSTRAINT `FK_CTAP_CONTROL_TRIGGER` FOREIGN KEY (`CONTROL_TRIGGER_ID`) REFERENCES `control_trigger` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_trigger_application`
--

LOCK TABLES `control_trigger_application` WRITE;
/*!40000 ALTER TABLE `control_trigger_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_trigger_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinate`
--

DROP TABLE IF EXISTS `coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinate` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `ALTITUDE` decimal(15,12) DEFAULT NULL,
  `LATITUDE` decimal(15,12) NOT NULL,
  `LOCATED_AT` datetime(6) NOT NULL,
  `LONGITUDE` decimal(15,12) NOT NULL,
  `ASSET_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_ASSET_COORDINATE` (`ASSET_ID`,`LOCATED_AT`),
  CONSTRAINT `FK_COORDINATE_ASSET` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinate`
--

LOCK TABLES `coordinate` WRITE;
/*!40000 ALTER TABLE `coordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ISO_CODE_2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ISO_CODE_3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NUMERICAL_CODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_COUNTRY_NAME` (`NAME`),
  UNIQUE KEY `UIDX_COUNTRY_ISO_CODE_2` (`ISO_CODE_2`),
  UNIQUE KEY `UIDX_COUNTRY_ISO_CODE_3` (`ISO_CODE_3`),
  UNIQUE KEY `UIDX_COUNTRY_NUMERICAL_CODE` (`NUMERICAL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_control`
--

DROP TABLE IF EXISTS `custom_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_control` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CONTROL_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `SETUP` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CUSTOM_CONTROL_CLIENT` (`CLIENT_ID`),
  KEY `FK_CUSTOM_CONTROL_PARENT` (`PARENT_ID`),
  CONSTRAINT `FK_CUSTOM_CONTROL_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_CUSTOM_CONTROL_PARENT` FOREIGN KEY (`PARENT_ID`) REFERENCES `custom_control` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_control`
--

LOCK TABLES `custom_control` WRITE;
/*!40000 ALTER TABLE `custom_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field`
--

DROP TABLE IF EXISTS `custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `CUSTOM_CONTROL_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CUSTOM_FIELD_NAME` (`CLIENT_ID`,`NAME`),
  KEY `FK_CUSTOM_FIELD_CUSTOM_CONTROL` (`CUSTOM_CONTROL_ID`),
  CONSTRAINT `FK_CUSTOM_FIELD_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_CUSTOM_FIELD_CUSTOM_CONTROL` FOREIGN KEY (`CUSTOM_CONTROL_ID`) REFERENCES `custom_control` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field`
--

LOCK TABLES `custom_field` WRITE;
/*!40000 ALTER TABLE `custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension_type`
--

DROP TABLE IF EXISTS `dimension_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimension_type` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `ABBREVIATION` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `PARENT_TYPE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_DIMENSION_TYPE_NAME` (`CLIENT_ID`,`PARENT_TYPE_ID`,`NAME`),
  KEY `FK_DIMENSION_TYPE_PARENT_TYPE` (`PARENT_TYPE_ID`),
  CONSTRAINT `FK_DIMENSION_TYPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_DIMENSION_TYPE_PARENT_TYPE` FOREIGN KEY (`PARENT_TYPE_ID`) REFERENCES `dimension_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension_type`
--

LOCK TABLES `dimension_type` WRITE;
/*!40000 ALTER TABLE `dimension_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimension_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DOCUMENT_UUID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ENTITY_ID` bigint NOT NULL,
  `IS_PINNED_DP` bit(1) NOT NULL,
  `IS_PINNED_EG` bit(1) NOT NULL,
  `IS_PINNED_MF` bit(1) NOT NULL,
  `IS_PINNED_VS` bit(1) NOT NULL,
  `IS_PINNED_VT` bit(1) NOT NULL,
  `DOCUMENT_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_DOCUMENT` (`DOCUMENT_TYPE`,`DOCUMENT_UUID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidence`
--

DROP TABLE IF EXISTS `incidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidence` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_INCIDENCE_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_INCIDENCE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidence`
--

LOCK TABLES `incidence` WRITE;
/*!40000 ALTER TABLE `incidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirect_procedure`
--

DROP TABLE IF EXISTS `indirect_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirect_procedure` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_UNAVAILABILITY` bit(1) NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_INDIRECT_PROCEDURE_NAME` (`NAME`),
  KEY `FK_INDIRECT_PROCEDURE_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_INDIRECT_PROCEDURE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirect_procedure`
--

LOCK TABLES `indirect_procedure` WRITE;
/*!40000 ALTER TABLE `indirect_procedure` DISABLE KEYS */;
/*!40000 ALTER TABLE `indirect_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirect_procedure_relationship`
--

DROP TABLE IF EXISTS `indirect_procedure_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirect_procedure_relationship` (
  `INDIRECT_PROCEDURE_ID` bigint NOT NULL,
  `PROCEDURE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`INDIRECT_PROCEDURE_ID`,`PROCEDURE_ID`),
  KEY `FK_INDIRECT_PROCEDURE_RELATIONSHIP_PROCEDURE` (`PROCEDURE_ID`),
  CONSTRAINT `FK_INDIRECT_PROCEDURE_RELATIONSHIP_INDIRECT_PROCEDURE` FOREIGN KEY (`INDIRECT_PROCEDURE_ID`) REFERENCES `indirect_procedure` (`ID`),
  CONSTRAINT `FK_INDIRECT_PROCEDURE_RELATIONSHIP_PROCEDURE` FOREIGN KEY (`PROCEDURE_ID`) REFERENCES `route_procedure` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirect_procedure_relationship`
--

LOCK TABLES `indirect_procedure_relationship` WRITE;
/*!40000 ALTER TABLE `indirect_procedure_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `indirect_procedure_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `label` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `HEIGHT` decimal(5,2) NOT NULL,
  `LABEL_DATA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `WIDTH` decimal(5,2) NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_LABEL_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_LABEL_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_printer`
--

DROP TABLE IF EXISTS `label_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `label_printer` (
  `LABEL_ID` bigint NOT NULL,
  `PRINTER_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`LABEL_ID`,`PRINTER_ID`),
  KEY `FK_LABEL_PRINTER_PRINTER` (`PRINTER_ID`),
  CONSTRAINT `FK_LABEL_PRINTER_LABEL` FOREIGN KEY (`LABEL_ID`) REFERENCES `label` (`ID`),
  CONSTRAINT `FK_LABEL_PRINTER_PRINTER` FOREIGN KEY (`PRINTER_ID`) REFERENCES `printer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_printer`
--

LOCK TABLES `label_printer` WRITE;
/*!40000 ALTER TABLE `label_printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `label_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `IMAGE_UUID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `LAYOUT_MAP` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_LAYOUT_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LAYOUT_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `ALLOW_MATERIAL_REQUESTS` bit(1) NOT NULL,
  `OTHER_MATERIALS_ALLOWED` bit(1) DEFAULT NULL,
  `ALLOW_STORAGE` bit(1) NOT NULL,
  `CODE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `IMAGE_UUID` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LAYOUT_FRACTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LENGTH` int DEFAULT NULL,
  `MAX_BOX_ALLOWED` int DEFAULT NULL,
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `WIDTH` int DEFAULT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `LAYOUT_ID` bigint DEFAULT NULL,
  `PARENT_LOCATION_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_LOCATION_CODE` (`CLIENT_ID`,`CODE`),
  KEY `FK_LOCATION_LAYOUT` (`LAYOUT_ID`),
  KEY `FK_LOCATION_PARENT` (`PARENT_LOCATION_ID`),
  CONSTRAINT `FK_LOCATION_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_LOCATION_LAYOUT` FOREIGN KEY (`LAYOUT_ID`) REFERENCES `layout` (`ID`),
  CONSTRAINT `FK_LOCATION_PARENT` FOREIGN KEY (`PARENT_LOCATION_ID`) REFERENCES `location` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `MATERIAL_TYPE` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `COMPOSITION_IMAGE_UUID` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IMAGE_UUID` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_VIRTUAL` bit(1) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `OBSERVATIONS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `MEASURE_UNIT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_MATERIAL_NAME` (`CLIENT_ID`,`NAME`),
  UNIQUE KEY `UIDX_MATERIAL_CODE` (`CLIENT_ID`,`CODE`),
  KEY `FK_MATERIAL_MEASURE_UNIT` (`MEASURE_UNIT_ID`),
  CONSTRAINT `FK_MATERIAL_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_MATERIAL_MEASURE_UNIT` FOREIGN KEY (`MEASURE_UNIT_ID`) REFERENCES `measure_unit` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES ('MATERIAL_GENERIC',1,_binary '','2024-06-27 06:19:25.278048','2024-06-27 06:19:25.278048',NULL,1,'537704',NULL,NULL,'537704',NULL,_binary '\0','537704',NULL,1,1),('MATERIAL_GENERIC',2,_binary '','2024-06-28 06:39:42.253585','2024-06-28 06:39:42.253585',NULL,1,'546284',NULL,NULL,'546284',NULL,_binary '\0','546284',NULL,1,1),('MATERIAL_GENERIC',3,_binary '','2024-06-28 06:40:00.466612','2024-06-28 06:40:00.466612',NULL,1,'546285',NULL,NULL,'546285',NULL,_binary '\0','546285',NULL,1,1),('MATERIAL_GENERIC',4,_binary '','2024-06-28 07:11:25.786704','2024-06-28 07:11:25.786704',NULL,1,'546286',NULL,NULL,'546286',NULL,_binary '\0','546286',NULL,1,1),('MATERIAL_GENERIC',5,_binary '','2024-06-28 11:28:24.709606','2024-06-28 11:28:24.709606',NULL,1,'537705',NULL,NULL,'537705',NULL,_binary '\0','537705',NULL,1,1),('MATERIAL_GENERIC',6,_binary '','2024-06-28 11:28:25.254610','2024-06-28 11:28:25.254610',NULL,1,'537706',NULL,NULL,'537706',NULL,_binary '\0','537706',NULL,1,1),('MATERIAL_GENERIC',7,_binary '','2024-06-28 11:28:25.711615','2024-06-28 11:28:25.711615',NULL,1,'544642',NULL,NULL,'544642',NULL,_binary '\0','544642',NULL,1,1),('MATERIAL_GENERIC',8,_binary '','2024-06-28 11:28:26.125612','2024-06-28 11:28:26.125612',NULL,1,'544643',NULL,NULL,'544643',NULL,_binary '\0','544643',NULL,1,1),('MATERIAL_GENERIC',9,_binary '','2024-06-28 11:28:26.586615','2024-06-28 11:28:26.586615',NULL,1,'544644',NULL,NULL,'544644',NULL,_binary '\0','544644',NULL,1,1),('MATERIAL_GENERIC',10,_binary '','2024-06-28 11:28:28.253628','2024-06-28 11:28:28.253628',NULL,1,'544492',NULL,NULL,'544492',NULL,_binary '\0','544492',NULL,1,1),('MATERIAL_GENERIC',11,_binary '','2024-06-28 11:28:28.722634','2024-06-28 11:28:28.722634',NULL,1,'544493',NULL,NULL,'544493',NULL,_binary '\0','544493',NULL,1,1),('MATERIAL_GENERIC',12,_binary '','2024-06-28 11:28:29.161632','2024-06-28 11:28:29.161632',NULL,1,'544494',NULL,NULL,'544494',NULL,_binary '\0','544494',NULL,1,1),('MATERIAL_GENERIC',13,_binary '','2024-06-28 11:29:55.561436','2024-06-28 11:29:55.561436',NULL,1,'546254',NULL,NULL,'546254',NULL,_binary '\0','546254',NULL,1,1),('MATERIAL_GENERIC',14,_binary '','2024-06-28 11:29:55.996437','2024-06-28 11:29:55.996437',NULL,1,'546255',NULL,NULL,'546255',NULL,_binary '\0','546255',NULL,1,1),('MATERIAL_GENERIC',15,_binary '','2024-06-28 11:29:56.436445','2024-06-28 11:29:56.436445',NULL,1,'546256',NULL,NULL,'546256',NULL,_binary '\0','546256',NULL,1,1),('MATERIAL_GENERIC',16,_binary '','2024-06-28 11:29:57.951448','2024-06-28 11:29:57.951448',NULL,1,'555994',NULL,NULL,'555994',NULL,_binary '\0','555994',NULL,1,1),('MATERIAL_GENERIC',17,_binary '','2024-06-28 11:29:58.349451','2024-06-28 11:29:58.349451',NULL,1,'555995',NULL,NULL,'555995',NULL,_binary '\0','555995',NULL,1,1),('MATERIAL_GENERIC',18,_binary '','2024-06-28 11:29:58.749459','2024-06-28 11:29:58.749459',NULL,1,'555996',NULL,NULL,'555996',NULL,_binary '\0','555996',NULL,1,1),('MATERIAL_GENERIC',19,_binary '','2024-06-28 11:29:59.186463','2024-06-28 11:29:59.186463',NULL,1,'564840',NULL,NULL,'564840',NULL,_binary '\0','564840',NULL,1,1),('MATERIAL_GENERIC',20,_binary '','2024-06-28 11:29:59.581467','2024-06-28 11:29:59.581467',NULL,1,'564931',NULL,NULL,'564931',NULL,_binary '\0','564931',NULL,1,1),('MATERIAL_GENERIC',21,_binary '','2024-06-28 11:30:00.002463','2024-06-28 11:30:00.002463',NULL,1,'564932',NULL,NULL,'564932',NULL,_binary '\0','564932',NULL,1,1),('MATERIAL_GENERIC',22,_binary '','2024-06-28 11:30:05.143487','2024-06-28 11:30:05.143487',NULL,1,'655217',NULL,NULL,'655217',NULL,_binary '\0','655217',NULL,1,1),('MATERIAL_GENERIC',23,_binary '','2024-06-28 11:30:05.600500','2024-06-28 11:30:05.600500',NULL,1,'670569',NULL,NULL,'670569',NULL,_binary '\0','670569',NULL,1,1),('MATERIAL_GENERIC',24,_binary '','2024-06-28 11:30:06.023493','2024-06-28 11:30:06.023493',NULL,1,'655218',NULL,NULL,'655218',NULL,_binary '\0','655218',NULL,1,1),('MATERIAL_GENERIC',25,_binary '','2024-06-28 11:30:06.416503','2024-06-28 11:30:06.416503',NULL,1,'655219',NULL,NULL,'655219',NULL,_binary '\0','655219',NULL,1,1),('MATERIAL_GENERIC',26,_binary '','2024-06-28 11:30:06.855504','2024-06-28 11:30:06.855504',NULL,1,'657645',NULL,NULL,'657645',NULL,_binary '\0','657645',NULL,1,1),('MATERIAL_GENERIC',27,_binary '','2024-06-28 11:30:07.251504','2024-06-28 11:30:07.251504',NULL,1,'670625',NULL,NULL,'670625',NULL,_binary '\0','670625',NULL,1,1),('MATERIAL_GENERIC',28,_binary '','2024-06-28 11:30:07.644516','2024-06-28 11:30:07.644516',NULL,1,'657646',NULL,NULL,'657646',NULL,_binary '\0','657646',NULL,1,1),('MATERIAL_GENERIC',29,_binary '','2024-06-28 11:30:08.033503','2024-06-28 11:30:08.033503',NULL,1,'657647',NULL,NULL,'657647',NULL,_binary '\0','657647',NULL,1,1),('MATERIAL_GENERIC',30,_binary '','2024-06-28 11:30:08.426513','2024-06-28 11:30:08.426513',NULL,1,'659006',NULL,NULL,'659006',NULL,_binary '\0','659006',NULL,1,1),('MATERIAL_GENERIC',31,_binary '','2024-06-28 11:30:08.820507','2024-06-28 11:30:08.820507',NULL,1,'670620',NULL,NULL,'670620',NULL,_binary '\0','670620',NULL,1,1),('MATERIAL_GENERIC',32,_binary '','2024-06-28 11:30:09.230519','2024-06-28 11:30:09.230519',NULL,1,'659007',NULL,NULL,'659007',NULL,_binary '\0','659007',NULL,1,1),('MATERIAL_GENERIC',33,_binary '','2024-06-28 11:30:09.626520','2024-06-28 11:30:09.626520',NULL,1,'659008',NULL,NULL,'659008',NULL,_binary '\0','659008',NULL,1,1),('MATERIAL_GENERIC',34,_binary '','2024-06-28 11:30:10.019517','2024-06-28 11:30:10.019517',NULL,1,'668223',NULL,NULL,'668223',NULL,_binary '\0','668223',NULL,1,1),('MATERIAL_GENERIC',35,_binary '','2024-06-28 11:30:10.413529','2024-06-28 11:30:10.413529',NULL,1,'670654',NULL,NULL,'670654',NULL,_binary '\0','670654',NULL,1,1),('MATERIAL_GENERIC',36,_binary '','2024-06-28 11:30:10.809519','2024-06-28 11:30:10.809519',NULL,1,'668224',NULL,NULL,'668224',NULL,_binary '\0','668224',NULL,1,1),('MATERIAL_GENERIC',37,_binary '','2024-06-28 11:30:11.198536','2024-06-28 11:30:11.198536',NULL,1,'668225',NULL,NULL,'668225',NULL,_binary '\0','668225',NULL,1,1),('MATERIAL_GENERIC',38,_binary '','2024-06-28 11:30:11.591530','2024-06-28 11:30:11.591530',NULL,1,'668064',NULL,NULL,'668064',NULL,_binary '\0','668064',NULL,1,1),('MATERIAL_GENERIC',39,_binary '','2024-06-28 11:30:11.985531','2024-06-28 11:30:11.985531',NULL,1,'670674',NULL,NULL,'670674',NULL,_binary '\0','670674',NULL,1,1),('MATERIAL_GENERIC',40,_binary '','2024-06-28 11:30:12.389535','2024-06-28 11:30:12.389535',NULL,1,'668065',NULL,NULL,'668065',NULL,_binary '\0','668065',NULL,1,1),('MATERIAL_GENERIC',41,_binary '','2024-06-28 11:30:12.797540','2024-06-28 11:30:12.797540',NULL,1,'668066',NULL,NULL,'668066',NULL,_binary '\0','668066',NULL,1,1),('MATERIAL_GENERIC',42,_binary '','2024-06-28 11:30:13.195531','2024-06-28 11:30:13.195531',NULL,1,'660081',NULL,NULL,'660081',NULL,_binary '\0','660081',NULL,1,1),('MATERIAL_GENERIC',43,_binary '','2024-06-28 11:30:13.589553','2024-06-28 11:30:13.589553',NULL,1,'670645',NULL,NULL,'670645',NULL,_binary '\0','670645',NULL,1,1),('MATERIAL_GENERIC',44,_binary '','2024-06-28 11:30:13.980546','2024-06-28 11:30:13.980546',NULL,1,'660082',NULL,NULL,'660082',NULL,_binary '\0','660082',NULL,1,1),('MATERIAL_GENERIC',45,_binary '','2024-06-28 11:30:14.374546','2024-06-28 11:30:14.374546',NULL,1,'660083',NULL,NULL,'660083',NULL,_binary '\0','660083',NULL,1,1),('MATERIAL_GENERIC',46,_binary '','2024-06-28 11:30:14.767542','2024-06-28 11:30:14.767542',NULL,1,'660087',NULL,NULL,'660087',NULL,_binary '\0','660087',NULL,1,1),('MATERIAL_GENERIC',47,_binary '','2024-06-28 11:30:15.160551','2024-06-28 11:30:15.160551',NULL,1,'670647',NULL,NULL,'670647',NULL,_binary '\0','670647',NULL,1,1),('MATERIAL_GENERIC',48,_binary '','2024-06-28 11:30:15.553547','2024-06-28 11:30:15.553547',NULL,1,'660088',NULL,NULL,'660088',NULL,_binary '\0','660088',NULL,1,1),('MATERIAL_GENERIC',49,_binary '','2024-06-28 11:30:15.978562','2024-06-28 11:30:15.978562',NULL,1,'660089',NULL,NULL,'660089',NULL,_binary '\0','660089',NULL,1,1),('MATERIAL_GENERIC',50,_binary '','2024-06-28 11:30:16.417560','2024-06-28 11:30:16.417560',NULL,1,'673102',NULL,NULL,'673102',NULL,_binary '\0','673102',NULL,1,1),('MATERIAL_GENERIC',51,_binary '','2024-06-28 11:30:16.872570','2024-06-28 11:30:16.872570',NULL,1,'673101',NULL,NULL,'673101',NULL,_binary '\0','673101',NULL,1,1),('MATERIAL_GENERIC',52,_binary '','2024-06-28 11:30:17.251557','2024-06-28 11:30:17.251557',NULL,1,'660767',NULL,NULL,'660767',NULL,_binary '\0','660767',NULL,1,1),('MATERIAL_GENERIC',53,_binary '','2024-06-28 11:30:17.645566','2024-06-28 11:30:17.645566',NULL,1,'660768',NULL,NULL,'660768',NULL,_binary '\0','660768',NULL,1,1),('MATERIAL_GENERIC',54,_binary '','2024-06-28 11:30:18.037570','2024-06-28 11:30:18.037570',NULL,1,'660769',NULL,NULL,'660769',NULL,_binary '\0','660769',NULL,1,1),('MATERIAL_GENERIC',55,_binary '','2024-06-28 11:30:37.416674','2024-06-28 11:30:37.416674',NULL,1,'536666',NULL,NULL,'536666',NULL,_binary '\0','536666',NULL,1,1),('MATERIAL_GENERIC',56,_binary '','2024-06-28 11:30:37.834684','2024-06-28 11:30:37.834684',NULL,1,'536667',NULL,NULL,'536667',NULL,_binary '\0','536667',NULL,1,1),('MATERIAL_GENERIC',57,_binary '','2024-06-28 11:30:38.262688','2024-06-28 11:30:38.262688',NULL,1,'536668',NULL,NULL,'536668',NULL,_binary '\0','536668',NULL,1,1),('MATERIAL_GENERIC',58,_binary '','2024-07-02 06:05:04.149118','2024-07-02 06:05:04.149118',NULL,1,'532716',NULL,NULL,'532716',NULL,_binary '\0','532716',NULL,1,1),('MATERIAL_GENERIC',59,_binary '','2024-07-02 06:05:14.210878','2024-07-02 06:05:14.210878',NULL,1,'532717',NULL,NULL,'532717',NULL,_binary '\0','532717',NULL,1,1),('MATERIAL_GENERIC',60,_binary '','2024-07-02 06:05:14.618908','2024-07-02 06:05:14.618908',NULL,1,'532718',NULL,NULL,'532718',NULL,_binary '\0','532718',NULL,1,1),('MATERIAL_GENERIC',61,_binary '','2024-07-02 06:05:15.982536','2024-07-02 06:05:15.982536',NULL,1,'639329',NULL,NULL,'639329',NULL,_binary '\0','639329',NULL,1,1),('MATERIAL_GENERIC',62,_binary '','2024-07-02 06:05:16.380375','2024-07-02 06:05:16.380375',NULL,1,'639330',NULL,NULL,'639330',NULL,_binary '\0','639330',NULL,1,1),('MATERIAL_GENERIC',63,_binary '','2024-07-02 06:05:16.775963','2024-07-02 06:05:16.775963',NULL,1,'639361',NULL,NULL,'639361',NULL,_binary '\0','639361',NULL,1,1),('MATERIAL_GENERIC',64,_binary '','2024-07-02 06:05:19.314131','2024-07-02 06:05:19.314131',NULL,1,'629652',NULL,NULL,'629652',NULL,_binary '\0','629652',NULL,1,1),('MATERIAL_GENERIC',65,_binary '','2024-07-02 06:05:19.729642','2024-07-02 06:05:19.729642',NULL,1,'629653',NULL,NULL,'629653',NULL,_binary '\0','629653',NULL,1,1),('MATERIAL_GENERIC',66,_binary '','2024-07-02 06:05:20.099560','2024-07-02 06:05:20.099560',NULL,1,'629654',NULL,NULL,'629654',NULL,_binary '\0','629654',NULL,1,1),('MATERIAL_GENERIC',67,_binary '','2024-07-02 06:05:21.336609','2024-07-02 06:05:21.336609',NULL,1,'629658',NULL,NULL,'629658',NULL,_binary '\0','629658',NULL,1,1),('MATERIAL_GENERIC',68,_binary '','2024-07-02 06:05:21.714606','2024-07-02 06:05:21.714606',NULL,1,'629659',NULL,NULL,'629659',NULL,_binary '\0','629659',NULL,1,1),('MATERIAL_GENERIC',69,_binary '','2024-07-02 06:05:22.066612','2024-07-02 06:05:22.066612',NULL,1,'629660',NULL,NULL,'629660',NULL,_binary '\0','629660',NULL,1,1),('MATERIAL_GENERIC',70,_binary '','2024-07-02 06:05:23.225000','2024-07-02 06:05:23.225000',NULL,1,'600507',NULL,NULL,'600507',NULL,_binary '\0','600507',NULL,1,1),('MATERIAL_GENERIC',71,_binary '','2024-07-02 06:05:23.582991','2024-07-02 06:05:23.582991',NULL,1,'600508',NULL,NULL,'600508',NULL,_binary '\0','600508',NULL,1,1),('MATERIAL_GENERIC',72,_binary '','2024-07-02 06:05:23.924993','2024-07-02 06:05:23.924993',NULL,1,'600509',NULL,NULL,'600509',NULL,_binary '\0','600509',NULL,1,1);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_candidate`
--

DROP TABLE IF EXISTS `material_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_candidate` (
  `CANDIDATE_ID` bigint NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`CANDIDATE_ID`,`MATERIAL_ID`),
  KEY `FK_MATERIAL_CANDIDATE_MATERIAL` (`MATERIAL_ID`),
  CONSTRAINT `FK_MATERIAL_CANDIDATE_CANDIDATE` FOREIGN KEY (`CANDIDATE_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_MATERIAL_CANDIDATE_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_candidate`
--

LOCK TABLES `material_candidate` WRITE;
/*!40000 ALTER TABLE `material_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_composition`
--

DROP TABLE IF EXISTS `material_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_composition` (
  `COMPONENT_ID` bigint NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `COMPOSITION_ORDER` int NOT NULL,
  `IMAGE_MAP` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_PERCENTAGE` bit(1) NOT NULL,
  `TOLERANCE` decimal(8,5) DEFAULT NULL,
  `UNITS` decimal(14,8) NOT NULL,
  `MEASURE_UNIT` bigint DEFAULT NULL,
  PRIMARY KEY (`COMPONENT_ID`,`MATERIAL_ID`),
  KEY `FK_COMPOUND_MATERIAL` (`MATERIAL_ID`),
  KEY `FK_COMPONENT_MEASURE_UNIT` (`MEASURE_UNIT`),
  CONSTRAINT `FK_COMPONENT_MATERIAL` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_COMPONENT_MEASURE_UNIT` FOREIGN KEY (`MEASURE_UNIT`) REFERENCES `measure_unit` (`ID`),
  CONSTRAINT `FK_COMPOUND_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_composition`
--

LOCK TABLES `material_composition` WRITE;
/*!40000 ALTER TABLE `material_composition` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_consumable`
--

DROP TABLE IF EXISTS `material_consumable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_consumable` (
  `CRITICAL` bit(1) DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONSUMABLE_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  PRIMARY KEY (`MATERIAL_ID`),
  CONSTRAINT `FK_CONSUMABLE_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_consumable`
--

LOCK TABLES `material_consumable` WRITE;
/*!40000 ALTER TABLE `material_consumable` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_consumable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_cost_history`
--

DROP TABLE IF EXISTS `material_cost_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_cost_history` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `COST` decimal(12,6) NOT NULL,
  `FROM_DATE_TIME` datetime(6) NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MATERIAL_COST_HISTORY_CLIENT` (`CLIENT_ID`),
  KEY `FK_MATERIAL_COST_HISTORY_MATERIAL` (`MATERIAL_ID`),
  CONSTRAINT `FK_MATERIAL_COST_HISTORY_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_MATERIAL_COST_HISTORY_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_cost_history`
--

LOCK TABLES `material_cost_history` WRITE;
/*!40000 ALTER TABLE `material_cost_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_cost_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_family`
--

DROP TABLE IF EXISTS `material_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_family` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IMAGE_UUID` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_MATERIAL_FAMILY_NAME` (`CLIENT_ID`,`NAME`),
  KEY `FK_MATERIAL_FAMILY_PARENT` (`PARENT_ID`),
  CONSTRAINT `FK_MATERIAL_FAMILY_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_MATERIAL_FAMILY_PARENT` FOREIGN KEY (`PARENT_ID`) REFERENCES `material_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_family`
--

LOCK TABLES `material_family` WRITE;
/*!40000 ALTER TABLE `material_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_family_custom_field`
--

DROP TABLE IF EXISTS `material_family_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_family_custom_field` (
  `CUSTOM_FIELD_ID` bigint NOT NULL,
  `MATERIAL_FAMILY_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `MANDATORY` bit(1) NOT NULL,
  `POSITION` int NOT NULL,
  PRIMARY KEY (`CUSTOM_FIELD_ID`,`MATERIAL_FAMILY_ID`),
  KEY `FK_MFCF_ASSET_FAMILY` (`MATERIAL_FAMILY_ID`),
  CONSTRAINT `FK_MFCF_ASSET_FAMILY` FOREIGN KEY (`MATERIAL_FAMILY_ID`) REFERENCES `material_family` (`ID`),
  CONSTRAINT `FK_MFCF_CUSTOM_FIELD` FOREIGN KEY (`CUSTOM_FIELD_ID`) REFERENCES `custom_field` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_family_custom_field`
--

LOCK TABLES `material_family_custom_field` WRITE;
/*!40000 ALTER TABLE `material_family_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_family_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_field_value`
--

DROP TABLE IF EXISTS `material_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_field_value` (
  `CUSTOM_FIELD_ID` bigint NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CUSTOM_FIELD_ID`,`MATERIAL_ID`),
  KEY `FK_MFV_MATERIAL` (`MATERIAL_ID`),
  CONSTRAINT `FK_MFV_CUSTOM_FIELD` FOREIGN KEY (`CUSTOM_FIELD_ID`) REFERENCES `custom_field` (`ID`),
  CONSTRAINT `FK_MFV_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_field_value`
--

LOCK TABLES `material_field_value` WRITE;
/*!40000 ALTER TABLE `material_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_generic`
--

DROP TABLE IF EXISTS `material_generic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_generic` (
  `IS_FINISHED` bit(1) NOT NULL,
  `IS_RAW_MATERIAL` bit(1) NOT NULL,
  `IS_SEMIFINISHED` bit(1) NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  PRIMARY KEY (`MATERIAL_ID`),
  CONSTRAINT `FK_MATERIAL_GENERIC_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_generic`
--

LOCK TABLES `material_generic` WRITE;
/*!40000 ALTER TABLE `material_generic` DISABLE KEYS */;
INSERT INTO `material_generic` VALUES (_binary '',_binary '\0',_binary '\0',1),(_binary '',_binary '\0',_binary '\0',2),(_binary '',_binary '\0',_binary '\0',3),(_binary '',_binary '\0',_binary '\0',4),(_binary '',_binary '\0',_binary '\0',5),(_binary '',_binary '\0',_binary '\0',6),(_binary '',_binary '\0',_binary '\0',7),(_binary '',_binary '\0',_binary '\0',8),(_binary '',_binary '\0',_binary '\0',9),(_binary '',_binary '\0',_binary '\0',10),(_binary '',_binary '\0',_binary '\0',11),(_binary '',_binary '\0',_binary '\0',12),(_binary '',_binary '\0',_binary '\0',13),(_binary '',_binary '\0',_binary '\0',14),(_binary '',_binary '\0',_binary '\0',15),(_binary '',_binary '\0',_binary '\0',16),(_binary '',_binary '\0',_binary '\0',17),(_binary '',_binary '\0',_binary '\0',18),(_binary '',_binary '\0',_binary '\0',19),(_binary '',_binary '\0',_binary '\0',20),(_binary '',_binary '\0',_binary '\0',21),(_binary '',_binary '\0',_binary '\0',22),(_binary '',_binary '\0',_binary '\0',23),(_binary '',_binary '\0',_binary '\0',24),(_binary '',_binary '\0',_binary '\0',25),(_binary '',_binary '\0',_binary '\0',26),(_binary '',_binary '\0',_binary '\0',27),(_binary '',_binary '\0',_binary '\0',28),(_binary '',_binary '\0',_binary '\0',29),(_binary '',_binary '\0',_binary '\0',30),(_binary '',_binary '\0',_binary '\0',31),(_binary '',_binary '\0',_binary '\0',32),(_binary '',_binary '\0',_binary '\0',33),(_binary '',_binary '\0',_binary '\0',34),(_binary '',_binary '\0',_binary '\0',35),(_binary '',_binary '\0',_binary '\0',36),(_binary '',_binary '\0',_binary '\0',37),(_binary '',_binary '\0',_binary '\0',38),(_binary '',_binary '\0',_binary '\0',39),(_binary '',_binary '\0',_binary '\0',40),(_binary '',_binary '\0',_binary '\0',41),(_binary '',_binary '\0',_binary '\0',42),(_binary '',_binary '\0',_binary '\0',43),(_binary '',_binary '\0',_binary '\0',44),(_binary '',_binary '\0',_binary '\0',45),(_binary '',_binary '\0',_binary '\0',46),(_binary '',_binary '\0',_binary '\0',47),(_binary '',_binary '\0',_binary '\0',48),(_binary '',_binary '\0',_binary '\0',49),(_binary '',_binary '\0',_binary '\0',50),(_binary '',_binary '\0',_binary '\0',51),(_binary '',_binary '\0',_binary '\0',52),(_binary '',_binary '\0',_binary '\0',53),(_binary '',_binary '\0',_binary '\0',54),(_binary '',_binary '\0',_binary '\0',55),(_binary '',_binary '\0',_binary '\0',56),(_binary '',_binary '\0',_binary '\0',57),(_binary '',_binary '\0',_binary '\0',58),(_binary '',_binary '\0',_binary '\0',59),(_binary '',_binary '\0',_binary '\0',60),(_binary '',_binary '\0',_binary '\0',61),(_binary '',_binary '\0',_binary '\0',62),(_binary '',_binary '\0',_binary '\0',63),(_binary '',_binary '\0',_binary '\0',64),(_binary '',_binary '\0',_binary '\0',65),(_binary '',_binary '\0',_binary '\0',66),(_binary '',_binary '\0',_binary '\0',67),(_binary '',_binary '\0',_binary '\0',68),(_binary '',_binary '\0',_binary '\0',69),(_binary '',_binary '\0',_binary '\0',70),(_binary '',_binary '\0',_binary '\0',71),(_binary '',_binary '\0',_binary '\0',72);
/*!40000 ALTER TABLE `material_generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_measure_unit_conversion`
--

DROP TABLE IF EXISTS `material_measure_unit_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_measure_unit_conversion` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CONVERSION_FACTOR` decimal(12,6) NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  `SOURCE_UNIT_ID` bigint NOT NULL,
  `TARGET_UNIT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_MMUC_UNITS` (`MATERIAL_ID`,`SOURCE_UNIT_ID`,`TARGET_UNIT_ID`),
  KEY `FK_MMUC_CLIENT` (`CLIENT_ID`),
  KEY `FK_MMUC_SOURCE` (`SOURCE_UNIT_ID`),
  KEY `FK_MMUC_TARGET` (`TARGET_UNIT_ID`),
  CONSTRAINT `FK_MMUC_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_MMUC_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_MMUC_SOURCE` FOREIGN KEY (`SOURCE_UNIT_ID`) REFERENCES `measure_unit` (`ID`),
  CONSTRAINT `FK_MMUC_TARGET` FOREIGN KEY (`TARGET_UNIT_ID`) REFERENCES `measure_unit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_measure_unit_conversion`
--

LOCK TABLES `material_measure_unit_conversion` WRITE;
/*!40000 ALTER TABLE `material_measure_unit_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_measure_unit_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_membership`
--

DROP TABLE IF EXISTS `material_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_membership` (
  `MATERIAL_FAMILY_ID` bigint NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`MATERIAL_FAMILY_ID`,`MATERIAL_ID`),
  KEY `FK_MATERIAL_MEMBERSHIP_MATERIAL` (`MATERIAL_ID`),
  CONSTRAINT `FK_MATERIAL_MEMBERSHIP_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_MATERIAL_MEMBERSHIP_MATERIAL_FAMILY` FOREIGN KEY (`MATERIAL_FAMILY_ID`) REFERENCES `material_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_membership`
--

LOCK TABLES `material_membership` WRITE;
/*!40000 ALTER TABLE `material_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_stock_range`
--

DROP TABLE IF EXISTS `material_stock_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_stock_range` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `FROM_DATE_TIME` datetime(6) NOT NULL,
  `MAX_STOCK` decimal(12,6) NOT NULL,
  `MIN_STOCK` decimal(12,6) NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `MATERIAL_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MATERIAL_STOCK_RANGE_CLIENT` (`CLIENT_ID`),
  KEY `FK_MATERIAL_STOCK_RANGE_MATERIAL` (`MATERIAL_ID`),
  CONSTRAINT `FK_MATERIAL_STOCK_RANGE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_MATERIAL_STOCK_RANGE_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_stock_range`
--

LOCK TABLES `material_stock_range` WRITE;
/*!40000 ALTER TABLE `material_stock_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_stock_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_tag`
--

DROP TABLE IF EXISTS `material_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_tag` (
  `MATERIAL_ID` bigint NOT NULL,
  `TAG_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`MATERIAL_ID`,`TAG_ID`),
  KEY `FK_MATERIAL_TAG_TAG` (`TAG_ID`),
  CONSTRAINT `FK_MATERIAL_TAG_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_MATERIAL_TAG_TAG` FOREIGN KEY (`TAG_ID`) REFERENCES `tag` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_tag`
--

LOCK TABLES `material_tag` WRITE;
/*!40000 ALTER TABLE `material_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_unit`
--

DROP TABLE IF EXISTS `measure_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_unit` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `ABBREVIATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_MEASURE_UNIT_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_MEASURE_UNIT_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_unit`
--

LOCK TABLES `measure_unit` WRITE;
/*!40000 ALTER TABLE `measure_unit` DISABLE KEYS */;
INSERT INTO `measure_unit` VALUES (1,_binary '','2021-04-27 00:00:00.000000','2023-09-22 09:50:44.092440',1,2,'Uds','Unidades',1);
/*!40000 ALTER TABLE `measure_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_unit_conversion`
--

DROP TABLE IF EXISTS `measure_unit_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_unit_conversion` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CONVERSION_FACTOR` decimal(12,6) NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `SOURCE_UNIT_ID` bigint NOT NULL,
  `TARGET_UNIT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_MUC_UNITS` (`CLIENT_ID`,`SOURCE_UNIT_ID`,`TARGET_UNIT_ID`),
  KEY `FK_MUC_SOURCE` (`SOURCE_UNIT_ID`),
  KEY `FK_MUC_TARGET` (`TARGET_UNIT_ID`),
  CONSTRAINT `FK_MUC_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_MUC_SOURCE` FOREIGN KEY (`SOURCE_UNIT_ID`) REFERENCES `measure_unit` (`ID`),
  CONSTRAINT `FK_MUC_TARGET` FOREIGN KEY (`TARGET_UNIT_ID`) REFERENCES `measure_unit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_unit_conversion`
--

LOCK TABLES `measure_unit_conversion` WRITE;
/*!40000 ALTER TABLE `measure_unit_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `measure_unit_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer`
--

DROP TABLE IF EXISTS `printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printer` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `IP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `PORT` int DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PRINTER_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_PRINTER_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer`
--

LOCK TABLES `printer` WRITE;
/*!40000 ALTER TABLE `printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `OBSERVATIONS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_ROUTE_NAME` (`CLIENT_ID`,`NAME`),
  UNIQUE KEY `UIDX_ROUTE_CODE` (`CLIENT_ID`,`CODE`),
  CONSTRAINT `FK_ROUTE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_material`
--

DROP TABLE IF EXISTS `route_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_material` (
  `MATERIAL_ID` bigint NOT NULL,
  `ROUTE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `MEASURE_UNIT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MATERIAL_ID`,`ROUTE_ID`),
  KEY `FK_ROUTE_MATERIAL_MEASURE_UNIT` (`MEASURE_UNIT_ID`),
  KEY `FK_ROUTE_MATERIAL_ROUTE` (`ROUTE_ID`),
  CONSTRAINT `FK_ROUTE_MATERIAL_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_ROUTE_MATERIAL_MEASURE_UNIT` FOREIGN KEY (`MEASURE_UNIT_ID`) REFERENCES `measure_unit` (`ID`),
  CONSTRAINT `FK_ROUTE_MATERIAL_ROUTE` FOREIGN KEY (`ROUTE_ID`) REFERENCES `route` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_material`
--

LOCK TABLES `route_material` WRITE;
/*!40000 ALTER TABLE `route_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_procedure`
--

DROP TABLE IF EXISTS `route_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_procedure` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_PROCEDURE_NAME` (`NAME`),
  KEY `FK_PROCEDURE_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_PROCEDURE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_procedure`
--

LOCK TABLES `route_procedure` WRITE;
/*!40000 ALTER TABLE `route_procedure` DISABLE KEYS */;
INSERT INTO `route_procedure` VALUES (1,_binary '','2024-06-27 06:01:36.314614','2024-06-27 06:01:36.314614',NULL,1,NULL,'ACABADOS',1),(2,_binary '','2024-06-27 07:12:06.277727','2024-06-27 07:12:06.277727',NULL,1,'ESTAMPACION','FORJA',1),(3,_binary '','2024-06-28 07:10:53.069781','2024-06-28 07:10:53.069781',NULL,1,'Corte en sierra','CORTE',1),(4,_binary '','2024-06-28 11:30:05.556501','2024-06-28 11:30:05.556501',NULL,1,'TT Envejecimiento','TT ENVEJECIDO',1),(5,_binary '','2024-06-28 11:30:15.928549','2024-06-28 11:30:15.928549',NULL,1,'CORTE EN SIERRA',' CORTE',1),(6,_binary '','2024-06-28 11:30:16.367557','2024-06-28 11:30:16.367557',NULL,1,'Corte separación','C.SEPARACIÓN',1),(7,_binary '','2024-06-28 11:30:16.837556','2024-06-28 11:30:16.837556',NULL,1,'Repaso','REPASO',1),(8,_binary '','2024-07-02 06:05:04.022561','2024-07-02 06:05:04.022561',NULL,1,'GRANALLADO FULGOR','GRANALLADO',1);
/*!40000 ALTER TABLE `route_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step`
--

DROP TABLE IF EXISTS `route_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EMPLOYEE_NUMBER` decimal(6,3) DEFAULT NULL,
  `EXECUTIONS` bigint NOT NULL,
  `GLOBAL_MAX_DOWNTIME` decimal(8,5) DEFAULT NULL,
  `GLOBAL_MAX_OVERHEAD` decimal(8,5) DEFAULT NULL,
  `GLOBAL_MAX_REJECTIONS` decimal(8,5) DEFAULT NULL,
  `GLOBAL_OEE` decimal(8,5) DEFAULT NULL,
  `POSITION` int DEFAULT NULL,
  `PROCEDURE_ID` bigint NOT NULL,
  `ROUTE_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROUTE_STEP_PROCEDURE` (`PROCEDURE_ID`),
  KEY `FK_ROUTE_STEP_ROUTE` (`ROUTE_ID`),
  CONSTRAINT `FK_ROUTE_STEP_PROCEDURE` FOREIGN KEY (`PROCEDURE_ID`) REFERENCES `route_procedure` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_ROUTE` FOREIGN KEY (`ROUTE_ID`) REFERENCES `route` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step`
--

LOCK TABLES `route_step` WRITE;
/*!40000 ALTER TABLE `route_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_control_list`
--

DROP TABLE IF EXISTS `route_step_control_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_control_list` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `IS_MANDATORY` bit(1) NOT NULL,
  `TRIGGER_PARAMETER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTROL_LIST_ID` bigint NOT NULL,
  `CONTROL_TRIGGER_ID` bigint NOT NULL,
  `ROUTE_STEP_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROUTE_STEP_CONTROL_LIST_CONTROL_LIST` (`CONTROL_LIST_ID`),
  KEY `FK_ROUTE_STEP_CONTROL_LIST_CONTROL_TRIGGER` (`CONTROL_TRIGGER_ID`),
  KEY `FK_ROUTE_STEP_CONTROL_LIST_ROUTE_STEP` (`ROUTE_STEP_ID`),
  CONSTRAINT `FK_ROUTE_STEP_CONTROL_LIST_CONTROL_LIST` FOREIGN KEY (`CONTROL_LIST_ID`) REFERENCES `control_list` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_CONTROL_LIST_CONTROL_TRIGGER` FOREIGN KEY (`CONTROL_TRIGGER_ID`) REFERENCES `control_trigger` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_CONTROL_LIST_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_control_list`
--

LOCK TABLES `route_step_control_list` WRITE;
/*!40000 ALTER TABLE `route_step_control_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_control_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_control_template`
--

DROP TABLE IF EXISTS `route_step_control_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_control_template` (
  `CONTROL_TEMPLATE_ID` bigint NOT NULL,
  `ROUTE_STEP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`CONTROL_TEMPLATE_ID`,`ROUTE_STEP_ID`),
  KEY `FK_ROUTE_STEP_CONTROL_TEMPLATE_ROUTE_STEP` (`ROUTE_STEP_ID`),
  CONSTRAINT `FK_ROUTE_STEP_CONTROL_TEMPLATE_CONTROL_TEMPLATE` FOREIGN KEY (`CONTROL_TEMPLATE_ID`) REFERENCES `control_template` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_CONTROL_TEMPLATE_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_control_template`
--

LOCK TABLES `route_step_control_template` WRITE;
/*!40000 ALTER TABLE `route_step_control_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_control_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_dependency`
--

DROP TABLE IF EXISTS `route_step_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_dependency` (
  `REFERENCED_ROUTE_STEP_ID` bigint NOT NULL,
  `ROUTE_STEP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DEPENDENCY_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`REFERENCED_ROUTE_STEP_ID`,`ROUTE_STEP_ID`),
  KEY `FK_ROUTE_STEP_DEPENDENCY_ROUTE_STEP` (`ROUTE_STEP_ID`),
  CONSTRAINT `FK_ROUTE_STEP_DEPENDENCY_REFERENCED_ROUTE_STEP` FOREIGN KEY (`REFERENCED_ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_DEPENDENCY_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_dependency`
--

LOCK TABLES `route_step_dependency` WRITE;
/*!40000 ALTER TABLE `route_step_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_material`
--

DROP TABLE IF EXISTS `route_step_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_material` (
  `MATERIAL_ID` bigint NOT NULL,
  `ROUTE_STEP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `HAS_BATCH` bit(1) NOT NULL,
  `HAS_QUANTITY` bit(1) NOT NULL,
  `IS_PERCENTAGE` bit(1) NOT NULL,
  `IS_STRICT` bit(1) NOT NULL,
  `TOLERANCE` decimal(8,5) DEFAULT NULL,
  `UNITS` decimal(14,8) NOT NULL,
  `MEASURE_UNIT` bigint DEFAULT NULL,
  PRIMARY KEY (`MATERIAL_ID`,`ROUTE_STEP_ID`),
  KEY `FK_ROUTE_STEP_MEASURE_UNIT` (`MEASURE_UNIT`),
  KEY `FK_ROUTE_STEP_MATERIAL_ROUTE_STEP` (`ROUTE_STEP_ID`),
  CONSTRAINT `FK_ROUTE_STEP_MATERIAL_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_MATERIAL_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_MEASURE_UNIT` FOREIGN KEY (`MEASURE_UNIT`) REFERENCES `measure_unit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_material`
--

LOCK TABLES `route_step_material` WRITE;
/*!40000 ALTER TABLE `route_step_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_operator`
--

DROP TABLE IF EXISTS `route_step_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_operator` (
  `OPERATOR_ID` bigint NOT NULL,
  `ROUTE_STEP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `OPERATOR_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`OPERATOR_ID`,`ROUTE_STEP_ID`),
  KEY `FK_ROUTE_STEP_OPERATOR_ROUTE_STEP` (`ROUTE_STEP_ID`),
  CONSTRAINT `FK_ROUTE_STEP_OPERATOR_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_operator`
--

LOCK TABLES `route_step_operator` WRITE;
/*!40000 ALTER TABLE `route_step_operator` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_output`
--

DROP TABLE IF EXISTS `route_step_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_output` (
  `MATERIAL_ID` bigint NOT NULL,
  `ROUTE_STEP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `IS_FINAL` bit(1) NOT NULL,
  `UNIQUE_SERIAL_NUMBERING` bit(1) DEFAULT NULL,
  `UNITS` decimal(14,8) NOT NULL,
  `BATCH_SEQUENCE_ID` bigint DEFAULT NULL,
  `LABEL_ID` bigint DEFAULT NULL,
  `MEASURE_UNIT_ID` bigint DEFAULT NULL,
  `PRINTER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MATERIAL_ID`,`ROUTE_STEP_ID`),
  KEY `FK_ROUTE_STEP_BATCH_SEQUENCE` (`BATCH_SEQUENCE_ID`),
  KEY `FK_ROUTE_STEP_LABEL` (`LABEL_ID`),
  KEY `FK_ROUTE_STEP_OUTPUT_MEASURE_UNIT` (`MEASURE_UNIT_ID`),
  KEY `FK_ROUTE_STEP_PRINTER` (`PRINTER_ID`),
  KEY `FK_ROUTE_STEP_OUTPUT_ROUTE_STEP` (`ROUTE_STEP_ID`),
  CONSTRAINT `FK_ROUTE_STEP_BATCH_SEQUENCE` FOREIGN KEY (`BATCH_SEQUENCE_ID`) REFERENCES `batch_sequence` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_LABEL` FOREIGN KEY (`LABEL_ID`) REFERENCES `label` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_OUTPUT_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_OUTPUT_MEASURE_UNIT` FOREIGN KEY (`MEASURE_UNIT_ID`) REFERENCES `measure_unit` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_OUTPUT_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_PRINTER` FOREIGN KEY (`PRINTER_ID`) REFERENCES `printer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_output`
--

LOCK TABLES `route_step_output` WRITE;
/*!40000 ALTER TABLE `route_step_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_tool`
--

DROP TABLE IF EXISTS `route_step_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_tool` (
  `ROUTE_STEP_ID` bigint NOT NULL,
  `TOOL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ROUTE_STEP_ID`,`TOOL_ID`),
  KEY `FK_ROUTE_STEP_TOOL_TOOL` (`TOOL_ID`),
  CONSTRAINT `FK_ROUTE_STEP_TOOL_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_TOOL_TOOL` FOREIGN KEY (`TOOL_ID`) REFERENCES `asset_tool` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_tool`
--

LOCK TABLES `route_step_tool` WRITE;
/*!40000 ALTER TABLE `route_step_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_tool_material`
--

DROP TABLE IF EXISTS `route_step_tool_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_tool_material` (
  `MATERIAL_ID` bigint NOT NULL,
  `ROUTE_STEP_ID` bigint NOT NULL,
  `TOOL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `UNITS` int NOT NULL,
  PRIMARY KEY (`MATERIAL_ID`,`ROUTE_STEP_ID`,`TOOL_ID`),
  KEY `FK_RSTM_ROUTE_STEP_TOOL` (`ROUTE_STEP_ID`,`TOOL_ID`),
  CONSTRAINT `FK_RSTM_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_RSTM_ROUTE_STEP_TOOL` FOREIGN KEY (`ROUTE_STEP_ID`, `TOOL_ID`) REFERENCES `route_step_tool` (`ROUTE_STEP_ID`, `TOOL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_tool_material`
--

LOCK TABLES `route_step_tool_material` WRITE;
/*!40000 ALTER TABLE `route_step_tool_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_tool_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_workstation`
--

DROP TABLE IF EXISTS `route_step_workstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_workstation` (
  `ROUTE_STEP_ID` bigint NOT NULL,
  `WORKSTATION_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CYCLE_TIME` decimal(19,2) DEFAULT NULL,
  `MAX_DOWNTIME` decimal(8,5) DEFAULT NULL,
  `MAX_OVERHEAD` decimal(8,5) DEFAULT NULL,
  `MAX_REJECTIONS` decimal(8,5) DEFAULT NULL,
  `MICROSTOP_TIME` decimal(19,2) DEFAULT NULL,
  `NUMBER_OF_EMPLOYEES` int DEFAULT NULL,
  `OEE` decimal(8,5) NOT NULL DEFAULT '1.00000',
  `POSITION` int NOT NULL DEFAULT '0',
  `STOP_TIME` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`ROUTE_STEP_ID`,`WORKSTATION_ID`),
  KEY `FK_ROUTE_STEP_WORKSTATION_WORKSTATION` (`WORKSTATION_ID`),
  CONSTRAINT `FK_ROUTE_STEP_WORKSTATION_ROUTE_STEP` FOREIGN KEY (`ROUTE_STEP_ID`) REFERENCES `route_step` (`ID`),
  CONSTRAINT `FK_ROUTE_STEP_WORKSTATION_WORKSTATION` FOREIGN KEY (`WORKSTATION_ID`) REFERENCES `asset_workstation` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_workstation`
--

LOCK TABLES `route_step_workstation` WRITE;
/*!40000 ALTER TABLE `route_step_workstation` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_workstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_workstation_param`
--

DROP TABLE IF EXISTS `route_step_workstation_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_workstation_param` (
  `ROUTE_STEP_ID` bigint NOT NULL,
  `WORKSTATION_ID` bigint NOT NULL,
  `WORKSTATION_PARAM_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ROUTE_STEP_ID`,`WORKSTATION_ID`,`WORKSTATION_PARAM_ID`),
  KEY `FK_RSWP_WORKSTATION_PARAM` (`WORKSTATION_PARAM_ID`),
  CONSTRAINT `FK_RSWP_ROUTE_STEP_WORKSTATION` FOREIGN KEY (`ROUTE_STEP_ID`, `WORKSTATION_ID`) REFERENCES `route_step_workstation` (`ROUTE_STEP_ID`, `WORKSTATION_ID`),
  CONSTRAINT `FK_RSWP_WORKSTATION_PARAM` FOREIGN KEY (`WORKSTATION_PARAM_ID`) REFERENCES `workstation_param` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_workstation_param`
--

LOCK TABLES `route_step_workstation_param` WRITE;
/*!40000 ALTER TABLE `route_step_workstation_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_workstation_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_step_workstation_tool`
--

DROP TABLE IF EXISTS `route_step_workstation_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_step_workstation_tool` (
  `ROUTE_STEP_ID` bigint NOT NULL,
  `WORKSTATION_ID` bigint NOT NULL,
  `TOOL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`ROUTE_STEP_ID`,`WORKSTATION_ID`,`TOOL_ID`),
  KEY `FK_RSWP_TOOL` (`TOOL_ID`),
  CONSTRAINT `FK_RSWP_TOOL` FOREIGN KEY (`TOOL_ID`) REFERENCES `asset_tool` (`ASSET_ID`),
  CONSTRAINT `FK_RSWT_ROUTE_STEP_WORKSTATION` FOREIGN KEY (`ROUTE_STEP_ID`, `WORKSTATION_ID`) REFERENCES `route_step_workstation` (`ROUTE_STEP_ID`, `WORKSTATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_step_workstation_tool`
--

LOCK TABLES `route_step_workstation_tool` WRITE;
/*!40000 ALTER TABLE `route_step_workstation_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_step_workstation_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap_type`
--

DROP TABLE IF EXISTS `scrap_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap_type` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_SCRAP_TYPE_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_SCRAP_TYPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap_type`
--

LOCK TABLES `scrap_type` WRITE;
/*!40000 ALTER TABLE `scrap_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap_type_family`
--

DROP TABLE IF EXISTS `scrap_type_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap_type_family` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IMAGE_UUID` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_SCRAP_TYPE_FAMILY_NAME` (`CLIENT_ID`,`NAME`),
  KEY `FK_SCRAP_TYPE_FAMILY_PARENT` (`PARENT_ID`),
  CONSTRAINT `FK_SCRAP_TYPE_FAMILY_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_SCRAP_TYPE_FAMILY_PARENT` FOREIGN KEY (`PARENT_ID`) REFERENCES `scrap_type_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap_type_family`
--

LOCK TABLES `scrap_type_family` WRITE;
/*!40000 ALTER TABLE `scrap_type_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap_type_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap_type_family_material`
--

DROP TABLE IF EXISTS `scrap_type_family_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap_type_family_material` (
  `MATERIAL_ID` bigint NOT NULL,
  `SCRAP_TYPE_FAMILY_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`MATERIAL_ID`,`SCRAP_TYPE_FAMILY_ID`),
  KEY `FK_STFM_SCRAP_TYPE_FAMILY` (`SCRAP_TYPE_FAMILY_ID`),
  CONSTRAINT `FK_STFM_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_STFM_SCRAP_TYPE_FAMILY` FOREIGN KEY (`SCRAP_TYPE_FAMILY_ID`) REFERENCES `scrap_type_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap_type_family_material`
--

LOCK TABLES `scrap_type_family_material` WRITE;
/*!40000 ALTER TABLE `scrap_type_family_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap_type_family_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap_type_family_material_family`
--

DROP TABLE IF EXISTS `scrap_type_family_material_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap_type_family_material_family` (
  `MATERIAL_FAMILY_ID` bigint NOT NULL,
  `SCRAP_TYPE_FAMILY_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`MATERIAL_FAMILY_ID`,`SCRAP_TYPE_FAMILY_ID`),
  KEY `FK_STFMF_SCRAP_TYPE_FAMILY` (`SCRAP_TYPE_FAMILY_ID`),
  CONSTRAINT `FK_STFMF_MATERIAL_FAMILY` FOREIGN KEY (`MATERIAL_FAMILY_ID`) REFERENCES `material_family` (`ID`),
  CONSTRAINT `FK_STFMF_SCRAP_TYPE_FAMILY` FOREIGN KEY (`SCRAP_TYPE_FAMILY_ID`) REFERENCES `scrap_type_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap_type_family_material_family`
--

LOCK TABLES `scrap_type_family_material_family` WRITE;
/*!40000 ALTER TABLE `scrap_type_family_material_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap_type_family_material_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap_type_material`
--

DROP TABLE IF EXISTS `scrap_type_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap_type_material` (
  `MATERIAL_ID` bigint NOT NULL,
  `SCRAP_TYPE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`MATERIAL_ID`,`SCRAP_TYPE_ID`),
  KEY `FK_STM_SCRAP_TYPE` (`SCRAP_TYPE_ID`),
  CONSTRAINT `FK_STM_MATERIAL` FOREIGN KEY (`MATERIAL_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `FK_STM_SCRAP_TYPE` FOREIGN KEY (`SCRAP_TYPE_ID`) REFERENCES `scrap_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap_type_material`
--

LOCK TABLES `scrap_type_material` WRITE;
/*!40000 ALTER TABLE `scrap_type_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap_type_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap_type_material_family`
--

DROP TABLE IF EXISTS `scrap_type_material_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap_type_material_family` (
  `MATERIAL_FAMILY_ID` bigint NOT NULL,
  `SCRAP_TYPE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`MATERIAL_FAMILY_ID`,`SCRAP_TYPE_ID`),
  KEY `FK_STMF_SCRAP_TYPE` (`SCRAP_TYPE_ID`),
  CONSTRAINT `FK_STMF_MATERIAL_FAMILY` FOREIGN KEY (`MATERIAL_FAMILY_ID`) REFERENCES `material_family` (`ID`),
  CONSTRAINT `FK_STMF_SCRAP_TYPE` FOREIGN KEY (`SCRAP_TYPE_ID`) REFERENCES `scrap_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap_type_material_family`
--

LOCK TABLES `scrap_type_material_family` WRITE;
/*!40000 ALTER TABLE `scrap_type_material_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap_type_material_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrap_type_membership`
--

DROP TABLE IF EXISTS `scrap_type_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scrap_type_membership` (
  `SCRAP_TYPE_FAMILY_ID` bigint NOT NULL,
  `SCRAP_TYPE_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `TOLERANCE` decimal(8,5) NOT NULL,
  PRIMARY KEY (`SCRAP_TYPE_FAMILY_ID`,`SCRAP_TYPE_ID`),
  KEY `FK_SCRAP_TYPE_MEMBERSHIP_SCRAP_TYPE` (`SCRAP_TYPE_ID`),
  CONSTRAINT `FK_SCRAP_TYPE_MEMBERSHIP_SCRAP_TYPE` FOREIGN KEY (`SCRAP_TYPE_ID`) REFERENCES `scrap_type` (`ID`),
  CONSTRAINT `FK_SCRAP_TYPE_MEMBERSHIP_SCRAP_TYPE_FAMILY` FOREIGN KEY (`SCRAP_TYPE_FAMILY_ID`) REFERENCES `scrap_type_family` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrap_type_membership`
--

LOCK TABLES `scrap_type_membership` WRITE;
/*!40000 ALTER TABLE `scrap_type_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap_type_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_SECTOR_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_SECTOR_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortened_url`
--

DROP TABLE IF EXISTS `shortened_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortened_url` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `CODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `COUNTER` int NOT NULL,
  `EXPIRATED_AT` datetime(6) DEFAULT NULL,
  `LAST_ACCESS_AT` datetime(6) DEFAULT NULL,
  `URL` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_CODE` (`CODE`),
  UNIQUE KEY `UIDX_URL` (`URL`),
  KEY `FK_URL_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_URL_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortened_url`
--

LOCK TABLES `shortened_url` WRITE;
/*!40000 ALTER TABLE `shortened_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `shortened_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stop_type`
--

DROP TABLE IF EXISTS `stop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop_type` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_STOP_TYPE_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_STOP_TYPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop_type`
--

LOCK TABLES `stop_type` WRITE;
/*!40000 ALTER TABLE `stop_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `stop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `COLOR` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_TAG_NAME` (`NAME`),
  KEY `FK_TAG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_TAG_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_interval`
--

DROP TABLE IF EXISTS `time_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_interval` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `COLOR` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DURATION` bigint NOT NULL,
  `FROM_TIME` time NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `TIME_ZONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  `TIME_INTERVAL_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_TIME_INTERVAL_NAME` (`CLIENT_ID`,`NAME`),
  KEY `FK_TIME_INTERVAL_TYPE` (`TIME_INTERVAL_TYPE_ID`),
  CONSTRAINT `FK_TIME_INTERVAL_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_TIME_INTERVAL_TYPE` FOREIGN KEY (`TIME_INTERVAL_TYPE_ID`) REFERENCES `time_interval_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_interval`
--

LOCK TABLES `time_interval` WRITE;
/*!40000 ALTER TABLE `time_interval` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_interval_type`
--

DROP TABLE IF EXISTS `time_interval_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_interval_type` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `EXTERNAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_PRODUCTIVE` bit(1) NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_TIME_INTERVAL_TYPE_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_TIME_INTERVAL_TYPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_interval_type`
--

LOCK TABLES `time_interval_type` WRITE;
/*!40000 ALTER TABLE `time_interval_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_interval_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_candidate`
--

DROP TABLE IF EXISTS `tool_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_candidate` (
  `CANDIDATE_ID` bigint NOT NULL,
  `TOOL_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`CANDIDATE_ID`,`TOOL_ID`),
  KEY `FK_TOOL_CANDIDATE_TOOL` (`TOOL_ID`),
  CONSTRAINT `FK_TOOL_CANDIDATE_CANDIDATE` FOREIGN KEY (`CANDIDATE_ID`) REFERENCES `asset_tool` (`ASSET_ID`),
  CONSTRAINT `FK_TOOL_CANDIDATE_TOOL` FOREIGN KEY (`TOOL_ID`) REFERENCES `asset_tool` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_candidate`
--

LOCK TABLES `tool_candidate` WRITE;
/*!40000 ALTER TABLE `tool_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workstation_param`
--

DROP TABLE IF EXISTS `workstation_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_param` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DEFAULT_VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `MANDATORY` bit(1) NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CUSTOM_CONTROL_ID` bigint NOT NULL,
  `WORKSTATION_PARAM_TYPE_ID` bigint NOT NULL,
  `WORKSTATION_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_WORKSTATION_PARAM_NAME` (`WORKSTATION_ID`,`NAME`),
  KEY `FK_WORKSTATION_PARAM_CUSTOM_CONTROL` (`CUSTOM_CONTROL_ID`),
  KEY `FK_WORKSTATION_PARAM_TYPE` (`WORKSTATION_PARAM_TYPE_ID`),
  CONSTRAINT `FK_WORKSTATION_PARAM_CUSTOM_CONTROL` FOREIGN KEY (`CUSTOM_CONTROL_ID`) REFERENCES `custom_control` (`ID`),
  CONSTRAINT `FK_WORKSTATION_PARAM_TYPE` FOREIGN KEY (`WORKSTATION_PARAM_TYPE_ID`) REFERENCES `workstation_param_type` (`ID`),
  CONSTRAINT `FK_WORKSTATION_PARAM_WORKSTATION` FOREIGN KEY (`WORKSTATION_ID`) REFERENCES `asset_workstation` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workstation_param`
--

LOCK TABLES `workstation_param` WRITE;
/*!40000 ALTER TABLE `workstation_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `workstation_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workstation_param_type`
--

DROP TABLE IF EXISTS `workstation_param_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_param_type` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UIDX_WORKSTATION_PARAM_TYPE_NAME` (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK_WORKSTATION_PARAM_TYPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workstation_param_type`
--

LOCK TABLES `workstation_param_type` WRITE;
/*!40000 ALTER TABLE `workstation_param_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `workstation_param_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workstation_procedure`
--

DROP TABLE IF EXISTS `workstation_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_procedure` (
  `PROCEDURE_ID` bigint NOT NULL,
  `WORKSTATION_ID` bigint NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `CREATED_AT` datetime(6) NOT NULL,
  `MODIFIED_AT` datetime(6) NOT NULL,
  `MODIFIED_BY` bigint DEFAULT NULL,
  `VERSION_LOCK` int NOT NULL,
  PRIMARY KEY (`PROCEDURE_ID`,`WORKSTATION_ID`),
  KEY `FK_PROCEDURE_CANDIDATE_WORKSTATION` (`WORKSTATION_ID`),
  CONSTRAINT `FK_PROCEDURE_CANDIDATE_PROCEDURE` FOREIGN KEY (`PROCEDURE_ID`) REFERENCES `route_procedure` (`ID`),
  CONSTRAINT `FK_PROCEDURE_CANDIDATE_WORKSTATION` FOREIGN KEY (`WORKSTATION_ID`) REFERENCES `asset_workstation` (`ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workstation_procedure`
--

LOCK TABLES `workstation_procedure` WRITE;
/*!40000 ALTER TABLE `workstation_procedure` DISABLE KEYS */;
/*!40000 ALTER TABLE `workstation_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'my_factory'
--

--
-- Final view structure for view `asset_user_group_view`
--

/*!50001 DROP VIEW IF EXISTS `asset_user_group_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`snc`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `asset_user_group_view` AS with recursive `asset_user_group_effective` as (select `asset_union`.`ASSET_ID` AS `ASSET_ID`,`asset_union`.`ASSET_CODE` AS `ASSET_CODE`,`asset_union`.`ASSET_PARENT_ID` AS `ASSET_PARENT_ID`,group_concat(`aug`.`USER_GROUP_ID` separator ',') AS `USER_GROUP_IDS` from ((select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,NULL AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_factory` `af` on((`a`.`ID` = `af`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,`a_s`.`FACTORY_ID` AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_section` `a_s` on((`a`.`ID` = `a_s`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,`apl`.`SECTION_ID` AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_production_line` `apl` on((`a`.`ID` = `apl`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,(case when (`aw`.`PARENT_ID` is null) then `aw`.`PRODUCTION_LINE_ID` else `aw`.`PARENT_ID` end) AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_workstation` `aw` on((`a`.`ID` = `aw`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,`at`.`PARENT_ID` AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_tool` `at` on((`a`.`ID` = `at`.`ASSET_ID`)))) `asset_union` left join `asset_user_group` `aug` on((`asset_union`.`ASSET_ID` = `aug`.`ASSET_ID`))) group by `asset_union`.`ASSET_ID`,`asset_union`.`ASSET_CODE`,`asset_union`.`ASSET_PARENT_ID` having (`asset_union`.`ASSET_PARENT_ID` is null) union all select `augv`.`ASSET_ID` AS `ASSET_ID`,`augv`.`ASSET_CODE` AS `ASSET_CODE`,`augv`.`ASSET_PARENT_ID` AS `ASSET_PARENT_ID`,concat_ws(',',`augv`.`USER_GROUP_IDS`,`auge`.`USER_GROUP_IDS`) AS `concat_ws(',', augv.USER_GROUP_IDS, auge.USER_GROUP_IDS)` from ((select `asset_union`.`ASSET_ID` AS `ASSET_ID`,`asset_union`.`ASSET_CODE` AS `ASSET_CODE`,`asset_union`.`ASSET_PARENT_ID` AS `ASSET_PARENT_ID`,group_concat(`aug`.`USER_GROUP_ID` separator ',') AS `USER_GROUP_IDS` from ((select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,NULL AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_factory` `af` on((`a`.`ID` = `af`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,`a_s`.`FACTORY_ID` AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_section` `a_s` on((`a`.`ID` = `a_s`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,`apl`.`SECTION_ID` AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_production_line` `apl` on((`a`.`ID` = `apl`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,(case when (`aw`.`PARENT_ID` is null) then `aw`.`PRODUCTION_LINE_ID` else `aw`.`PARENT_ID` end) AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_workstation` `aw` on((`a`.`ID` = `aw`.`ASSET_ID`))) union select `a`.`ID` AS `ASSET_ID`,`a`.`CODE` AS `ASSET_CODE`,`at`.`PARENT_ID` AS `ASSET_PARENT_ID` from (`asset` `a` join `asset_tool` `at` on((`a`.`ID` = `at`.`ASSET_ID`)))) `asset_union` left join `asset_user_group` `aug` on((`asset_union`.`ASSET_ID` = `aug`.`ASSET_ID`))) group by `asset_union`.`ASSET_ID`,`asset_union`.`ASSET_CODE`,`asset_union`.`ASSET_PARENT_ID`) `augv` join `asset_user_group_effective` `auge` on((`augv`.`ASSET_PARENT_ID` = `auge`.`ASSET_ID`)))) select `asset_user_group_effective`.`ASSET_ID` AS `ASSET_ID`,`asset_user_group_effective`.`ASSET_CODE` AS `ASSET_CODE`,`asset_user_group_effective`.`ASSET_PARENT_ID` AS `ASSET_PARENT_ID`,`asset_user_group_effective`.`USER_GROUP_IDS` AS `USER_GROUP_IDS` from `asset_user_group_effective` where ((`asset_user_group_effective`.`USER_GROUP_IDS` is not null) and (`asset_user_group_effective`.`USER_GROUP_IDS` <> '')) order by `asset_user_group_effective`.`ASSET_ID` */;
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

-- Dump completed on 2024-07-03  8:02:33
