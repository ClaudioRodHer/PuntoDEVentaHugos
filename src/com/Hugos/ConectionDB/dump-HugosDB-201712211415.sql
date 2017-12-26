-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: HugosDB
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AlitasR`
--

DROP TABLE IF EXISTS `AlitasR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlitasR` (
  `idAlitasR` int(5) NOT NULL AUTO_INCREMENT,
  `idStock` int(100) NOT NULL,
  `idUnidadMedida` int(5) NOT NULL,
  `idTipoAlitas` int(5) NOT NULL,
  PRIMARY KEY (`idAlitasR`),
  KEY `AlitasR_stock_FK` (`idStock`),
  KEY `AlitasR_unidadMedida_FK` (`idUnidadMedida`),
  KEY `AlitasR_tipoAlitas_FK` (`idTipoAlitas`),
  CONSTRAINT `AlitasR_stock_FK` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idStock`) ON UPDATE CASCADE,
  CONSTRAINT `AlitasR_tipoAlitas_FK` FOREIGN KEY (`idTipoAlitas`) REFERENCES `tipoAlitas` (`idTipoAlitas`) ON UPDATE CASCADE,
  CONSTRAINT `AlitasR_unidadMedida_FK` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadMedida` (`idUnidadMedida`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlitasR`
--

LOCK TABLES `AlitasR` WRITE;
/*!40000 ALTER TABLE `AlitasR` DISABLE KEYS */;
/*!40000 ALTER TABLE `AlitasR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HamburgesaR`
--

DROP TABLE IF EXISTS `HamburgesaR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HamburgesaR` (
  `idHamburgesaR` int(5) NOT NULL AUTO_INCREMENT,
  `idStock` int(100) NOT NULL,
  `idUnidadMedida` int(5) NOT NULL,
  `idTipoHamburguesa` int(5) DEFAULT NULL,
  PRIMARY KEY (`idHamburgesaR`),
  KEY `HamburgesaR_stock_FK` (`idStock`),
  KEY `HamburgesaR_unidadMedida_FK` (`idUnidadMedida`),
  KEY `HamburgesaR_tipoHamburgesa_FK` (`idTipoHamburguesa`),
  CONSTRAINT `HamburgesaR_stock_FK` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idStock`) ON UPDATE CASCADE,
  CONSTRAINT `HamburgesaR_tipoHamburgesa_FK` FOREIGN KEY (`idTipoHamburguesa`) REFERENCES `tipoHamburgesa` (`idTipoHamburguesa`) ON UPDATE CASCADE,
  CONSTRAINT `HamburgesaR_unidadMedida_FK` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadMedida` (`idUnidadMedida`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HamburgesaR`
--

LOCK TABLES `HamburgesaR` WRITE;
/*!40000 ALTER TABLE `HamburgesaR` DISABLE KEYS */;
/*!40000 ALTER TABLE `HamburgesaR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `idDireccion` int(5) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `cliente_direccion_FK` (`idDireccion`),
  CONSTRAINT `cliente_direccion_FK` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `idDireccion` int(5) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(60) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `CP` varchar(6) DEFAULT NULL,
  `nInterior` varchar(6) DEFAULT NULL,
  `nExterior` varchar(6) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `idDireccion` int(5) DEFAULT NULL,
  `Puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `empleado_direccion_FK` (`idDireccion`),
  CONSTRAINT `empleado_direccion_FK` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzaR`
--

DROP TABLE IF EXISTS `pizzaR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizzaR` (
  `idPizzaR` int(5) NOT NULL AUTO_INCREMENT,
  `idStock` int(100) NOT NULL,
  `idUnidadMedida` int(5) NOT NULL,
  `idTipoPizza` int(5) NOT NULL,
  `idTamanio` int(5) NOT NULL,
  PRIMARY KEY (`idPizzaR`),
  KEY `idStock` (`idStock`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  KEY `idTipoPizza` (`idTipoPizza`),
  KEY `idTamanio` (`idTamanio`),
  CONSTRAINT `pizzaR_ibfk_1` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idStock`),
  CONSTRAINT `pizzaR_ibfk_2` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadMedida` (`idUnidadMedida`),
  CONSTRAINT `pizzaR_ibfk_3` FOREIGN KEY (`idTipoPizza`) REFERENCES `tipoPizza` (`idTipoPizza`),
  CONSTRAINT `pizzaR_ibfk_4` FOREIGN KEY (`idTamanio`) REFERENCES `tamanio` (`idTamanio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzaR`
--

LOCK TABLES `pizzaR` WRITE;
/*!40000 ALTER TABLE `pizzaR` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizzaR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `idStock` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `pieza` int(5) NOT NULL,
  `cantidadMedida` varchar(20) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `perteneceA` varchar(30) NOT NULL,
  PRIMARY KEY (`idStock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanio`
--

DROP TABLE IF EXISTS `tamanio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamanio` (
  `idTamanio` int(5) NOT NULL AUTO_INCREMENT,
  `nombreT` varchar(30) NOT NULL,
  `precio` int(3) NOT NULL,
  PRIMARY KEY (`idTamanio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanio`
--

LOCK TABLES `tamanio` WRITE;
/*!40000 ALTER TABLE `tamanio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamanio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoAlitas`
--

DROP TABLE IF EXISTS `tipoAlitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoAlitas` (
  `idTipoAlitas` int(5) NOT NULL AUTO_INCREMENT,
  `nombreTA` varchar(30) NOT NULL,
  PRIMARY KEY (`idTipoAlitas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoAlitas`
--

LOCK TABLES `tipoAlitas` WRITE;
/*!40000 ALTER TABLE `tipoAlitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoAlitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoHamburgesa`
--

DROP TABLE IF EXISTS `tipoHamburgesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoHamburgesa` (
  `idTipoHamburguesa` int(5) NOT NULL AUTO_INCREMENT,
  `nombreTH` varchar(30) NOT NULL,
  PRIMARY KEY (`idTipoHamburguesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoHamburgesa`
--

LOCK TABLES `tipoHamburgesa` WRITE;
/*!40000 ALTER TABLE `tipoHamburgesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoHamburgesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoPizza`
--

DROP TABLE IF EXISTS `tipoPizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoPizza` (
  `idTipoPizza` int(5) NOT NULL AUTO_INCREMENT,
  `nombreTP` varchar(30) NOT NULL,
  PRIMARY KEY (`idTipoPizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoPizza`
--

LOCK TABLES `tipoPizza` WRITE;
/*!40000 ALTER TABLE `tipoPizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoPizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadMedida`
--

DROP TABLE IF EXISTS `unidadMedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidadMedida` (
  `idUnidadMedida` int(5) NOT NULL AUTO_INCREMENT,
  `nombreUnidad` varchar(20) NOT NULL,
  PRIMARY KEY (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadMedida`
--

LOCK TABLES `unidadMedida` WRITE;
/*!40000 ALTER TABLE `unidadMedida` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidadMedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'HugosDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-21 14:15:53
