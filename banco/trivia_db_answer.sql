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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_correct` bit(1) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8frr4bcabmmeyyu60qt7iiblo` (`question_id`),
  CONSTRAINT `FK8frr4bcabmmeyyu60qt7iiblo` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (225,_binary '','Steven Erikson',57),(226,_binary '\0','Ian Cameron Esslemont',57),(227,_binary '\0','George RR Martins',57),(228,_binary '\0','- J. R. R. TOLKIEN',57),(229,_binary '','Dinâmico',58),(230,_binary '\0','Perigoso',58),(231,_binary '\0','Dinástico',58),(232,_binary '\0','Delirante',58),(233,_binary '','Xogum',59),(234,_binary '\0','Ninja',59),(235,_binary '\0','Samurai',59),(236,_binary '\0','Shinobi',59),(237,_binary '','OS VIKINGS',60),(238,_binary '\0','Os Longos Navios',60),(239,_binary '\0','Príncipe Valente',60),(240,_binary '\0','Spartacus',60),(241,_binary '','O3',61),(242,_binary '\0','C6H2O6',61),(243,_binary '\0','N2O',61),(244,_binary '\0','SO4-',61),(245,_binary '','Sr. Rogers',62),(246,_binary '\0','Batman',62),(247,_binary '\0','Chuck Norris',62),(248,_binary '\0','Godzilla',62),(249,_binary '','Garfield Tabby',63),(250,_binary '\0','ChalkZone',63),(251,_binary '\0','Minha vida como robô adolescente',63),(252,_binary '\0','The Fairly OddParents',63),(253,_binary '','Lamarr',64),(254,_binary '\0','Jumperr',64),(255,_binary '\0','Drett',64),(256,_binary '\0','Jerry',64),(257,_binary '','Atalanta',65),(258,_binary '\0','Peleu',65),(259,_binary '\0','Teseu',65),(260,_binary '\0','Jason',65),(261,_binary '','Imperador',66),(262,_binary '\0','King',66),(263,_binary '\0','Gentoo',66),(264,_binary '\0','Adele',66),(265,_binary '','Shellshock',67),(266,_binary '\0','Heartbleed',67),(267,_binary '\0','Bashbug',67),(268,_binary '\0','Stagefright',67),(269,_binary '','2000',68),(270,_binary '\0','2001',68),(271,_binary '\0','2003',68),(272,_binary '\0','1998',68),(273,_binary '','Suíça',69),(274,_binary '\0','China',69),(275,_binary '\0','Canadá',69),(276,_binary '\0','a n.o País',69),(277,_binary '','A cascata de ressonância',70),(278,_binary '\0','3ª Guerra Mundial',70),(279,_binary '\0','O Ataque de Xen',70),(280,_binary '\0','The Black Mesa Nuke',70),(281,_binary '','O Dia do Gafanhoto',71),(282,_binary '\0','CÍRCULO VICIOSO, DILEMA, IMPASSE; SITUAÇÃO ABSURDA',71),(283,_binary '\0','De Ratos e Homens',71),(284,_binary '\0','Uma paz em separado',71),(285,_binary '','Lesoto',72),(286,_binary '\0','Essuatíni',72),(287,_binary '\0','Botsuana',72),(288,_binary '\0','Zimbábue',72),(289,_binary '','Ace Combat',73),(290,_binary '\0','Rádio Jet Set',73),(291,_binary '\0','Deus Ex',73),(292,_binary '\0','Céus Carmesins',73),(293,_binary '','Irreal. ',74),(294,_binary '\0','União',74),(295,_binary '\0','Criador de jogos: Estúdio',74),(296,_binary '\0','Cry Engine',74),(297,_binary '','SHAQUILLE O\'NEAL SOT: ',75),(298,_binary '\0','ALLEN IVERSON SOT: ',75),(299,_binary '\0','Kobe Bryant',75),(300,_binary '\0','Paul Pierce',75),(301,_binary '','Don Cherry',76),(302,_binary '\0','Don McKellar',76),(303,_binary '\0','Don Taylor',76),(304,_binary '\0','Donald Sutherland',76),(305,_binary '','The Junkyard Gang',77),(306,_binary '\0','The Trash Troupe',77),(307,_binary '\0','The Scrapyard Seven',77),(308,_binary '\0','The Rotten Posse',77),(309,_binary '','Bumper-WAC',78),(310,_binary '\0','Tampa do bueiro americano',78),(311,_binary '\0','Sputnik I',78),(312,_binary '\0','Sputnik II',78),(313,_binary '','Kirby\'s Adventure',79),(314,_binary '\0','Kirby Super Star',79),(315,_binary '\0','Kirby\'s Dream Land 2',79),(316,_binary '\0','Kirby\'s Dream Land',79),(317,_binary '','MICHAEL EMERSON',80),(318,_binary '\0','Jim Caviezel',80),(319,_binary '\0','Taraji P. Henson',80),(320,_binary '\0','Kevin Chapman',80),(321,_binary '','Charme Ankh',81),(322,_binary '\0','Cajado Veneno',81),(323,_binary '\0','Fratura do Céu',81),(324,_binary '\0','Ferramentas Orichalcum',81),(325,_binary '','Call of Duty 3',82),(326,_binary '\0','Call of Duty 4: Guerra Moderna',82),(327,_binary '\0','Call of Duty: Mundo em Guerra',82),(328,_binary '\0','Call of Duty: Caminhos para a Vitória',82),(329,_binary '','17 de setembro de 2013',83),(330,_binary '\0','17 de agosto de 2013',83),(331,_binary '\0','14/04/2015',83),(332,_binary '\0','18 de novembro de 2014',83),(333,_binary '','10 de outubro de 2010',84),(334,_binary '\0','06 de novembro de 2010',84),(335,_binary '\0','14 de abril de 1984',84),(336,_binary '\0','MAY 18th 2015',84),(337,_binary '','1914',85),(338,_binary '\0','1905',85),(339,_binary '\0','1919',85),(340,_binary '\0','1925',85),(341,_binary '','Eu vim, eu vi, eu conquistei.',86),(342,_binary '\0','Não veja o mal, não ouça o mal, não fale o mal',86),(343,_binary '\0','Vida, liberdade e felicidade',86),(344,_binary '\0','passado, presente e futuro',86),(345,_binary '','7',87),(346,_binary '\0','5',87),(347,_binary '\0','4',87),(348,_binary '\0','9',87),(349,_binary '','Arteijo',88),(350,_binary '\0','Sanjenjo',88),(351,_binary '\0','Mugía',88),(352,_binary '\0','Órdenes',88),(353,_binary '','Kootie Pie',89),(354,_binary '\0','Docinho',89),(355,_binary '\0','Wendy Pie',89),(356,_binary '\0','Torta de mel',89),(357,_binary '','LAKE VICTORIA',90),(358,_binary '\0','Lago Tanganica',90),(359,_binary '\0','Lago Malawi',90),(360,_binary '\0','Lago Turkana',90),(361,_binary '','The Cure',91),(362,_binary '\0','The Smiths',91),(363,_binary '\0','Eco',91),(364,_binary '\0','Novo pedido',91),(365,_binary '','30/06/',92),(366,_binary '\0',',308',92),(367,_binary '\0','7,62',92),(368,_binary '\0','7,62x51mm',92),(369,_binary '','DD-445',93),(370,_binary '\0','DD-992',93),(371,_binary '\0','DD-444',93),(372,_binary '\0','DD-446',93),(373,_binary '','Ossos',94),(374,_binary '\0','Produção I.G',94),(375,_binary '\0','Animação de Quioto',94),(376,_binary '\0','xebec',94),(377,_binary '','Romênia',95),(378,_binary '\0','Turcomenistão',95),(379,_binary '\0','Belarus',95),(380,_binary '\0','Tajiquistão',95),(381,_binary '','Joelho',96),(382,_binary '\0','Cotovelo ',96),(383,_binary '\0','Tornozelo',96),(384,_binary '\0','Ombro',96),(385,_binary '','Tom Vasel',97),(386,_binary '\0','Jason LeVine',97),(387,_binary '\0','Borth Sampson',97),(388,_binary '\0','Tio Pennybags',97),(389,_binary '','Avô e Neto',98),(390,_binary '\0','Pai e filho. ',98),(391,_binary '\0','As melhores amigas.',98),(392,_binary '\0','Parceiros de combate ao crime',98),(393,_binary '','Inuktitut',99),(394,_binary '\0','Inuinnaqtun',99),(395,_binary '\0','Groenlandês',99),(396,_binary '\0','Inupiat',99),(397,_binary '','Neurônio Perceptivo',100),(398,_binary '\0','Neurônio Sensorial&#10;&#10;',100),(399,_binary '\0','Neurônio motor.&#10;&#10;',100),(400,_binary '\0','Interneurônio',100),(401,_binary '','Machado de Gelo',101),(402,_binary '\0','Machado de Fogo',101),(403,_binary '\0','Chave inglesa',101),(404,_binary '\0','Canivete de caça',101),(405,_binary '','Células T citotóxicas',102),(406,_binary '\0','Células dendríticas ',102),(407,_binary '\0','Células Assassinas Naturais',102),(408,_binary '\0','Glóbulos brancos',102),(409,_binary '','Espanha',103),(410,_binary '\0','Áustria-Hungria',103),(411,_binary '\0','Turquia',103),(412,_binary '\0','Alemanha',103),(413,_binary '','Placa Atlântica',104),(414,_binary '\0','Placa Norte-Americana',104),(415,_binary '\0','Placa eurasiana',104),(416,_binary '\0','Placa de Nazca',104),(417,_binary '','1936',105),(418,_binary '\0','1948',105),(419,_binary '\0','1932',105),(420,_binary '\0','1955',105),(421,_binary '','Vermelho',106),(422,_binary '\0','Branco',106),(423,_binary '\0','CA',106),(424,_binary '\0','Preto',106);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
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
