CREATE DATABASE  IF NOT EXISTS `livraria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `livraria`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: livraria
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `numautor` decimal(4,0) NOT NULL,
  `nomeautor` varchar(30) DEFAULT NULL,
  `anonascimento` year(4) DEFAULT NULL,
  `anofalecimento` year(4) DEFAULT NULL,
  PRIMARY KEY (`numautor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1023,'Sandra Puga',1954,NULL),(1234,'Shamkant Navathe',1948,2013),(2345,'Carlos Heuser',1951,NULL),(3456,'C.J.Date',1948,NULL),(4567,'Henry F.Silberschatz',1950,1990),(5678,'Michael Morrison',1960,2015),(6789,'Eric Freeman',1970,NULL),(7890,'Elisabeth Freeman',1956,2010),(8901,'Mark L. Gillenson',1954,2011),(9012,'Paul Barry',1957,2010);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoria`
--

DROP TABLE IF EXISTS `autoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoria` (
  `numlivro` decimal(4,0) NOT NULL DEFAULT '0',
  `numautor` decimal(4,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numlivro`,`numautor`),
  KEY `fk_numautor` (`numautor`),
  CONSTRAINT `fk_numautor` FOREIGN KEY (`numautor`) REFERENCES `autor` (`numautor`),
  CONSTRAINT `fk_numlivro` FOREIGN KEY (`numlivro`) REFERENCES `livro` (`numlivro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoria`
--

LOCK TABLES `autoria` WRITE;
/*!40000 ALTER TABLE `autoria` DISABLE KEYS */;
INSERT INTO `autoria` VALUES (1010,1023),(1111,1234),(4444,2345),(5555,3456),(2222,4567),(6666,5678),(7777,6789),(8888,7890),(3333,8901),(9999,9012);
/*!40000 ALTER TABLE `autoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `numcli` decimal(5,0) NOT NULL,
  `nomecli` varchar(50) DEFAULT NULL,
  `rua` varchar(40) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`numcli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (11111,'Carla Soares','Moraes Sarmento','Juiz de Fora','MG','Brasil'),(11112,'Angela Silveira','Av. Sete de Setembro','Juiz de Fora','MG','Brasil'),(11122,'Marcelo Souza','Padre Frederico','Juiz de Fora','MG','Brasil'),(11223,'Raimundo Oliveira','Av. Itamar Franco','Juiz de Fora','MG','Brasil'),(22222,'Alicia Rosa','Moraes e Castro','Juiz de Fora','MG','Brasil'),(22223,'Sandra Alvarenga','Rei Alberto','Juiz de Fora','MG','Brasil'),(22233,'José Castilho','Oscar Freire','Juiz de Fora','MG','Brasil'),(33333,'Alice Ferreira','Ibitiguaia','Juiz de Fora','MG','Brasil'),(33334,'Maria Tereza','Av. Santa Luzia','Juiz de Fora','MG','Brasil'),(33344,'Silvio Albuquerque','Oscar Vidal','Juiz de Fora','MG','Brasil'),(33445,'Margarida de Jesus','Pasteur','Juiz de Fora','MG','Brasil'),(44445,'Iara Cristina','Porto das Flores','Juiz de Fora','MG','Brasil'),(44455,'Alex Alves','Manoel Honório','Juiz de Fora','MG','Brasil'),(55556,'Adriane Santana','Av. Deusdedith Salgado','Juiz de Fora','MG','Brasil'),(55566,'Matheus Reis','Padre Café','Juiz de Fora','MG','Brasil'),(55667,'Argemiro Braga','Oswaldo Aranha','Juiz de Fora','MG','Brasil'),(66666,'Tamara Jesus','Mariano Procópio','Juiz de Fora','MG','Brasil'),(66667,'Laura Leme','Av. Itamar Franco','Juiz de Fora','MG','Brasil'),(66677,'Gisele Almeida','Av. Costa e Silva','Juiz de Fora','MG','Brasil'),(66778,'Joice Leite','Gil Horta','Juiz de Fora','MG','Brasil'),(77777,'Adriana Alves','Olípio Costa','Juiz de Fora','MG','Brasil'),(77778,'Luisa Antunes','Braz Bernardino','Juiz de Fora','MG','Brasil'),(77889,'Luiz de Paula','Av. Barão do Rio Branco','Juiz de Fora','MG','Brasil'),(88889,'Romero Santos','Av. Juscelino Kubitschek','Juiz de Fora','MG','Brasil');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editora` (
  `nomeeditora` varchar(15) NOT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `anofundacao` year(4) DEFAULT NULL,
  PRIMARY KEY (`nomeeditora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES ('Alta Books','Rio de Janeiro','Brasil','(21)3278-8159',2012),('Campus','Rio de Janeiro','Brasil','0800-026-5340',1976),('Grupo GEN','São Paulo','Brasil','(11)5080-0770',2007),('Pearson','São Paulo','Brasil','(11)2178-8686',1901),('Sagra Luzzatto','Porto Alegre','Brasil','(51)3013-8121',2003);
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `numlivro` decimal(4,0) NOT NULL,
  `nomelivro` varchar(50) DEFAULT NULL,
  `anopub` year(4) DEFAULT NULL,
  `paginas` decimal(3,0) DEFAULT NULL,
  `nomeeditora` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`numlivro`),
  KEY `fk_nome_editora` (`nomeeditora`),
  CONSTRAINT `fk_nome_editora` FOREIGN KEY (`nomeeditora`) REFERENCES `editora` (`nomeeditora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1010,'Banco de Dados: Implementação em SQL',2014,326,'Pearson'),(1111,'Sistema de Banco de Dados',2011,770,'Pearson'),(2222,'Sistema de Banco de Dados',2006,781,'Campus'),(3333,'Introdução À Gerência De Bancos De Dados',2009,228,'Grupo Gen'),(4444,'Projeto de Banco de Dados',1998,205,'Sagra Luzzatto'),(5555,'INTRODUÇÃO A BANCO DE DADOS',2004,975,'Campus'),(6666,'Use a Cabeça!JavaScript',2010,640,'Alta Books'),(7777,'Use a Cabeça!Programação em Html 5',2014,608,'Alta Books'),(8888,'Use a Cabeça!Html com Css e Xhtml',2008,616,'Alta Books'),(9999,'Use a Cabeça! Programação',2010,440,'Alta Books');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `numlivro` decimal(4,0) NOT NULL DEFAULT '0',
  `numcli` decimal(5,0) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `preco` double DEFAULT NULL,
  `quantidade` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`numlivro`,`numcli`,`data`),
  KEY `fk_numcli` (`numcli`),
  CONSTRAINT `fk_numcli` FOREIGN KEY (`numcli`) REFERENCES `cliente` (`numcli`),
  CONSTRAINT `fk_numlivroVendas` FOREIGN KEY (`numlivro`) REFERENCES `livro` (`numlivro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1111,11112,'2013-09-11',230,1),(1111,11122,'2014-01-02',230,10),(2222,22222,'2014-03-04',180,8),(2222,22223,'2014-01-03',180,2),(3333,11111,'2013-09-23',250,3),(3333,33334,'2014-11-12',250,1),(4444,33344,'2014-05-21',80,2),(4444,33445,'2014-05-19',80,15),(5555,44445,'2014-09-09',120,5),(5555,55556,'2014-10-10',120,3),(6666,22223,'2014-01-03',150,4),(6666,55566,'2014-08-23',150,1),(7777,11122,'2014-05-14',18,7),(7777,55667,'2014-11-13',180,3),(8888,33344,'2014-08-27',220,9),(8888,66667,'2014-11-11',220,6),(8888,77777,'2014-03-22',220,2),(9999,77889,'2014-11-14',140,6),(9999,88889,'2014-11-05',140,3);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-22 19:38:10
