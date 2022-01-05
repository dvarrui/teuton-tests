
-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_residencias_escolares
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

--
-- Table structure for table `residencias`
--

DROP TABLE IF EXISTS `residencias`;

CREATE TABLE `residencias` (
  `cod_residencia` int(11) NOT NULL AUTO_INCREMENT,
  `nom_residencia` varchar(30) DEFAULT NULL,
  `cod_universidad` char(6) DEFAULT NULL,
  `precio_mensual` int(11) DEFAULT '900',
  `comedor` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cod_residencia`),
  KEY `fk_uni` (`cod_universidad`),
  CONSTRAINT `fk_uni` FOREIGN KEY (`cod_universidad`) REFERENCES `universidades` (`cod_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `universidades`
--

DROP TABLE IF EXISTS `universidades`;

CREATE TABLE `universidades` (
  `cod_universidad` char(6) NOT NULL,
  `nom_universidad` varchar(30) DEFAULT 'La Laguna',
  PRIMARY KEY (`cod_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
