CREATE DATABASE  IF NOT EXISTS `seguros` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `seguros`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: seguros
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `acidente`
--

DROP TABLE IF EXISTS `acidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acidente` (
  `numero_ocorrencia` int NOT NULL,
  `data` date DEFAULT NULL,
  `local` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`numero_ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acidente`
--

LOCK TABLES `acidente` WRITE;
/*!40000 ALTER TABLE `acidente` DISABLE KEYS */;
INSERT INTO `acidente` VALUES (149,'2004-11-22','Rua dos Macacos, 1410, Três Rios, RJ'),(321,'2009-09-09','Eng. Cabral Filho,83, Niterói, RJ'),(654,'2010-06-06','Av. Presidente Vargas, 34, São Paulo, SP'),(980,'2011-05-07','Rua 15 de Abril, 204, Sergipe, AL'),(981,'2021-10-29','Rua Tiradentes'),(987,'2011-02-26','Rua das Flores, 83, Novo Hamburgo, RS');
/*!40000 ALTER TABLE `acidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `modelo` varchar(20) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `placa` varchar(10) NOT NULL,
  PRIMARY KEY (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES ('Ford Ka',2005,'GWA1534'),('Fiat Uno',2001,'HBL1556'),('Brasília',1960,'JAW5874'),('VW Gol',2010,'KWY3245'),('Honda Civic',2011,'PAQ5698');
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participou`
--

DROP TABLE IF EXISTS `participou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participou` (
  `id_motorista` int NOT NULL,
  `placa` varchar(10) NOT NULL,
  `numero_ocorrencia` int NOT NULL,
  `valor_dano` double DEFAULT NULL,
  PRIMARY KEY (`id_motorista`,`placa`,`numero_ocorrencia`),
  KEY `fc_cstr_4` (`numero_ocorrencia`),
  KEY `fc_cstr_5` (`placa`),
  CONSTRAINT `fc_cstr_3` FOREIGN KEY (`id_motorista`) REFERENCES `pessoa` (`id_motorista`),
  CONSTRAINT `fc_cstr_4` FOREIGN KEY (`numero_ocorrencia`) REFERENCES `acidente` (`numero_ocorrencia`),
  CONSTRAINT `fc_cstr_5` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participou`
--

LOCK TABLES `participou` WRITE;
/*!40000 ALTER TABLE `participou` DISABLE KEYS */;
INSERT INTO `participou` VALUES (12345,'HBL1556',149,3000),(12345,'HBL1556',654,3),(12345,'HBL1556',981,3000),(123456,'PAQ5698',987,549),(789012,'GWA1534',321,432),(789012,'GWA1534',980,690);
/*!40000 ALTER TABLE `participou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertence`
--

DROP TABLE IF EXISTS `pertence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pertence` (
  `id_motorista` int NOT NULL,
  `placa` varchar(10) NOT NULL,
  PRIMARY KEY (`id_motorista`,`placa`),
  KEY `fc_cstr_2` (`placa`),
  CONSTRAINT `fc_cstr_1` FOREIGN KEY (`id_motorista`) REFERENCES `pessoa` (`id_motorista`),
  CONSTRAINT `fc_cstr_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertence`
--

LOCK TABLES `pertence` WRITE;
/*!40000 ALTER TABLE `pertence` DISABLE KEYS */;
INSERT INTO `pertence` VALUES (789012,'GWA1534'),(12345,'HBL1556'),(456789,'KWY3245'),(123456,'PAQ5698');
/*!40000 ALTER TABLE `pertence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id_motorista` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_motorista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (12345,'Frederico Barbosa','Rua Tirandentes, 995, Campo Grande, MT'),(123456,'João Arthur','Rua da Laguna 32, Rio de Janeiro, RJ'),(456789,'Maria Aparecida','Rua A, 45, São Paulo, SP'),(789012,'Joaquim José','Rua Itamar Arantes, 498, Vitória, ES');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visao1`
--

DROP TABLE IF EXISTS `visao1`;
/*!50001 DROP VIEW IF EXISTS `visao1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao1` AS SELECT 
 1 AS `avg(valor_dano)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao10`
--

DROP TABLE IF EXISTS `visao10`;
/*!50001 DROP VIEW IF EXISTS `visao10`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao10` AS SELECT 
 1 AS `modelo`,
 1 AS `local`,
 1 AS `numero_ocorrencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao11`
--

DROP TABLE IF EXISTS `visao11`;
/*!50001 DROP VIEW IF EXISTS `visao11`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao11` AS SELECT 
 1 AS `count(distinct placa)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao12`
--

DROP TABLE IF EXISTS `visao12`;
/*!50001 DROP VIEW IF EXISTS `visao12`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao12` AS SELECT 
 1 AS `placa`,
 1 AS `sum(valor_dano)`,
 1 AS `avg(valor_dano)`,
 1 AS `min(valor_dano)`,
 1 AS `max(valor_dano)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao13`
--

DROP TABLE IF EXISTS `visao13`;
/*!50001 DROP VIEW IF EXISTS `visao13`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao13` AS SELECT 
 1 AS `numero_ocorrencia`,
 1 AS `data`,
 1 AS `local`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao14`
--

DROP TABLE IF EXISTS `visao14`;
/*!50001 DROP VIEW IF EXISTS `visao14`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao14` AS SELECT 
 1 AS `modelo`,
 1 AS `ano`,
 1 AS `placa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao15`
--

DROP TABLE IF EXISTS `visao15`;
/*!50001 DROP VIEW IF EXISTS `visao15`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao15` AS SELECT 
 1 AS `modelo`,
 1 AS `ano`,
 1 AS `placa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao16`
--

DROP TABLE IF EXISTS `visao16`;
/*!50001 DROP VIEW IF EXISTS `visao16`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao16` AS SELECT 
 1 AS `modelo`,
 1 AS `ano`,
 1 AS `placa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao2`
--

DROP TABLE IF EXISTS `visao2`;
/*!50001 DROP VIEW IF EXISTS `visao2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao2` AS SELECT 
 1 AS `estado`,
 1 AS `media`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao3`
--

DROP TABLE IF EXISTS `visao3`;
/*!50001 DROP VIEW IF EXISTS `visao3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao3` AS SELECT 
 1 AS `modelo`,
 1 AS `ano`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao4`
--

DROP TABLE IF EXISTS `visao4`;
/*!50001 DROP VIEW IF EXISTS `visao4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao4` AS SELECT 
 1 AS `nome`,
 1 AS `modelo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao5`
--

DROP TABLE IF EXISTS `visao5`;
/*!50001 DROP VIEW IF EXISTS `visao5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao5` AS SELECT 
 1 AS `id_motorista`,
 1 AS `nome`,
 1 AS `endereco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao6`
--

DROP TABLE IF EXISTS `visao6`;
/*!50001 DROP VIEW IF EXISTS `visao6`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao6` AS SELECT 
 1 AS `modelo`,
 1 AS `ano`,
 1 AS `placa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao7`
--

DROP TABLE IF EXISTS `visao7`;
/*!50001 DROP VIEW IF EXISTS `visao7`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao7` AS SELECT 
 1 AS `numero_ocorrencia`,
 1 AS `data`,
 1 AS `local`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao8`
--

DROP TABLE IF EXISTS `visao8`;
/*!50001 DROP VIEW IF EXISTS `visao8`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao8` AS SELECT 
 1 AS `numero_ocorrencia`,
 1 AS `data`,
 1 AS `local`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao9`
--

DROP TABLE IF EXISTS `visao9`;
/*!50001 DROP VIEW IF EXISTS `visao9`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao9` AS SELECT 
 1 AS `data`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `visao1`
--

/*!50001 DROP VIEW IF EXISTS `visao1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao1` AS select avg(`part`.`valor_dano`) AS `avg(valor_dano)` from (`participou` `part` join `acidente` `ac` on((`part`.`numero_ocorrencia` = `ac`.`numero_ocorrencia`))) where (`ac`.`local` like '%RJ') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao10`
--

/*!50001 DROP VIEW IF EXISTS `visao10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao10` AS select `c`.`modelo` AS `modelo`,`a`.`local` AS `local`,`a`.`numero_ocorrencia` AS `numero_ocorrencia` from ((`carro` `c` join `participou` `p`) join `acidente` `a`) where ((`c`.`placa` = `p`.`placa`) and (`a`.`numero_ocorrencia` = `p`.`numero_ocorrencia`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao11`
--

/*!50001 DROP VIEW IF EXISTS `visao11`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao11` AS select count(distinct `participou`.`placa`) AS `count(distinct placa)` from `participou` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao12`
--

/*!50001 DROP VIEW IF EXISTS `visao12`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao12` AS select `participou`.`placa` AS `placa`,sum(`participou`.`valor_dano`) AS `sum(valor_dano)`,avg(`participou`.`valor_dano`) AS `avg(valor_dano)`,min(`participou`.`valor_dano`) AS `min(valor_dano)`,max(`participou`.`valor_dano`) AS `max(valor_dano)` from `participou` group by `participou`.`placa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao13`
--

/*!50001 DROP VIEW IF EXISTS `visao13`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao13` AS select `acidente`.`numero_ocorrencia` AS `numero_ocorrencia`,`acidente`.`data` AS `data`,`acidente`.`local` AS `local` from `acidente` where (`acidente`.`data` = (select min(`acidente`.`data`) from `acidente`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao14`
--

/*!50001 DROP VIEW IF EXISTS `visao14`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao14` AS select distinct `c`.`modelo` AS `modelo`,`c`.`ano` AS `ano`,`c`.`placa` AS `placa` from (`carro` `c` join `participou` `p` on((`c`.`placa` = `p`.`placa`))) where (`c`.`ano` = (select min(`carro`.`ano`) from (`carro` join `participou` on((`carro`.`placa` = `participou`.`placa`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao15`
--

/*!50001 DROP VIEW IF EXISTS `visao15`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao15` AS select distinct `c`.`modelo` AS `modelo`,`c`.`ano` AS `ano`,`c`.`placa` AS `placa` from (`carro` `c` join `participou` `p` on((`c`.`placa` = `p`.`placa`))) where (`c`.`ano` = (select max(`carro`.`ano`) from (`carro` join `participou` on((`carro`.`placa` = `participou`.`placa`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao16`
--

/*!50001 DROP VIEW IF EXISTS `visao16`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao16` AS select `carro`.`modelo` AS `modelo`,`carro`.`ano` AS `ano`,`carro`.`placa` AS `placa` from `carro` where `carro`.`placa` in (select `participou`.`placa` from `participou`) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao2`
--

/*!50001 DROP VIEW IF EXISTS `visao2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao2` AS select right(`ac`.`local`,2) AS `estado`,avg(`part`.`valor_dano`) AS `media` from (`acidente` `ac` join `participou` `part` on((`part`.`numero_ocorrencia` = `ac`.`numero_ocorrencia`))) group by `estado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao3`
--

/*!50001 DROP VIEW IF EXISTS `visao3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao3` AS select `c`.`modelo` AS `modelo`,`c`.`ano` AS `ano` from ((`carro` `c` join `participou` `p` on((`c`.`placa` = `p`.`placa`))) join `acidente` `a` on((`p`.`numero_ocorrencia` = `a`.`numero_ocorrencia`))) where (year(`a`.`data`) = 2011) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao4`
--

/*!50001 DROP VIEW IF EXISTS `visao4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao4` AS select `p`.`nome` AS `nome`,`c`.`modelo` AS `modelo` from ((`pessoa` `p` join `carro` `c`) join `pertence` `pert`) where ((`p`.`id_motorista` = `pert`.`id_motorista`) and (`c`.`placa` = `pert`.`placa`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao5`
--

/*!50001 DROP VIEW IF EXISTS `visao5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao5` AS select `pessoa`.`id_motorista` AS `id_motorista`,`pessoa`.`nome` AS `nome`,`pessoa`.`endereco` AS `endereco` from `pessoa` where `pessoa`.`id_motorista` in (select `participou`.`id_motorista` from `participou`) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao6`
--

/*!50001 DROP VIEW IF EXISTS `visao6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao6` AS select `c`.`modelo` AS `modelo`,`c`.`ano` AS `ano`,`c`.`placa` AS `placa` from (`carro` `c` left join `participou` `p` on((`c`.`placa` = `p`.`placa`))) group by `c`.`placa` having (count(`p`.`numero_ocorrencia`) <= 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao7`
--

/*!50001 DROP VIEW IF EXISTS `visao7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao7` AS select `a`.`numero_ocorrencia` AS `numero_ocorrencia`,`a`.`data` AS `data`,`a`.`local` AS `local` from (`acidente` `a` join `participou` `p` on((`a`.`numero_ocorrencia` = `p`.`numero_ocorrencia`))) where (`p`.`valor_dano` = (select max(`participou`.`valor_dano`) from `participou`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao8`
--

/*!50001 DROP VIEW IF EXISTS `visao8`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao8` AS select `a`.`numero_ocorrencia` AS `numero_ocorrencia`,`a`.`data` AS `data`,`a`.`local` AS `local` from (`acidente` `a` join `participou` `p` on((`a`.`numero_ocorrencia` = `p`.`numero_ocorrencia`))) where (`p`.`valor_dano` = (select min(`participou`.`valor_dano`) from `participou`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visao9`
--

/*!50001 DROP VIEW IF EXISTS `visao9`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao9` AS select `a`.`data` AS `data` from ((`acidente` `a` join `participou` `p` on((`a`.`numero_ocorrencia` = `p`.`numero_ocorrencia`))) join `carro` `c` on((`p`.`placa` = `c`.`placa`))) where (`c`.`modelo` = 'Fiat Uno') */;
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

-- Dump completed on 2021-10-29 21:56:24
