CREATE DATABASE  IF NOT EXISTS `empresa_02` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empresa_02`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: empresa_02
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `codigo_cargo` decimal(3,0) NOT NULL,
  `salario_min` decimal(7,2) DEFAULT NULL,
  `salario_max` decimal(8,2) DEFAULT NULL,
  `nivel_graduacao` char(1) DEFAULT NULL,
  `nome_cargo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigo_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (101,5000.00,7000.00,'M','Gestor de Qualidade de Software'),(201,NULL,NULL,'N','Auxiliar Administrativo'),(301,7000.00,9000.00,'D','Gerente de Projetos'),(401,1000.00,1500.00,'N','Vendedor'),(501,8000.00,10000.00,'P','Engenheiro de Software'),(601,2000.00,3000.00,'G','Gerente de Vendas'),(701,2500.00,8000.00,'M','Administrador'),(801,2500.00,8000.00,'D','Gerente de Recursos Humanos'),(802,1000.00,2000.00,'G','Auxiliar de Recursos Humanos I'),(803,1500.00,2500.00,'G','Auxiliar de Recursos Humanos II');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `codigo_dep` decimal(3,0) NOT NULL,
  `nome_dep` varchar(30) DEFAULT NULL,
  `codigo_gerente` decimal(6,0) DEFAULT NULL,
  `data_inicio_gerente` date DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `local` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_dep`),
  KEY `fc_cstr_2` (`codigo_gerente`),
  CONSTRAINT `fc_cstr_2` FOREIGN KEY (`codigo_gerente`) REFERENCES `empregado` (`codigo_empregado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (306,'Vendas',7728,'2001-06-06','1999-06-22','Rio de Janeiro'),(501,'TI',3030,'2000-10-01','2000-10-01','São Paulo'),(505,'Administrativo',3687,'2005-04-22','1995-03-15','Rio de Janeiro'),(627,'RH',4099,'2010-02-03','1996-01-01','Niterói'),(847,'Compras',NULL,NULL,'1998-08-14','São Paulo');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `codigo_empregado` decimal(6,0) NOT NULL,
  `nome_dependente` varchar(50) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `parentesco` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigo_empregado`,`nome_dependente`),
  CONSTRAINT `fc_cstr_1` FOREIGN KEY (`codigo_empregado`) REFERENCES `empregado` (`codigo_empregado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (1216,'Isadora','F','1999-10-12','Filha'),(1216,'Pedro','M','2001-11-11','Filho'),(1555,'Israel','M','2004-03-26','Filho'),(2501,'Carolina','F','1995-09-12','Filha'),(2501,'Kelly','F','1970-04-28','Esposa'),(2650,'Jonas','M','2006-01-13','Filho'),(2659,'Gabriel','M','2010-09-08','Neto'),(2659,'Patrícia','F','1982-05-29','Filha'),(7728,'Sandra','F','1970-06-15','Esposa');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregado` (
  `codigo_empregado` decimal(6,0) NOT NULL,
  `nome` char(15) DEFAULT NULL,
  `codigo_cargo` decimal(3,0) NOT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `codigo_chefe` decimal(6,0) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `sobrenome` char(15) DEFAULT NULL,
  `codigo_dep` decimal(3,0) NOT NULL,
  PRIMARY KEY (`codigo_empregado`),
  UNIQUE KEY `empregado` (`cpf`),
  KEY `fc_cstr_3` (`codigo_chefe`),
  KEY `fc_cstr_4` (`codigo_cargo`),
  KEY `fc_cstr_5` (`codigo_dep`),
  CONSTRAINT `fc_cstr_3` FOREIGN KEY (`codigo_chefe`) REFERENCES `empregado` (`codigo_empregado`),
  CONSTRAINT `fc_cstr_4` FOREIGN KEY (`codigo_cargo`) REFERENCES `cargo` (`codigo_cargo`),
  CONSTRAINT `fc_cstr_5` FOREIGN KEY (`codigo_dep`) REFERENCES `departamento` (`codigo_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES (1010,'José Luiz',201,'Rua das Flores 55','Centro','Rio de Janeiro',3687,'RJ','1985-12-18','M',2000.00,'12345678912','Santos Silva',505),(1216,'Luciana',802,'Avenida Tiradentes 159','Boa Vista','Niterói',4099,'RJ','1975-12-02','F',1895.00,'98765432132','Andrade Dias',627),(1555,'Sandra',803,'Rua Tereza 229 apto 504','Centro','Niterói',4099,'RJ','1970-06-01','F',2250.00,'32132132132','Andrade Dias',627),(2501,'Carlos Eduardo',101,'Rua dos Palmares 33','Paineiras','Santos',3030,'SP','1964-10-22','M',5250.00,'65465465465','Raimundo Nonato',501),(2650,'José Eduardo',401,'Rua Treze de Maio 6542','Centro','Santos',7728,'SP','1975-03-03','M',3100.00,'12312312312','Nogueira',306),(2659,'Antônio',401,'Avenida Joaquim Lobo','Centro','São Paulo',7728,'SP','1962-12-25','M',2600.00,'98798798798','Natalino',306),(3030,'Márcia',501,'Rua Setembrino de Souza 325','Santana','São Paulo',NULL,'SP','1972-02-15','F',4000.00,'45645645645','Araújo Alves',501),(3687,'Ricardo',701,'Avenida JK 544','Botafogo','Rio de Janeiro',NULL,'RJ','1978-04-30','M',7000.00,'78978978978','de Mello Reis',505),(4099,'Jorge',801,'Rua 9 de Julho 2000','Centro','Niterói',NULL,'RJ','1965-07-17','M',5500.00,'14714714714','Amado Batista',627),(5566,'Sílvia',201,'Rua Divina Luz 168','Centro','São Paulo',3687,'SP','1980-12-19','F',1200.00,'25825825825','Costa e Silva',505),(7728,'Rogério',601,'Rua Santa Clara 977','Arpoador','Rio de Janeiro',NULL,'RJ','1972-01-25','M',6000.00,'36936936936','dos Anjos',306);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visao1`
--

DROP TABLE IF EXISTS `visao1`;
/*!50001 DROP VIEW IF EXISTS `visao1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao1` AS SELECT 
 1 AS `salario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visao2`
--

DROP TABLE IF EXISTS `visao2`;
/*!50001 DROP VIEW IF EXISTS `visao2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao2` AS SELECT 
 1 AS `nome`,
 1 AS `quantidadeDependentes`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `visao1`
--

/*!50001 DROP VIEW IF EXISTS `visao1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao1` AS select avg(`ep1`.`salario`) AS `salario` from (`empregado` `ep1` join `empregado` `ep2` on((`ep1`.`codigo_empregado` = `ep2`.`codigo_chefe`))) */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao2` AS select `empregado`.`nome` AS `nome`,count(0) AS `quantidadeDependentes` from (`empregado` join `dependente` on((`empregado`.`codigo_empregado` = `dependente`.`codigo_empregado`))) group by `empregado`.`nome` */;
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

-- Dump completed on 2022-05-30 10:33:42
