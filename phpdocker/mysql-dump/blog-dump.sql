-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `blog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `blog` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `blog`;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
                         `id` int unsigned NOT NULL AUTO_INCREMENT,
                         `title` varchar(30) NOT NULL,
                         `subtitle` varchar(255) DEFAULT NULL,
                         `content` text NOT NULL,
                         `user_id` int unsigned,
                         `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                         PRIMARY KEY (`id`),
                         FOREIGN KEY (user_id) REFERENCES `users`(id)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'title - Leks','subtitle','something content for post, bla-bla-bla 1',1,'2021-07-26 10:54:55'),(2,'title - Rubik','subtitle','something content for post, bla-bla-bla 2',2,'2021-07-26 10:55:19'),(3,'title - Kesha','subtitle','something content for post, bla-bla-bla 3',3,'2021-07-26 10:56:21'),(4,'title - Bobik','subtitle','something content for post, bla-bla-bla 4',4,'2021-07-26 11:29:02'),(5,'title - Topik','subtitle','something content for post, bla-bla-bla 5',5,'2021-07-26 11:29:15'),(6,'title - Gosha','subtitle','something content for post, bla-bla-bla 6',6,'2021-07-26 11:29:41'),(7,'title - Barsik','subtitle','something content for post, bla-bla-bla 7',7,'2021-07-26 11:32:52'),(8,'title - Motya','subtitle','something content for post, bla-bla-bla 8',8,'2021-07-26 11:33:08'),(9,'title - Sonya','subtitle','something content for post, bla-bla-bla 9',9,'2021-07-26 11:33:13'),(10,'title - Tayson','subtitle','something content for post, bla-bla-bla 10',10,'2021-07-26 11:35:52'),(11,'title - Rex','subtitle','something content for post, bla-bla-bla 11',1,'2021-07-26 11:35:56'),(12,'title - Baron','subtitle','something content for post, bla-bla-bla 12',2,'2021-07-26 11:37:45'),(13,'title - Rey','subtitle','something content for post, bla-bla-bla 13',3,'2021-07-26 11:37:57'),(14,'title - Bonya','subtitle','something content for post, bla-bla-bla 14',4,'2021-07-26 11:38:04'),(15,'title - Maks','subtitle','something content for post, bla-bla-bla 15',5,'2021-07-26 11:38:22'),(16,'title - Aleks','subtitle','something content for post, bla-bla-bla 16',6,'2021-07-26 11:38:39'),(17,'title - Gerda','subtitle','something content for post, bla-bla-bla 17',7,'2021-07-26 11:38:45');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` int unsigned NOT NULL AUTO_INCREMENT,
                         `name` varchar(50) DEFAULT NULL,
                         `email` varchar(50) NOT NULL,
                         `password` varchar(55) NOT NULL,
                         `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Egor','as1df@gmail.com','123','2021-07-26 10:38:55'),(2,'Alexandr','ashaw2shs@gmail.com','123','2021-07-26 10:40:17'),(3,'Danil','asda3sdhg@gmail.com','123','2021-07-26 10:40:41'),(4,'Maxim','sadg4hasdh@gmail.com','123','2021-07-26 10:41:17'),(5,'Kirill','sabs5drj@gmail.com','123','2021-07-26 10:42:57'),(6,'Andrey','hdrh6vc@gmail.com','123','2021-07-26 10:44:48'),(7,'Evgeniy','ds7jtjsdf@gmail.com','123','2021-07-26 10:47:36'),(8,'Dmitry','sd8fjtsrjs@gmail.com','123','2021-07-26 10:48:50'),(9,'Oleg','sdfh9sdjt@gmail.com','123','2021-07-26 10:49:22'),(10,'Ivan','sdk10yllulu@gmail.com','123','2021-07-26 10:50:37'),(11,'Артур','artur-rvachev@rambler.ru','4297f44b13955235245b2497399d7a93','2022-10-12 10:57:15'),(12,'Артур','adm@gmail.com','9ad64470c6325927f75ad62b94804107','2022-10-12 12:34:33'),(13,'111','art@gmail.com','4297f44b13955235245b2497399d7a93','2022-10-12 12:55:22'),(14,'Новая роль 1','admin1@gmail.com','b76533a41de99664612a77f92c3d2f35','2022-10-12 13:09:22'),(15,'art','admin@gmail.com','9ad64470c6325927f75ad62b94804107','2022-10-12 13:11:14'),(16,'123','adma@gmail.com','9ad64470c6325927f75ad62b94804107','2022-10-12 13:15:15'),(17,'asdg','artur-rvachev1@rambler.ru','9ad64470c6325927f75ad62b94804107','2022-10-12 13:18:38'),(18,'111','admasdf@gmail.com','9ad64470c6325927f75ad62b94804107','2022-10-12 13:21:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-13  7:37:17