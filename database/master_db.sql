-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: master_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `atencion_servicio`
--

DROP TABLE IF EXISTS `atencion_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atencion_servicio` (
  `idATENCION_SERVICIO` int NOT NULL AUTO_INCREMENT,
  `cod_atencion` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `observaciones` varchar(45) NOT NULL,
  `fecha_atencion` date NOT NULL,
  `hora_atencion` time NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USUARIO_idUSUARIO` int NOT NULL,
  `SERVICIO_idSERVICIO` int NOT NULL,
  PRIMARY KEY (`idATENCION_SERVICIO`),
  KEY `fk_ATENCION_SERVICIO_USUARIO1_idx` (`USUARIO_idUSUARIO`),
  KEY `fk_ATENCION_SERVICIO_SERVICIO1_idx` (`SERVICIO_idSERVICIO`),
  CONSTRAINT `fk_ATENCION_SERVICIO_SERVICIO1` FOREIGN KEY (`SERVICIO_idSERVICIO`) REFERENCES `servicio` (`idSERVICIO`),
  CONSTRAINT `fk_ATENCION_SERVICIO_USUARIO1` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atencion_servicio`
--

LOCK TABLES `atencion_servicio` WRITE;
/*!40000 ALTER TABLE `atencion_servicio` DISABLE KEYS */;
INSERT INTO `atencion_servicio` VALUES (1,'0000000001','ATENCIÓN REALIZADA SATISFACTORIAMENTE','NINGUNA','2021-02-21','11:37:00','2021-09-27 04:33:59','2021-09-26 23:33:59','2021-09-27 04:33:59',1,1),(2,'0000000002','ATENCIÓN REALIZADA SATISFACTORIAMENTE','NINGUNA','2021-02-21','12:12:00','2021-09-27 04:34:14','2021-09-26 23:34:14','2021-09-27 04:34:14',1,1),(3,'0000000003','ATENCIÓN REALIZADA SATISFACTORIAMENTE','NINGUNA','2021-02-21','12:30:00','2021-09-27 04:34:23','2021-09-26 23:36:04','2021-09-27 04:34:23',2,1),(4,'0000000004','ATENCIÓN REALIZADA SATISFACTORIAMENTE','NINGUNA','2021-02-21','15:52:30','2021-09-27 04:34:31','2021-09-26 23:36:13','2021-09-27 04:34:31',2,1),(5,'0000000005','ATENCIÓN REALIZADA SATISFACTORIAMENTE','NINGUNA','2021-02-22','09:42:12','2021-09-27 04:34:41','2021-09-26 23:36:19','2021-09-27 04:34:41',2,1);
/*!40000 ALTER TABLE `atencion_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleador`
--

DROP TABLE IF EXISTS `empleador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleador` (
  `idEMPLEADOR` int NOT NULL AUTO_INCREMENT,
  `nombres_empleador` varchar(80) NOT NULL,
  `apellido_paterno` varchar(60) NOT NULL,
  `apelliodo_materno` varchar(60) NOT NULL,
  `celular` int NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEMPLEADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleador`
--

LOCK TABLES `empleador` WRITE;
/*!40000 ALTER TABLE `empleador` DISABLE KEYS */;
INSERT INTO `empleador` VALUES (1,'JEREMIAS ALONZO','GUEVARA','GUTIERREZ',987446328,'Jr. Retamas N°654','jguevarag@unasam.edu.pe','activo','2021-09-27 04:31:25','2021-09-26 23:31:25','2021-09-27 04:31:25');
/*!40000 ALTER TABLE `empleador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta` (
  `idENCUESTA` int NOT NULL AUTO_INCREMENT,
  `codigo_encuesta` varchar(45) NOT NULL,
  `nombre_encuesta` varchar(45) NOT NULL,
  `descripcion_encuesta` varchar(100) NOT NULL,
  `fecha_encuesta` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `SERVICIO_idSERVICIO` int NOT NULL,
  `ESTADO_ENCUESTA_idESTADO_ENCUESTA` int NOT NULL,
  `PERIODO_idPERIODO` int NOT NULL,
  `TIPO_ENCUESTA_idTIPO_ENCUESTA` int NOT NULL,
  PRIMARY KEY (`idENCUESTA`,`SERVICIO_idSERVICIO`),
  KEY `fk_ENCUESTA_SERVICIO1_idx` (`SERVICIO_idSERVICIO`),
  KEY `fk_ENCUESTA_ESTADO_ENCUESTA1_idx` (`ESTADO_ENCUESTA_idESTADO_ENCUESTA`),
  KEY `fk_ENCUESTA_PERIODO1_idx` (`PERIODO_idPERIODO`),
  KEY `fk_ENCUESTA_TIPO_ENCUESTA1_idx` (`TIPO_ENCUESTA_idTIPO_ENCUESTA`),
  CONSTRAINT `fk_ENCUESTA_ESTADO_ENCUESTA1` FOREIGN KEY (`ESTADO_ENCUESTA_idESTADO_ENCUESTA`) REFERENCES `estado_encuesta` (`idESTADO_ENCUESTA`),
  CONSTRAINT `fk_ENCUESTA_PERIODO1` FOREIGN KEY (`PERIODO_idPERIODO`) REFERENCES `periodo` (`idPERIODO`),
  CONSTRAINT `fk_ENCUESTA_SERVICIO1` FOREIGN KEY (`SERVICIO_idSERVICIO`) REFERENCES `servicio` (`idSERVICIO`),
  CONSTRAINT `fk_ENCUESTA_TIPO_ENCUESTA1` FOREIGN KEY (`TIPO_ENCUESTA_idTIPO_ENCUESTA`) REFERENCES `tipo_encuesta` (`idTIPO_ENCUESTA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,'0000000001','ENCUESTA SERVICIO COMEDOR UNIVERSITARIO','ENCUESTA PARA OBTENER EL GRADO DE SATISFACCIÓN DE\nLOS USUARIOS DEL COMEDOR UNIVERSITARIO','2021-03-02','2021-09-27 04:44:08','2021-09-26 23:44:08','2021-09-27 04:44:08',1,2,1,3);
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_has_empleador`
--

DROP TABLE IF EXISTS `encuesta_has_empleador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta_has_empleador` (
  `ENCUESTA_idENCUESTA` int NOT NULL,
  `EMPLEADOR_idEMPLEADOR` int NOT NULL,
  `METAS_idMETAS` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ENCUESTA_idENCUESTA`,`EMPLEADOR_idEMPLEADOR`),
  KEY `fk_ENCUESTA_has_EMPLEADOR_EMPLEADOR1_idx` (`EMPLEADOR_idEMPLEADOR`),
  KEY `fk_ENCUESTA_has_EMPLEADOR_ENCUESTA1_idx` (`ENCUESTA_idENCUESTA`),
  KEY `fk_ENCUESTA_has_EMPLEADOR_METAS1_idx` (`METAS_idMETAS`),
  CONSTRAINT `fk_ENCUESTA_has_EMPLEADOR_EMPLEADOR1` FOREIGN KEY (`EMPLEADOR_idEMPLEADOR`) REFERENCES `empleador` (`idEMPLEADOR`),
  CONSTRAINT `fk_ENCUESTA_has_EMPLEADOR_ENCUESTA1` FOREIGN KEY (`ENCUESTA_idENCUESTA`) REFERENCES `encuesta` (`idENCUESTA`),
  CONSTRAINT `fk_ENCUESTA_has_EMPLEADOR_METAS1` FOREIGN KEY (`METAS_idMETAS`) REFERENCES `metas` (`idMETAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_has_empleador`
--

LOCK TABLES `encuesta_has_empleador` WRITE;
/*!40000 ALTER TABLE `encuesta_has_empleador` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_has_empleador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escuela` (
  `idESCUELA` int NOT NULL AUTO_INCREMENT,
  `nombre_escuela` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FACULTAD_idFACULTAD` int NOT NULL,
  PRIMARY KEY (`idESCUELA`),
  KEY `fk_ESCUELA_FACULTAD_idx` (`FACULTAD_idFACULTAD`),
  CONSTRAINT `fk_ESCUELA_FACULTAD` FOREIGN KEY (`FACULTAD_idFACULTAD`) REFERENCES `facultad` (`idFACULTAD`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
INSERT INTO `escuela` VALUES (1,'Ingeniería de Sistemas e Informática','','Activo','2021-09-27 04:21:56','2021-09-26 23:21:56','2021-09-27 04:21:56',1),(2,'Estadistica e Informática','','Activo','2021-09-27 04:22:03','2021-09-26 23:22:03','2021-09-27 04:22:03',1),(3,'Matematica','','Activo','2021-09-27 04:22:05','2021-09-26 23:22:05','2021-09-27 04:22:05',1);
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idESTADO` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'VIGENTE','EL SERVICIO SE ENCUENTRA VIGENTE EN LA ACTUALIDAD','2021-09-27 04:30:07','2021-09-26 23:30:07','2021-09-27 04:30:07'),(2,'NO VIGENTE','EL SERVICIO NO SE ENCUENTRA VIGENTE EN LA ACTUALIDAD','2021-09-27 04:30:07','2021-09-26 23:30:07','2021-09-27 04:30:07'),(3,'CUMPLIDO','EL SERVICIO SE HA CUMPLIDO EN EL PERIODO ESTABLECIDO SATISFACTORIAMENTE','2021-09-27 04:30:07','2021-09-26 23:30:07','2021-09-27 04:30:07'),(4,'CANCELADO','EL SERVICIO SE HA CANCELADO','2021-09-27 04:30:07','2021-09-26 23:30:07','2021-09-27 04:30:07');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_encuesta`
--

DROP TABLE IF EXISTS `estado_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_encuesta` (
  `idESTADO_ENCUESTA` int NOT NULL AUTO_INCREMENT,
  `nombre_estadoencuesta` varchar(45) NOT NULL,
  `descripcion_estadoencuesta` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idESTADO_ENCUESTA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_encuesta`
--

LOCK TABLES `estado_encuesta` WRITE;
/*!40000 ALTER TABLE `estado_encuesta` DISABLE KEYS */;
INSERT INTO `estado_encuesta` VALUES (1,'VIGENTE','ENCUESTA VIGENTE','2021-09-27 04:37:01','2021-09-26 23:37:01','2021-09-27 04:37:01'),(2,'NO VIGENTE','LA ENCUESTA HA CULMINADO','2021-09-27 04:37:01','2021-09-26 23:37:01','2021-09-27 04:37:01'),(3,'CANCELADA','ENCUESTA CANCELADA POR DIVERSOS MOTIVOS','2021-09-27 04:37:01','2021-09-26 23:37:01','2021-09-27 04:37:01');
/*!40000 ALTER TABLE `estado_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `idFACULTAD` int NOT NULL AUTO_INCREMENT,
  `nombre_facultad` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFACULTAD`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'FACULTAD DE CIENCIAS','','Activo','2021-09-27 04:21:41','2021-09-26 23:21:41','2021-09-27 04:21:41'),(2,'FACULTAD DE ECONOMIA Y CONTABILIDAD','','Activo','2021-09-27 04:21:44','2021-09-26 23:21:44','2021-09-27 04:21:44');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `idINSTITUCION` int NOT NULL AUTO_INCREMENT,
  `nombre_institucion` varchar(80) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `celular` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCALIDAD_idLOCALIDAD` int NOT NULL,
  PRIMARY KEY (`idINSTITUCION`),
  KEY `fk_INSTITUCION_LOCALIDAD1_idx` (`LOCALIDAD_idLOCALIDAD`),
  CONSTRAINT `fk_INSTITUCION_LOCALIDAD1` FOREIGN KEY (`LOCALIDAD_idLOCALIDAD`) REFERENCES `localidad` (`idLOCALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (1,'UNIVERSIDAD NACIONAL SANTIAGO ANTUNEZ DE MAYOLO','PRIMERA UNIVERSIDAD DEL DEPARTAMENTO DE ANCASH',43202020,'informes@unasam.edu.pe','Av. Centenario N° 230','Activo','2021-09-27 04:29:51','2021-09-26 23:29:51','2021-09-27 04:29:51',1);
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `idLOCALIDAD` int NOT NULL AUTO_INCREMENT,
  `nombre_localidad` varchar(80) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `pais_localidad` varchar(60) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLOCALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Huaraz','Ciudad de Huaraz - Departamento de Ancash','Perú','2021-09-27 04:28:16','2021-09-26 23:28:16','2021-09-27 04:28:16');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metas` (
  `idMETAS` int NOT NULL AUTO_INCREMENT,
  `nombre_meta` varchar(45) NOT NULL,
  `descripcion_meta` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idMETAS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
INSERT INTO `metas` VALUES (1,'MINIMO','CALIFICATIVO MINIMO A ENCUESTA REALIZADA','2021-09-27 04:36:35','2021-09-26 23:36:35','2021-09-27 04:36:35'),(2,'SATISFACTORIO','CALIFICATIVO SATISFACTORIO A ENCUESTA','2021-09-27 04:36:35','2021-09-26 23:36:35','2021-09-27 04:36:35'),(3,'SOBRESALIENTE','CALIFICATIVO SOBRESALIENTE A ENCUESTA','2021-09-27 04:36:35','2021-09-26 23:36:35','2021-09-27 04:36:35');
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacion_a_cargo`
--

DROP TABLE IF EXISTS `organizacion_a_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizacion_a_cargo` (
  `codigo_organizacion` int NOT NULL,
  `nombre_organizacion` varchar(45) NOT NULL,
  `descripcion_organizacion` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo_organizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacion_a_cargo`
--

LOCK TABLES `organizacion_a_cargo` WRITE;
/*!40000 ALTER TABLE `organizacion_a_cargo` DISABLE KEYS */;
INSERT INTO `organizacion_a_cargo` VALUES (1,'RESPONSABILIDAD SOCIAL UNIVERSITARIA','dsadsadsa','2021-09-27 04:30:53','2021-09-26 23:30:53','2021-09-27 04:30:53'),(2,'OGEBUYAE','dsadsadsa','2021-09-27 04:31:04','2021-09-26 23:31:04','2021-09-27 04:31:04');
/*!40000 ALTER TABLE `organizacion_a_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `idPERIODO` int NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(45) NOT NULL,
  `descripcion_periodo` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPERIODO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'MENSUAL','ENCUESTA REALIZADA MENSUALMENTE','2021-09-27 04:37:12','2021-09-26 23:37:12','2021-09-27 04:37:12'),(2,'SEMESTRAL','ENCUESTA REALIZADA SEMESTRALMENTE','2021-09-27 04:37:12','2021-09-26 23:37:12','2021-09-27 04:37:12');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulante`
--

DROP TABLE IF EXISTS `postulante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulante` (
  `idPOSTULANTE` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellido_paterno` varchar(45) NOT NULL,
  `apellido_materno` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `edad` varchar(45) NOT NULL,
  `fecha_nacimiento` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ESCUELA_idESCUELA` int NOT NULL,
  `LOCALIDAD_idLOCALIDAD` int NOT NULL,
  PRIMARY KEY (`idPOSTULANTE`),
  KEY `fk_POSTULANTE_ESCUELA1_idx` (`ESCUELA_idESCUELA`),
  KEY `fk_POSTULANTE_LOCALIDAD1_idx` (`LOCALIDAD_idLOCALIDAD`),
  CONSTRAINT `fk_POSTULANTE_ESCUELA1` FOREIGN KEY (`ESCUELA_idESCUELA`) REFERENCES `escuela` (`idESCUELA`),
  CONSTRAINT `fk_POSTULANTE_LOCALIDAD1` FOREIGN KEY (`LOCALIDAD_idLOCALIDAD`) REFERENCES `localidad` (`idLOCALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulante`
--

LOCK TABLES `postulante` WRITE;
/*!40000 ALTER TABLE `postulante` DISABLE KEYS */;
INSERT INTO `postulante` VALUES (1,'171.2502.128','HERNAN JOSE','OCHOA','MESA','987852951','Psj. San Jose S/N','23','12-10-1998','activo','2021-09-27 04:28:35','2021-09-26 23:28:35','2021-09-27 04:28:35',1,1),(2,'171.2502.420','MARIANA SANDRA','TORRES','FIGUEROA','951754680','Av. Centenario N° 850','23','12-10-1998','activo','2021-09-27 04:29:40','2021-09-26 23:29:40','2021-09-27 04:29:40',1,1);
/*!40000 ALTER TABLE `postulante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `idSEMESTRE` int NOT NULL AUTO_INCREMENT,
  `nombre_semetre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `anio_semetre` varchar(45) NOT NULL,
  PRIMARY KEY (`idSEMESTRE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES (1,'2020-II','SEMESTRE 2020-II','2021'),(2,'2021-I','SEMESTRE 2021-I','2021');
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `idSERVICIO` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `INSTITUCION_idINSTITUCION` int NOT NULL,
  `SEMESTRE_idSEMESTRE` int NOT NULL,
  `ESTADO_idESTADO` int NOT NULL,
  `ORGANIZACION_A_CARGO_codigo_organizacion` int NOT NULL,
  `TIPO_SERVICIO_idTIPO_SERVICIO` int NOT NULL,
  PRIMARY KEY (`idSERVICIO`),
  KEY `fk_SERVICIO_INSTITUCION1_idx` (`INSTITUCION_idINSTITUCION`),
  KEY `fk_SERVICIO_SEMESTRE1_idx` (`SEMESTRE_idSEMESTRE`),
  KEY `fk_SERVICIO_ESTADO1_idx` (`ESTADO_idESTADO`),
  KEY `fk_SERVICIO_ORGANIZACION_A_CARGO1_idx` (`ORGANIZACION_A_CARGO_codigo_organizacion`),
  KEY `fk_SERVICIO_TIPO_SERVICIO1_idx` (`TIPO_SERVICIO_idTIPO_SERVICIO`),
  CONSTRAINT `fk_SERVICIO_ESTADO1` FOREIGN KEY (`ESTADO_idESTADO`) REFERENCES `estado` (`idESTADO`),
  CONSTRAINT `fk_SERVICIO_INSTITUCION1` FOREIGN KEY (`INSTITUCION_idINSTITUCION`) REFERENCES `institucion` (`idINSTITUCION`),
  CONSTRAINT `fk_SERVICIO_ORGANIZACION_A_CARGO1` FOREIGN KEY (`ORGANIZACION_A_CARGO_codigo_organizacion`) REFERENCES `organizacion_a_cargo` (`codigo_organizacion`),
  CONSTRAINT `fk_SERVICIO_SEMESTRE1` FOREIGN KEY (`SEMESTRE_idSEMESTRE`) REFERENCES `semestre` (`idSEMESTRE`),
  CONSTRAINT `fk_SERVICIO_TIPO_SERVICIO1` FOREIGN KEY (`TIPO_SERVICIO_idTIPO_SERVICIO`) REFERENCES `tipo_servicio` (`idTIPO_SERVICIO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'COMEDOR UNIVERSITARIO','SERVICIO DE COMEDOR UNIVERSITARIO BRINDADO A ESTUDIANTES','2021-09-27 04:32:18','2021-09-26 23:32:18','2021-09-27 04:32:18',1,1,2,2,2);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_has_empleador`
--

DROP TABLE IF EXISTS `servicio_has_empleador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_has_empleador` (
  `SERVICIO_idSERVICIO` int NOT NULL,
  `EMPLEADOR_idEMPLEADOR` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SERVICIO_idSERVICIO`,`EMPLEADOR_idEMPLEADOR`),
  KEY `fk_SERVICIO_has_EMPLEADOR_EMPLEADOR1_idx` (`EMPLEADOR_idEMPLEADOR`),
  KEY `fk_SERVICIO_has_EMPLEADOR_SERVICIO1_idx` (`SERVICIO_idSERVICIO`),
  CONSTRAINT `fk_SERVICIO_has_EMPLEADOR_EMPLEADOR1` FOREIGN KEY (`EMPLEADOR_idEMPLEADOR`) REFERENCES `empleador` (`idEMPLEADOR`),
  CONSTRAINT `fk_SERVICIO_has_EMPLEADOR_SERVICIO1` FOREIGN KEY (`SERVICIO_idSERVICIO`) REFERENCES `servicio` (`idSERVICIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_has_empleador`
--

LOCK TABLES `servicio_has_empleador` WRITE;
/*!40000 ALTER TABLE `servicio_has_empleador` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_has_empleador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_encuesta`
--

DROP TABLE IF EXISTS `tipo_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_encuesta` (
  `idTIPO_ENCUESTA` int NOT NULL AUTO_INCREMENT,
  `nombre_tipoencuesta` varchar(45) NOT NULL,
  `descripcion_tipoencuesta` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idTIPO_ENCUESTA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_encuesta`
--

LOCK TABLES `tipo_encuesta` WRITE;
/*!40000 ALTER TABLE `tipo_encuesta` DISABLE KEYS */;
INSERT INTO `tipo_encuesta` VALUES (1,'A ESTUDIANTES','ENCUESTA REALIZADA PARA MEDIR EL GRADO DE SATISFACCIÓN DE LOS ESTUDIANTES','2021-09-27 04:37:25','2021-09-26 23:37:25','2021-09-27 04:37:25'),(2,'A EMPLEADORES','ENCUESTA REALIZADA PARA MEDIR EL GRADO DE SATISFACCIÓN DE LOS EMPLEADORES','2021-09-27 04:37:25','2021-09-26 23:37:25','2021-09-27 04:37:25'),(3,'A SERVICIOS','ENCUESTA REALIZADA PARA MEDIR EL GRADO DE SATISFACCIÓN DE LOS SERVICIOS','2021-09-27 04:37:26','2021-09-26 23:37:26','2021-09-27 04:37:26');
/*!40000 ALTER TABLE `tipo_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicio` (
  `idTIPO_SERVICIO` int NOT NULL AUTO_INCREMENT,
  `codigo_tiposervicio` varchar(45) NOT NULL,
  `nombre_tiposervicio` varchar(100) NOT NULL,
  `descripcion_tiposervicio` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idTIPO_SERVICIO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (1,'001','BOLSA DE TRABAJO','ESTE TIPO DE SERVICIO SE ESTÁ AVOCADO PARA GENERAR EMPLEO PARA\nLOS ESTUDIANTES','2021-09-27 04:30:16','2021-09-26 23:30:16','2021-09-27 04:30:16'),(2,'002','BIENESTAR UNIVERSITARIO','ESTE TIPO DE SERVICIO SE ESTÁ AVOCADO PARA LOS SERVICIOS COMO\nCOMEDOR UNIVERSITARIO,ETC','2021-09-27 04:30:18','2021-09-26 23:30:18','2021-09-27 04:30:18'),(3,'003','CONVENIOS','SON LOS CONVENIOS ESTRATÉGICOS QUE SE REALIZA','2021-09-27 04:30:21','2021-09-26 23:30:21','2021-09-27 04:30:21');
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `idTIPO_USUARIO` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idTIPO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'ESTUDIANTE','ESTUDIANTE VIGENTE','USUARIO VIGENTE','2021-09-27 04:31:33','2021-09-26 23:31:33','2021-09-27 04:31:33'),(2,'ESTUDIANTE','ESTUDIANTE VIGENTE','USUARIO NO VIGENTE','2021-09-27 04:31:33','2021-09-26 23:31:33','2021-09-27 04:31:33'),(3,'ESTUDIANTE','ESTUDIANTE NO VIGENTE','USUARIO NO VIGENTE','2021-09-27 04:31:33','2021-09-26 23:31:33','2021-09-27 04:31:33');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUSUARIO` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `POSTULANTE_idPOSTULANTE` int NOT NULL,
  `TIPO_USUARIO_idTIPO_USUARIO` int NOT NULL,
  PRIMARY KEY (`idUSUARIO`),
  KEY `fk_USUARIO_POSTULANTE1_idx` (`POSTULANTE_idPOSTULANTE`),
  KEY `fk_USUARIO_TIPO_USUARIO1_idx` (`TIPO_USUARIO_idTIPO_USUARIO`),
  CONSTRAINT `fk_USUARIO_POSTULANTE1` FOREIGN KEY (`POSTULANTE_idPOSTULANTE`) REFERENCES `postulante` (`idPOSTULANTE`),
  CONSTRAINT `fk_USUARIO_TIPO_USUARIO1` FOREIGN KEY (`TIPO_USUARIO_idTIPO_USUARIO`) REFERENCES `tipo_usuario` (`idTIPO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'arobesr@unasam.edu.pe','795705d71043120a97d7f7c882ffb20c','2021-09-27 04:32:53','2021-09-26 23:32:53','2021-09-27 04:32:53',1,1),(2,'mtorresf@unasam.edu.pe','c6395fc2a20ef14c669de0a8fc196280','2021-09-27 04:33:28','2021-09-26 23:33:28','2021-09-27 04:33:28',2,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_encuesta`
--

DROP TABLE IF EXISTS `usuario_has_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_encuesta` (
  `USUARIO_idUSUARIO` int NOT NULL,
  `ENCUESTA_idENCUESTA` int NOT NULL,
  `METAS_idMETAS` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`USUARIO_idUSUARIO`,`ENCUESTA_idENCUESTA`),
  KEY `fk_USUARIO_has_ENCUESTA_ENCUESTA1_idx` (`ENCUESTA_idENCUESTA`),
  KEY `fk_USUARIO_has_ENCUESTA_USUARIO1_idx` (`USUARIO_idUSUARIO`),
  KEY `fk_USUARIO_has_ENCUESTA_METAS1_idx` (`METAS_idMETAS`),
  CONSTRAINT `fk_USUARIO_has_ENCUESTA_ENCUESTA1` FOREIGN KEY (`ENCUESTA_idENCUESTA`) REFERENCES `encuesta` (`idENCUESTA`),
  CONSTRAINT `fk_USUARIO_has_ENCUESTA_METAS1` FOREIGN KEY (`METAS_idMETAS`) REFERENCES `metas` (`idMETAS`),
  CONSTRAINT `fk_USUARIO_has_ENCUESTA_USUARIO1` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_encuesta`
--

LOCK TABLES `usuario_has_encuesta` WRITE;
/*!40000 ALTER TABLE `usuario_has_encuesta` DISABLE KEYS */;
INSERT INTO `usuario_has_encuesta` VALUES (1,1,3,'2021-09-27 05:05:20','2021-09-27 00:05:20','2021-09-27 05:05:20'),(2,1,2,'2021-09-27 05:05:28','2021-09-27 00:05:28','2021-09-27 05:05:28');
/*!40000 ALTER TABLE `usuario_has_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_servicio`
--

DROP TABLE IF EXISTS `usuario_has_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_servicio` (
  `SERVICIO_idSERVICIO` int NOT NULL,
  `USUARIO_idUSUARIO` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SERVICIO_idSERVICIO`,`USUARIO_idUSUARIO`),
  KEY `fk_USUARIO_has_SERVICIO_SERVICIO1_idx` (`SERVICIO_idSERVICIO`),
  KEY `fk_USUARIO_has_SERVICIO_USUARIO1_idx` (`USUARIO_idUSUARIO`),
  CONSTRAINT `fk_USUARIO_has_SERVICIO_SERVICIO1` FOREIGN KEY (`SERVICIO_idSERVICIO`) REFERENCES `servicio` (`idSERVICIO`),
  CONSTRAINT `fk_USUARIO_has_SERVICIO_USUARIO1` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_servicio`
--

LOCK TABLES `usuario_has_servicio` WRITE;
/*!40000 ALTER TABLE `usuario_has_servicio` DISABLE KEYS */;
INSERT INTO `usuario_has_servicio` VALUES (1,1,'2021-09-27 05:02:11','2021-09-27 00:02:11','2021-09-27 05:02:11'),(1,2,'2021-09-27 05:02:26','2021-09-27 00:02:26','2021-09-27 05:02:26');
/*!40000 ALTER TABLE `usuario_has_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'master_db'
--

--
-- Dumping routines for database 'master_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-27 14:27:23
