-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: document_manager
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
-- Table structure for table `dmr_document_permissions`
--
CREATE DATABASE IF NOT EXISTS document_manager;
USE document_manager;



DROP TABLE IF EXISTS `dmr_document_permissions`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `dmr_document_permissions` (
        `IDDocument` bigint NOT NULL,
        `IDSecGroup` bigint NOT NULL,
        PRIMARY KEY (`IDDocument`, `IDSecGroup`),
        CONSTRAINT `FK_DOCUMENT_PERMISSION_DOCUMENT` FOREIGN KEY (`IDDocument`) REFERENCES `dmr_documents` (`IDDocument`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmr_document_permissions`
--
LOCK TABLES `dmr_document_permissions` WRITE;

/*!40000 ALTER TABLE `dmr_document_permissions` DISABLE KEYS */;

/*!40000 ALTER TABLE `dmr_document_permissions` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `dmr_document_userpermissions`
--
DROP TABLE IF EXISTS `dmr_document_userpermissions`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `dmr_document_userpermissions` (
        `IDDocument` bigint NOT NULL,
        `IDSecGroup` bigint NOT NULL,
        `IDUser` bigint NOT NULL,
        PRIMARY KEY (`IDDocument`, `IDSecGroup`, `IDUser`),
        CONSTRAINT `FK_DOCUMENT_USERPERMISSION_DOCUMENT` FOREIGN KEY (`IDDocument`) REFERENCES `dmr_documents` (`IDDocument`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmr_document_userpermissions`
--
LOCK TABLES `dmr_document_userpermissions` WRITE;

/*!40000 ALTER TABLE `dmr_document_userpermissions` DISABLE KEYS */;

/*!40000 ALTER TABLE `dmr_document_userpermissions` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `dmr_document_versions`
--
DROP TABLE IF EXISTS `dmr_document_versions`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `dmr_document_versions` (
        `IDDocument` bigint NOT NULL,
        `IDVersion` bigint NOT NULL,
        `ExternalCode` varchar(500) DEFAULT NULL,
        `IDUser` bigint NOT NULL,
        `MimeType` varchar(500) DEFAULT NULL,
        `modifiedDate` datetime (6) DEFAULT NULL,
        `Reason` varchar(500) DEFAULT NULL,
        `UploadDate` datetime (6) NOT NULL,
        `VersionStatus` varchar(10) NOT NULL,
        PRIMARY KEY (`IDDocument`, `IDVersion`),
        CONSTRAINT `FK_DOCUMENT_VERSION_DOCUMENT` FOREIGN KEY (`IDDocument`) REFERENCES `dmr_documents` (`IDDocument`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmr_document_versions`
--
LOCK TABLES `dmr_document_versions` WRITE;

/*!40000 ALTER TABLE `dmr_document_versions` DISABLE KEYS */;

/*!40000 ALTER TABLE `dmr_document_versions` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `dmr_documents`
--
DROP TABLE IF EXISTS `dmr_documents`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
    `dmr_documents` (
        `IDDocument` bigint NOT NULL AUTO_INCREMENT,
        `Name` varchar(200) NOT NULL,
        `TypeDoc` varchar(10) NOT NULL,
        `Uuid` varchar(36) NOT NULL,
        `IDParent` bigint DEFAULT NULL,
        PRIMARY KEY (`IDDocument`),
        UNIQUE KEY `UKmkfwydknrbhv6g5gb3is9cvjn` (`Name`, `TypeDoc`, `IDParent`),
        KEY `FK_DOCUMENT_PARENT` (`IDParent`),
        CONSTRAINT `FK_DOCUMENT_PARENT` FOREIGN KEY (`IDParent`) REFERENCES `dmr_documents` (`IDDocument`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 377 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmr_documents`
--
LOCK TABLES `dmr_documents` WRITE;

/*!40000 ALTER TABLE `dmr_documents` DISABLE KEYS */;

INSERT INTO
    `dmr_documents`
VALUES
    (
        1,
        'Emisuite',
        'FOLDER',
        'd02e4ad2-2fc6-11ef-8371-0a0027000007',
        NULL
    ),
    (
        2,
        'Visual Tracking',
        'FOLDER',
        'd031841d-2fc6-11ef-8371-0a0027000007',
        1
    ),
    (
        3,
        'Visual SGA',
        'FOLDER',
        'd0343fc8-2fc6-11ef-8371-0a0027000007',
        1
    ),
    (
        4,
        'My Factory',
        'FOLDER',
        'd0367021-2fc6-11ef-8371-0a0027000007',
        1
    ),
    (
        5,
        'Easy GMAO',
        'FOLDER',
        '6d44b088-2324-4afd-b186-514f150205cb',
        1
    ),
    (
        6,
        'Digital People',
        'FOLDER',
        '3791fbdb-cb62-4742-9cf3-fc8f79d8a51c',
        1
    ),
    (
        7,
        'clients',
        'FOLDER',
        'fe84a6dd-b405-4ebe-925a-c7c7167852cf',
        NULL
    ),
    (
        8,
        '1',
        'FOLDER',
        '3f9a1b03-a88b-49c7-9cae-15e70ac79bb7',
        7
    ),
    (
        9,
        'vt',
        'FOLDER',
        'eeb9922e-3c99-45e4-b3e6-7fa6ae8e1da8',
        8
    ),
    (
        10,
        'items',
        'FOLDER',
        'd1a35662-b10c-4232-bf2b-8faee4ea8391',
        9
    ),
    (
        11,
        '839037-17-30',
        'FOLDER',
        '36005d3c-12f2-4676-9590-e48885df201d',
        10
    ),
    (
        12,
        'Datos de la OF',
        'FOLDER',
        'e8277704-d10e-462a-9e3b-b1b532fa149b',
        11
    ),
    (
        13,
        'v1',
        'FOLDER',
        '75585006-db26-4bc7-9a83-5731f04a893a',
        12
    ),
    (
        14,
        '839037-1597-30',
        'FOLDER',
        '6e2db5c9-6edd-4245-88f4-877231ea036b',
        10
    ),
    (
        15,
        'Datos de la OF',
        'FOLDER',
        '65808ce4-0525-4f6b-bb35-5ff409c2c04e',
        14
    ),
    (
        16,
        'v1',
        'FOLDER',
        'c87ecdfa-4c90-494a-a61f-cc1bcd47e12e',
        15
    ),
    (
        17,
        '769082-1619-30',
        'FOLDER',
        '85fe519d-9a45-4287-b161-ff5135dfef22',
        10
    ),
    (
        18,
        'Datos de la OF',
        'FOLDER',
        'f05144e7-bc0d-4297-a319-db9c3f27ff98',
        17
    ),
    (
        19,
        'v1',
        'FOLDER',
        '06dfaa10-29f7-46a6-bfe1-b86eda86e85e',
        18
    ),
    (
        20,
        '769082-1619-20',
        'FOLDER',
        '0d622ae4-080e-44df-8457-2f708fe8a1de',
        10
    ),
    (
        21,
        'Datos de la OF',
        'FOLDER',
        '583cdd78-ef7e-4638-9ec7-a778d6cceeba',
        20
    ),
    (
        22,
        'v1',
        'FOLDER',
        'd09b938a-1122-48d5-941f-557b4ac7ba74',
        21
    ),
    (
        23,
        '769082-1619-10',
        'FOLDER',
        '5e25cef2-a14a-4c76-a8b9-db4812982710',
        10
    ),
    (
        24,
        'Datos de la OF',
        'FOLDER',
        '8fcdf1a2-6c7e-4115-aa4b-75d9d206d41b',
        23
    ),
    (
        25,
        'v1',
        'FOLDER',
        'fcf6abd8-9ea1-46df-b215-2935f4fb5ae7',
        24
    ),
    (
        26,
        '839037-1597-20',
        'FOLDER',
        'd28a236d-796d-405d-aa92-d5b405c69986',
        10
    ),
    (
        27,
        'Datos de la OF',
        'FOLDER',
        '1f88e78b-87c9-49f3-b696-050a6ad71476',
        26
    ),
    (
        28,
        'v1',
        'FOLDER',
        'f7a5fd4b-c8e9-4b3b-a271-6026f929d6d7',
        27
    ),
    (
        29,
        '839037-1597-10',
        'FOLDER',
        'ca776c17-75ba-47d4-90bf-cd579d710809',
        10
    ),
    (
        30,
        'Datos de la OF',
        'FOLDER',
        '19886d06-c019-4e3b-bd38-bfbda87e2176',
        29
    ),
    (
        31,
        'v1',
        'FOLDER',
        '81c62068-3ca9-489b-9612-d7867759f9d6',
        30
    ),
    (
        32,
        '531444-1615-30',
        'FOLDER',
        '6dc3f9fd-da88-47c5-8c30-7b1709529e29',
        10
    ),
    (
        33,
        'Datos de la OF',
        'FOLDER',
        'ea357822-765e-4de4-9994-dbcda2e9a97c',
        32
    ),
    (
        34,
        'v1',
        'FOLDER',
        '63421385-fb96-4977-985a-39fe96912464',
        33
    ),
    (
        35,
        '531444-1615-20',
        'FOLDER',
        '68c1299c-d617-4c32-869d-19c6fd05a647',
        10
    ),
    (
        36,
        'Datos de la OF',
        'FOLDER',
        'f13d23d5-f6ec-4ca1-af9f-0f3d57c57720',
        35
    ),
    (
        37,
        'v1',
        'FOLDER',
        'c37371dc-a2ce-49b0-b023-be185429b8bf',
        36
    ),
    (
        38,
        '531444-1615-10',
        'FOLDER',
        '89f826bd-ef58-4d39-8fa4-547cfc02765b',
        10
    ),
    (
        39,
        'Datos de la OF',
        'FOLDER',
        '2b48df0f-774b-4a1b-9779-ac96ff4306d8',
        38
    ),
    (
        40,
        'v1',
        'FOLDER',
        '34718ac5-2873-4ea5-b496-237e2a47d85a',
        39
    ),
    (
        41,
        '541445-1615-30',
        'FOLDER',
        '4c493cc7-435c-4b60-a18b-bc318039e943',
        10
    ),
    (
        42,
        'Datos de la OF',
        'FOLDER',
        '3179bc27-caa6-4dab-95e2-6eddefb5abd6',
        41
    ),
    (
        43,
        'v1',
        'FOLDER',
        'b7194a5b-efc3-43b1-ba6e-d045262202ef',
        42
    ),
    (
        44,
        '541445-1615-20',
        'FOLDER',
        '7dd59238-fcfe-4ec1-b505-9dbed544366d',
        10
    ),
    (
        45,
        'Datos de la OF',
        'FOLDER',
        'eb383139-6cd1-4932-987c-2011723b6245',
        44
    ),
    (
        46,
        'v1',
        'FOLDER',
        'c90aeca5-38e1-4cf1-a721-5f07f446a5e3',
        45
    ),
    (
        47,
        '541445-1615-10',
        'FOLDER',
        'a7453b83-3af8-4add-9c99-a05b0561f697',
        10
    ),
    (
        48,
        'Datos de la OF',
        'FOLDER',
        '7e062c9e-0511-411e-b62f-1a73c5cd4cbb',
        47
    ),
    (
        49,
        'v1',
        'FOLDER',
        '97656a64-06df-4289-a91b-052f755166a6',
        48
    ),
    (
        50,
        '670788-1617-30',
        'FOLDER',
        'cbb33076-b4f1-4b4f-8265-0511f6bbc24d',
        10
    ),
    (
        51,
        'Datos de la OF',
        'FOLDER',
        '191bae21-8f81-473f-87dd-5c6cdd20b976',
        50
    ),
    (
        52,
        'v1',
        'FOLDER',
        '118ad36a-fd20-4042-b334-4a4cefd7e928',
        51
    ),
    (
        53,
        '670788-1617-20',
        'FOLDER',
        '80310abc-29ef-4ff1-8103-ae1a33e8b0c8',
        10
    ),
    (
        54,
        'Datos de la OF',
        'FOLDER',
        '3a3f7b34-76d8-4f15-a58a-21ec07124b46',
        53
    ),
    (
        55,
        'v1',
        'FOLDER',
        'b131cc2e-e7b4-4743-8055-828ef2a49f92',
        54
    ),
    (
        56,
        '670788-1617-10',
        'FOLDER',
        '0f9d8818-8345-48b6-baea-722e9f22a6b4',
        10
    ),
    (
        57,
        'Datos de la OF',
        'FOLDER',
        '821453c3-7d07-4168-be3a-dabde4a1ed2f',
        56
    ),
    (
        58,
        'v1',
        'FOLDER',
        'b6e1d041-bb87-4d33-b600-b76df963d02c',
        57
    ),
    (
        59,
        '661219-1617-30',
        'FOLDER',
        '14f0f696-d9a8-4945-8955-59522f2bf15f',
        10
    ),
    (
        60,
        'Datos de la OF',
        'FOLDER',
        '68618409-c4dc-44ce-b2a5-4a77c1e137a0',
        59
    ),
    (
        61,
        'v1',
        'FOLDER',
        '0b88f58c-172e-4fa1-9d46-bfdadcf0d245',
        60
    ),
    (
        62,
        '661219-1617-20',
        'FOLDER',
        '8314fec1-04f1-494a-b01c-071826d0df77',
        10
    ),
    (
        63,
        'Datos de la OF',
        'FOLDER',
        '65b1718f-e69b-45f5-8540-21f814a050b5',
        62
    ),
    (
        64,
        'v1',
        'FOLDER',
        '3eb69f82-93a3-4127-bb3f-dcb828d82b57',
        63
    ),
    (
        65,
        '661219-1617-10',
        'FOLDER',
        '6d9db6cb-c595-4f1b-b466-a82b2e257a3a',
        10
    ),
    (
        66,
        'Datos de la OF',
        'FOLDER',
        'd869d55a-108a-407f-8085-204d117b920e',
        65
    ),
    (
        67,
        'v1',
        'FOLDER',
        'dd6e111f-0951-4f16-91d9-ff216ecbf9f7',
        66
    ),
    (
        68,
        '001220-1617-30',
        'FOLDER',
        '7939fcd1-af1e-497b-91a9-4ebef290e2c8',
        10
    ),
    (
        69,
        'Datos de la OF',
        'FOLDER',
        '767751a0-2003-4bad-9374-5d004be1cdeb',
        68
    ),
    (
        70,
        'v1',
        'FOLDER',
        '1d757b61-18ee-4f74-bc7a-5e95d9c88e41',
        69
    ),
    (
        71,
        '001220-1617-20',
        'FOLDER',
        '1463d4a2-ac6e-4f8f-a6c9-dd07b7cedfbf',
        10
    ),
    (
        72,
        'Datos de la OF',
        'FOLDER',
        'af41fcf8-2b7a-4783-bfab-206e0466f65d',
        71
    ),
    (
        73,
        'v1',
        'FOLDER',
        '7e58f014-f4a9-4c5a-bd92-c827ddbeb892',
        72
    ),
    (
        74,
        '001220-1617-10',
        'FOLDER',
        '18210150-db10-46cf-8241-f3cc6db4ab91',
        10
    ),
    (
        75,
        'Datos de la OF',
        'FOLDER',
        '6a57c1aa-3e47-470d-9b77-df4bbb7bf77d',
        74
    ),
    (
        76,
        'v1',
        'FOLDER',
        'ff3b89a7-6d12-4967-aab7-5e0ccc46706e',
        75
    ),
    (
        77,
        '651507-1617-30',
        'FOLDER',
        '60727b2a-a2f4-431e-b1f1-80f6c75bd96a',
        10
    ),
    (
        78,
        'Datos de la OF',
        'FOLDER',
        'e5f74b5a-972c-4bbe-9b8a-288e5d9ebabb',
        77
    ),
    (
        79,
        'v1',
        'FOLDER',
        '15be608f-9286-4f74-86d2-81c8bf7839ee',
        78
    ),
    (
        80,
        '651507-1617-20',
        'FOLDER',
        '61965fe4-320b-4144-b875-b36576ba1d9e',
        10
    ),
    (
        81,
        'Datos de la OF',
        'FOLDER',
        '82aef585-999d-4652-878b-8bc7d0cd163a',
        80
    ),
    (
        82,
        'v1',
        'FOLDER',
        '03de609b-880e-4218-9763-0e7384fae67f',
        81
    ),
    (
        83,
        '651507-1617-10',
        'FOLDER',
        'e3270d03-be16-4f80-8d44-d0fa35bd099a',
        10
    ),
    (
        84,
        'Datos de la OF',
        'FOLDER',
        'd0183572-b87f-40b8-b337-6a0a4b7099ba',
        83
    ),
    (
        85,
        'v1',
        'FOLDER',
        '7dd5689e-d178-4651-8501-30369ec47c5b',
        84
    ),
    (
        86,
        '759081-1619-30',
        'FOLDER',
        '40b7e036-1d30-4a76-a7da-c1f5823a9a38',
        10
    ),
    (
        87,
        'Datos de la OF',
        'FOLDER',
        '253ec2dc-d265-4f17-a2e3-ca2c1c7f7469',
        86
    ),
    (
        88,
        'v1',
        'FOLDER',
        '4993c959-6615-4965-abb7-d8641527bbec',
        87
    ),
    (
        89,
        '759081-1619-20',
        'FOLDER',
        'a07572f8-ce88-4a3b-b549-e899608bc903',
        10
    ),
    (
        90,
        'Datos de la OF',
        'FOLDER',
        'e8606a5b-0382-467e-8136-51e0cf8453ed',
        89
    ),
    (
        91,
        'v1',
        'FOLDER',
        '781e76bb-7e9c-4d97-91dc-5e9ee818ccfa',
        90
    ),
    (
        92,
        '759081-1619-10',
        'FOLDER',
        'c6cb7410-74ae-4e18-997d-b4701b15da62',
        10
    ),
    (
        93,
        'Datos de la OF',
        'FOLDER',
        'b2d138f8-7bd2-40e0-a9b0-4e6ba223d837',
        92
    ),
    (
        94,
        'v1',
        'FOLDER',
        '20a224e8-7c6e-4102-ae6d-b89190647109',
        93
    ),
    (
        95,
        '739088-1620-30',
        'FOLDER',
        'e3be25f1-f71e-4912-84d8-c14883d95e6f',
        10
    ),
    (
        96,
        'Datos de la OF',
        'FOLDER',
        'ac5806b7-3e57-46d5-998c-76a6f89b93fe',
        95
    ),
    (
        97,
        'v1',
        'FOLDER',
        'ba7f0ea5-ffa8-4c14-b450-8d08e486c392',
        96
    ),
    (
        98,
        '739088-1620-20',
        'FOLDER',
        '71446386-86b2-4c0e-be54-4fe93397ad02',
        10
    ),
    (
        99,
        'Datos de la OF',
        'FOLDER',
        '6d577ca7-5aea-4914-a6ce-dd1957cd90ef',
        98
    ),
    (
        100,
        'v1',
        'FOLDER',
        '2cfb4e78-4798-4e47-9aad-98103c802ca1',
        99
    ),
    (
        101,
        '739088-1620-10',
        'FOLDER',
        '27f15099-cacc-4c03-8a72-fa2e18923b3b',
        10
    ),
    (
        102,
        'Datos de la OF',
        'FOLDER',
        '59330b6a-a775-4cbd-9ef6-4dfeda68409c',
        101
    ),
    (
        103,
        'v1',
        'FOLDER',
        'b937c7c2-a140-44a6-93dd-0b1c72e102eb',
        102
    ),
    (
        104,
        '740609-1620-30',
        'FOLDER',
        'ac1533ad-4002-4e13-86db-74f3c7b1a2f4',
        10
    ),
    (
        105,
        'Datos de la OF',
        'FOLDER',
        '94b5e0a5-e894-4bec-a692-c8e1142e78a4',
        104
    ),
    (
        106,
        'v1',
        'FOLDER',
        '81dfbd37-f182-46a5-92f3-5680227cac6f',
        105
    ),
    (
        107,
        '740609-1620-20',
        'FOLDER',
        'e9595d6c-9a92-42b2-af52-6b8072f66a5c',
        10
    ),
    (
        108,
        'Datos de la OF',
        'FOLDER',
        '5165c49f-db50-4d64-9f1d-3e8aaaa1249d',
        107
    ),
    (
        109,
        'v1',
        'FOLDER',
        '256c849c-9469-4098-82a8-472c0d3291b1',
        108
    ),
    (
        110,
        '740609-1620-10',
        'FOLDER',
        '05fe8c12-ac9e-4dbb-ad5b-83e57cbfa4b1',
        10
    ),
    (
        111,
        'Datos de la OF',
        'FOLDER',
        '81352a5f-b966-4af1-8925-311f5d2d4421',
        110
    ),
    (
        112,
        'v1',
        'FOLDER',
        'eed6726c-987b-453b-9ebd-1944821bfc9a',
        111
    ),
    (
        113,
        '671447-1629-30',
        'FOLDER',
        'e539cc30-a267-4ac3-93cb-1b22d5d76464',
        10
    ),
    (
        114,
        'Datos de la OF',
        'FOLDER',
        '5652a4a4-3fef-4f60-b943-10cc87015ac8',
        113
    ),
    (
        115,
        'v1',
        'FOLDER',
        '44776e90-7dab-4625-8c2a-d9a78da93b19',
        114
    ),
    (
        116,
        '671447-1629-20',
        'FOLDER',
        '4dd1a920-3a3c-4556-98ee-c72769d6606c',
        10
    ),
    (
        117,
        'Datos de la OF',
        'FOLDER',
        '01eff968-0504-4c4e-9859-ac4d52fca6a1',
        116
    ),
    (
        118,
        'v1',
        'FOLDER',
        '408b9957-4c61-48f5-b8a2-23292f65b9de',
        117
    ),
    (
        119,
        '671447-1629-10',
        'FOLDER',
        'a5332bef-03ef-46ca-aa82-77b5a8cdc363',
        10
    ),
    (
        120,
        'Datos de la OF',
        'FOLDER',
        '9bd3bc9e-3ed8-46cd-9511-d75e16f26d5a',
        119
    ),
    (
        121,
        'v1',
        'FOLDER',
        '6d3052a5-e1d4-446f-a5b3-ea462fee5fe7',
        120
    ),
    (
        122,
        '231451-1653-30',
        'FOLDER',
        'bb43d04c-aa92-46c7-bfe8-c8fd3e651904',
        10
    ),
    (
        123,
        'Datos de la OF',
        'FOLDER',
        'da18e0b6-ad1c-42e2-b08a-38c27cb3b225',
        122
    ),
    (
        124,
        'v1',
        'FOLDER',
        '43f1fd1f-b9ba-42b2-ae01-12d396d62c77',
        123
    ),
    (
        125,
        '231451-1653-20',
        'FOLDER',
        '7ee15a37-dcb4-4649-8112-5065630d7d45',
        10
    ),
    (
        126,
        'Datos de la OF',
        'FOLDER',
        '19cee94e-ee1b-4d35-9996-05f23ac75934',
        125
    ),
    (
        127,
        'v1',
        'FOLDER',
        '7326209e-8ba9-46f4-b505-af1c81f22df0',
        126
    ),
    (
        128,
        '231451-1653-10',
        'FOLDER',
        'c0e16db9-69aa-4c33-95e1-0ec68846adf4',
        10
    ),
    (
        129,
        'Datos de la OF',
        'FOLDER',
        '8cafeff0-ef8e-4a31-b197-8140c8f93f03',
        128
    ),
    (
        130,
        'v1',
        'FOLDER',
        '402cb760-ecec-43d8-b051-93a6ea166ade',
        129
    ),
    (
        131,
        '-1737-40',
        'FOLDER',
        '4881bb67-e5a6-4a41-a79c-eb7b53d27a55',
        10
    ),
    (
        132,
        'Datos de la OF',
        'FOLDER',
        'dd2b9cb6-d21c-4762-a432-036ad59cf0bc',
        131
    ),
    (
        133,
        'v1',
        'FOLDER',
        '288596e3-817f-404d-919a-01ec2ccbc832',
        132
    ),
    (
        134,
        '-1737-30',
        'FOLDER',
        'f20ed581-b630-40a0-b8ba-7677b978710b',
        10
    ),
    (
        135,
        'Datos de la OF',
        'FOLDER',
        '2207dbcd-ffe7-47c4-bfb9-47e664e05621',
        134
    ),
    (
        136,
        'v1',
        'FOLDER',
        '22f353a4-cd58-4358-afb0-49c07c164f9b',
        135
    ),
    (
        137,
        '-1737-20',
        'FOLDER',
        'e3be7c14-ea9e-49c3-bf0f-05c98e1f01fd',
        10
    ),
    (
        138,
        'Datos de la OF',
        'FOLDER',
        '9c260f33-fdcc-481b-8b53-68e4c59b2dda',
        137
    ),
    (
        139,
        'v1',
        'FOLDER',
        '3a37b02f-8a18-4d62-8b5b-6705766b912e',
        138
    ),
    (
        140,
        '-1737-10',
        'FOLDER',
        '63ecaf2d-e609-4b54-8a78-ea06dca3007e',
        10
    ),
    (
        141,
        'Datos de la OF',
        'FOLDER',
        '030b9b61-dfba-4e39-aec0-b613b0f2d5b2',
        140
    ),
    (
        142,
        'v1',
        'FOLDER',
        '1d2d0e02-ea5f-44f4-8451-5af3b61a1188',
        141
    ),
    (
        143,
        '050608-1752-40',
        'FOLDER',
        '4f7eb5db-06c4-4ff9-b396-4b3eb8f0cf9a',
        10
    ),
    (
        144,
        'Datos de la OF',
        'FOLDER',
        '759f34cd-c06d-4db9-9b62-51723969b0d5',
        143
    ),
    (
        145,
        'v1',
        'FOLDER',
        '1d93c468-6ffe-4508-be4d-5072cdd2ee64',
        144
    ),
    (
        146,
        '050608-1752-30',
        'FOLDER',
        'a4e6ac41-51a9-4230-879e-f1bb8af5ea7e',
        10
    ),
    (
        147,
        'Datos de la OF',
        'FOLDER',
        'e73bddcb-cac6-4b3e-abbb-38a28eee2a0e',
        146
    ),
    (
        148,
        'v1',
        'FOLDER',
        '36f0f230-12f3-4ed4-ae49-7eb9613dd93e',
        147
    ),
    (
        149,
        '050608-1752-20',
        'FOLDER',
        'be915af4-58e8-4e62-bfb4-0e57d252aa0d',
        10
    ),
    (
        150,
        'Datos de la OF',
        'FOLDER',
        '1d571a4e-d123-4c16-9832-4cc6a279960c',
        149
    ),
    (
        151,
        'v1',
        'FOLDER',
        '3c713609-4aa9-47d7-8f4c-63ee2b78f948',
        150
    ),
    (
        152,
        '050608-1752-10',
        'FOLDER',
        'dc1595c5-abef-4ec0-938c-95fcbf879384',
        10
    ),
    (
        153,
        'Datos de la OF',
        'FOLDER',
        '9e841e17-1f26-4054-a6ca-ccc7d8fb4ced',
        152
    ),
    (
        154,
        'v1',
        'FOLDER',
        '0a236ec2-84f8-431b-89d1-73c30f9f12f7',
        153
    ),
    (
        155,
        '079063-1753-40',
        'FOLDER',
        'd0633cad-2d24-4828-a40a-4b3c324b0017',
        10
    ),
    (
        156,
        'Datos de la OF',
        'FOLDER',
        '4b4a826a-2054-466f-b081-934461c3a1e3',
        155
    ),
    (
        157,
        'v1',
        'FOLDER',
        '8ef6a135-4519-442c-bab6-c6a30e8f810f',
        156
    ),
    (
        158,
        '079063-1753-30',
        'FOLDER',
        '57a05173-d0e8-4976-966b-50df21384d81',
        10
    ),
    (
        159,
        'Datos de la OF',
        'FOLDER',
        '5f3830c2-70ab-4a20-b72a-6109d3c11cad',
        158
    ),
    (
        160,
        'v1',
        'FOLDER',
        '4ce112e6-b20f-4531-92e6-3127efbdbc04',
        159
    ),
    (
        161,
        '079063-1753-20',
        'FOLDER',
        '5c37ab0e-9558-485b-833c-a97ddc713ac1',
        10
    ),
    (
        162,
        'Datos de la OF',
        'FOLDER',
        '1fd31a1d-bda1-45e1-a1c8-73af16d45ed8',
        161
    ),
    (
        163,
        'v1',
        'FOLDER',
        'dade4bb7-b5e6-4ab5-94d1-463fbd2fee30',
        162
    ),
    (
        164,
        '079063-1753-10',
        'FOLDER',
        '6de23725-de20-44ed-bad3-4c6eba42bbbc',
        10
    ),
    (
        165,
        'Datos de la OF',
        'FOLDER',
        'a29ca9c1-5770-4c07-a4f9-33f9b64760ea',
        164
    ),
    (
        166,
        'v1',
        'FOLDER',
        'c2f12203-65a0-4ffe-a1b3-9c57bcff8f29',
        165
    ),
    (
        167,
        '028447-1757-40',
        'FOLDER',
        'c6875f00-080d-4fb6-b7bf-e89900205f95',
        10
    ),
    (
        168,
        'Datos de la OF',
        'FOLDER',
        '767c6991-902e-4faf-bf35-9b5b90d0f82f',
        167
    ),
    (
        169,
        'v1',
        'FOLDER',
        '2466743c-4645-4e09-a7b6-f9e656506400',
        168
    ),
    (
        170,
        '028447-1757-30',
        'FOLDER',
        '978e3ba9-5e69-46d0-9cce-7dbde7a4576d',
        10
    ),
    (
        171,
        'Datos de la OF',
        'FOLDER',
        '1c32df92-2b62-44e6-86c5-c043a700fada',
        170
    ),
    (
        172,
        'v1',
        'FOLDER',
        'df490317-1894-4795-b584-9cd364ebfc85',
        171
    ),
    (
        173,
        '028447-1757-20',
        'FOLDER',
        'be55bfdf-7124-4517-98c1-f101e4305335',
        10
    ),
    (
        174,
        'Datos de la OF',
        'FOLDER',
        'c69b64f7-b739-4b58-9781-b318077eb235',
        173
    ),
    (
        175,
        'v1',
        'FOLDER',
        '4cac18de-b41d-4eb2-8c96-bd5227bd58ef',
        174
    ),
    (
        176,
        '028447-1757-10',
        'FOLDER',
        '4b2f8549-8676-41c6-a98b-bfed4028e322',
        10
    ),
    (
        177,
        'Datos de la OF',
        'FOLDER',
        '639ce02b-e20a-4b23-9400-80e638f21719',
        176
    ),
    (
        178,
        'v1',
        'FOLDER',
        '0dbc08e9-9362-43d1-8e75-666d61c5547b',
        177
    ),
    (
        179,
        '029517-1758-40',
        'FOLDER',
        '6e47e1aa-5c8d-461d-a49f-e3d4e57708f0',
        10
    ),
    (
        180,
        'Datos de la OF',
        'FOLDER',
        '217a0a62-c8bb-423c-b652-5b2357d3e5d2',
        179
    ),
    (
        181,
        'v1',
        'FOLDER',
        'bbb246f0-8f29-404f-ab81-8404bd7f30f0',
        180
    ),
    (
        182,
        '029517-1758-30',
        'FOLDER',
        '29988921-d668-4c4c-a620-1372b5e86ba7',
        10
    ),
    (
        183,
        'Datos de la OF',
        'FOLDER',
        '57f82411-994c-4ae2-9b5c-2ef9fb57606d',
        182
    ),
    (
        184,
        'v1',
        'FOLDER',
        '7f5291f8-b7c3-4135-88a7-fc5097b9dbc3',
        183
    ),
    (
        185,
        '029517-1758-20',
        'FOLDER',
        'af0dc485-7f1c-4e7a-96b1-241ecfbf55fc',
        10
    ),
    (
        186,
        'Datos de la OF',
        'FOLDER',
        '88b695dd-8886-4ed0-a580-3253772b07a5',
        185
    ),
    (
        187,
        'v1',
        'FOLDER',
        'a40e428b-a5a2-4bc9-92c0-cee2903ece99',
        186
    ),
    (
        188,
        '029517-1758-10',
        'FOLDER',
        'de09ab23-2dea-4ac3-bd79-95ea140798c4',
        10
    ),
    (
        189,
        'Datos de la OF',
        'FOLDER',
        '2d239a97-8983-43a5-ae17-61d6f9f17a71',
        188
    ),
    (
        190,
        'v1',
        'FOLDER',
        'fc5c3afb-29d8-4ba7-b3a3-cdfefd1012f6',
        189
    ),
    (
        191,
        '068299-1759-40',
        'FOLDER',
        '5fb8b875-3c58-421e-b373-fc418961df2c',
        10
    ),
    (
        192,
        'Datos de la OF',
        'FOLDER',
        'b4832be6-dd89-4d1c-9391-cde8e61a5728',
        191
    ),
    (
        193,
        'v1',
        'FOLDER',
        '9b09f425-c681-4efa-acda-9b14c2509959',
        192
    ),
    (
        194,
        '068299-1759-30',
        'FOLDER',
        '4d2a45d5-ddac-47ec-a2ae-88cdd669b271',
        10
    ),
    (
        195,
        'Datos de la OF',
        'FOLDER',
        '873f2696-f7cb-4640-b9e9-f7d3f6d0266f',
        194
    ),
    (
        196,
        'v1',
        'FOLDER',
        'fe18d41f-9ce9-4c78-b086-fed673396635',
        195
    ),
    (
        197,
        '068299-1759-20',
        'FOLDER',
        '1a523cb3-fd17-4145-9dae-74162a3fd732',
        10
    ),
    (
        198,
        'Datos de la OF',
        'FOLDER',
        '7984348f-0ead-4177-bbfb-65d2509aab7a',
        197
    ),
    (
        199,
        'v1',
        'FOLDER',
        'fc715c43-3b14-4b8e-bed0-3f6fd063bfdb',
        198
    ),
    (
        200,
        '068299-1759-10',
        'FOLDER',
        'd957601f-b979-4dec-8da6-151c993a1bb5',
        10
    ),
    (
        201,
        'Datos de la OF',
        'FOLDER',
        '4a9353e7-4cb8-4fcc-97c7-9036600faa3a',
        200
    ),
    (
        202,
        'v1',
        'FOLDER',
        '97372a5c-be36-4474-976e-d8356bcdb646',
        201
    ),
    (
        203,
        '068400-1760-40',
        'FOLDER',
        '48213f26-8764-451e-a81e-5ffa5fa0f2f9',
        10
    ),
    (
        204,
        'Datos de la OF',
        'FOLDER',
        '1d4581ea-2369-4f18-acad-45044cac0bc0',
        203
    ),
    (
        205,
        'v1',
        'FOLDER',
        '6b29b582-2da8-4186-b0fc-89a69a2d2e9f',
        204
    ),
    (
        206,
        '068400-1760-30',
        'FOLDER',
        'bacd6273-5ccc-4c01-8308-15db2a0e7173',
        10
    ),
    (
        207,
        'Datos de la OF',
        'FOLDER',
        '108ab03b-f501-413e-8d39-6f1f56898fc2',
        206
    ),
    (
        208,
        'v1',
        'FOLDER',
        '83ff675d-efb6-46a3-8294-9ab69ed8d93b',
        207
    ),
    (
        209,
        '068400-1760-20',
        'FOLDER',
        '7a8a40cf-837f-4cc6-835a-66e381198508',
        10
    ),
    (
        210,
        'Datos de la OF',
        'FOLDER',
        'aaa33949-e42b-430b-bbc1-9d9e6cd4533d',
        209
    ),
    (
        211,
        'v1',
        'FOLDER',
        'ea36d390-a5cc-4a01-8b2e-61943574b9bc',
        210
    ),
    (
        212,
        '068400-1760-10',
        'FOLDER',
        '5b0e69df-fb49-4ad5-b606-d546ae35cc6a',
        10
    ),
    (
        213,
        'Datos de la OF',
        'FOLDER',
        '9bc120c5-cc89-440a-9f88-105e0681bae0',
        212
    ),
    (
        214,
        'v1',
        'FOLDER',
        '52a0d838-f7cc-4a52-8dfe-753de79cffc3',
        213
    ),
    (
        215,
        '169006-1772-50',
        'FOLDER',
        'cb2815f3-d93b-4740-ad05-eaeac6b0f76f',
        10
    ),
    (
        216,
        'Datos de la OF',
        'FOLDER',
        '615477c2-90b8-477a-924e-1dcaec9743d6',
        215
    ),
    (
        217,
        'v1',
        'FOLDER',
        'd86d5b25-7799-4944-b466-19a2e80260a2',
        216
    ),
    (
        218,
        '169006-1772-40',
        'FOLDER',
        'cfd6d143-f272-4ee3-9907-21b18c1ec58b',
        10
    ),
    (
        219,
        'Datos de la OF',
        'FOLDER',
        '012ae022-5d6f-4e36-85ff-27ed8d25a424',
        218
    ),
    (
        220,
        'v1',
        'FOLDER',
        '35e1331e-e28f-499d-abe7-00f3df21cb4d',
        219
    ),
    (
        221,
        '169006-1772-30',
        'FOLDER',
        'e322b51e-9dcc-4ff2-b844-e9c1c2df8c5e',
        10
    ),
    (
        222,
        'Datos de la OF',
        'FOLDER',
        'cbfe774d-3abd-4f3b-b85f-854d3f84b1a5',
        221
    ),
    (
        223,
        'v1',
        'FOLDER',
        '696b6832-1976-4a97-aaa6-61ee02bf8b9e',
        222
    ),
    (
        224,
        '169006-1772-20',
        'FOLDER',
        '022ed43f-2d16-46ad-8115-8eae18518f85',
        10
    ),
    (
        225,
        'Datos de la OF',
        'FOLDER',
        '4a8d3af8-05d5-4659-ae78-69ee77b5210b',
        224
    ),
    (
        226,
        'v1',
        'FOLDER',
        '5c307573-94ba-4cdb-a8e4-e54fbf0d0fcd',
        225
    ),
    (
        227,
        '169006-1772-10',
        'FOLDER',
        '10e7371e-f9e9-42be-8522-d6dfd4b004c4',
        10
    ),
    (
        228,
        'Datos de la OF',
        'FOLDER',
        '85928aa1-5a61-4282-8383-5254fa19514b',
        227
    ),
    (
        229,
        'v1',
        'FOLDER',
        'ad3fbc19-7460-4906-81bd-a11b42703149',
        228
    ),
    (
        230,
        '171137-1772-50',
        'FOLDER',
        'bf9d2cb4-4a8d-4bf4-893f-292a107e2479',
        10
    ),
    (
        231,
        'Datos de la OF',
        'FOLDER',
        'faa28686-b9c8-4ee2-8d8f-e87b62e84d1b',
        230
    ),
    (
        232,
        'v1',
        'FOLDER',
        'ae790538-22f4-442c-80cf-2c491573b728',
        231
    ),
    (
        233,
        '171137-1772-40',
        'FOLDER',
        '80f4e1cd-4572-4c7a-b9ed-ed7f7d9c5707',
        10
    ),
    (
        234,
        'Datos de la OF',
        'FOLDER',
        '964e3e76-286a-4520-b501-adfdbafde217',
        233
    ),
    (
        235,
        'v1',
        'FOLDER',
        '5e14b89c-3744-4796-a500-3bd4a919743a',
        234
    ),
    (
        236,
        '171137-1772-30',
        'FOLDER',
        '5dd0b214-0341-4d5f-858d-78ef1ced7631',
        10
    ),
    (
        237,
        'Datos de la OF',
        'FOLDER',
        '337d1a30-0218-47bd-9a54-43dd0fc76213',
        236
    ),
    (
        238,
        'v1',
        'FOLDER',
        '0fc533c5-34ad-4438-b399-9c370868c186',
        237
    ),
    (
        239,
        '171137-1772-20',
        'FOLDER',
        '0c9aa770-7170-4d85-80e6-414169d73897',
        10
    ),
    (
        240,
        'Datos de la OF',
        'FOLDER',
        '49c6d26a-cf3a-416c-8c1b-b4fca5c89dd7',
        239
    ),
    (
        241,
        'v1',
        'FOLDER',
        '62929897-6b70-4c2e-9e5c-dd5660285c28',
        240
    ),
    (
        242,
        '171137-1772-10',
        'FOLDER',
        '2ddfae68-19f7-4ba5-907e-ce003f0c50ff',
        10
    ),
    (
        243,
        'Datos de la OF',
        'FOLDER',
        'df56e6e1-65c7-4a4f-914b-4a00782bf614',
        242
    ),
    (
        244,
        'v1',
        'FOLDER',
        '3b505a54-daf4-4237-8753-70a54618db7f',
        243
    ),
    (
        245,
        '181138-1772-50',
        'FOLDER',
        '04861ccb-b718-4304-9f82-3bd871177d87',
        10
    ),
    (
        246,
        'Datos de la OF',
        'FOLDER',
        'a9e87bb7-f5f2-44fc-9a0a-64718c18150c',
        245
    ),
    (
        247,
        'v1',
        'FOLDER',
        '372d1fa5-8e38-4688-9d11-436ae861aa5e',
        246
    ),
    (
        248,
        '181138-1772-40',
        'FOLDER',
        'd1bea3f4-03c5-4f76-98c5-52968cd3182d',
        10
    ),
    (
        249,
        'Datos de la OF',
        'FOLDER',
        'f60d7585-a08c-4754-bdd3-d0aa597eb115',
        248
    ),
    (
        250,
        'v1',
        'FOLDER',
        'fcf3ee3e-f3ba-422f-b3cd-cf5a99f30afb',
        249
    ),
    (
        251,
        '181138-1772-30',
        'FOLDER',
        'd7b9b02b-2931-4f33-879c-bafa95039d72',
        10
    ),
    (
        252,
        'Datos de la OF',
        'FOLDER',
        'c6a98930-ab6a-405c-9e87-021c97bc46b0',
        251
    ),
    (
        253,
        'v1',
        'FOLDER',
        '1dc4571c-130a-4e5e-958c-9933f41d4827',
        252
    ),
    (
        254,
        '181138-1772-20',
        'FOLDER',
        'f77a7aca-5fa8-421b-9599-ec6fb11a75ec',
        10
    ),
    (
        255,
        'Datos de la OF',
        'FOLDER',
        '3a338627-e5be-4c46-ae31-af6637e0cd03',
        254
    ),
    (
        256,
        'v1',
        'FOLDER',
        '52993fcc-b137-42ad-939f-71474fede2ed',
        255
    ),
    (
        257,
        '181138-1772-10',
        'FOLDER',
        '2a41d8ca-1a67-4fb0-abb8-7456acdb016e',
        10
    ),
    (
        258,
        'Datos de la OF',
        'FOLDER',
        'fb3481f4-2760-4ec1-b8ae-f53876abfc89',
        257
    ),
    (
        259,
        'v1',
        'FOLDER',
        '51c7147d-05ba-41f5-80d5-66234a5f224f',
        258
    ),
    (
        260,
        '471142-1594-30',
        'FOLDER',
        '517d1f42-3073-4df7-9799-d0bbe260de9f',
        10
    ),
    (
        261,
        'Datos de la OF',
        'FOLDER',
        '9513b3f3-2b60-4a11-a082-2e2ca3c2d60d',
        260
    ),
    (
        262,
        'v1',
        'FOLDER',
        '6948845f-17c4-4e6f-b3cf-2fb6841f030c',
        261
    ),
    (
        263,
        '471142-1594-20',
        'FOLDER',
        'db88e856-82f1-4fba-96b7-b7007cb8067d',
        10
    ),
    (
        264,
        'Datos de la OF',
        'FOLDER',
        'e9e914d9-f055-4e25-9fb0-9bde1b7abb8d',
        263
    ),
    (
        265,
        'v1',
        'FOLDER',
        '69ac88bb-afd2-428a-b6f2-9a4c71645fa1',
        264
    ),
    (
        266,
        '471142-1594-10',
        'FOLDER',
        '16ac8025-c5db-433c-b6cd-8a01ca3d4528',
        10
    ),
    (
        267,
        'Datos de la OF',
        'FOLDER',
        'f1a0932d-dec5-4115-87f4-77df1dd57bfe',
        266
    ),
    (
        268,
        'v1',
        'FOLDER',
        '800bed0b-dc98-42a7-9633-2ef6b0bf535a',
        267
    ),
    (
        269,
        '549708-1582B-30',
        'FOLDER',
        'cc994290-40fb-4cfb-88f8-e22786fe2f5a',
        10
    ),
    (
        270,
        'Datos de la OF',
        'FOLDER',
        'f68f05b2-e706-4e2c-a1ff-b220c2cc9192',
        269
    ),
    (
        271,
        'v1',
        'FOLDER',
        '393b623d-3c8e-4ec6-823c-b29243c0c126',
        270
    ),
    (
        272,
        '549708-1582B-20',
        'FOLDER',
        'ac7f9df0-ea7e-455b-b116-338f0d2cebab',
        10
    ),
    (
        273,
        'Datos de la OF',
        'FOLDER',
        '58e9889a-8004-451a-926b-9cfa7dd2dd8d',
        272
    ),
    (
        274,
        'v1',
        'FOLDER',
        'c99dc1e3-b30e-4a10-9afc-122d15116bfb',
        273
    ),
    (
        275,
        '549708-1582B-10',
        'FOLDER',
        '65e94cc5-7e57-41cc-b95d-6d17a5929bb7',
        10
    ),
    (
        276,
        'Datos de la OF',
        'FOLDER',
        'c8cea1a8-480b-46db-a629-8a67a83789cc',
        275
    ),
    (
        277,
        'v1',
        'FOLDER',
        'f474486b-516d-4ddd-94c7-e02e7d240c66',
        276
    ),
    (
        278,
        '559709-1582B-30',
        'FOLDER',
        '1347300f-48b9-4cc6-8524-f29fe92c4d3f',
        10
    ),
    (
        279,
        'Datos de la OF',
        'FOLDER',
        'd2675e62-ee72-474a-804b-ebf90ef9ac1e',
        278
    ),
    (
        280,
        'v1',
        'FOLDER',
        'adc221e4-3909-4837-9560-8f7dd4403c1c',
        279
    ),
    (
        281,
        '559709-1582B-20',
        'FOLDER',
        'cae94b59-9b1e-4b67-a1e4-d64f10195c46',
        10
    ),
    (
        282,
        'Datos de la OF',
        'FOLDER',
        '4fae4cb4-9ef1-48eb-9f09-3b8b45556a86',
        281
    ),
    (
        283,
        'v1',
        'FOLDER',
        '7cafa06c-1966-4c1d-be96-24a690042fe7',
        282
    ),
    (
        284,
        '559709-1582B-10',
        'FOLDER',
        '4ddb6d79-3a10-470b-9211-7a2c5939dcad',
        10
    ),
    (
        285,
        'Datos de la OF',
        'FOLDER',
        'ee570e1d-d9e1-4bec-b076-1a71cfa9949a',
        284
    ),
    (
        286,
        'v1',
        'FOLDER',
        'ef7f937c-460f-45f6-b3df-dadb4908876b',
        285
    ),
    (
        287,
        '057929-1714B-30',
        'FOLDER',
        'e98b9d46-b8e1-4efb-996e-f633733f86e7',
        10
    ),
    (
        288,
        'Datos de la OF',
        'FOLDER',
        '3abfa430-6735-4b51-8344-3f662044f965',
        287
    ),
    (
        289,
        'v1',
        'FOLDER',
        'd97b4cf7-bcc0-44da-9724-24b3b5b9b036',
        288
    ),
    (
        290,
        '057929-1714B-20',
        'FOLDER',
        'bca5bc93-19ab-45a0-83de-c38be53476f4',
        10
    ),
    (
        291,
        'Datos de la OF',
        'FOLDER',
        '2f0bb16f-d204-4bb8-a9e5-c42616162dde',
        290
    ),
    (
        292,
        'v1',
        'FOLDER',
        '9da7f422-ab2d-41b9-9706-c19796c0ef9a',
        291
    ),
    (
        293,
        '057929-1714B-10',
        'FOLDER',
        'f27f0927-a67d-45dd-9f55-5ccd8afc6c50',
        10
    ),
    (
        294,
        'Datos de la OF',
        'FOLDER',
        '57f59e8b-e704-4bda-b9e0-185cdf1515b5',
        293
    ),
    (
        295,
        'v1',
        'FOLDER',
        'f5273c03-a670-4b80-9562-595a096f68db',
        294
    ),
    (
        296,
        '067930-1714B-30',
        'FOLDER',
        'b54d80d9-f455-4915-82bd-908c07ed137a',
        10
    ),
    (
        297,
        'Datos de la OF',
        'FOLDER',
        '8c57f146-7f14-436c-b56d-4e28dee74870',
        296
    ),
    (
        298,
        'v1',
        'FOLDER',
        '0c57a57f-566c-440d-a265-9bfe353793df',
        297
    ),
    (
        299,
        '067930-1714B-20',
        'FOLDER',
        'd96014f7-c8e9-4512-b42f-f03984a5aad4',
        10
    ),
    (
        300,
        'Datos de la OF',
        'FOLDER',
        '18ced572-cc35-4404-8b5e-40565e8b82f6',
        299
    ),
    (
        301,
        'v1',
        'FOLDER',
        '170db13b-6f7a-4c99-8d5e-a501fdb15cb8',
        300
    ),
    (
        302,
        '067930-1714B-10',
        'FOLDER',
        '6197c7fc-daa4-439c-b07a-da95d6de67ce',
        10
    ),
    (
        303,
        'Datos de la OF',
        'FOLDER',
        'ac534329-277d-4093-99ab-75c1b22de39e',
        302
    ),
    (
        304,
        'v1',
        'FOLDER',
        '457503a0-18b1-4737-90eb-52e47982bdbf',
        303
    ),
    (
        305,
        '077931-1714B-30',
        'FOLDER',
        '56e1eb41-803e-4005-965c-2b73d6b85558',
        10
    ),
    (
        306,
        'Datos de la OF',
        'FOLDER',
        'fd8b1ba8-948b-4b6f-a4cd-41d3f04882a7',
        305
    ),
    (
        307,
        'v1',
        'FOLDER',
        '19395bc4-c02f-4357-93fb-26a589a6c76c',
        306
    ),
    (
        308,
        '077931-1714B-20',
        'FOLDER',
        '92f6b9b4-26f8-41f4-9923-abd85cff97dd',
        10
    ),
    (
        309,
        'Datos de la OF',
        'FOLDER',
        'c6519bca-a767-412f-a27a-65e7d7c39f6f',
        308
    ),
    (
        310,
        'v1',
        'FOLDER',
        '47410193-4ade-4c7f-92d6-07406ac0e7b8',
        309
    ),
    (
        311,
        '077931-1714B-10',
        'FOLDER',
        'b9286c83-1add-4c43-96a4-2325e5c7d3ef',
        10
    ),
    (
        312,
        'Datos de la OF',
        'FOLDER',
        '2d501e17-9d3c-4291-adb8-bbfff299eadc',
        311
    ),
    (
        313,
        'v1',
        'FOLDER',
        'b7446c86-ef49-4f03-b407-9955c51e1480',
        312
    ),
    (
        314,
        '557289-1697B-30',
        'FOLDER',
        'c240afb7-814d-4bbc-8cd9-131043a2dd3e',
        10
    ),
    (
        315,
        'Datos de la OF',
        'FOLDER',
        'e6b8bba4-edd2-460b-987f-ef38a7818042',
        314
    ),
    (
        316,
        'v1',
        'FOLDER',
        '04e492bd-0213-479d-be52-d2de9ae25028',
        315
    ),
    (
        317,
        '557289-1697B-20',
        'FOLDER',
        'c528a4ef-eaf3-4203-a09a-201962bda748',
        10
    ),
    (
        318,
        'Datos de la OF',
        'FOLDER',
        '9984dc4c-630c-48d4-89d4-f3512483723b',
        317
    ),
    (
        319,
        'v1',
        'FOLDER',
        'f59225cf-453c-4186-9cbe-f4f82ce4abc4',
        318
    ),
    (
        320,
        '557289-1697B-10',
        'FOLDER',
        'bdac3609-747f-405d-ac0d-4dc00b3374fe',
        10
    ),
    (
        321,
        'Datos de la OF',
        'FOLDER',
        'aa601d0b-de9b-462b-a6d8-4f8007a64374',
        320
    ),
    (
        322,
        'v1',
        'FOLDER',
        '22d36a89-9100-471b-8b4c-ac6709d3e2a1',
        321
    ),
    (
        323,
        '567290-1697B-30',
        'FOLDER',
        '7040cafd-b1c3-41c9-b9bc-25046e137b7a',
        10
    ),
    (
        324,
        'Datos de la OF',
        'FOLDER',
        'e10a373e-f848-44e7-a995-32bbfaaea9f3',
        323
    ),
    (
        325,
        'v1',
        'FOLDER',
        'a0b768f8-2bf7-41e6-9b0b-bd61aa367f3b',
        324
    ),
    (
        326,
        '567290-1697B-20',
        'FOLDER',
        '40db7de1-fc80-45c2-9366-ff7376f07940',
        10
    ),
    (
        327,
        'Datos de la OF',
        'FOLDER',
        '35bd812d-f6ca-4f1f-9d2c-cfd4e337abe8',
        326
    ),
    (
        328,
        'v1',
        'FOLDER',
        '93f054f6-09e2-449d-8f5a-2baf65dc94e1',
        327
    ),
    (
        329,
        '477291-1698B-30',
        'FOLDER',
        '908c6348-02e6-4911-ab32-7960efeef3b4',
        10
    ),
    (
        330,
        'Datos de la OF',
        'FOLDER',
        'a0f1b012-608f-4757-a70a-f71449fcc26c',
        329
    ),
    (
        331,
        'v1',
        'FOLDER',
        'c25004d9-661a-4396-9434-bc4612be4d37',
        330
    ),
    (
        332,
        '567290-1697B-10',
        'FOLDER',
        '3145cd59-9a3c-4be1-984b-cf073a4ee50d',
        10
    ),
    (
        333,
        'Datos de la OF',
        'FOLDER',
        'a7ed5245-d0b6-4e44-91f5-4f93f30c9d8e',
        332
    ),
    (
        334,
        '477291-1698B-20',
        'FOLDER',
        '7c2b13de-ffa5-4ea4-a8da-58556dfb3090',
        10
    ),
    (
        335,
        'v1',
        'FOLDER',
        '7bc24535-8b4d-41df-8623-06b6846737d9',
        333
    ),
    (
        336,
        'Datos de la OF',
        'FOLDER',
        'e9261e7c-188e-4c50-9833-9af247ef919c',
        334
    ),
    (
        337,
        'v1',
        'FOLDER',
        'dc8b9cd1-5eaa-47d0-b1f5-0fc773d7d529',
        336
    ),
    (
        338,
        '477291-1698B-10',
        'FOLDER',
        'f05ba532-f99b-4f73-bfd6-1dfa49c299a8',
        10
    ),
    (
        339,
        'Datos de la OF',
        'FOLDER',
        '7676f5cc-c9b7-4757-9460-032cbd388f50',
        338
    ),
    (
        340,
        'v1',
        'FOLDER',
        '4a28cab0-ac96-4ebe-9a1f-336a9b630782',
        339
    ),
    (
        341,
        '487292-1698B-30',
        'FOLDER',
        'bd639a36-cc13-4d0d-b5d5-fcc4e02da552',
        10
    ),
    (
        342,
        'Datos de la OF',
        'FOLDER',
        '4edf0b54-f842-434e-8e48-6c129305f828',
        341
    ),
    (
        343,
        'v1',
        'FOLDER',
        '0440f920-9ca6-4eb1-94a0-67680b3cedaa',
        342
    ),
    (
        344,
        '487292-1698B-20',
        'FOLDER',
        '81327bf0-6f2b-491c-b5b7-d45d242f8449',
        10
    ),
    (
        345,
        'Datos de la OF',
        'FOLDER',
        '2dc1e8dd-b3e0-434f-89d2-2ad603a6501d',
        344
    ),
    (
        346,
        'v1',
        'FOLDER',
        'c9c366ad-a78b-4965-8db3-9c91d7d02f6c',
        345
    ),
    (
        347,
        '487292-1698B-10',
        'FOLDER',
        '3a5b9d1a-e72c-40e5-9710-20280fb8e0cc',
        10
    ),
    (
        348,
        'Datos de la OF',
        'FOLDER',
        '7a50aba5-eb56-4432-80ab-a918a141f8b0',
        347
    ),
    (
        349,
        'v1',
        'FOLDER',
        'aa4d9414-d1f0-40fe-aba0-07b822661e57',
        348
    ),
    (
        350,
        '637287-1685B-30',
        'FOLDER',
        '6007ee86-bedb-4b11-a6d7-316b96cbabaf',
        10
    ),
    (
        351,
        'Datos de la OF',
        'FOLDER',
        '347e7d1b-4bd1-40ee-bae8-762a155a7d01',
        350
    ),
    (
        352,
        'v1',
        'FOLDER',
        'c69993a7-6a31-4994-8e54-aec2a0666673',
        351
    ),
    (
        353,
        '637287-1685B-20',
        'FOLDER',
        '2f90ae74-3302-4a65-994d-3a26bbf4e6e0',
        10
    ),
    (
        354,
        'Datos de la OF',
        'FOLDER',
        '916d282e-d0fa-4e24-b950-d25cf69e3b32',
        353
    ),
    (
        355,
        'v1',
        'FOLDER',
        '79bff21f-e90e-42db-9643-2b0502570c8f',
        354
    ),
    (
        356,
        '637287-1685B-10',
        'FOLDER',
        '980434ac-e573-451d-9006-96b3eda3e993',
        10
    ),
    (
        357,
        'Datos de la OF',
        'FOLDER',
        '29a33a42-6835-4397-8938-960addea0e57',
        356
    ),
    (
        358,
        'v1',
        'FOLDER',
        '65dbeddf-fc52-4509-ba32-efb4a2e4d530',
        357
    ),
    (
        359,
        '647288-1685B-30',
        'FOLDER',
        'f4112f44-41b0-48ee-96e7-cabafcc10b72',
        10
    ),
    (
        360,
        'Datos de la OF',
        'FOLDER',
        '67be2be5-63d8-405c-a1dc-f2ab0b5cf8ba',
        359
    ),
    (
        361,
        'v1',
        'FOLDER',
        '9a928f63-6d18-4d9c-8139-233bde376a09',
        360
    ),
    (
        362,
        '647288-1685B-20',
        'FOLDER',
        '32d0ce9e-6557-491a-9482-d3dbbeca7a93',
        10
    ),
    (
        363,
        'Datos de la OF',
        'FOLDER',
        'e7b50242-cddc-448c-8109-1a4172d57d73',
        362
    ),
    (
        364,
        'v1',
        'FOLDER',
        'f45d7cd6-d28e-45a0-bfc2-6b66b4c0cf28',
        363
    ),
    (
        365,
        '647288-1685B-10',
        'FOLDER',
        '7153f107-4fd6-4172-b541-bb7ce270b1be',
        10
    ),
    (
        366,
        'Datos de la OF',
        'FOLDER',
        '9864ebb2-89ce-4acc-8f39-fdc9a9cd5001',
        365
    ),
    (
        367,
        'v1',
        'FOLDER',
        '8b885791-ffe5-4877-a7cc-9e1a189106ca',
        366
    ),
    (
        368,
        '594184-1685B-30',
        'FOLDER',
        '638fc8f6-74ad-4b2f-8bd8-c57eb145d117',
        10
    ),
    (
        369,
        'Datos de la OF',
        'FOLDER',
        'fc617a15-14fe-4120-85e4-02db24da607a',
        368
    ),
    (
        370,
        'v1',
        'FOLDER',
        '2db3e225-d148-44cb-af50-a358acdd6b07',
        369
    ),
    (
        371,
        '594184-1685B-20',
        'FOLDER',
        'e6e776d3-9cdf-4618-835a-f608ecec186f',
        10
    ),
    (
        372,
        'Datos de la OF',
        'FOLDER',
        '1a679acc-b9e9-44e6-944f-50726e833f4a',
        371
    ),
    (
        373,
        'v1',
        'FOLDER',
        'e31a2b3c-c070-410c-99ef-28d7a070267f',
        372
    ),
    (
        374,
        '594184-1685B-10',
        'FOLDER',
        '916d185a-2feb-496f-9f5e-79907e279435',
        10
    ),
    (
        375,
        'Datos de la OF',
        'FOLDER',
        '970e9d61-0dff-4989-91da-3531ecee0ca8',
        374
    ),
    (
        376,
        'v1',
        'FOLDER',
        'f281b4c0-62fb-4633-890b-6b4db6577870',
        375
    );

/*!40000 ALTER TABLE `dmr_documents` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Dumping routines for database 'document_manager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03  8:02:31