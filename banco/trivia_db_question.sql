CREATE DATABASE  IF NOT EXISTS `trivia_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trivia_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: trivia_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (57,'Entretenimento: Livros','Quem é o autor da série \"Livro Malazan dos Caídos\"?'),(58,'Entretenimento: Quadrinhos','De acordo com seu apelido de longa data, que tipo de \"dupla\" são Batman'),(59,'Conhecimentos Gerais','Qual foi o nome dado aos ditadores militares japoneses que governaram o país durante os séculos XII e XIX?'),(60,'Entretenimento: Filme','Qual filme de 1958 estrelou Kirk Douglas e Tony Curtis como meio-irmãos Einar e Eric?'),(61,'Comportamental','Qual é a fórmula molecular do Ozônio?'),(62,'Entretenimento & Música','Na música \"The Ultimate Showdown of Ultimate Destiny\", quem é o único a sobreviver à batalha?'),(63,'Conhecimentos Gerais','Qual desses Nicktoons NÃO era originalmente um curta em Oh Yeah! Desenhos animados antes de se tornarem sua própria série?'),(64,'Entretenimento: videogames','Que nome tem o caranguejozinho em \"Half Life 2\"?'),(65,'Mitologia','Quem Hipômenes derrotou em uma corrida a pé?'),(66,'Conhecimentos Gerais','Qual é a maior espécie viva de pinguim?'),(67,'Ciências: Computadores','Qual era o nome da vulnerabilidade de segurança encontrada no Bash em 2014?'),(68,'Entretenimento: videogames','Marvel vs Capcom 2: New Age of Heroes foi lançado em que ano?'),(69,'Geografia','Qual país tem a abreviação \"CH\"?'),(70,'Entretenimento: videogames','No videogame Half-Life, que evento deu início ao universo Half-Life como conhecemos hoje?'),(71,'Entretenimento: Livros','Em qual romance clássico existe um personagem chamado Homer Simpson?'),(72,'Geografia','Qual país está completamente sem litoral pela África do Sul?'),(73,'Entretenimento: videogames','\"Strangereal\" é um mundo fictício semelhante à Terra para qual série de jogos?'),(74,'Entretenimento: videogames','Qual desses mecanismos de videogame foi feito pela empresa Epic Games?'),(75,'Esportes','Qual jogador da NBA ganhou o Jogador Mais Valioso na temporada 1999-2000?'),(76,'Esportes','Este locutor esportivo de televisão canadense é conhecido por seu papel de \"Noite de Hóquei no Canadá\", um programa de comentários durante os jogos de hóquei.'),(77,'Entretenimento: Cartoon','Na série \"Fat Albert and the Cosby Kids\", qual é o nome da gangue fictícia dos personagens?'),(78,'História','Qual foi o primeiro objeto registrado a chegar ao espaço?'),(79,'Entretenimento: videogames','Qual jogo de Kirby introduziu pela primeira vez as habilidades de cópia?'),(80,'Entretenimento: Televisão','Na série de TV \"Person of Interest\", quem interpreta o personagem \"Harold Finch\"?'),(81,'Entretenimento: videogames','Em Terraria, qual desses itens NÃO é criado em uma Bigorna de Mythril?'),(82,'Entretenimento: videogames','Qual dos seguintes jogos de Call of Duty foi um título de lançamento do PS3?'),(83,'Entretenimento: videogames','Qual foi a data de lançamento original de Grand Theft Auto V?'),(84,'Entretenimento: Televisão','Qual foi a data de exibição original do episódio piloto de My Little Pony: A Amizade é Mágica?'),(85,'História','Em que ano começou a Primeira Guerra Mundial?'),(86,'Conhecimentos Gerais','O que a frase latina \"Veni, vidi, vici\" traduz para o inglês?'),(87,'Ciências: Matemática','Quantos lados tem um heptágono?'),(88,'Conhecimentos Gerais','Onde em La Coruña (Espanha) fica a sede da \"Inditex\", o maior grupo de moda do mundo?'),(89,'Entretenimento: Cartoon','Wendy O. Koopa apareceu nos desenhos animados Super Mario DIC, mas como ela era conhecida?'),(90,'Geografia','Qual é o maior lago do continente africano?'),(91,'Entretenimento & Música','Qual banda dos anos 80 é liderada pelo cantor/guitarrista Robert Smith?'),(92,'Ciência: Gadgets','Qual rodada uma M1 Garand WW2 dispara?'),(93,'História','Qual é o NÚMERO do casco do destróier da classe Fletcher Fletcher?'),(94,'Entretenimento: anime japonês','Que estúdio animou o Clube de Anfitriões da Ouran High School?'),(95,'Geografia','Qual país NÃO fazia parte da União Soviética?'),(96,'Comportamental','O menisco medial forma qual parte de qual articulação do corpo humano?'),(97,'Entretenimento: jogos de tabuleiro','A rede Dice Tower de podcasts e vídeos de jogos de tabuleiro é administrada por qual indivíduo?'),(98,'Entretenimento: Cartoon','Qual é a relação entre Rick e Morty na série \"Rick e Morty\"?'),(99,'Geografia','Qual das seguintes línguas inuítes foi a PRIMEIRA a usar um sistema de escrita único não baseado no alfabeto latino?'),(100,'Comportamental','Qual não é um tipo de neurônio?'),(101,'Entretenimento: videogames','Qual arma que foi cortada do jogo \"Half Life 2\" iria substituir o pé de cabra?'),(102,'Comportamental','Quais das seguintes opções são células do sistema imunológico adaptativo?'),(103,'História','Qual desses países NÃO estava nas Potências Centrais durante a Primeira Guerra Mundial?'),(104,'Geografia','Qual destas NÃO é uma placa tectônica real?'),(105,'Entretenimento: Televisão','Em que ano a empresa de televisão BBC lançou oficialmente o canal BBC One?'),(106,'Geografia','Qual é a cor do círculo na bandeira japonesa?');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15 14:59:12
