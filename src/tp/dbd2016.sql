-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dbd2016
-- ------------------------------------------------------
-- Server version	5.7.12-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alimento` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `calorias` decimal(5,2) unsigned NOT NULL,
  `carbohidratos` decimal(5,2) DEFAULT NULL,
  `azucar` decimal(4,2) DEFAULT NULL,
  `proteinas` decimal(5,2) DEFAULT NULL,
  `grasas_totales` decimal(4,2) unsigned DEFAULT NULL,
  `grasas_saturadas` decimal(4,2) unsigned DEFAULT NULL,
  `grasas_trans` decimal(4,2) unsigned DEFAULT NULL,
  `colesterol` tinyint(3) unsigned DEFAULT NULL,
  `fibra` decimal(5,2) DEFAULT NULL,
  `sodio` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (1,'Leche entera',66.00,4.70,0.00,3.00,3.80,2.30,0.00,NULL,0.00,50),(2,'Leche descremada',44.00,4.70,0.00,3.00,1.50,0.90,0.00,NULL,0.00,50),(3,'Pan de Salvado',227.00,40.00,2.90,9.40,3.20,0.70,0.00,0,7.60,516),(4,'Arroz',130.00,28.17,0.05,2.69,0.28,0.08,0.00,0,0.40,1),(5,'Queso light',218.00,0.50,0.00,27.00,12.00,7.60,0.20,35,0.00,500),(6,'Huevo',70.00,0.00,0.00,6.00,5.00,1.50,0.00,185,0.00,70),(7,'Milanesa soja tradicional',187.00,31.00,0.30,9.40,2.60,0.30,0.00,0,4.60,561),(8,'Milanesa soja cebolla',176.00,28.00,0.30,10.00,3.90,0.60,0.00,0,4.80,365),(9,'Milanesa soja jamón',204.00,36.00,0.30,9.00,2.60,0.30,0.00,0,4.40,708),(10,'Pollo',145.00,0.00,0.00,22.20,6.20,NULL,0.00,62,0.00,66),(11,'Papa',80.00,19.00,NULL,2.50,0.10,0.00,0.00,0,NULL,NULL),(12,'Kiwi',67.00,14.66,9.00,1.14,0.52,0.03,0.00,0,3.00,3),(13,'Espinaca',36.00,1.10,0.50,4.00,0.90,0.20,0.00,0,3.70,0),(14,'Berenjena',35.00,8.70,3.20,0.80,0.23,0.04,0.00,0,2.50,1),(15,'Calabaza',50.00,10.81,4.90,2.48,0.43,0.13,0.00,0,4.90,8),(16,'Avena',353.00,55.70,0.00,11.72,7.09,0.45,0.00,0,9.67,8),(17,'Nesquik',392.86,78.57,NULL,4.29,2.86,1.43,0.00,0,6.43,200),(18,'Queso Holanda',330.20,1.00,0.00,25.52,25.40,17.04,0.00,114,0.00,512),(19,'Cebolla',31.85,5.30,0.00,1.19,0.25,0.09,0.00,0,1.80,3),(20,'Tomate',22.17,3.50,0.00,0.88,0.21,0.04,0.00,0,1.40,9),(21,'Puerro',29.00,3.26,NULL,2.19,0.29,0.01,0.00,0,2.27,4),(22,'Banana',95.03,20.80,NULL,1.06,0.27,0.12,0.00,0,2.55,1),(23,'Nueces',649.00,4.40,NULL,14.42,62.50,6.83,0.00,0,5.80,544),(24,'Mani',515.00,4.00,0.00,27.00,43.00,6.80,0.10,0,14.00,836),(25,'Almendras',610.00,5.36,NULL,18.71,54.10,4.14,0.00,NULL,13.50,14),(26,'Azúcar',399.00,99.80,99.80,0.00,0.00,0.00,0.00,0,0.00,0),(27,'Naranja',42.00,8.60,NULL,0.80,NULL,NULL,0.00,0,2.00,3),(28,'Lentejas',304.00,40.60,NULL,23.18,1.70,0.23,0.00,0,17.00,24),(29,'Mermelada de Durazno',278.00,69.00,58.00,0.00,0.00,0.00,0.00,0,0.00,31),(30,'Mermelada BC Durazno',150.00,36.50,32.00,0.00,0.00,0.00,0.00,0,0.00,26),(31,'Brócoli',34.00,6.64,1.70,2.82,0.37,0.04,0.00,0,2.60,33),(32,'Remolacha',43.00,9.56,6.76,1.61,0.17,0.03,0.00,0,2.80,78),(33,'Atún al natural',120.00,2.00,0.00,22.00,1.00,0.00,0.00,NULL,0.00,226),(34,'Zapallito',17.00,3.60,1.10,1.20,0.23,0.04,0.00,0,0.60,2),(35,'Morrón',24.00,5.66,2.20,0.95,0.19,0.05,0.00,0,1.50,2),(36,'Acelga',29.70,4.50,NULL,1.88,0.20,0.03,0.00,0,1.20,150),(37,'Torta de chocolate',443.00,41.80,20.00,5.20,27.90,16.90,8.70,148,1.80,365);
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `dni` int(10) unsigned NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,35666235,'Juan','Perez','1990-10-10'),(2,38667785,'Emiliano','Rodriguez','1988-07-16'),(3,33667785,'Laura','Noguera','1990-05-05'),(4,28458771,'Analia','Werben','1981-01-25'),(5,26458771,'Francisco','Rojas','1978-09-20');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro` (
  `fecha` date NOT NULL,
  `cantidad` decimal(5,2) unsigned DEFAULT NULL,
  `calorias` decimal(5,2) unsigned DEFAULT NULL,
  `carbohidratos` decimal(5,2) unsigned DEFAULT NULL,
  `proteinas` decimal(5,2) unsigned NOT NULL,
  `grasas` decimal(5,2) unsigned DEFAULT NULL,
  `comentarios` text,
  `id_persona` smallint(5) unsigned NOT NULL,
  `id_alimento` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_persona`,`id_alimento`,`fecha`),
  KEY `fk_id_alimento` (`id_alimento`),
  CONSTRAINT `fk_id_alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES ('2016-09-03',200.00,132.00,9.40,6.00,7.60,NULL,1,1),('2016-09-15',200.00,132.00,9.40,6.00,7.60,NULL,1,1),('2016-09-03',100.00,204.00,36.00,9.00,2.60,NULL,1,9),('2016-09-15',200.00,290.00,0.00,44.40,12.40,NULL,1,10),('2016-09-15',500.00,180.00,5.50,4.00,4.50,NULL,1,13),('2016-09-03',200.00,706.00,114.40,23.44,14.18,NULL,1,16),('2016-09-15',100.00,353.00,55.70,11.72,7.09,NULL,1,16),('2016-09-15',50.00,305.00,2.68,9.35,27.05,NULL,1,25),('2016-05-22',200.00,240.00,4.00,44.00,2.00,NULL,1,33),('2016-09-15',200.00,240.00,4.00,44.00,2.00,NULL,1,33),('2016-09-03',200.00,886.00,83.60,10.40,55.80,NULL,1,37),('2016-09-15',100.00,353.00,55.70,11.72,7.09,NULL,2,16),('2016-07-21',200.00,88.00,9.40,6.00,3.00,NULL,3,2),('2016-07-21',300.00,390.00,84.51,8.07,0.84,NULL,3,4),('2016-07-21',100.00,70.00,0.00,6.00,5.00,NULL,3,6),('2016-07-21',100.00,353.00,55.70,11.72,7.09,NULL,3,16);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

