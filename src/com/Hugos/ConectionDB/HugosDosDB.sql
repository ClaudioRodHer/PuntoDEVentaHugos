/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : HugosDosDB

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-16 06:32:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idCliente` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cliente
-- ----------------------------

-- ----------------------------
-- Table structure for direccion
-- ----------------------------
DROP TABLE IF EXISTS `direccion`;
CREATE TABLE `direccion` (
  `idDireccion` int(5) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(60) NOT NULL,
  `colonia` varchar(60) NOT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `CP` varchar(6) DEFAULT NULL,
  `nInterior` varchar(6) DEFAULT NULL,
  `nExterior` varchar(6) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `idEmpleado` int(5) DEFAULT NULL,
  `idCliente` int(5) DEFAULT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `direccion_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of direccion
-- ----------------------------

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `idEmpleado` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `Puesto` varchar(50) NOT NULL,
  `horaEntrada` datetime NOT NULL,
  `horaSalida` datetime NOT NULL,
  `contrasenia` varchar(20) NOT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', 'Hugo', 'Sanchez', 'Nava', '123456789', 'Administrador', '2018-01-16 00:17:43', '2018-01-16 00:17:43', 'hugo1234');

-- ----------------------------
-- Table structure for Producto
-- ----------------------------
DROP TABLE IF EXISTS `Producto`;
CREATE TABLE `Producto` (
  `idProducto` int(5) NOT NULL,
  `nombreProducto` varchar(30) NOT NULL,
  `idTipo` int(5) DEFAULT NULL,
  `precio` int(5) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `idReceta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idTipo` (`idTipo`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `Producto_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`),
  CONSTRAINT `Producto_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `Receta` (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Producto
-- ----------------------------

-- ----------------------------
-- Table structure for Receta
-- ----------------------------
DROP TABLE IF EXISTS `Receta`;
CREATE TABLE `Receta` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `nombreReceta` varchar(100) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `idTamanio` int(11) NOT NULL,
  `idUnidadMedida` int(11) NOT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `idTipo` (`idTipo`),
  KEY `idTamanio` (`idTamanio`),
  KEY `idUnidadMedida` (`idUnidadMedida`),
  CONSTRAINT `Receta_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`),
  CONSTRAINT `Receta_ibfk_2` FOREIGN KEY (`idTamanio`) REFERENCES `tamanio` (`idTamanio`),
  CONSTRAINT `Receta_ibfk_3` FOREIGN KEY (`idUnidadMedida`) REFERENCES `unidadMedida` (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Receta
-- ----------------------------

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `idStock` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `pieza` int(5) NOT NULL,
  `cantidadMedida` varchar(20) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `perteneceA` varchar(30) NOT NULL,
  PRIMARY KEY (`idStock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for tamanio
-- ----------------------------
DROP TABLE IF EXISTS `tamanio`;
CREATE TABLE `tamanio` (
  `idTamanio` int(5) NOT NULL AUTO_INCREMENT,
  `nombreT` varchar(30) NOT NULL,
  `precio` int(3) NOT NULL,
  PRIMARY KEY (`idTamanio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tamanio
-- ----------------------------

-- ----------------------------
-- Table structure for tipo
-- ----------------------------
DROP TABLE IF EXISTS `tipo`;
CREATE TABLE `tipo` (
  `idTipo` int(5) NOT NULL,
  `nombreTipo` varchar(30) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo
-- ----------------------------

-- ----------------------------
-- Table structure for unidadMedida
-- ----------------------------
DROP TABLE IF EXISTS `unidadMedida`;
CREATE TABLE `unidadMedida` (
  `idUnidadMedida` int(5) NOT NULL AUTO_INCREMENT,
  `nombreUnidad` varchar(20) NOT NULL,
  PRIMARY KEY (`idUnidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unidadMedida
-- ----------------------------

-- ----------------------------
-- Table structure for Venta
-- ----------------------------
DROP TABLE IF EXISTS `Venta`;
CREATE TABLE `Venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `tipoVenta` varchar(20) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idProducto` (`idProducto`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `Venta_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`),
  CONSTRAINT `Venta_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Venta
-- ----------------------------

-- ----------------------------
-- Table structure for VentaProducto
-- ----------------------------
DROP TABLE IF EXISTS `VentaProducto`;
CREATE TABLE `VentaProducto` (
  `idVenta` int(20) NOT NULL,
  `idProducto` int(20) NOT NULL,
  PRIMARY KEY (`idVenta`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `VentaProducto_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `Venta` (`idVenta`),
  CONSTRAINT `VentaProducto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of VentaProducto
-- ----------------------------
