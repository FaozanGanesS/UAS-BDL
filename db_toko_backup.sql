-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_toko
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Table structure for table `itempesanan`
--

DROP TABLE IF EXISTS `itempesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itempesanan` (
  `IDItemPesanan` int(11) NOT NULL,
  `IDPesanan` int(11) DEFAULT NULL,
  `IDProduk` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `HargaSatuan` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IDItemPesanan`),
  KEY `IDPesanan` (`IDPesanan`),
  KEY `IDProduk` (`IDProduk`),
  CONSTRAINT `itempesanan_ibfk_1` FOREIGN KEY (`IDPesanan`) REFERENCES `pesanan` (`IDPesanan`),
  CONSTRAINT `itempesanan_ibfk_2` FOREIGN KEY (`IDProduk`) REFERENCES `produk` (`IDProduk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempesanan`
--

LOCK TABLES `itempesanan` WRITE;
/*!40000 ALTER TABLE `itempesanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempesanan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_UpdateTotalPesanan_Insert
AFTER INSERT ON ItemPesanan
FOR EACH ROW
BEGIN
    UPDATE Pesanan
    SET Total = (SELECT SUM(ip.HargaSatuan * ip.Jumlah) FROM ItemPesanan ip WHERE ip.IDPesanan = Pesanan.IDPesanan)
    WHERE IDPesanan = NEW.IDPesanan;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `IDPelanggan` int(11) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Alamat` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IDPelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'John Doe','johndoe@example.com','Jalan Sudirman 123'),(2,'Jane Smith','janesmith@example.com','Jalan Thamrin 456'),(3,'Bob Brown','bobbrown@example.com','Jalan Gatot Subroto 789');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan`
--

DROP TABLE IF EXISTS `pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan` (
  `IDPesanan` int(11) NOT NULL,
  `IDPelanggan` int(11) DEFAULT NULL,
  `TanggalPesanan` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IDPesanan`),
  KEY `IDPelanggan` (`IDPelanggan`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`IDPelanggan`) REFERENCES `pelanggan` (`IDPelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan`
--

LOCK TABLES `pesanan` WRITE;
/*!40000 ALTER TABLE `pesanan` DISABLE KEYS */;
INSERT INTO `pesanan` VALUES (1,1,'2022-01-01',100000.00),(2,1,'2022-01-15',50000.00),(3,2,'2022-02-01',200000.00),(4,3,'2022-03-01',150000.00);
/*!40000 ALTER TABLE `pesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `IDProduk` int(11) NOT NULL,
  `NamaProduk` varchar(100) DEFAULT NULL,
  `Deskripsi` varchar(200) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IDProduk`),
  KEY `idx_NamaProduk` (`NamaProduk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,'Ponsel X','Ponsel flagship dengan kamera 48MP',500000.00),(2,'Laptop Y','Laptop gaming dengan prosesor Intel Core i7',15000000.00),(3,'Tablet Z','Tablet Android dengan layar 10 inch',3000000.00);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_topprodukterlaris`
--

DROP TABLE IF EXISTS `vw_topprodukterlaris`;
/*!50001 DROP VIEW IF EXISTS `vw_topprodukterlaris`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_topprodukterlaris` AS SELECT
 1 AS `NamaProduk`,
  1 AS `JumlahTotal` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_topprodukterlaris`
--

/*!50001 DROP VIEW IF EXISTS `vw_topprodukterlaris`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_topprodukterlaris` AS select `p`.`NamaProduk` AS `NamaProduk`,sum(`ip`.`Jumlah`) AS `JumlahTotal` from (`produk` `p` join `itempesanan` `ip` on(`p`.`IDProduk` = `ip`.`IDProduk`)) group by `p`.`NamaProduk` order by sum(`ip`.`Jumlah`) desc limit 10 */;
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

-- Dump completed on 2024-06-24  3:04:41
