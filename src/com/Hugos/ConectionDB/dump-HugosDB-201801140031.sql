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
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreproducto` varchar(50) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `idReceta` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `Producto_Tipo_FK` (`idTipo`),
  KEY `Producto_Receta_FK` (`idReceta`),
  CONSTRAINT `Producto_Receta_FK` FOREIGN KEY (`idReceta`) REFERENCES `Receta` (`idReceta`) ON UPDATE CASCADE,
  CONSTRAINT `Producto_Tipo_FK` FOREIGN KEY (`idTipo`) REFERENCES `Tipo` (`idTipo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receta`
--

DROP TABLE IF EXISTS `Receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Receta` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `Nombredelareceta` varchar(100) NOT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `idTamanio` int(11) NOT NULL,
  `idUnidadMedida` int(11) NOT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `Receta_Tipo_FK` (`idTipo`),
  KEY `Receta_tamanio_FK` (`idTamanio`),
  KEY `Receta_unidadMedida_FK` (`idUnidadMedida`),
  CONSTRAINT `Receta_Tipo_FK` FOREIGN KEY (`idTipo`) REFERENCES `Tipo` (`idTipo`) ON UPDATE CASCADE,
  CONSTRAINT `Receta_tamanio_FK` FOREIGN KEY (`idTamanio`) REFERENCES `tamanio` (`idTamanio`) ON UPDATE CASCADE,
  CONSTRAINT `Receta_unidadMedida_FK` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadMedida` (`idUnidadMedida`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receta`
--

LOCK TABLES `Receta` WRITE;
/*!40000 ALTER TABLE `Receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo`
--

DROP TABLE IF EXISTS `Tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo` (
  `idTipo` int(5) NOT NULL AUTO_INCREMENT,
  `nombreTipo` varchar(30) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo`
--

LOCK TABLES `Tipo` WRITE;
/*!40000 ALTER TABLE `Tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venta`
--

DROP TABLE IF EXISTS `Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `Venta_Producto_FK` (`idProducto`),
  CONSTRAINT `Venta_Producto_FK` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Jilotepec','Deni','guerrero','5467','S/N','S/N','junto al canal');
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
  `Contraseña` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `empleado_direccion_FK` (`idDireccion`),
  CONSTRAINT `empleado_direccion_FK` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Claudio','Rodriguez','Hernandez','5578934567',NULL,'Cajero','128973'),(2,'Hugo','Sanchez','Nava','5534832910',NULL,'Administrador','HuG0S@ncheZ'),(3,'Jose','peres','lopez','5534832910',NULL,'Administrador','barquito'),(4,'Raul','Lopez','Lopez','5512397345',NULL,'Repartidor','nel'),(5,'juan','Reyes','Nava','5534813928',NULL,'Cajero','ajioajio'),(6,'Angel','Rios','Reyes','5567192348',NULL,'Repartidor','vaiavaia'),(11,'Jose','Andrade','lopez','Perez',NULL,'[Administrador, Cajero, Repartidor]','12swed'),(13,'Jose','perez','lopez','55672813426',NULL,'Repartidor','78u876y'),(14,'Isaias','Hernandez','Rodriguez','551363490192',NULL,'Cajero','2w3e4r5t'),(15,'root','x','x','123',NULL,'Administrador','123'),(16,'Nachito','Cisneros','Juarez','5568731459',NULL,'Cajero','1q2w3e'),(17,'Nachito','Cisneros','Juarez','5568731459',NULL,'Cajero','1q2w3e'),(18,'g','fgh','cvgbhj','345678',NULL,'Repartidor','1234'),(19,'ccgg ','vhvhb','vjhiui','567898',NULL,'Cajero','789'),(20,'asdfgh','wertgyhj','xcvbnm','45678',NULL,'Cajero','4567'),(21,'gbnm','vbn','ghjk','65789',NULL,'Administrador','89'),(22,'ghj','fghnm','ghjm','3456789',NULL,'Cajero','678'),(23,'ghj','fghnm','ghjm','3456789',NULL,'Cajero','678'),(24,'rtyu','rtyu','tyu','5678',NULL,'Repartidor','7890'),(25,'rtyu','rtyu','tyu','5678',NULL,'Repartidor','7890');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
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

-- Dump completed on 2018-01-14  0:31:58
