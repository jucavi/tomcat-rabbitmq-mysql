-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: snc_security_db
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
-- Table structure for table `application`
--
CREATE DATABASE IF NOT EXISTS snc_security_db;
USE snc_security_db;

DROP TABLE IF EXISTS `application`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `application` (
        `ID` bigint NOT NULL AUTO_INCREMENT,
        `ACTIVE` bit (1) NOT NULL,
        `DATE_INS` datetime (6) NOT NULL,
        `DATE_MODIF` datetime (6) DEFAULT NULL,
        `VERSION_LOCK` int NOT NULL,
        `NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `DESCRIPTION` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `DISPLAY_NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--
LOCK TABLES `application` WRITE;

/*!40000 ALTER TABLE `application` DISABLE KEYS */;

INSERT INTO
    `application`
VALUES
    (
        1,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        'SecuritySuite',
        NULL,
        'Seguridad'
    ),
    (
        2,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        'VisualTracking',
        NULL,
        'Visual Tracking'
    ),
    (
        3,
        _binary '',
        '2020-03-25 16:35:25.000000',
        NULL,
        0,
        'EMISuiteLauncher',
        NULL,
        'EMI Suite Launcher'
    ),
    (
        4,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'DigitalPeople',
        NULL,
        'Digital People'
    ),
    (
        5,
        _binary '',
        '2020-08-04 00:00:00.000000',
        NULL,
        0,
        'FastMonitoring',
        NULL,
        'Fast Monitoring'
    ),
    (
        6,
        _binary '',
        '2020-08-04 00:00:00.000000',
        NULL,
        0,
        'emi_daemon',
        NULL,
        'emi_daemon'
    ),
    (
        7,
        _binary '',
        '2020-08-10 00:00:00.000000',
        NULL,
        0,
        'AndonBoards',
        NULL,
        'Andon Boards'
    ),
    (
        8,
        _binary '',
        '2020-08-18 05:17:42.000000',
        NULL,
        0,
        'BOM',
        NULL,
        'BOM'
    ),
    (
        9,
        _binary '',
        '2020-09-18 05:17:06.000000',
        NULL,
        0,
        'SGA',
        NULL,
        'SGA'
    ),
    (
        10,
        _binary '',
        '2020-01-01 00:00:00.000000',
        NULL,
        0,
        'MyFactory',
        NULL,
        'My Factory'
    ),
    (
        11,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        'EasyGMAO',
        NULL,
        'Easy GMAO'
    );

/*!40000 ALTER TABLE `application` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `application_to_role`
--
DROP TABLE IF EXISTS `application_to_role`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `application_to_role` (
        `APPLICATION` bigint NOT NULL,
        `ROLE` bigint NOT NULL,
        PRIMARY KEY (`APPLICATION`, `ROLE`),
        KEY `FK_ATR_ROLE` (`ROLE`),
        CONSTRAINT `FK_ATR_APPLICATION` FOREIGN KEY (`APPLICATION`) REFERENCES `application` (`ID`),
        CONSTRAINT `FK_ATR_ROLE` FOREIGN KEY (`ROLE`) REFERENCES `role` (`ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_to_role`
--
LOCK TABLES `application_to_role` WRITE;

/*!40000 ALTER TABLE `application_to_role` DISABLE KEYS */;

/*!40000 ALTER TABLE `application_to_role` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `authentication`
--
DROP TABLE IF EXISTS `authentication`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `authentication` (
        `AUTH_ID` bigint NOT NULL AUTO_INCREMENT,
        `ACTIVE` bit (1) NOT NULL,
        `DATE_INS` datetime (6) NOT NULL,
        `DATE_MODIF` datetime (6) DEFAULT NULL,
        `VERSION_LOCK` int NOT NULL,
        `MAX_ATTEMPTS` int DEFAULT NULL,
        `SEC_USER` bigint NOT NULL,
        PRIMARY KEY (`AUTH_ID`),
        KEY `FK_AUTH_USER` (`SEC_USER`),
        CONSTRAINT `FK_AUTH_USER` FOREIGN KEY (`SEC_USER`) REFERENCES `user` (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1374 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication`
--
LOCK TABLES `authentication` WRITE;

/*!40000 ALTER TABLE `authentication` DISABLE KEYS */;

INSERT INTO
    `authentication`
VALUES
    (
        129,
        _binary '',
        '2020-08-04 08:57:23.879152',
        NULL,
        93,
        NULL,
        114
    ),
    (
        972,
        _binary '',
        '2023-01-13 09:21:43.896948',
        NULL,
        1,
        NULL,
        834
    ),
    (
        973,
        _binary '',
        '2023-01-13 09:21:43.894950',
        NULL,
        1,
        NULL,
        834
    );

/*!40000 ALTER TABLE `authentication` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `code`
--
DROP TABLE IF EXISTS `code`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `code` (
        `CODE` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `AUTH_ID` bigint NOT NULL,
            PRIMARY KEY (`AUTH_ID`),
            UNIQUE KEY `UK_olxdd57rej13wy2inue0qlcqu` (`CODE`),
            CONSTRAINT `FK_CODE_AUTHENTICATION` FOREIGN KEY (`AUTH_ID`) REFERENCES `authentication` (`AUTH_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--
LOCK TABLES `code` WRITE;

/*!40000 ALTER TABLE `code` DISABLE KEYS */;

INSERT INTO
    `code`
VALUES
    ('7468B', 972);

/*!40000 ALTER TABLE `code` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `ldap`
--
DROP TABLE IF EXISTS `ldap`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `ldap` (
        `USERNAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `AUTH_ID` bigint NOT NULL,
            PRIMARY KEY (`AUTH_ID`),
            CONSTRAINT `FK_LDAP_AUTHENTICATION` FOREIGN KEY (`AUTH_ID`) REFERENCES `authentication` (`AUTH_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldap`
--
LOCK TABLES `ldap` WRITE;

/*!40000 ALTER TABLE `ldap` DISABLE KEYS */;

/*!40000 ALTER TABLE `ldap` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `module`
--
DROP TABLE IF EXISTS `module`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `module` (
        `ID` bigint NOT NULL AUTO_INCREMENT,
        `ACTIVE` bit (1) NOT NULL,
        `DATE_INS` datetime (6) NOT NULL,
        `DATE_MODIF` datetime (6) DEFAULT NULL,
        `VERSION_LOCK` int NOT NULL,
        `DESCRIPTION` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `DISPLAY_NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `application_ID` bigint NOT NULL,
            PRIMARY KEY (`ID`),
            KEY `FK_MODULE_APPLICATION` (`application_ID`),
            CONSTRAINT `FK_MODULE_APPLICATION` FOREIGN KEY (`application_ID`) REFERENCES `application` (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 122 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--
LOCK TABLES `module` WRITE;

/*!40000 ALTER TABLE `module` DISABLE KEYS */;

INSERT INTO
    `module`
VALUES
    (
        1,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Usuarios',
        'SNC_Users',
        1
    ),
    (
        3,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Permisos',
        'SNC_Permissions',
        1
    ),
    (
        5,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Roles',
        'SNC_Roles',
        1
    ),
    (
        8,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Grupos de usuarios',
        'SNC_UsersGroups',
        1
    ),
    (
        12,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'LDAP',
        'SNC_LDAP',
        1
    ),
    (
        13,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Métodos de autenticación',
        'SNC_AuthenticationMethods',
        1
    ),
    (
        15,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Aplicaciones',
        'SNC_Applications',
        1
    ),
    (
        16,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Módulos',
        'SNC_Modules',
        1
    ),
    (
        18,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Modelado',
        'VT_Modelling',
        2
    ),
    (
        19,
        _binary '',
        '2020-02-13 11:23:08.119000',
        NULL,
        0,
        'Administration section',
        'Administration',
        'admin',
        2
    ),
    (
        20,
        _binary '',
        '2020-02-14 14:38:19.315000',
        NULL,
        0,
        'Lead in Visual Tracking',
        'Lead',
        'vt_lead',
        2
    ),
    (
        21,
        _binary '',
        '2020-02-18 16:21:04.823000',
        NULL,
        0,
        'Budget in Visual Tracking',
        'Budget',
        'vt_budget',
        2
    ),
    (
        22,
        _binary '',
        '2020-02-18 16:22:59.286000',
        NULL,
        0,
        'Validation in Visual Tracking',
        'Validation',
        'vt_validation',
        2
    ),
    (
        23,
        _binary '',
        '2020-02-20 16:29:16.708000',
        NULL,
        0,
        'Create new item in Visual Tracking',
        'Create New Item',
        'newItem',
        2
    ),
    (
        24,
        _binary '',
        '2020-02-20 16:29:46.019000',
        NULL,
        0,
        'Clients Management section in Visual Tracking',
        'Clients Management',
        'clientsManagment',
        2
    ),
    (
        26,
        _binary '',
        '2020-02-25 16:41:22.703000',
        NULL,
        0,
        'VT Certification',
        'VT Certification',
        'vt_certification',
        2
    ),
    (
        27,
        _binary '',
        '2020-02-25 16:41:56.006000',
        NULL,
        0,
        'VT Scheduling',
        'VT Scheduling',
        'vt_scheduling',
        2
    ),
    (
        28,
        _binary '',
        '2020-02-26 11:44:23.547000',
        NULL,
        0,
        'Work Order',
        'Work Order',
        'workOrder',
        2
    ),
    (
        29,
        _binary '',
        '2020-02-26 11:44:23.547000',
        NULL,
        0,
        'Item Historic',
        'Item Historic',
        'itemHistoric',
        2
    ),
    (
        30,
        _binary '',
        '2020-03-25 16:35:39.000000',
        NULL,
        0,
        'Administration area',
        'Administration',
        'Administration',
        3
    ),
    (
        31,
        _binary '',
        '2020-04-22 10:00:00.000000',
        NULL,
        0,
        'Order in Visual Tracking',
        'Order',
        'vt_order',
        2
    ),
    (
        32,
        _binary '',
        '2020-05-19 11:00:00.000000',
        NULL,
        0,
        'Manufacturing in Visual Tracking',
        'Manufacturing',
        'vt_manufacturing',
        2
    ),
    (
        33,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Empleados',
        'People',
        4
    ),
    (
        34,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Responsable',
        'Responsible',
        4
    ),
    (
        35,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Solicitudes',
        'Requests',
        4
    ),
    (
        36,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Área de gestión',
        'Management',
        4
    ),
    (
        37,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Organizaciones',
        'Company',
        4
    ),
    (
        38,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Formaciones',
        'Training',
        4
    ),
    (
        39,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Aptos médicos',
        'HealthCheckup',
        4
    ),
    (
        40,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Cualificaciones',
        'Qualification',
        4
    ),
    (
        41,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Calendarios',
        'Calendars',
        4
    ),
    (
        42,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Matriz de polivalencia',
        'PolyvalenceMatrix',
        4
    ),
    (
        43,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Administración',
        'Administration',
        4
    ),
    (
        44,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Gestión de días de vacaciones',
        'PersonRemainingTime',
        4
    ),
    (
        45,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Propuestas de Contratación',
        'ContractProposal',
        4
    ),
    (
        46,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Aprobaciones de solicitudes',
        'ResponsibleRequest',
        4
    ),
    (
        48,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        NULL,
        'employee_sync',
        'employee_sync',
        6
    ),
    (
        49,
        _binary '',
        '2020-08-18 05:20:28.000000',
        NULL,
        0,
        'References',
        'Referencias',
        'References',
        8
    ),
    (
        50,
        _binary '',
        '2020-08-18 05:20:31.000000',
        NULL,
        0,
        'Roadmaps',
        'Hojas de ruta',
        'Roadmaps',
        8
    ),
    (
        51,
        _binary '',
        '2020-08-18 05:20:34.000000',
        NULL,
        0,
        'Management',
        'Gestión',
        'Management',
        8
    ),
    (
        52,
        _binary '',
        '2020-08-18 05:20:38.000000',
        NULL,
        0,
        'Colorants',
        'Colorantes',
        'Colorants',
        8
    ),
    (
        53,
        _binary '',
        '2020-08-18 05:20:42.000000',
        NULL,
        0,
        'Inserts',
        'Insertos',
        'Inserts',
        8
    ),
    (
        54,
        _binary '',
        '2020-08-18 05:20:46.000000',
        NULL,
        0,
        'Raw materials',
        'Materias primas',
        'RawMaterials',
        8
    ),
    (
        55,
        _binary '',
        '2020-08-18 05:20:49.000000',
        NULL,
        0,
        'Packagings',
        'Embalajes',
        'Packagings',
        8
    ),
    (
        56,
        _binary '',
        '2020-08-18 05:20:54.000000',
        NULL,
        0,
        'Molds',
        'Moldes',
        'Molds',
        8
    ),
    (
        57,
        _binary '',
        '2020-08-18 05:20:58.000000',
        NULL,
        0,
        'Building materials',
        'Útiles de fabricación',
        'BuildingMaterials',
        8
    ),
    (
        58,
        _binary '',
        '2020-08-18 05:21:02.000000',
        NULL,
        0,
        'Machines',
        'Máquinas',
        'Machines',
        8
    ),
    (
        59,
        _binary '',
        '2020-08-18 05:21:05.000000',
        NULL,
        0,
        'Administration',
        'Administración',
        'Administration',
        8
    ),
    (
        60,
        _binary '',
        '2020-08-27 13:45:05.000000',
        NULL,
        0,
        'Menu de Informes',
        'Informes',
        'vt_Reports',
        2
    ),
    (
        61,
        _binary '',
        '2020-09-18 05:18:10.000000',
        NULL,
        0,
        'Labeling',
        'Etiquetado',
        'Labeling',
        9
    ),
    (
        62,
        _binary '',
        '2020-09-18 05:18:13.000000',
        NULL,
        0,
        'Arrivals',
        'Entradas',
        'Arrivals',
        9
    ),
    (
        63,
        _binary '',
        '2020-09-18 05:18:16.000000',
        NULL,
        0,
        'Departures',
        'Salidas',
        'Departures',
        9
    ),
    (
        64,
        _binary '',
        '2020-09-18 05:18:20.000000',
        NULL,
        0,
        'Locations',
        'Localizaciones',
        'Locations',
        9
    ),
    (
        65,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Asignación',
        'assignment',
        2
    ),
    (
        66,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Sequencer',
        'Secuenciador',
        'sequencer',
        2
    ),
    (
        67,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Generator OF',
        'Generator OF',
        'generatorOf',
        2
    ),
    (
        68,
        _binary '',
        '2020-12-09 15:32:15.923682',
        NULL,
        0,
        'Gestión de nóminas de empleados',
        'Nóminas',
        'Payrolls',
        4
    ),
    (
        69,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Gestión de trabajos',
        'GMAO_Task_Management',
        11
    ),
    (
        70,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Históricos',
        'GMAO_Historics',
        11
    ),
    (
        71,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Indicadores',
        'GMAO_Indicators',
        11
    ),
    (
        72,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Gestión',
        'GMAO_Management',
        11
    ),
    (
        73,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Peticiones',
        'GMAO_Request',
        11
    ),
    (
        74,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Operador',
        'GMAO_Operator',
        11
    ),
    (
        75,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Responsable',
        'GMAO_Responsible',
        11
    ),
    (
        76,
        _binary '',
        '2021-02-16 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Gamas',
        'GMAO_Gamut',
        11
    ),
    (
        77,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Gestión',
        'EASY_GMAO_MANAGEMENT',
        11
    ),
    (
        78,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Responsable',
        'EASY_GMAO_RESPONSIBLE',
        11
    ),
    (
        79,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Operario',
        'EASY_GMAO_OPERATOR',
        11
    ),
    (
        80,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Repuestos',
        'EASY_GMAO_CONSUMABLES',
        11
    ),
    (
        81,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Informes',
        'EASY_GMAO_REPORTS',
        11
    ),
    (
        82,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Configuración',
        'EASY_GMAO_CONFIGURATION',
        11
    ),
    (
        83,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Peticiones',
        'EASY_GMAO_REQUESTS',
        11
    ),
    (
        84,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        0,
        'Gestión general de control de fichajes de los empleados',
        'Control de fichajes',
        'DP_Records',
        4
    ),
    (
        85,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        0,
        'Gestión de control de horas de los empleados',
        'Control de horas',
        'DP_TimeControl',
        4
    ),
    (
        86,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        0,
        'Gestión de las bolsas de horas de los empleados',
        'Bolsas de horas',
        'DP_HourBags',
        4
    ),
    (
        90,
        _binary '',
        '2020-04-22 10:00:00.000000',
        NULL,
        0,
        'Order OT in Visual Tracking',
        'Order OT',
        'order_ot',
        2
    ),
    (
        91,
        _binary '',
        '2021-07-22 10:20:21.000000',
        NULL,
        0,
        'Calidad en Visual Tracking',
        'Calidad',
        'vt_quality',
        2
    ),
    (
        92,
        _binary '',
        '2021-07-22 10:20:21.000000',
        NULL,
        0,
        'Valoración en Visual Tracking',
        'Valoración',
        'vt_valuation',
        2
    ),
    (
        93,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Peticiones',
        'VISUAL_SGA_REQUESTS',
        9
    ),
    (
        94,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'InputsOutputs',
        'VISUAL_SGA_INPUTS_OUTPUTS',
        9
    ),
    (
        95,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Administrador',
        'VISUAL_SGA_ADMINISTRATOR',
        9
    ),
    (
        96,
        _binary '',
        '2021-03-25 00:00:00.000000',
        '2021-03-25 00:00:00.000000',
        1,
        NULL,
        'TPM',
        'EASY_GMAO_TPM',
        11
    ),
    (
        98,
        _binary '',
        '2021-07-22 10:20:21.000000',
        NULL,
        0,
        'Vista de certificación horas operario',
        'Certificación horas operario',
        'vt_certificationOperatorHour',
        2
    ),
    (
        99,
        _binary '',
        '2023-05-09 12:53:09.000000',
        '2023-05-09 12:53:09.000000',
        0,
        'Portal de información y noticias',
        'Portal',
        'DP_Portal',
        4
    ),
    (
        100,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ficha del empleado',
        'Ficha empleado',
        'DP_EmployeeProfile',
        4
    ),
    (
        101,
        _binary '',
        '2021-07-22 10:20:21.000000',
        NULL,
        0,
        'Vista de certificación de progreso',
        'Certificación de progreso',
        'vt_certificationProgress',
        2
    ),
    (
        102,
        _binary '',
        '2021-07-22 10:20:21.000000',
        NULL,
        0,
        'Modulo panel de operario',
        'Panel de operario',
        'vt_operatorPanel',
        2
    ),
    (
        103,
        _binary '',
        '2023-07-12 06:24:26.765000',
        NULL,
        0,
        'Modulo de responsables',
        'Responsables',
        'vt_responsibles',
        2
    ),
    (
        104,
        _binary '',
        '2023-08-01 06:17:59.000000',
        '2023-08-01 06:17:59.000000',
        0,
        'Buzón de sugerencias, denuncias y peticiones',
        'Buzón',
        'DP_Propositions',
        4
    ),
    (
        106,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'VisualTracking',
        'VisualTracking',
        3
    ),
    (
        107,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'DigitalPeople',
        'DigitalPeople',
        3
    ),
    (
        108,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'FastMonitoring',
        'FastMonitoring',
        3
    ),
    (
        110,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'AndonBoards',
        'AndonBoards',
        3
    ),
    (
        112,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'SGA',
        'SGA',
        3
    ),
    (
        113,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'MyFactory',
        'MyFactory',
        3
    ),
    (
        114,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'EasyGMAO',
        'EasyGMAO',
        3
    ),
    (
        115,
        _binary '',
        '2023-09-08 00:00:00.000000',
        NULL,
        0,
        NULL,
        'General',
        'GEN',
        10
    ),
    (
        116,
        _binary '',
        '2023-09-11 13:14:18.797000',
        NULL,
        0,
        'Vista de seguimiento de operarios',
        'Parte de actividad',
        'vt_activityReport',
        2
    ),
    (
        117,
        _binary '',
        '2023-09-20 11:22:11.473000',
        NULL,
        0,
        'Avanzar, Cerrar y Pinnear ordenes',
        'Ordenes',
        'vt_item',
        2
    ),
    (
        118,
        _binary '',
        '2024-03-13 16:46:00.000000',
        NULL,
        0,
        'Pestañas de seguimiento',
        'Seguimiento',
        'vt_monitoring',
        2
    );

/*!40000 ALTER TABLE `module` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `open_id`
--
DROP TABLE IF EXISTS `open_id`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `open_id` (
        `EMAIL` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `OPENID_TYPE` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `UNIQUE_USER_ID` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `AUTH_ID` bigint NOT NULL,
            PRIMARY KEY (`AUTH_ID`),
            CONSTRAINT `FK_OPEN_ID_AUTHENTICATION` FOREIGN KEY (`AUTH_ID`) REFERENCES `authentication` (`AUTH_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id`
--
LOCK TABLES `open_id` WRITE;

/*!40000 ALTER TABLE `open_id` DISABLE KEYS */;

/*!40000 ALTER TABLE `open_id` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `password`
--
DROP TABLE IF EXISTS `password`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `password` (
        `PASSWORD` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `AUTH_ID` bigint NOT NULL,
            PRIMARY KEY (`AUTH_ID`),
            CONSTRAINT `FK_PASSWORD_AUTHENTICATION` FOREIGN KEY (`AUTH_ID`) REFERENCES `authentication` (`AUTH_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--
LOCK TABLES `password` WRITE;

/*!40000 ALTER TABLE `password` DISABLE KEYS */;

INSERT INTO
    `password`
VALUES
    (
        '$2a$10$SK4HlFDV8vkzWO458BezgOM.JnPM6q32PuT7u/Fgtp6y8EVpOODJy',
        129
    ),
    (
        '$2a$10$x56rFNoH9qAtzrdaJ5jfDOyiXNQhztQly5h727ROpeE1zBZcxyuFS',
        973
    );

/*!40000 ALTER TABLE `password` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `permission`
--
DROP TABLE IF EXISTS `permission`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `permission` (
        `ID` bigint NOT NULL AUTO_INCREMENT,
        `ACTIVE` bit (1) NOT NULL,
        `DATE_INS` datetime (6) NOT NULL,
        `DATE_MODIF` datetime (6) DEFAULT NULL,
        `VERSION_LOCK` int NOT NULL,
        `DESCRIPTION` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `DISPLAY_NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `MODULE` bigint NOT NULL,
            PRIMARY KEY (`ID`),
            KEY `FK_PERMISSION_MODULE` (`MODULE`),
            CONSTRAINT `FK_PERMISSION_MODULE` FOREIGN KEY (`MODULE`) REFERENCES `module` (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 403 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--
LOCK TABLES `permission` WRITE;

/*!40000 ALTER TABLE `permission` DISABLE KEYS */;

INSERT INTO
    `permission`
VALUES
    (
        1,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        'Permite ver los usuarios',
        'Ver usuarios',
        'USER_GET',
        1
    ),
    (
        2,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar usuarios',
        'USER_PUT',
        1
    ),
    (
        3,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar usuarios',
        'USER_DELETE',
        1
    ),
    (
        5,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver permisos',
        'PERMISSION_GET',
        3
    ),
    (
        6,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Crear permisos',
        'PERMISSION_POST',
        3
    ),
    (
        7,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar permisos',
        'PERMISSION_PUT',
        3
    ),
    (
        8,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar permisos',
        'PERMISSION_DELETE',
        3
    ),
    (
        9,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver permisos asignados a un usuario',
        'USERSGROUPSTOUSERSTOPERMISSIONS_GET',
        8
    ),
    (
        10,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Asignar permisos a un usuario',
        'USERSGROUPSTOUSERSTOPERMISSIONS_POST',
        8
    ),
    (
        11,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar permisos asignados a un usuario',
        'USERSGROUPSTOUSERSTOPERMISSIONS_PUT',
        8
    ),
    (
        12,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar permisos asignados a un usuario',
        'USERSGROUPSTOUSERSTOPERMISSIONS_DELETE',
        8
    ),
    (
        13,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver roles',
        'ROLE_GET',
        5
    ),
    (
        14,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Crear roles',
        'ROLE_POST',
        5
    ),
    (
        15,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar roles',
        'ROLE_PUT',
        5
    ),
    (
        16,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar roles',
        'ROLE_DELETE',
        5
    ),
    (
        17,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver roles asignados a un usuario',
        'USERSGROUPSTOUSERSTOROLES_GET',
        8
    ),
    (
        18,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Asignar roles a un usuario',
        'USERSGROUPSTOUSERSTOROLES_POST',
        8
    ),
    (
        19,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar roles asignados a un usuario',
        'USERSGROUPSTOUSERSTOROLES_DELETE',
        8
    ),
    (
        20,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver permisos asignados a un rol',
        'ROLESTOPERMISSIONS_GET',
        5
    ),
    (
        21,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Asignar permisos a un rol',
        'ROLESTOPERMISSIONS_POST',
        5
    ),
    (
        22,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar permisos asignados a un rol',
        'ROLESTOPERMISSIONS_DELETE',
        5
    ),
    (
        23,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver grupos de usuarios',
        'USERSGROUP_GET',
        8
    ),
    (
        24,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Crear grupos de usuarios',
        'USERSGROUP_POST',
        8
    ),
    (
        25,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar grupos de usuarios',
        'USERSGROUP_PUT',
        8
    ),
    (
        26,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar grupos de usuarios',
        'USERSGROUP_DELETE',
        8
    ),
    (
        30,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver Grupos de usuario de un rol',
        'USERSGROUPSTOROLES_GET',
        8
    ),
    (
        31,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Asignar grupo de usuario a un rol',
        'USERSGROUPSTOROLES_POST',
        8
    ),
    (
        32,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar grupo de usuario a un rol',
        'USERSGROUPSTOROLES_DELETE',
        8
    ),
    (
        33,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver usuarios de un grupo de usuarios',
        'USERSTOUSERSGROUPS_GET',
        1
    ),
    (
        34,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Asignar usuario a grupo de usuario',
        'USERSTOUSERSGROUPS_POST',
        1
    ),
    (
        35,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar usuario de grupo de usuario',
        'USERSTOUSERSGROUPS_DELETE',
        1
    ),
    (
        36,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver los usuarios de LDAP',
        'LDAP_GET',
        12
    ),
    (
        38,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver autenticacion de usuario',
        'AUTHENTICATION_GET',
        13
    ),
    (
        39,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Agregar autenticación a usuario',
        'AUTHENTICATION_POST',
        13
    ),
    (
        40,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar autenticación de usuario',
        'AUTHENTICATION_PUT',
        13
    ),
    (
        41,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar autenticación de usuario',
        'AUTHENTICATION_DELETE',
        13
    ),
    (
        43,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver aplicaciones',
        'APPLICATION_GET',
        15
    ),
    (
        44,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Agregar aplicación',
        'APPLICATION_POST',
        15
    ),
    (
        45,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar aplicación',
        'APPLICATION_PUT',
        15
    ),
    (
        46,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar aplicación',
        'APPLICATION_DELETE',
        15
    ),
    (
        47,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver módulos',
        'MODULE_GET',
        16
    ),
    (
        48,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Agregar módulo',
        'MODULE_POST',
        16
    ),
    (
        49,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Editar módulo',
        'MODULE_PUT',
        16
    ),
    (
        50,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar módulo',
        'MODULE_DELETE',
        16
    ),
    (
        52,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Ver consumibles',
        'CONSUMABLE_GET',
        18
    ),
    (
        53,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Agregar consumibles',
        'CONSUMABLE_POST',
        18
    ),
    (
        54,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Editar consumibles',
        'CONSUMABLE_PUT',
        18
    ),
    (
        55,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar consumibles',
        'CONSUMABLE_DELETE',
        18
    ),
    (
        56,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Ver hojas',
        'LEAF_GET',
        18
    ),
    (
        57,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Crear hojas',
        'LEAF_POST',
        18
    ),
    (
        58,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Editar hojas',
        'LEAF_PUT',
        18
    ),
    (
        59,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar hojas',
        'LEAF_DELETE',
        18
    ),
    (
        60,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Ver grupos de hojas',
        'LEAVESGROUP_GET',
        18
    ),
    (
        61,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Crear grupos de hojas',
        'LEAVESGROUP_POST',
        18
    ),
    (
        62,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Editar grupos de hojas',
        'LEAVESGROUP_PUT',
        18
    ),
    (
        63,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar grupos de hojas',
        'LEAVESGROUP_DELETE',
        18
    ),
    (
        64,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Ver modelados',
        'MODELLING_GET',
        18
    ),
    (
        65,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Crear modelados',
        'MODELLING_POST',
        18
    ),
    (
        66,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Editar modelados',
        'MODELLING_PUT',
        18
    ),
    (
        67,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar modelados',
        'MODELLING_DELETE',
        18
    ),
    (
        68,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Ver procedimientos',
        'PROCEDURE_GET',
        18
    ),
    (
        69,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Crear procedimientos',
        'PROCEDURE_POST',
        18
    ),
    (
        70,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Editar procedimientos',
        'PROCEDURE_PUT',
        18
    ),
    (
        71,
        _binary '',
        '2020-01-27 17:30:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar procedimientos',
        'PROCEDURE_DELETE',
        18
    ),
    (
        72,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Eliminar usuarios de un grupo de usuarios',
        'USERSGROUPSTOUSERS_DELETE',
        8
    ),
    (
        73,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Ver usuarios de un grupo de usuarios',
        'USERSGROUPSTOUSERS_GET',
        8
    ),
    (
        74,
        _binary '',
        '2020-01-10 09:45:00.000000',
        NULL,
        0,
        NULL,
        'Asignar usuarios a un grupo de usuarios',
        'USERSGROUPSTOUSERS_POST',
        8
    ),
    (
        75,
        _binary '',
        '2020-01-29 12:00:43.683000',
        NULL,
        0,
        'Permite ver los usuarios22',
        'Ver usuarios22',
        'USER_GET22',
        1
    ),
    (
        76,
        _binary '',
        '2020-02-13 12:04:30.042000',
        NULL,
        0,
        'Can view administration',
        'Can view',
        'VIEW',
        19
    ),
    (
        77,
        _binary '',
        '2020-02-17 15:09:45.126000',
        NULL,
        0,
        'Can view Lead',
        'Can view',
        'VIEW',
        20
    ),
    (
        78,
        _binary '',
        '2020-02-17 15:10:00.200000',
        NULL,
        0,
        'Can edit Lead',
        'Can edit',
        'EDIT',
        20
    ),
    (
        79,
        _binary '',
        '2020-02-17 15:10:00.200000',
        NULL,
        0,
        'Can Add New Item',
        'Can add new Item',
        'VIEW',
        23
    ),
    (
        80,
        _binary '',
        '2020-02-26 11:33:36.006000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        24
    ),
    (
        81,
        _binary '',
        '2020-02-26 11:34:49.167000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        24
    ),
    (
        82,
        _binary '',
        '2020-02-26 11:35:24.553000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        21
    ),
    (
        83,
        _binary '',
        '2020-02-26 11:35:31.688000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        21
    ),
    (
        84,
        _binary '',
        '2020-02-26 11:35:53.465000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        22
    ),
    (
        85,
        _binary '',
        '2020-02-26 11:36:04.451000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        22
    ),
    (
        87,
        _binary '',
        '2020-02-26 11:36:56.141000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        26
    ),
    (
        88,
        _binary '',
        '2020-02-26 11:37:08.137000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        26
    ),
    (
        89,
        _binary '',
        '2020-02-26 11:37:42.597000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        27
    ),
    (
        90,
        _binary '',
        '2020-02-26 11:38:41.332000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        18
    ),
    (
        91,
        _binary '',
        '2020-02-26 11:38:50.234000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        18
    ),
    (
        92,
        _binary '',
        '2020-02-26 11:40:15.978000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        27
    ),
    (
        93,
        _binary '',
        '2020-02-26 11:44:50.093000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        28
    ),
    (
        94,
        _binary '',
        '2020-02-26 11:44:58.662000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        28
    ),
    (
        95,
        _binary '',
        '2019-01-01 00:00:00.000000',
        NULL,
        0,
        'User Selection',
        'User Selection',
        'USERSELECTION',
        28
    ),
    (
        96,
        _binary '',
        '2019-01-01 00:00:00.000000',
        NULL,
        0,
        'Configuration',
        'Configuration',
        'CONFIGURATION',
        28
    ),
    (
        97,
        _binary '',
        '2019-01-01 00:00:00.000000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        29
    ),
    (
        98,
        _binary '',
        '2019-01-01 00:00:00.000000',
        NULL,
        0,
        'Can use the multiuser copy',
        'Can use the multiuser copy',
        'COPYWORKORDER',
        28
    ),
    (
        99,
        _binary '',
        '2020-03-25 16:36:11.000000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        30
    ),
    (
        100,
        _binary '',
        '2020-02-26 11:35:53.465000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        31
    ),
    (
        101,
        _binary '',
        '2020-02-26 11:36:04.451000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        31
    ),
    (
        102,
        _binary '',
        '2020-02-26 11:35:53.465000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        32
    ),
    (
        103,
        _binary '',
        '2020-02-26 11:36:04.451000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        32
    ),
    (
        104,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver empleados',
        'Ver empleados',
        'VIEW',
        33
    ),
    (
        105,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar empleados',
        'Editar empleados',
        'EDIT',
        33
    ),
    (
        106,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver perfiles de empleados',
        'Ver perfiles de empleados',
        'VIEW_PROFILES',
        33
    ),
    (
        107,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Acceder al área de responsable',
        'Acceder al área de responsable',
        'VIEW',
        34
    ),
    (
        108,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar aprobaciones',
        'Editar aprobaciones',
        'EDIT',
        34
    ),
    (
        109,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver solicitudes',
        'Ver solicitudes',
        'VIEW',
        35
    ),
    (
        110,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar solicitudes',
        'Editar solicitudes',
        'EDIT',
        35
    ),
    (
        111,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Acceder al área de gestión',
        'Acceder al área de gestión',
        'VIEW',
        36
    ),
    (
        112,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver organizaciones',
        'Ver organizaciones',
        'VIEW',
        37
    ),
    (
        113,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar organizaciones',
        'Editar organizaciones',
        'EDIT',
        37
    ),
    (
        114,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver formaciones',
        'Ver formaciones',
        'VIEW',
        38
    ),
    (
        115,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar formaciones',
        'Editar formaciones',
        'EDIT',
        38
    ),
    (
        116,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver aptos médicos',
        'Ver aptos médicos',
        'VIEW',
        39
    ),
    (
        117,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar aptos médicos',
        'Editar aptos médicos',
        'EDIT',
        39
    ),
    (
        118,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver cualificaciones',
        'Ver cualificaciones',
        'VIEW',
        40
    ),
    (
        119,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar cualificaciones',
        'Editar cualificaciones',
        'EDIT',
        40
    ),
    (
        120,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver calendarios',
        'Ver calendarios',
        'VIEW',
        41
    ),
    (
        121,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar calendarios',
        'Editar calendarios',
        'EDIT',
        41
    ),
    (
        122,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver la matriz de polivalencia',
        'Ver la matriz de polivalencia',
        'VIEW',
        42
    ),
    (
        123,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Acceder al área de administración',
        'Acceder al área de administración',
        'VIEW',
        43
    ),
    (
        124,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar el área de administración',
        'Editar el área de administración',
        'EDIT',
        43
    ),
    (
        125,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver la gestión de días de vacaciones',
        'Ver la gestión de días de vacaciones',
        'VIEW',
        44
    ),
    (
        126,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar los días de vacaciones',
        'Editar los días de vacaciones',
        'EDIT',
        44
    ),
    (
        127,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver propuestas de contratación',
        'Ver propuestas de contratación',
        'VIEW',
        45
    ),
    (
        128,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar propuestas de contratación',
        'Editar propuestas de contratación',
        'EDIT',
        45
    ),
    (
        129,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver las aprobaciones de solicitudes',
        'Ver las aprobaciones de solicitudes',
        'VIEW',
        46
    ),
    (
        130,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Editar las aprobaciones de solicitudes',
        'Editar las aprobaciones de solicitudes',
        'EDIT',
        46
    ),
    (
        133,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver todas las formaciones independientemente del departamento',
        'Ver todas las formaciones independientemente del departamento',
        'VIEW_ALL',
        38
    ),
    (
        134,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver todos los aptos médicos independientemente del departamento',
        'Ver todas los aptos médicos independientemente del departamento',
        'VIEW_ALL',
        39
    ),
    (
        135,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver todas las propuestas de contratación independientemente del departamento',
        'Ver todas las propuestas de contratación independientemente del departamento',
        'VIEW_ALL',
        45
    ),
    (
        137,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver todas las aprobaciones de solicitudes independientemente del departamento',
        'Ver todas las aprobaciones de solicitudes independientemente del departamento',
        'VIEW_ALL',
        46
    ),
    (
        138,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Ver todos los empleados en cualificaciones independientemente del departamento',
        'Ver todos los empleados en cualificaciones independientemente del departamento',
        'VIEW_ALL',
        40
    ),
    (
        139,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        'Firmar propuestas de contratación',
        'Firmar propuestas de contratación',
        'SIGN',
        45
    ),
    (
        140,
        _binary '',
        '2020-06-02 00:00:00.000000',
        NULL,
        0,
        '',
        'synchronize',
        'synchronize',
        48
    ),
    (
        141,
        _binary '',
        '2020-08-18 05:24:45.000000',
        NULL,
        0,
        'View references',
        'Ver referencias',
        'VIEW',
        49
    ),
    (
        142,
        _binary '',
        '2020-08-18 05:24:48.000000',
        NULL,
        0,
        'Edit references',
        'Editar referencias',
        'EDIT',
        49
    ),
    (
        143,
        _binary '',
        '2020-08-18 05:24:52.000000',
        NULL,
        0,
        'View all references',
        'Ver referencia completa',
        'VIEW_ALL',
        49
    ),
    (
        144,
        _binary '',
        '2020-08-18 05:24:56.000000',
        NULL,
        0,
        'View roadmaps',
        'Ver hojas de ruta',
        'VIEW',
        50
    ),
    (
        145,
        _binary '',
        '2020-08-18 05:24:59.000000',
        NULL,
        0,
        'Edit roadmaps',
        'Editar hojas de ruta',
        'EDIT',
        50
    ),
    (
        146,
        _binary '',
        '2020-08-18 05:25:03.000000',
        NULL,
        0,
        'View all roadmaps',
        'Ver hoja de ruta completa',
        'VIEW_ALL',
        50
    ),
    (
        147,
        _binary '',
        '2020-08-18 05:25:07.000000',
        NULL,
        0,
        'View management',
        'Ver gestión',
        'VIEW',
        51
    ),
    (
        148,
        _binary '',
        '2020-08-18 05:25:10.000000',
        NULL,
        0,
        'Edit management',
        'Editar gestión',
        'EDIT',
        51
    ),
    (
        149,
        _binary '',
        '2020-08-18 05:25:14.000000',
        NULL,
        0,
        'View colorants',
        'Ver colorantes',
        'VIEW',
        52
    ),
    (
        150,
        _binary '',
        '2020-08-18 05:25:17.000000',
        NULL,
        0,
        'Edit colorants',
        'Editar colorantes',
        'EDIT',
        52
    ),
    (
        151,
        _binary '',
        '2020-08-18 05:25:20.000000',
        NULL,
        0,
        'View inserts',
        'Ver insertos',
        'VIEW',
        53
    ),
    (
        152,
        _binary '',
        '2020-08-18 05:25:24.000000',
        NULL,
        0,
        'Edit inserts',
        'Editar insertos',
        'EDIT',
        53
    ),
    (
        153,
        _binary '',
        '2020-08-18 05:25:27.000000',
        NULL,
        0,
        'View raw materials',
        'Ver materias primas',
        'VIEW',
        54
    ),
    (
        154,
        _binary '',
        '2020-08-18 05:25:30.000000',
        NULL,
        0,
        'Edit raw materials',
        'Editar materias primas',
        'EDIT',
        54
    ),
    (
        155,
        _binary '',
        '2020-08-18 05:25:33.000000',
        NULL,
        0,
        'View packagings',
        'Ver embalajes',
        'VIEW',
        55
    ),
    (
        156,
        _binary '',
        '2020-08-18 05:25:37.000000',
        NULL,
        0,
        'Edit embalajes',
        'Editar embalajes',
        'EDIT',
        55
    ),
    (
        157,
        _binary '',
        '2020-08-18 05:25:41.000000',
        NULL,
        0,
        'View molds',
        'Ver moldes',
        'VIEW',
        56
    ),
    (
        158,
        _binary '',
        '2020-08-18 05:25:44.000000',
        NULL,
        0,
        'Edit molds',
        'Editar moldes',
        'EDIT',
        56
    ),
    (
        159,
        _binary '',
        '2020-08-18 05:25:48.000000',
        NULL,
        0,
        'View building materials',
        'Ver útiles de fabricación',
        'VIEW',
        57
    ),
    (
        160,
        _binary '',
        '2020-08-18 05:25:50.000000',
        NULL,
        0,
        'Edit building materials',
        'Editar útiles de fabricación',
        'EDIT',
        57
    ),
    (
        161,
        _binary '',
        '2020-08-18 05:25:54.000000',
        NULL,
        0,
        'View machines',
        'Ver máquinas',
        'VIEW',
        58
    ),
    (
        162,
        _binary '',
        '2020-08-18 05:25:57.000000',
        NULL,
        0,
        'Edit machine',
        'Editar máquinas',
        'EDIT',
        58
    ),
    (
        163,
        _binary '',
        '2020-08-18 05:26:01.000000',
        NULL,
        0,
        'View administration',
        'Ver administración',
        'VIEW',
        59
    ),
    (
        164,
        _binary '',
        '2020-08-18 05:26:04.000000',
        NULL,
        0,
        'Edit administration',
        'Editar administración',
        'EDIT',
        59
    ),
    (
        165,
        _binary '',
        '2020-08-27 13:45:05.000000',
        NULL,
        0,
        'Ver menú de los informes',
        'Ver menú informes',
        'VIEWMENU',
        60
    ),
    (
        166,
        _binary '',
        '2020-08-27 13:45:05.000000',
        NULL,
        0,
        'Ver el informe Control económico de proyectos',
        'Ver Control económico de proyectos',
        'VIEWECONOMICALCONTROL',
        60
    ),
    (
        167,
        _binary '',
        '2020-08-27 13:45:05.000000',
        NULL,
        0,
        'Ver el informe Pedidos',
        'Ver Pedidos',
        'VIEWORDERS',
        60
    ),
    (
        168,
        _binary '',
        '2020-08-27 13:45:05.000000',
        NULL,
        0,
        'Ver el informe Listado de ofertas',
        'Ver Listado de ofertas',
        'VIEWLEADLIST',
        60
    ),
    (
        169,
        _binary '',
        '2020-08-27 13:45:05.000000',
        NULL,
        0,
        'Ver Seguimiento global',
        'Ver Seguimiento global',
        'VIEWGLOBALSTATUS',
        60
    ),
    (
        170,
        _binary '',
        '2020-09-18 05:18:31.000000',
        NULL,
        0,
        'Create labels',
        'Crear etiquetas',
        'CREATE',
        61
    ),
    (
        171,
        _binary '',
        '2020-09-18 05:18:35.000000',
        NULL,
        0,
        'View arrivals',
        'Ver log de entradas',
        'VIEW',
        62
    ),
    (
        172,
        _binary '',
        '2020-09-18 05:18:38.000000',
        NULL,
        0,
        'Edit arrivals',
        'Editar entradas',
        'EDIT',
        62
    ),
    (
        173,
        _binary '',
        '2020-09-18 05:18:41.000000',
        NULL,
        0,
        'View departures',
        'Ver log de salidas',
        'VIEW',
        63
    ),
    (
        174,
        _binary '',
        '2020-09-18 05:18:44.000000',
        NULL,
        0,
        'Edit departures',
        'Editar salidas',
        'EDIT',
        63
    ),
    (
        175,
        _binary '',
        '2020-09-18 05:18:47.000000',
        NULL,
        0,
        'View locations',
        'Ver localizaciones',
        'VIEW',
        64
    ),
    (
        176,
        _binary '',
        '2020-09-30 08:15:00.000000',
        NULL,
        0,
        NULL,
        'Crear usuarios',
        'USER_POST',
        1
    ),
    (
        177,
        _binary '',
        '2020-10-05 11:45:05.000000',
        NULL,
        0,
        'Ver directrices',
        'Ver directrices',
        'VIEWGUIDELINES',
        60
    ),
    (
        178,
        _binary '',
        '2020-10-05 11:45:05.000000',
        NULL,
        0,
        'Ver asignación',
        'Ver asignación',
        'VIEW',
        65
    ),
    (
        179,
        _binary '',
        '2020-10-05 11:45:05.000000',
        NULL,
        0,
        'Editar asignación',
        'Editar asignación',
        'EDIT',
        65
    ),
    (
        180,
        _binary '',
        '2020-10-05 11:45:05.000000',
        NULL,
        0,
        'Ver el secuenciador',
        'Ver el secuenciador',
        'VIEW',
        66
    ),
    (
        181,
        _binary '',
        '2020-10-05 11:45:05.000000',
        NULL,
        0,
        'Editar en el secuenciador',
        'Editar en el secuenciador',
        'EDIT',
        66
    ),
    (
        182,
        _binary '',
        '2020-10-05 11:45:05.000000',
        NULL,
        0,
        'Ver resumen de pedidos',
        'Ver resumen de pedidos',
        'VIEWORDERS',
        60
    ),
    (
        183,
        _binary '',
        '2020-10-05 11:45:05.000000',
        NULL,
        0,
        'Ver generador de OFs',
        'Ver generador de OFs',
        'VIEW',
        67
    ),
    (
        184,
        _binary '',
        '2020-12-09 15:32:15.786823',
        NULL,
        0,
        'Can view employee payrolls',
        'Can view',
        'VIEW',
        68
    ),
    (
        185,
        _binary '',
        '2020-12-09 15:32:15.786922',
        NULL,
        0,
        'Can edit employee payrolls',
        'Can edit',
        'EDIT',
        68
    ),
    (
        186,
        _binary '',
        '2021-02-01 00:00:00.000000',
        '2021-02-01 00:00:00.000000',
        0,
        'Ver perfil propio',
        'Ver perfil propio',
        'VIEW_MY_PROFILE',
        33
    ),
    (
        187,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver Menú Gestión Trabajos',
        'TASK_MANAGEMENT_VIEW',
        69
    ),
    (
        188,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Editar Gestión Trabajos',
        'TASK_MANAGEMENT_EDIT',
        69
    ),
    (
        189,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver Históricos',
        'HISTORICS_VIEW',
        70
    ),
    (
        190,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver Indicadores',
        'INDICATORS_VIEW',
        71
    ),
    (
        191,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver Menú Gestión Activos',
        'ASSET_MANAGEMENT_VIEW',
        72
    ),
    (
        192,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Editar Gestión Activos',
        'ASSET_MANAGEMENT_EDIT',
        72
    ),
    (
        193,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar tipo de incidencia',
        'INCIDENCE_TYPE_EDIT',
        72
    ),
    (
        194,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver incidencias',
        'INCIDENCE_VIEW',
        72
    ),
    (
        195,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar incidencias',
        'INCIDENCE_EDIT',
        72
    ),
    (
        196,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver controles alternativos de Pokayokes',
        'POKAYOKE_ALTERNATIVE_CONTROL_VIEW',
        72
    ),
    (
        197,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver acciones',
        'ACTION_VIEW',
        72
    ),
    (
        198,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver listado Pokayokes',
        'CONFIGURATION_POKAYOKE_VIEW',
        72
    ),
    (
        199,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Editar Listado Pokayokes',
        'CONFIGURATION_POKAYOKE_EDIT',
        72
    ),
    (
        200,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver Menú Gestión',
        'MANAGEMENT_VIEW',
        72
    ),
    (
        201,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar acciones',
        'ACTION_EDIT',
        72
    ),
    (
        202,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar controles alternativos de Pokayokes',
        'POKAYOKE_ALTERNATIVE_CONTROL_EDIT',
        72
    ),
    (
        203,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver medidas de control de Pokayokes',
        'POKAYOKE_CONTROL_VIEW',
        72
    ),
    (
        204,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver sistemas de Pokayokes',
        'POKAYOKE_SYSTEM_VIEW',
        72
    ),
    (
        205,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar sistemas de Pokayokes',
        'POKAYOKE_SYSTEM_EDIT',
        72
    ),
    (
        206,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar medidas de control de Pokayokes',
        'POKAYOKE_CONTROL_EDIT',
        72
    ),
    (
        207,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver los fabricantes de piezas de repuesto',
        'SPARE_PART_MANUFACTURER_VIEW',
        72
    ),
    (
        208,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar los fabricantes de piezas de repuesto',
        'SPARE_PART_MANUFACTURER_EDIT',
        72
    ),
    (
        209,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver los probedores de piezas de repuesto',
        'SPARE_PART_SUPPLIER_VIEW',
        72
    ),
    (
        210,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar los probedores de piezas de repuesto',
        'SPARE_PART_SUPPLIER_EDIT',
        72
    ),
    (
        211,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver los stock de piezas de repuesto',
        'SPARE_PART_STOCK_VIEW',
        72
    ),
    (
        212,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar los stock de piezas de repuesto',
        'SPARE_PART_STOCK_EDIT',
        72
    ),
    (
        213,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver los tipos de piezas de repuesto',
        'SPARE_PART_TYPE_VIEW',
        72
    ),
    (
        214,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar los tipos de piezas de repuesto',
        'SPARE_PART_TYPE_EDIT',
        72
    ),
    (
        215,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver los piezas de repuesto',
        'SPARE_PART_VIEW',
        72
    ),
    (
        216,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar los  piezas de repuesto',
        'SPARE_PART_EDIT',
        72
    ),
    (
        217,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Poder replicar planificación',
        'REPLICATE_PLANIFICATION_VIEW',
        72
    ),
    (
        218,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Poder cargar una planificación',
        'LOAD_PLANIFICATION_VIEW',
        72
    ),
    (
        219,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Poder cargar masivamente maquinas',
        'LOAD_ASSET_VIEW',
        72
    ),
    (
        220,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Poder cargar masivamente piezas de repuesto',
        'LOAD_SPARE_PART_VIEW',
        72
    ),
    (
        221,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver estado de las maquinas',
        'ASSET_STATUS_VIEW',
        72
    ),
    (
        222,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar estado de las maquinas',
        'ASSET_STATUS_EDIT',
        72
    ),
    (
        223,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver maquinas inactivas',
        'ASSET_INACTIVE_VIEW',
        72
    ),
    (
        224,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar maquinas inactivas',
        'ASSET_INACTIVE_EDIT',
        72
    ),
    (
        225,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver turnos',
        'SHIFTS_VIEW',
        72
    ),
    (
        226,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver tipo de imputaciones',
        'IMPUTATION_TYPE_VIEW',
        72
    ),
    (
        227,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver etiquetas',
        'TAG_VIEW',
        72
    ),
    (
        228,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar etiquetas',
        'TAG_EDIT',
        72
    ),
    (
        229,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver tipo de intervenciones',
        'INTERVENTION_TYPE_VIEW',
        72
    ),
    (
        230,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Editar tipo de intervenciones',
        'INTERVENTION_TYPE_EDIT',
        72
    ),
    (
        231,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver tipo de incidencia',
        'INCIDENCE_TYPE_VIEW',
        72
    ),
    (
        232,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver peticiones de mantenimiento',
        'REQUEST_VIEW',
        73
    ),
    (
        233,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Editar peticiones de mantenimiento',
        'REQUEST_EDIT',
        73
    ),
    (
        234,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver ventana de operador',
        'OPERATOR_VIEW',
        74
    ),
    (
        235,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Imputar a Trabajo',
        'TASK_IMPUTATION',
        74
    ),
    (
        236,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver Mi jornada',
        'EMPLOYEE_INDICATOR_VIEW',
        74
    ),
    (
        237,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver lista de trabajos',
        'TASK_LIST_VIEW',
        74
    ),
    (
        238,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Poder crear trabajo correctivo (Nuevo Trabajo)',
        'NEW_CORRECTIVE_VIEW',
        74
    ),
    (
        239,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver Mi historico',
        'EMPLOYEE_HISTORIC_VIEW',
        74
    ),
    (
        240,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Editar Tareas Correctivas',
        'CORRECTIVE_TASK_EDIT',
        75
    ),
    (
        241,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Editar Imputaciones',
        'IMPUTATIONS_EDIT',
        75
    ),
    (
        242,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver Imputaciones',
        'IMPUTATIONS_VIEW',
        75
    ),
    (
        243,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver tiempos de los empleados',
        'EMPLOYEE_TIME_VIEW',
        75
    ),
    (
        244,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Poder realizar asignación masiva',
        'ASSIGNMENT_VIEW',
        75
    ),
    (
        245,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver ventana de responsable',
        'RESPONSIBLE_VIEW',
        75
    ),
    (
        246,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Imputar a Trabajo',
        'TASK_IMPUTATION',
        75
    ),
    (
        247,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver incumplimientos',
        'BREACHES_VIEW',
        75
    ),
    (
        248,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Ver lista de trabajos',
        'TASK_LIST_VIEW',
        75
    ),
    (
        249,
        _binary '',
        '2021-02-15 00:00:00.000000',
        NULL,
        0,
        '',
        'Poder crear trabajo correctivo (Nuevo Trabajo)',
        'NEW_CORRECTIVE_VIEW',
        75
    ),
    (
        250,
        _binary '',
        '2021-02-16 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Ver gamas',
        'GAMUT_VIEW',
        76
    ),
    (
        251,
        _binary '',
        '2021-02-16 00:00:00.000000',
        NULL,
        0,
        NULL,
        'Editar gamas',
        'GAMUT_EDIT',
        76
    ),
    (
        252,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver menú de gestión',
        'EASY_GMAO_MANAGEMENT_VIEW',
        77
    ),
    (
        253,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de preventivo',
        'EASY_GMAO_TEMPLATE_VIEW',
        77
    ),
    (
        254,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar preventivos',
        'EASY_GMAO_TEMPLATE_EDIT',
        77
    ),
    (
        255,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de gamas',
        'EASY_GMAO_GAMUT_VIEW',
        77
    ),
    (
        256,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar gamas',
        'EASY_GMAO_GAMUT_EDIT',
        77
    ),
    (
        257,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver menú de responsable',
        'EASY_GMAO_RESPONSIBLE_VIEW',
        78
    ),
    (
        258,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de asignación de trabajos',
        'EASY_GMAO_ASSIGNMENT_VIEW',
        78
    ),
    (
        259,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar asignación de trabajos',
        'EASY_GMAO_ASSIGNMENT_EDIT',
        78
    ),
    (
        260,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de incumplimientos',
        'EASY_GMAO_BREACH_VIEW',
        78
    ),
    (
        261,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar incumplimientos',
        'EASY_GMAO_BREACH_EDIT',
        78
    ),
    (
        262,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de tiempo empleados',
        'EASY_GMAO_EMPLOYEE_TIME_VIEW',
        78
    ),
    (
        263,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar tiempo de empleados',
        'EASY_GMAO_EMPLOYEE_TIME_EDIT',
        78
    ),
    (
        264,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de imputaciones',
        'EASY_GMAO_IMPUTATION_VIEW',
        78
    ),
    (
        265,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar imputaciones',
        'EASY_GMAO_IMPUTATION_EDIT',
        78
    ),
    (
        266,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver menú de operador',
        'EASY_GMAO_OPERATOR_VIEW',
        79
    ),
    (
        267,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar operador',
        'EASY_GMAO_OPERATOR_EDIT',
        79
    ),
    (
        268,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver menú de repuestos',
        'EASY_GMAO_CONSUMABLE_VIEW',
        80
    ),
    (
        269,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de catálogo',
        'EASY_GMAO_CATALOG_VIEW',
        80
    ),
    (
        270,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar catálogo',
        'EASY_GMAO_CATALOG_EDIT',
        80
    ),
    (
        271,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de stocks',
        'EASY_GMAO_STOCK_VIEW',
        80
    ),
    (
        272,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar stocks',
        'EASY_GMAO_STOCK_EDIT',
        80
    ),
    (
        273,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver menú de informes',
        'EASY_GMAO_REPORT_VIEW',
        81
    ),
    (
        274,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de indicadores',
        'EASY_GMAO_INDICATOR_VIEW',
        81
    ),
    (
        275,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de resumen anual',
        'EASY_GMAO_SUMMARY_VIEW',
        81
    ),
    (
        276,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver menú de configuración',
        'EASY_GMAO_CONFIGURATION_VIEW',
        82
    ),
    (
        277,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de gestión de máquinas',
        'EASY_GMAO_MACHINE_MANAGEMENT_VIEW',
        82
    ),
    (
        278,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver menú de peticiones',
        'EASY_GMAO_REQUEST_VIEW',
        83
    ),
    (
        279,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de envío',
        'EASY_GMAO_SENDING_VIEW',
        83
    ),
    (
        280,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar envío',
        'EASY_GMAO_SENDING_EDIT',
        83
    ),
    (
        281,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de recepción',
        'EASY_GMAO_RECEPTION_VIEW',
        83
    ),
    (
        282,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar recepción',
        'EASY_GMAO_RECEPTION_EDIT',
        83
    ),
    (
        283,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        0,
        'Ver el menú de administración para gestionar las bolsas de horas de los empleados',
        'Ver control de fichajes',
        'VIEW',
        84
    ),
    (
        284,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        0,
        'Ver el control de horas de los empleados',
        'Ver control de horas',
        'VIEW',
        85
    ),
    (
        285,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        0,
        'Editar el control de horas de los empleados',
        'Editar control de horas',
        'EDIT',
        85
    ),
    (
        286,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        0,
        'Ver las bolsas de horas',
        'Ver bolsas de horas',
        'VIEW',
        86
    ),
    (
        287,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de relación de máquinas',
        'EASY_GMAO_MACHINE_RELATIONSHIP_VIEW',
        82
    ),
    (
        288,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar relación de máquinas',
        'EASY_GMAO_MACHINE_RELATIONSHIP_EDIT',
        82
    ),
    (
        289,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de mantenimiento',
        'EASY_GMAO_MAINTENANCE_VIEW',
        82
    ),
    (
        290,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de etiquetas',
        'EASY_GMAO_TAG_VIEW',
        82
    ),
    (
        291,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar etiquetas',
        'EASY_GMAO_TAG_EDIT',
        82
    ),
    (
        292,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de tipos de intervención',
        'EASY_GMAO_INTERVENTION_TYPE_VIEW',
        82
    ),
    (
        293,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar tipos de intervención',
        'EASY_GMAO_INTERVENTION_TYPE_EDIT',
        82
    ),
    (
        294,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de tipos de incidencia',
        'EASY_GMAO_INCIDENCE_TYPE_VIEW',
        82
    ),
    (
        295,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar tipos de incidencia',
        'EASY_GMAO_INCIDENCE_TYPE_EDIT',
        82
    ),
    (
        296,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver submenú de pokayokes',
        'EASY_GMAO_POKAYOKE_VIEW',
        82
    ),
    (
        297,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de listado de pokayokes',
        'EASY_GMAO_POKAYOKE_LIST_VIEW',
        82
    ),
    (
        298,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar listado de pokayokes',
        'EASY_GMAO_POKAYOKE_LIST_EDIT',
        82
    ),
    (
        299,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de controles alternativos',
        'EASY_GMAO_ALTERNATIVE_CONTROL_VIEW',
        82
    ),
    (
        300,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar controles alternativos',
        'EASY_GMAO_ALTERNATIVE_CONTROL_EDIT',
        82
    ),
    (
        301,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de medidas de control',
        'EASY_GMAO_CONTROL_MEDIUM_VIEW',
        82
    ),
    (
        302,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar medidas de control',
        'EASY_GMAO_CONTROL_MEDIUM_EDIT',
        82
    ),
    (
        303,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver opción de sistemas pokayoke',
        'EASY_GMAO_POKAYOKE_SYSTEM_VIEW',
        82
    ),
    (
        304,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar sistemas pokayoke',
        'EASY_GMAO_POKAYOKE_SYSTEM_EDIT',
        82
    ),
    (
        305,
        _binary '',
        '2020-02-26 11:35:53.465000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        90
    ),
    (
        306,
        _binary '',
        '2020-02-26 11:36:04.451000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        90
    ),
    (
        307,
        _binary '',
        '2021-07-22 10:22:11.000000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        91
    ),
    (
        308,
        _binary '',
        '2021-07-22 10:22:11.000000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        91
    ),
    (
        309,
        _binary '',
        '2021-07-22 10:22:11.000000',
        NULL,
        0,
        'Can edit',
        'Can edit',
        'EDIT',
        92
    ),
    (
        310,
        _binary '',
        '2021-07-22 10:22:11.000000',
        NULL,
        0,
        'Can view',
        'Can view',
        'VIEW',
        92
    ),
    (
        311,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver peticiones',
        'VISUAL_SGA_REQUESTS_VIEW',
        93
    ),
    (
        312,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver peticiones',
        'VISUAL_SGA_REQUESTS_REQUEST_VIEW',
        93
    ),
    (
        313,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver entregas',
        'VISUAL_SGA_REQUESTS_DISTRIBUTION_VIEW',
        93
    ),
    (
        314,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver  recepción',
        'VISUAL_SGA_REQUESTS_RECEPTION_VIEW',
        93
    ),
    (
        315,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver  entradas y salidas',
        'VISUAL_SGA_INPUTS_OUTPUTS_VIEW',
        94
    ),
    (
        316,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Ver responsable y configuración',
        'VISUAL_SGA_ADMINISTRATOR_VIEW',
        95
    ),
    (
        317,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar tarea TPM',
        'EASY_GMAO_TASK_TPM_EDIT',
        96
    ),
    (
        318,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar tarea',
        'EASY_GMAO_TASK_EDIT',
        78
    ),
    (
        319,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        1,
        NULL,
        'Acceso TPM/Plantillas',
        'EASY_GMAO_TPM_MANAGEMENT_VIEW',
        96
    ),
    (
        320,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        1,
        NULL,
        'Acceso TPM/Historico',
        'EASY_GMAO_TPM_HISTORY_VIEW',
        96
    ),
    (
        321,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        1,
        NULL,
        'Acceso TPM/Asignacion',
        'EASY_GMAO_TPM_TASKS_VIEW',
        96
    ),
    (
        322,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        1,
        NULL,
        'Acceso TPM/Mis tareas',
        'EASY_GMAO_TPM_MY_TASKS_VIEW',
        96
    ),
    (
        323,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        1,
        NULL,
        'Acceso TPM',
        'EASY_GMAO_TPM_VIEW',
        96
    ),
    (
        324,
        _binary '',
        '2021-02-18 00:00:00.000000',
        '2021-03-23 00:00:00.000000',
        1,
        NULL,
        'Editar tarea completada',
        'EASY_GMAO_COMPLETE_TASK_EDIT',
        78
    ),
    (
        325,
        _binary '',
        '2021-03-11 00:00:00.000000',
        '2021-03-11 00:00:00.000000',
        1,
        NULL,
        'Acceso TPM/Imputaciones',
        'EASY_GMAO_TPM_IMPUTATIONS_VIEW',
        96
    ),
    (
        326,
        _binary '',
        '2022-08-29 11:32:26.000000',
        NULL,
        0,
        'Ver el listado de empleados y su información básica de contacto',
        'Ver el listado de empleados',
        'DIGITAL_PEOPLE_LIST_VIEW',
        33
    ),
    (
        327,
        _binary '',
        '2022-08-29 11:32:26.000000',
        NULL,
        0,
        'Ver el organigrama de la organización',
        'Ver el organigrama',
        'DIGITAL_PEOPLE_ORGCHART_VIEW',
        33
    ),
    (
        328,
        _binary '',
        '2022-07-25 00:00:00.000000',
        '2022-07-25 00:00:00.000000',
        0,
        'Ver fichajes en ficha de empleado',
        'Ver fichajes en perfil',
        'VIEW_PROFILE_RECORDS',
        84
    ),
    (
        333,
        _binary '',
        '2023-03-29 09:09:27.276000',
        NULL,
        0,
        NULL,
        'Ver certificación horas operario',
        'VIEW',
        98
    ),
    (
        334,
        _binary '',
        '2023-05-09 12:53:22.000000',
        '2023-05-09 12:53:22.000000',
        0,
        'Ver el portal',
        'Ver portal',
        'VIEW_PORTAL',
        99
    ),
    (
        335,
        _binary '',
        '2023-05-09 12:53:22.000000',
        '2023-05-09 12:53:22.000000',
        0,
        'Editar el portal',
        'Editar portal',
        'EDIT_PORTAL',
        99
    ),
    (
        336,
        _binary '',
        '2023-05-09 12:53:22.000000',
        '2023-05-09 12:53:22.000000',
        0,
        'Ver noticias',
        'Ver noticias',
        'VIEW_NEWS',
        99
    ),
    (
        337,
        _binary '',
        '2023-05-09 12:53:22.000000',
        '2023-05-09 12:53:22.000000',
        0,
        'Editar noticias',
        'Editar noticias',
        'EDIT_NEWS',
        99
    ),
    (
        338,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver información personal general',
        'Ver información personal general',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_PERSONAL_GENERAL_VIEW',
        100
    ),
    (
        339,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Editar información personal general',
        'Editar información personal general',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_PERSONAL_GENERAL_EDIT',
        100
    ),
    (
        340,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver cualificaciones',
        'Ver cualificaciones',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_QUALIFICATIONS_VIEW',
        100
    ),
    (
        342,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver habilidades',
        'Ver habilidades',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_SKILLS_VIEW',
        100
    ),
    (
        343,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Editar habilidades',
        'Editar habilidades',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_SKILLS_EDIT',
        100
    ),
    (
        344,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver resumen laboral',
        'Ver resumen laboral',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_WORK_SUMMARY_VIEW',
        100
    ),
    (
        345,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Editar resumen laboral',
        'Editar resumen laboral',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_WORK_SUMMARY_EDIT',
        100
    ),
    (
        346,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver contratos y asignaciones',
        'Ver contratos y asignaciones',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_CONTRACTS_VIEW',
        100
    ),
    (
        347,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Editar contratos y asignaciones',
        'Editar contratos y asignaciones',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_CONTRACTS_EDIT',
        100
    ),
    (
        348,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver categoría profesional',
        'Ver categoría profesional',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_PROFESSIONAL_CATEGORY_VIEW',
        100
    ),
    (
        349,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Editar categoría profesional',
        'Editar categoría profesional',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_PROFESSIONAL_CATEGORY_EDIT',
        100
    ),
    (
        350,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver formaciones',
        'Ver formaciones',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_TRAINING_VIEW',
        100
    ),
    (
        352,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver aptos médicos',
        'Ver aptos médicos',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_MEDICAL_FITNESS_VIEW',
        100
    ),
    (
        354,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver tiempo disponible',
        'Ver tiempo disponible',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_TIME_AVAILABLE_VIEW',
        100
    ),
    (
        356,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver control de jornada',
        'Ver control de jornada',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_WORKING_DAY_CONTROL_VIEW',
        100
    ),
    (
        358,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver solicitudes',
        'Ver solicitudes',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_REQUESTS_VIEW',
        100
    ),
    (
        360,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver bajas IT',
        'Ver bajas IT',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_IT_LEAVE_VIEW',
        100
    ),
    (
        361,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Editar bajas IT',
        'Editar bajas IT',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_IT_LEAVE_EDIT',
        100
    ),
    (
        362,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver documentación',
        'Ver documentación',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_DOCUMENTATION_VIEW',
        100
    ),
    (
        363,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Editar documentación',
        'Editar documentación',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_DOCUMENTATION_EDIT',
        100
    ),
    (
        364,
        _binary '',
        '2023-05-23 15:44:14.000000',
        '2023-05-23 15:44:14.000000',
        0,
        'Ver nóminas',
        'Ver nóminas',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_PAYROLLS_VIEW',
        100
    ),
    (
        366,
        _binary '',
        '2023-05-26 08:25:17.282000',
        NULL,
        0,
        NULL,
        'Ver certificacion de progreso',
        'VIEW',
        101
    ),
    (
        367,
        _binary '',
        '2023-06-20 12:19:31.000000',
        '2023-06-20 12:19:31.000000',
        0,
        'Editar tiempo disponible',
        'Editar tiempo disponible',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_TIME_AVAILABLE_EDIT',
        100
    ),
    (
        368,
        _binary '',
        '2023-07-03 09:24:12.000000',
        '2023-07-03 09:24:12.000000',
        0,
        'Ver solicitudes',
        'Ver solicitudes',
        'VIEW_REQUEST',
        34
    ),
    (
        369,
        _binary '',
        '2023-07-03 09:24:12.000000',
        '2023-07-03 09:24:12.000000',
        0,
        'Editar solicitudes',
        'Editar solicitudes',
        'EDIT_REQUEST',
        34
    ),
    (
        370,
        _binary '',
        '2023-07-03 09:24:12.000000',
        '2023-07-03 09:24:12.000000',
        0,
        'Crear imputaciones en diferido',
        'Crear imputaciones en diferido',
        'CREATEIMPUTATION',
        102
    ),
    (
        371,
        _binary '',
        '2023-07-12 06:25:45.904000',
        NULL,
        0,
        'Ver responsables',
        'Ver responsables',
        'VIEW',
        103
    ),
    (
        372,
        _binary '',
        '2023-07-12 06:25:45.904000',
        NULL,
        0,
        'Editar responsables',
        'Editar responsables',
        'EDIT',
        103
    ),
    (
        373,
        _binary '',
        '2023-08-01 06:17:59.000000',
        '2023-08-01 06:17:59.000000',
        0,
        'Ver proposiciones',
        'Ver proposiciones',
        'DIGITAL_PEOPLE_PROPOSITIONS_VIEW',
        104
    ),
    (
        375,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'Can view',
        'VIEW',
        106
    ),
    (
        376,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'Can view',
        'VIEW',
        107
    ),
    (
        377,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'Can view',
        'VIEW',
        108
    ),
    (
        379,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'Can view',
        'VIEW',
        110
    ),
    (
        381,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'Can view',
        'VIEW',
        112
    ),
    (
        382,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'Can view',
        'VIEW',
        113
    ),
    (
        383,
        _binary '',
        '2023-09-08 10:13:12.000000',
        NULL,
        0,
        NULL,
        'Can view',
        'VIEW',
        114
    ),
    (
        385,
        _binary '',
        '2023-09-08 00:00:00.000000',
        NULL,
        0,
        'Acceso a la VT',
        'access',
        'ACCESS',
        115
    ),
    (
        386,
        _binary '',
        '2023-09-11 13:15:24.634000',
        NULL,
        0,
        'Ver todos los registros',
        'Ver todos los registros y editar',
        'VIEW',
        116
    ),
    (
        387,
        _binary '',
        '2023-09-20 11:23:14.446000',
        NULL,
        0,
        'Avanzar y Cerrar ordenes',
        'Avanzar y Cerrar ordenes',
        'CANFORWARD',
        117
    ),
    (
        388,
        _binary '',
        '2023-09-21 09:05:14.422000',
        NULL,
        0,
        'Pinnear ordenes',
        'Pinnear ordenes',
        'CANPIN',
        117
    ),
    (
        389,
        _binary '',
        '2023-09-21 11:25:35.488000',
        NULL,
        0,
        'Cambiar a cualquier usuario en el panel de operario sin restricciones',
        'Cambia operario sin restricciones',
        'OPERATORUNRESTRICTED',
        102
    ),
    (
        390,
        _binary '',
        '2023-09-21 11:26:47.079000',
        NULL,
        0,
        'Cambiar a cualquier usuario en el panel de operario con contraseña',
        'Cambia operario con contraseña',
        'OPERATORBYPASSWORD',
        102
    ),
    (
        391,
        _binary '',
        '2023-09-29 08:38:43.000000',
        '2023-09-29 08:38:43.000000',
        0,
        'Editar solicitudes de vacaciones',
        'Editar solicitudes de vacaciones',
        'EDIT_HOLIDAY_REQUESTS',
        35
    ),
    (
        392,
        _binary '',
        '2023-09-29 08:38:43.000000',
        '2023-09-29 08:38:43.000000',
        0,
        'Editar solicitudes de autorización de viaje',
        'Editar solicitudes de autorización de viaje',
        'EDIT_AUTH_TRAVEL_REQUESTS',
        35
    ),
    (
        393,
        _binary '',
        '2023-09-29 08:38:43.000000',
        '2023-09-29 08:38:43.000000',
        0,
        'Editar solicitudes de permisos',
        'Editar solicitudes de permisos',
        'EDIT_OTHER_REQUESTS',
        35
    ),
    (
        394,
        _binary '',
        '2023-09-29 08:38:43.000000',
        '2023-09-29 08:38:43.000000',
        0,
        'Editar solicitudes de asuntos propios',
        'Editar solicitudes de asuntos propios',
        'EDIT_ABSENCE_REQUESTS',
        35
    ),
    (
        395,
        _binary '',
        '2023-09-29 08:38:43.000000',
        '2023-09-29 08:38:43.000000',
        0,
        'Editar solicitudes de flexibilidad',
        'Editar solicitudes de flexibilidad',
        'EDIT_FLEXIBILITY_REQUESTS',
        35
    ),
    (
        396,
        _binary '',
        '2023-09-29 08:38:43.000000',
        '2023-09-29 08:38:43.000000',
        0,
        'Editar solicitudes de hojas de gastos',
        'Editar solicitudes de hojas de gastos',
        'EDIT_SETTLEMENT_TRIP_REQUESTS',
        35
    ),
    (
        397,
        _binary '',
        '2024-01-17 08:03:22.000000',
        '2024-01-17 08:03:22.000000',
        0,
        'Editar cualificaciones',
        'Editar cualificaciones',
        'DIGITAL_PEOPLE_EMPLOYEE_PROFILE_QUALIFICATIONS_EDIT',
        100
    ),
    (
        398,
        _binary '',
        '2024-03-08 10:41:11.235000',
        NULL,
        0,
        'Ver pestañas de seguimiento',
        'Ver pestañas de seguimiento',
        'VIEW',
        118
    );

/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--
DROP TABLE IF EXISTS `refresh_token`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `refresh_token` (
        `ID` bigint NOT NULL AUTO_INCREMENT,
        `CREATION_DATE` datetime (6) NOT NULL,
        `TOKEN` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `USER_ID` bigint NOT NULL,
            PRIMARY KEY (`ID`),
            KEY `FK_REFRESH_TOKEN_USER` (`USER_ID`),
            CONSTRAINT `FK_REFRESH_TOKEN_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 273171 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--
LOCK TABLES `refresh_token` WRITE;

/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;

INSERT INTO
    `refresh_token`
VALUES
    (
        273143,
        '2024-07-01 05:51:48.168059',
        '$2a$10$DEV6T9Mc.4aQ7SeIiiS38.iTJDmdUyl1PDe1aTDDm32ok1Cl/vprm',
        114
    ),
    (
        273144,
        '2024-07-01 05:56:10.154441',
        '$2a$10$owpvV.7HMAsNrSnOSIcwee7dlrDoL9tA72h9WEHGTTREKQabs8Ixi',
        114
    ),
    (
        273145,
        '2024-07-01 05:59:26.437808',
        '$2a$10$zUzE00RQcrl6Nv7hYPWnseMGA4.mxOEuB2wR/0A85sBtSyRCtoOia',
        114
    ),
    (
        273146,
        '2024-07-01 06:01:44.724713',
        '$2a$10$V9rpy7esdrRSbA9DbaMI..Y738WCPS1ddPGVd0h7KCTHuCU6PdGcO',
        114
    ),
    (
        273147,
        '2024-07-01 06:15:00.346963',
        '$2a$10$8r2BscnPKtdq7O2ZaETp3ueNBoHgOjQ4YBUL.PTyGd1ePdidQyaSG',
        114
    ),
    (
        273148,
        '2024-07-01 08:20:01.081771',
        '$2a$10$e4E8uZVncXBF6dBq6dFgCuMDjJIvSJQGsCxsqeJAnBVHKCwTvPZCu',
        114
    ),
    (
        273149,
        '2024-07-01 09:45:00.489119',
        '$2a$10$sEbhcZfVj6vXUBEiZhzFYuvxn.0vF76OBpYz/N67a1CZvg8sm5rgS',
        114
    ),
    (
        273150,
        '2024-07-01 10:45:19.579171',
        '$2a$10$c/j.HCTBskKRT3vma2Zbo.CmMM6778/aZ3.udXTxyVI0kArywUkzu',
        114
    ),
    (
        273151,
        '2024-07-01 10:50:00.259294',
        '$2a$10$uLvf.3uQqqIrkk4bTHE2n.wJT1lO846hNMXXLAUWTxz5OTppfNCoC',
        114
    ),
    (
        273152,
        '2024-07-01 10:50:00.264299',
        '$2a$10$qAoBEPylpAnYlPELK9ZZ5eRueP1tXxllTCbTLQbPoKvPlcaa6SLWG',
        114
    ),
    (
        273153,
        '2024-07-01 11:00:00.256308',
        '$2a$10$c1CvYUZdpJNSVMzL.1.LAez2Jkdx4Ej/OhkKvmUPfyplARbevEn9e',
        114
    ),
    (
        273154,
        '2024-07-01 11:50:00.425327',
        '$2a$10$TOVDxIfFn2o5hPJ26atZUeR1ZuHBpoDzsGzkE0XqGtwYuTslWLu3q',
        114
    ),
    (
        273156,
        '2024-07-02 05:54:02.102460',
        '$2a$10$hxWxMy61cCTxEF42HTWmhOhwB/O/StoQnK3vID.bAPdg4TQE9AHrG',
        114
    ),
    (
        273157,
        '2024-07-02 05:54:02.733113',
        '$2a$10$0injHwixtbtw1gKRtLn.XutYyM7yzXAb0Ll2MnbUUTxOssyEdC2PO',
        114
    ),
    (
        273158,
        '2024-07-02 05:54:02.755106',
        '$2a$10$oZhnX8qvQOKSdzB35gRQneGe/3tFdj8MSru8zo37Si1dRYZRdL32e',
        114
    ),
    (
        273159,
        '2024-07-02 05:55:00.302699',
        '$2a$10$InLcdQ3tEwxVdUwjwzdqBO0JyOodMLW9x8i07lhB18NNU0Ff0WHNG',
        114
    ),
    (
        273160,
        '2024-07-02 06:05:00.333810',
        '$2a$10$klWfeTcpa61/p7kNVKOV4..UB9/iv.rppN.wC5NDdIIPcd5PD8lx.',
        114
    ),
    (
        273161,
        '2024-07-02 06:09:00.454099',
        '$2a$10$JapXjeQKSJKtvRDy6TIAi.Lsh0pUANSdw.r9SvWoK09PCteX8HPXu',
        114
    ),
    (
        273162,
        '2024-07-02 10:49:15.081819',
        '$2a$10$OWOMXFs0D9eu6F9UScxkpO14sWmNCFzCCyVdsxitpa/XTG5RjHk3G',
        114
    ),
    (
        273163,
        '2024-07-02 10:50:00.325936',
        '$2a$10$nVfoXdhAlKVZGadsdNcEheeIqlDre1zKetpIo5.IToDNZp7z5.5Zq',
        114
    ),
    (
        273164,
        '2024-07-02 10:50:00.344934',
        '$2a$10$MWljGKOi3NhpJjqrnBRFGegGqhvbtdRMQcqe4rSfb/u2ykYD4t7yq',
        114
    ),
    (
        273165,
        '2024-07-02 11:40:00.341487',
        '$2a$10$1OHOL260.RVceIGPK6ra6ey.VNoRSh0H4GgKP/i7Qvc.R8dlXZJwC',
        114
    ),
    (
        273167,
        '2024-07-03 05:42:06.989095',
        '$2a$10$YcSwVOaruLVi.ySQFGrkIu2v0fgQS.FvO.5wWi/Hsb5BfVGsmPGvu',
        114
    ),
    (
        273169,
        '2024-07-03 05:45:49.047050',
        '$2a$10$vaiNm5shnrZR1yadbkbmSOsLFLKmoOrDY/pvuxnDjHcoDxhkq2cG6',
        114
    ),
    (
        273170,
        '2024-07-03 05:49:59.458197',
        '$2a$10$MDZpRRMHeBsEL2ZQITtnXOTPZ9F1bsF9u7bWO2l799QEukBUD16XO',
        114
    );

/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `rfid`
--
DROP TABLE IF EXISTS `rfid`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `rfid` (
        `CODE` bigint NOT NULL,
        `AUTH_ID` bigint NOT NULL,
        PRIMARY KEY (`AUTH_ID`),
        UNIQUE KEY `UK_ha7mnfksqcnicwb0968av6sxc` (`CODE`),
        CONSTRAINT `FK_RFID_AUTHENTICATION` FOREIGN KEY (`AUTH_ID`) REFERENCES `authentication` (`AUTH_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid`
--
LOCK TABLES `rfid` WRITE;

/*!40000 ALTER TABLE `rfid` DISABLE KEYS */;

/*!40000 ALTER TABLE `rfid` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `role`
--
DROP TABLE IF EXISTS `role`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `role` (
        `ID` bigint NOT NULL AUTO_INCREMENT,
        `ACTIVE` bit (1) NOT NULL,
        `DATE_INS` datetime (6) NOT NULL,
        `DATE_MODIF` datetime (6) DEFAULT NULL,
        `VERSION_LOCK` int NOT NULL,
        `DESCRIPTION` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 148 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--
LOCK TABLES `role` WRITE;

/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO
    `role`
VALUES
    (
        128,
        _binary '',
        '2022-09-22 11:33:16.056312',
        '2022-10-27 12:28:33.425558',
        2,
        'Rol de administrador de EMI Suite',
        'Administrador'
    ),
    (
        129,
        _binary '',
        '2023-01-13 08:56:16.979480',
        '2023-01-13 08:57:12.802823',
        1,
        'Rol de administrador de Visual Tracking',
        'VT - Administrador'
    ),
    (
        130,
        _binary '',
        '2023-01-13 08:58:07.263519',
        NULL,
        0,
        'Rol de operario en producción de Visual Tracking',
        'VT - Operario'
    );

/*!40000 ALTER TABLE `role` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `role_to_permission`
--
DROP TABLE IF EXISTS `role_to_permission`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `role_to_permission` (
        `PERMISSION` bigint NOT NULL,
        `ROLE` bigint NOT NULL,
        PRIMARY KEY (`PERMISSION`, `ROLE`),
        KEY `FK_RTP_ROLE` (`ROLE`),
        CONSTRAINT `FK_RTP_PERMISSION` FOREIGN KEY (`PERMISSION`) REFERENCES `permission` (`ID`),
        CONSTRAINT `FK_RTP_ROLE` FOREIGN KEY (`ROLE`) REFERENCES `role` (`ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_to_permission`
--
LOCK TABLES `role_to_permission` WRITE;

/*!40000 ALTER TABLE `role_to_permission` DISABLE KEYS */;

INSERT INTO
    `role_to_permission`
VALUES
    (1, 128),
    (2, 128),
    (3, 128),
    (5, 128),
    (6, 128),
    (7, 128),
    (8, 128),
    (9, 128),
    (10, 128),
    (11, 128),
    (12, 128),
    (13, 128),
    (14, 128),
    (15, 128),
    (16, 128),
    (17, 128),
    (18, 128),
    (19, 128),
    (20, 128),
    (21, 128),
    (22, 128),
    (23, 128),
    (24, 128),
    (25, 128),
    (26, 128),
    (30, 128),
    (31, 128),
    (32, 128),
    (33, 128),
    (34, 128),
    (35, 128),
    (36, 128),
    (38, 128),
    (39, 128),
    (40, 128),
    (41, 128),
    (43, 128),
    (44, 128),
    (45, 128),
    (46, 128),
    (47, 128),
    (48, 128),
    (49, 128),
    (50, 128),
    (52, 128),
    (53, 128),
    (54, 128),
    (55, 128),
    (56, 128),
    (57, 128),
    (58, 128),
    (59, 128),
    (60, 128),
    (61, 128),
    (62, 128),
    (63, 128),
    (64, 128),
    (65, 128),
    (66, 128),
    (67, 128),
    (68, 128),
    (69, 128),
    (70, 128),
    (71, 128),
    (72, 128),
    (73, 128),
    (74, 128),
    (75, 128),
    (76, 128),
    (77, 128),
    (78, 128),
    (79, 128),
    (80, 128),
    (81, 128),
    (82, 128),
    (83, 128),
    (84, 128),
    (85, 128),
    (87, 128),
    (88, 128),
    (89, 128),
    (90, 128),
    (91, 128),
    (92, 128),
    (93, 128),
    (94, 128),
    (95, 128),
    (96, 128),
    (97, 128),
    (98, 128),
    (99, 128),
    (100, 128),
    (101, 128),
    (102, 128),
    (103, 128),
    (104, 128),
    (105, 128),
    (106, 128),
    (107, 128),
    (108, 128),
    (109, 128),
    (110, 128),
    (111, 128),
    (112, 128),
    (113, 128),
    (114, 128),
    (115, 128),
    (116, 128),
    (117, 128),
    (118, 128),
    (119, 128),
    (120, 128),
    (121, 128),
    (122, 128),
    (123, 128),
    (124, 128),
    (125, 128),
    (126, 128),
    (127, 128),
    (128, 128),
    (129, 128),
    (130, 128),
    (133, 128),
    (134, 128),
    (135, 128),
    (137, 128),
    (138, 128),
    (139, 128),
    (140, 128),
    (141, 128),
    (142, 128),
    (143, 128),
    (144, 128),
    (145, 128),
    (146, 128),
    (147, 128),
    (148, 128),
    (149, 128),
    (150, 128),
    (151, 128),
    (152, 128),
    (153, 128),
    (154, 128),
    (155, 128),
    (156, 128),
    (157, 128),
    (158, 128),
    (159, 128),
    (160, 128),
    (161, 128),
    (162, 128),
    (163, 128),
    (164, 128),
    (165, 128),
    (166, 128),
    (167, 128),
    (168, 128),
    (169, 128),
    (170, 128),
    (171, 128),
    (172, 128),
    (173, 128),
    (174, 128),
    (175, 128),
    (176, 128),
    (177, 128),
    (178, 128),
    (179, 128),
    (180, 128),
    (181, 128),
    (182, 128),
    (183, 128),
    (184, 128),
    (185, 128),
    (186, 128),
    (187, 128),
    (188, 128),
    (189, 128),
    (190, 128),
    (191, 128),
    (192, 128),
    (193, 128),
    (194, 128),
    (195, 128),
    (196, 128),
    (197, 128),
    (198, 128),
    (199, 128),
    (200, 128),
    (201, 128),
    (202, 128),
    (203, 128),
    (204, 128),
    (205, 128),
    (206, 128),
    (207, 128),
    (208, 128),
    (209, 128),
    (210, 128),
    (211, 128),
    (212, 128),
    (213, 128),
    (214, 128),
    (215, 128),
    (216, 128),
    (217, 128),
    (218, 128),
    (219, 128),
    (220, 128),
    (221, 128),
    (222, 128),
    (223, 128),
    (224, 128),
    (225, 128),
    (226, 128),
    (227, 128),
    (228, 128),
    (229, 128),
    (230, 128),
    (231, 128),
    (232, 128),
    (233, 128),
    (234, 128),
    (235, 128),
    (236, 128),
    (237, 128),
    (238, 128),
    (239, 128),
    (240, 128),
    (241, 128),
    (242, 128),
    (243, 128),
    (244, 128),
    (245, 128),
    (246, 128),
    (247, 128),
    (248, 128),
    (249, 128),
    (250, 128),
    (251, 128),
    (252, 128),
    (253, 128),
    (254, 128),
    (255, 128),
    (256, 128),
    (257, 128),
    (258, 128),
    (259, 128),
    (260, 128),
    (261, 128),
    (262, 128),
    (263, 128),
    (264, 128),
    (265, 128),
    (266, 128),
    (267, 128),
    (268, 128),
    (269, 128),
    (270, 128),
    (271, 128),
    (272, 128),
    (273, 128),
    (274, 128),
    (275, 128),
    (276, 128),
    (277, 128),
    (278, 128),
    (279, 128),
    (280, 128),
    (281, 128),
    (282, 128),
    (283, 128),
    (284, 128),
    (285, 128),
    (286, 128),
    (287, 128),
    (288, 128),
    (289, 128),
    (290, 128),
    (291, 128),
    (292, 128),
    (293, 128),
    (294, 128),
    (295, 128),
    (296, 128),
    (297, 128),
    (298, 128),
    (299, 128),
    (300, 128),
    (301, 128),
    (302, 128),
    (303, 128),
    (304, 128),
    (305, 128),
    (306, 128),
    (307, 128),
    (308, 128),
    (309, 128),
    (310, 128),
    (311, 128),
    (312, 128),
    (313, 128),
    (314, 128),
    (315, 128),
    (316, 128),
    (317, 128),
    (318, 128),
    (319, 128),
    (320, 128),
    (321, 128),
    (322, 128),
    (323, 128),
    (324, 128),
    (325, 128),
    (326, 128),
    (327, 128),
    (328, 128),
    (333, 128),
    (334, 128),
    (335, 128),
    (336, 128),
    (337, 128),
    (338, 128),
    (339, 128),
    (340, 128),
    (342, 128),
    (343, 128),
    (344, 128),
    (345, 128),
    (346, 128),
    (347, 128),
    (348, 128),
    (349, 128),
    (350, 128),
    (352, 128),
    (354, 128),
    (356, 128),
    (358, 128),
    (360, 128),
    (361, 128),
    (362, 128),
    (363, 128),
    (364, 128),
    (366, 128),
    (367, 128),
    (368, 128),
    (369, 128),
    (370, 128),
    (371, 128),
    (372, 128),
    (373, 128),
    (375, 128),
    (376, 128),
    (377, 128),
    (379, 128),
    (381, 128),
    (382, 128),
    (383, 128),
    (385, 128),
    (386, 128),
    (387, 128),
    (388, 128),
    (389, 128),
    (390, 128),
    (391, 128),
    (392, 128),
    (393, 128),
    (394, 128),
    (395, 128),
    (396, 128),
    (397, 128),
    (398, 128),
    (52, 129),
    (53, 129),
    (54, 129),
    (55, 129),
    (56, 129),
    (57, 129),
    (58, 129),
    (59, 129),
    (60, 129),
    (61, 129),
    (62, 129),
    (63, 129),
    (64, 129),
    (65, 129),
    (66, 129),
    (67, 129),
    (68, 129),
    (69, 129),
    (70, 129),
    (71, 129),
    (76, 129),
    (77, 129),
    (78, 129),
    (79, 129),
    (80, 129),
    (81, 129),
    (82, 129),
    (83, 129),
    (84, 129),
    (85, 129),
    (87, 129),
    (88, 129),
    (89, 129),
    (90, 129),
    (91, 129),
    (92, 129),
    (93, 129),
    (94, 129),
    (95, 129),
    (96, 129),
    (97, 129),
    (98, 129),
    (100, 129),
    (101, 129),
    (102, 129),
    (103, 129),
    (165, 129),
    (166, 129),
    (167, 129),
    (168, 129),
    (169, 129),
    (177, 129),
    (178, 129),
    (179, 129),
    (180, 129),
    (181, 129),
    (182, 129),
    (183, 129),
    (305, 129),
    (306, 129),
    (307, 129),
    (308, 129),
    (309, 129),
    (310, 129),
    (333, 129),
    (366, 129),
    (370, 129),
    (371, 129),
    (372, 129),
    (386, 129),
    (387, 129),
    (388, 129),
    (389, 129),
    (390, 129),
    (398, 129);

/*!40000 ALTER TABLE `role_to_permission` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `role_to_role`
--
DROP TABLE IF EXISTS `role_to_role`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `role_to_role` (
        `PARENT_ROLE` bigint NOT NULL,
        `SON_ROLE` bigint NOT NULL,
        PRIMARY KEY (`PARENT_ROLE`, `SON_ROLE`),
        KEY `FK_RTR_SON_ROLE` (`SON_ROLE`),
        CONSTRAINT `FK_RTR_PARENT_ROLE` FOREIGN KEY (`PARENT_ROLE`) REFERENCES `role` (`ID`),
        CONSTRAINT `FK_RTR_SON_ROLE` FOREIGN KEY (`SON_ROLE`) REFERENCES `role` (`ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_to_role`
--
LOCK TABLES `role_to_role` WRITE;

/*!40000 ALTER TABLE `role_to_role` DISABLE KEYS */;

/*!40000 ALTER TABLE `role_to_role` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `security_users`
--
DROP TABLE IF EXISTS `security_users`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `security_users` (
        `ID` bigint NOT NULL,
        `ACCESS_TYPE` int NOT NULL,
        `ACTIVE` bit (1) NOT NULL,
        `EDITABLE` bit (1) NOT NULL,
        `EMAIL` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `INACTIVITY_TIME` int NOT NULL,
            `LOCKED` bit (1) NOT NULL,
            `NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `PASSWORD` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `SURNAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `USERNAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_users`
--
LOCK TABLES `security_users` WRITE;

/*!40000 ALTER TABLE `security_users` DISABLE KEYS */;

/*!40000 ALTER TABLE `security_users` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `user`
--
DROP TABLE IF EXISTS `user`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `user` (
        `ID` bigint NOT NULL AUTO_INCREMENT,
        `ACTIVE` bit (1) NOT NULL,
        `DATE_INS` datetime (6) NOT NULL,
        `DATE_MODIF` datetime (6) DEFAULT NULL,
        `VERSION_LOCK` int NOT NULL,
        `ALLOWED_LOGIN` bit (1) NOT NULL DEFAULT 1,
        `EMAIL` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `FIRST_SURNAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `IMAGE` mediumblob,
            `IMAGE_TYPE` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `MOBILE_PHONE_NUMBER` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `PHONE_NUMBER` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `SECOND_SURNAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `USERNAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `EXTERNAL_CODE` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1075 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--
LOCK TABLES `user` WRITE;

/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO
    `user`
VALUES
    (
        114,
        _binary '',
        '2020-07-21 07:47:25.672405',
        '2023-01-13 09:00:52.587008',
        127,
        _binary '',
        '',
        'Root',
        NULL,
        'image/jpeg',
        '',
        'Root',
        '',
        'Root',
        'root',
        ''
    ),
    (
        834,
        _binary '',
        '2023-01-13 09:21:44.115246',
        '2023-01-13 09:22:13.189461',
        1,
        _binary '',
        '',
        'Producción',
        '',
        '',
        '',
        'Operario',
        '',
        '',
        'produccion',
        NULL
    );

/*!40000 ALTER TABLE `user` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `user_to_users_group`
--
DROP TABLE IF EXISTS `user_to_users_group`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `user_to_users_group` (
        `userID` bigint NOT NULL,
        `usersGroupID` bigint NOT NULL,
        PRIMARY KEY (`userID`, `usersGroupID`),
        KEY `FK_UTUG_USERS_GROUP` (`usersGroupID`),
        CONSTRAINT `FK_UTUG_USER` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`),
        CONSTRAINT `FK_UTUG_USERS_GROUP` FOREIGN KEY (`usersGroupID`) REFERENCES `users_group` (`ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_users_group`
--
LOCK TABLES `user_to_users_group` WRITE;

/*!40000 ALTER TABLE `user_to_users_group` DISABLE KEYS */;

INSERT INTO
    `user_to_users_group`
VALUES
    (114, 92),
    (114, 93),
    (834, 93),
    (114, 94),
    (834, 95);

/*!40000 ALTER TABLE `user_to_users_group` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `user_to_users_group_to_permission`
--
DROP TABLE IF EXISTS `user_to_users_group_to_permission`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `user_to_users_group_to_permission` (
        `PERMISSION` bigint NOT NULL,
        `GRANTED` bit (1) NOT NULL,
        `USER` bigint NOT NULL,
        `USERS_GROUP` bigint NOT NULL,
        PRIMARY KEY (`PERMISSION`, `USER`, `USERS_GROUP`),
        KEY `FK_UTUGTP_USER_TO_USERS_GROUP` (`USER`, `USERS_GROUP`),
        CONSTRAINT `FK_UTUGTP_PERMISSION` FOREIGN KEY (`PERMISSION`) REFERENCES `permission` (`ID`),
        CONSTRAINT `FK_UTUGTP_USER_TO_USERS_GROUP` FOREIGN KEY (`USER`, `USERS_GROUP`) REFERENCES `user_to_users_group` (`userID`, `usersGroupID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_users_group_to_permission`
--
LOCK TABLES `user_to_users_group_to_permission` WRITE;

/*!40000 ALTER TABLE `user_to_users_group_to_permission` DISABLE KEYS */;

/*!40000 ALTER TABLE `user_to_users_group_to_permission` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `user_to_users_group_to_role`
--
DROP TABLE IF EXISTS `user_to_users_group_to_role`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `user_to_users_group_to_role` (
        `ROLE` bigint NOT NULL,
        `GRANTED` bit (1) NOT NULL,
        `USER` bigint NOT NULL,
        `USERS_GROUP` bigint NOT NULL,
        PRIMARY KEY (`ROLE`, `USER`, `USERS_GROUP`),
        KEY `FK_UTUGTR_USER_TO_USERS_GROUP` (`USER`, `USERS_GROUP`),
        CONSTRAINT `FK_UTUGTR_ROLE` FOREIGN KEY (`ROLE`) REFERENCES `role` (`ID`),
        CONSTRAINT `FK_UTUGTR_USER_TO_USERS_GROUP` FOREIGN KEY (`USER`, `USERS_GROUP`) REFERENCES `user_to_users_group` (`userID`, `usersGroupID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_users_group_to_role`
--

LOCK TABLES `user_to_users_group_to_role` WRITE;

/*!40000 ALTER TABLE `user_to_users_group_to_role` DISABLE KEYS */;

INSERT INTO
    `user_to_users_group_to_role`
VALUES
    (128, _binary '', 114, 92),
    (128, _binary '', 114, 93),
    (128, _binary '', 114, 94),
    (129, _binary '', 114, 92),
    (129, _binary '', 114, 93),
    (129, _binary '', 114, 94),
    (130, _binary '', 834, 93),
    (130, _binary '', 834, 95);

/*!40000 ALTER TABLE `user_to_users_group_to_role` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `users_group`
--
DROP TABLE IF EXISTS `users_group`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `users_group` (
        `ID` bigint NOT NULL AUTO_INCREMENT,
        `ACTIVE` bit (1) NOT NULL,
        `DATE_INS` datetime (6) NOT NULL,
        `DATE_MODIF` datetime (6) DEFAULT NULL,
        `VERSION_LOCK` int NOT NULL,
        `DESCRIPTION` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `IMAGE` mediumblob,
            `IMAGE_TYPE` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
            `NAME` varchar(255) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 120 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_group`
--
LOCK TABLES `users_group` WRITE;

/*!40000 ALTER TABLE `users_group` DISABLE KEYS */;

INSERT INTO
    `users_group`
VALUES
    (
        92,
        _binary '',
        '2022-09-22 11:32:46.383715',
        '2022-10-27 12:28:01.244519',
        2,
        'Grupo de administración de EMI Suite',
        '',
        '',
        'Administración'
    ),
    (
        93,
        _binary '',
        '2023-01-13 08:54:06.474442',
        '2023-01-13 09:22:01.388151',
        2,
        'Grupo de usuarios de Visual Tracking',
        '',
        '',
        'Visual Tracking'
    ),
    (
        94,
        _binary '',
        '2023-01-13 08:55:07.245465',
        '2023-01-13 08:55:25.749240',
        1,
        'Grupo de administración de Visual Tracking',
        '',
        '',
        'Visual Tracking - Administración'
    ),
    (
        95,
        _binary '',
        '2023-01-13 08:55:50.953540',
        '2023-01-13 09:22:07.002056',
        1,
        'Grupo de producción de Visual Tracking',
        '',
        '',
        'Visual Tracking - Producción'
    );

/*!40000 ALTER TABLE `users_group` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `users_group_to_role`
--
DROP TABLE IF EXISTS `users_group_to_role`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `users_group_to_role` (
        `ROLE` bigint NOT NULL,
        `USERS_GROUP` bigint NOT NULL,
        PRIMARY KEY (`ROLE`, `USERS_GROUP`),
        KEY `FK_UGTR_USERS_GROUP` (`USERS_GROUP`),
        CONSTRAINT `FK_UGTR_ROLE` FOREIGN KEY (`ROLE`) REFERENCES `role` (`ID`),
        CONSTRAINT `FK_UGTR_USERS_GROUP` FOREIGN KEY (`USERS_GROUP`) REFERENCES `users_group` (`ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_group_to_role`
--
LOCK TABLES `users_group_to_role` WRITE;

/*!40000 ALTER TABLE `users_group_to_role` DISABLE KEYS */;

INSERT INTO
    `users_group_to_role`
VALUES
    (128, 92);

/*!40000 ALTER TABLE `users_group_to_role` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Dumping routines for database 'snc_security_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03  8:02:34