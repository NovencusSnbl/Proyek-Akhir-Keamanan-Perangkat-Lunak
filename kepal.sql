/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.1.38-MariaDB : Database - unriyo_simho
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`unriyo_simho` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `unriyo_simho`;

/*Table structure for table `check_in` */

DROP TABLE IF EXISTS `check_in`;

CREATE TABLE `check_in` (
  `idcheck_in` int(11) NOT NULL AUTO_INCREMENT,
  `jumlah` tinyint(4) NOT NULL,
  `biaya` int(11) NOT NULL,
  `tgl_check_in` date NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  PRIMARY KEY (`idcheck_in`),
  KEY `fk_check_in_pelanggan_idx` (`idpelanggan`),
  CONSTRAINT `fk_check_in_pelanggan` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `check_in` */

insert  into `check_in`(`idcheck_in`,`jumlah`,`biaya`,`tgl_check_in`,`idpelanggan`) values (1,5,2500000,'2018-11-11',24),(2,3,750000,'2018-08-20',12),(3,3,3000000,'2018-07-07',9),(5,1,250000,'2020-12-28',30),(6,1,250000,'2020-12-01',21),(7,1,500000,'2021-01-06',38),(8,1,250000,'2021-01-14',38),(9,1,750000,'2021-01-13',38),(10,1,250000,'2021-01-07',38),(11,1,500000,'2020-12-28',38),(12,1,500000,'2021-01-15',38),(13,1,500000,'2021-01-13',38),(14,1,500000,'2021-01-13',38),(15,1,1000000,'2021-01-13',38),(16,1,1000000,'2021-01-13',38),(17,1,1000000,'2021-01-15',38),(18,1,750000,'2021-01-14',38),(19,1,500000,'2021-01-13',38),(20,1,500000,'2021-01-13',38),(22,1,500000,'2021-01-13',38),(23,1,500000,'2021-01-07',38),(24,1,500000,'2021-01-07',38),(25,1,500000,'2021-01-14',38),(26,1,500000,'2021-01-14',38),(27,1,500000,'2021-01-13',38),(29,1,750000,'2021-01-14',38),(30,1,250000,'2021-01-07',38),(33,1,500000,'2021-01-14',38),(34,1,500000,'2021-01-09',38),(36,1,500000,'2021-01-07',38),(37,1,1000000,'2021-01-20',38),(38,1,750000,'2021-01-14',40),(39,1,500000,'2021-01-15',40),(40,1,500000,'2021-01-13',41),(41,1,500000,'2021-01-09',41),(42,1,250000,'2021-01-11',53);

/*Table structure for table `check_in_kamar` */

DROP TABLE IF EXISTS `check_in_kamar`;

CREATE TABLE `check_in_kamar` (
  `idcheck_in` int(11) NOT NULL,
  `idruang_kamar` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `fk_check_in_kamar_ruang_kamar_idx` (`idruang_kamar`),
  KEY `fk_check_in_kamar_check_in` (`idcheck_in`),
  CONSTRAINT `fk_check_in_kamar_check_in` FOREIGN KEY (`idcheck_in`) REFERENCES `check_in` (`idcheck_in`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_in_kamar_ruang_kamar` FOREIGN KEY (`idruang_kamar`) REFERENCES `ruang_kamar` (`idruang_kamar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `check_in_kamar` */

insert  into `check_in_kamar`(`idcheck_in`,`idruang_kamar`,`created_at`) values (1,6,'2018-05-01 15:34:09'),(1,7,'2018-05-01 15:34:09'),(1,8,'2018-05-01 15:34:09'),(1,9,'2018-05-01 15:34:09'),(1,10,'2018-05-01 15:34:09'),(2,1,'2018-05-01 15:36:37'),(2,2,'2018-05-01 15:36:37'),(2,3,'2018-05-01 15:36:37'),(3,18,'2018-05-01 15:42:42'),(3,19,'2018-05-01 15:42:42'),(3,20,'2018-05-01 15:42:42'),(5,1,'2020-12-27 22:45:34'),(6,2,'2020-12-28 10:07:17'),(8,4,'2021-01-08 13:44:59'),(9,13,'2021-01-08 14:09:48'),(10,3,'2021-01-08 14:38:26'),(11,8,'2021-01-08 21:12:24'),(13,8,'2021-01-08 22:21:01'),(15,18,'2021-01-08 22:36:31'),(16,18,'2021-01-08 22:37:30'),(17,20,'2021-01-08 22:41:19'),(18,13,'2021-01-08 22:44:23'),(19,9,'2021-01-08 23:21:29'),(20,9,'2021-01-08 23:22:20'),(25,10,'2021-01-08 23:25:08'),(30,3,'2021-01-08 23:40:17'),(33,7,'2021-01-08 23:42:52'),(34,10,'2021-01-09 00:21:36'),(36,7,'2021-01-09 00:29:23'),(37,18,'2021-01-09 00:32:15'),(38,13,'2021-01-09 00:35:20'),(39,8,'2021-01-09 00:35:48'),(40,7,'2021-01-09 00:38:56'),(41,8,'2021-01-09 21:26:29'),(42,3,'2021-01-10 11:17:10');

/*Table structure for table `check_out` */

DROP TABLE IF EXISTS `check_out`;

CREATE TABLE `check_out` (
  `idcheck_out` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_check_out` date NOT NULL,
  `biaya_lain` int(11) DEFAULT '0',
  `idcheck_in` int(11) NOT NULL,
  PRIMARY KEY (`idcheck_out`),
  KEY `fk_check_out_check_in_idx` (`idcheck_in`),
  CONSTRAINT `fk_check_out_check_in` FOREIGN KEY (`idcheck_in`) REFERENCES `check_in` (`idcheck_in`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `check_out` */

insert  into `check_out`(`idcheck_out`,`tgl_check_out`,`biaya_lain`,`idcheck_in`) values (1,'2018-12-11',0,1),(2,'2018-08-18',0,2),(3,'2018-07-12',0,3),(5,'2020-12-30',0,5),(6,'2020-11-29',0,6),(7,'2021-01-13',0,7),(8,'2021-01-12',0,8),(9,'2021-01-27',0,9),(10,'2021-01-19',0,10),(11,'2021-01-13',0,11),(12,'2021-01-20',0,12),(13,'2021-01-10',0,13),(14,'2021-01-10',0,14),(15,'2021-02-03',0,15),(16,'2021-02-03',0,16),(17,'2021-01-05',0,17),(18,'2021-01-20',0,18),(19,'2021-01-04',0,19),(20,'2021-01-04',0,20),(22,'2021-01-04',0,22),(23,'2021-01-13',0,23),(24,'2021-01-13',0,24),(25,'2021-01-13',0,25),(26,'2021-01-12',0,26),(27,'2021-01-05',0,27),(29,'2021-01-11',0,29),(30,'2021-01-26',0,30),(33,'2021-01-19',0,33),(34,'2021-01-10',0,34),(36,'2021-01-18',0,36),(37,'2021-01-13',0,37),(38,'2021-01-19',0,38),(39,'2021-01-12',0,39),(40,'2021-01-20',0,40),(41,'2021-01-11',0,41),(42,'2021-01-13',0,42);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `status_order` enum('baru','lunas','selesai','batal') NOT NULL,
  `idcheck_in` int(11) NOT NULL,
  `tgl_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `fk_order_check_in_idx` (`idcheck_in`),
  CONSTRAINT `fk_order_check_in` FOREIGN KEY (`idcheck_in`) REFERENCES `check_in` (`idcheck_in`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`idorder`,`status_order`,`idcheck_in`,`tgl_order`,`code`) values (1,'selesai',1,'2018-05-01 08:34:09',''),(2,'selesai',2,'2018-05-01 08:36:37',''),(3,'selesai',3,'2018-05-01 08:42:42',''),(5,'selesai',5,'2020-12-27 22:45:34',''),(6,'selesai',6,'2020-12-28 10:07:17',''),(30,'selesai',30,'2021-01-08 23:40:17','jn5FIrNlokyfecfIhWA/KA=='),(33,'selesai',33,'2021-01-08 23:42:52','jHbJ/x1ARAD9uvGSq8J93w=='),(36,'selesai',36,'2021-01-09 00:29:23','Mgj60lTq2rvQj1bc'),(37,'selesai',37,'2021-01-09 00:32:15','OyuP3mnfyrOqvVji'),(38,'selesai',38,'2021-01-09 00:35:20','bRLg53bS2I2A4Ci6'),(39,'selesai',39,'2021-01-09 00:35:48','YA3U9VHizqyeiGP6'),(40,'selesai',40,'2021-01-09 00:38:56','aSzBg0X00c2yl1a/'),(41,'selesai',41,'2021-01-09 21:26:29','awH32EbQkoudklrs'),(42,'selesai',42,'2021-01-10 11:17:10','bgHV10LQ757Rr3b8');

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `email` varchar(225) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `no_ktp` varchar(18) NOT NULL,
  `telepon` varchar(18) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `otp` int(6) NOT NULL,
  PRIMARY KEY (`idpelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`idpelanggan`,`nama`,`email`,`alamat`,`no_ktp`,`telepon`,`password`,`status`,`otp`) values (1,'Bobby','','Jogja','332500912978707140','085743411430','123',1,0),(3,'Karimah','','Dk. Pacuan Kuda No. 586','972500912978707140','081531075435','123',1,0),(4,'Kamidin','','Ds. Eka No. 230','488369637491841416','080232618448','123',1,0),(5,'Endah','','Kpg. Yap Tjwan Bing No. 558','800673141160540094','083360109406','123',1,0),(6,'Mutia','','Ki. Ters. Pasir Koja No. 511','546803849624387311','080825596482','123',1,0),(7,'Safina','','Ds. Yap Tjwan Bing No. 681','481949182056359234','081228168463','123',1,0),(8,'Aswani','','Gg. Pattimura No. 828','677766733598611948','082774672410','123',1,0),(9,'Ega','','Kpg. M.T. Haryono No. 823','074096221694508498','088497160440','123',1,0),(10,'Restu','','Jln. Bakit  No. 538','932293024691620975','083918096455','123',1,0),(11,'Azalea','','Dk. Urip Sumoharjo No. 206','678791094798813301','086148224466','123',1,0),(12,'Oni','','Jln. Suprapto No. 727','704680373747099244','089077961464','123',1,0),(13,'Prasetya','','Ki. Basuki No. 919','212317160486031284','086925795467','123',1,0),(14,'Zelda','','Gg. Babadan No. 510','911163535155446622','084743670446','123',1,0),(15,'Cinta','','Gg. Krakatau No. 93','884413098330314248','087991308406','123',1,0),(16,'Daliman','','Jln. Bah Jaya No. 306','781335778174348194','089593419485','123',1,0),(17,'Saadat','','Jln. Raya Ujungberung No. 409','807410608416712633','082890798442','123',1,0),(18,'Kasiyah','','Psr. Yos No. 363','525831514635341926','087974115466','123',1,0),(19,'Puput','','Ds. Moch. Toha No. 38','539753488191953001','088691538413','123',1,0),(20,'Puspa','','Ds. Yogyakarta No. 119','535710867445009716','088265671479','123',1,0),(21,'Farah','','Kpg. Untung Suropati No. 714','233255427261338900','087298094437','123',1,0),(22,'Oni','','Gg. Madrasah No. 697','154965460356228373','087780049496','123',1,0),(23,'Mustofa','','Kpg. Dipatiukur No. 476','028414608002468212','085231463464','123',1,0),(24,'Satya','','Jln. Baan No. 987','862670698655440768','085368162451','123',1,0),(25,'Mala','','Ds. Daan No. 491','667863709650865638','084326103494','123',1,0),(26,'Asirwanda','','Ki. Tambak No. 535','009078655628092605','0','123',1,0),(27,'Limar','','Jr. Kusmanto No. 754','450762834083252581','0','123',1,0),(30,'Novencus Sinambela','','Jln pasar ,Porsea','1234567890','0','123',1,0),(38,'Novencus Sinambela','','porsea','12313123123','0','$2y$10$RP9aVFSwIETzwO0..Rf9q.adIY2xvM8nnAh2lSiO/Cbn5/xLd.fXe',1,0),(40,'Mangasi','','porsea 112','1234567890','0','$2y$10$/3E5St80pxROfKE5Q3E9COzJx7JXnn2MkyCBptEj2Q.mLS7TFI0SS',1,0),(41,'Jane Sinambela','','9876545678','09876545679','0','$2y$10$5ckB0u6Ctj/gB4di/ug/8.sud8DQBFPTUtpsqpa0G3BwkfslBdTsO',1,0),(53,'Novencus Sinambela','nvsgokilabis@gmail.com','Jln pasar ,Porsea','1231231241','081377336943','$2y$10$kHxfGw1noMUK7fkZWoFddeVKDDNoxuLnN8Ok7ESdZG8ZTud1I91zu',1,834366);

/*Table structure for table `ruang_kamar` */

DROP TABLE IF EXISTS `ruang_kamar`;

CREATE TABLE `ruang_kamar` (
  `idruang_kamar` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipe_kamar` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idruang_kamar`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `ruang_kamar` */

insert  into `ruang_kamar`(`idruang_kamar`,`id_tipe_kamar`,`status`) values (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,2,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1),(11,3,1),(12,3,1),(13,3,1),(14,3,1),(15,3,1),(16,4,1),(17,4,1),(18,4,1),(19,4,1),(20,4,1),(21,1,1),(22,1,1);

/*Table structure for table `tipe_kamar` */

DROP TABLE IF EXISTS `tipe_kamar`;

CREATE TABLE `tipe_kamar` (
  `idtipe_kamar` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `singkatan` varchar(15) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`idtipe_kamar`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tipe_kamar` */

insert  into `tipe_kamar`(`idtipe_kamar`,`nama`,`singkatan`,`harga`) values (1,'Basic','Bas',250000),(2,'Premium','Prem',500000),(3,'Grand','Grd',750000),(4,'Royal','Roy',1000000);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`idusers`,`username`,`password`) values (5,'admin','$2y$10$7l5H4ovf9yzQx.J00Em22efTxcxjnnGwGjjGxSIzM1awvBWv8RpMy'),(6,'novencus','$2y$10$juQFUWoq.AZXZ.IUc9K4Oem4yDT/v2ZIhH6L33qMd7eblqWPes2vS');

/*Table structure for table `histori_order` */

DROP TABLE IF EXISTS `histori_order`;

/*!50001 DROP VIEW IF EXISTS `histori_order` */;
/*!50001 DROP TABLE IF EXISTS `histori_order` */;

/*!50001 CREATE TABLE  `histori_order`(
 `status_order` enum('baru','lunas','selesai','batal') ,
 `idorder` int(11) ,
 `nama` varchar(45) ,
 `no_ktp` varchar(18) ,
 `tgl_check_in` date ,
 `tgl_check_out` date ,
 `biaya` int(11) 
)*/;

/*Table structure for table `lihat_bayar` */

DROP TABLE IF EXISTS `lihat_bayar`;

/*!50001 DROP VIEW IF EXISTS `lihat_bayar` */;
/*!50001 DROP TABLE IF EXISTS `lihat_bayar` */;

/*!50001 CREATE TABLE  `lihat_bayar`(
 `idorder` int(11) ,
 `nama` varchar(45) ,
 `no_ktp` varchar(18) ,
 `tgl_check_in` date ,
 `tgl_check_out` date ,
 `biaya` int(11) 
)*/;

/*View structure for view histori_order */

/*!50001 DROP TABLE IF EXISTS `histori_order` */;
/*!50001 DROP VIEW IF EXISTS `histori_order` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `histori_order` AS select `o`.`status_order` AS `status_order`,`o`.`idorder` AS `idorder`,`p`.`nama` AS `nama`,`p`.`no_ktp` AS `no_ktp`,`ci`.`tgl_check_in` AS `tgl_check_in`,`co`.`tgl_check_out` AS `tgl_check_out`,`ci`.`biaya` AS `biaya` from (((`order` `o` join `pelanggan` `p`) join `check_in` `ci`) join `check_out` `co`) where ((`o`.`idcheck_in` = `ci`.`idcheck_in`) and (`ci`.`idpelanggan` = `p`.`idpelanggan`) and (`co`.`idcheck_in` = `ci`.`idcheck_in`)) */;

/*View structure for view lihat_bayar */

/*!50001 DROP TABLE IF EXISTS `lihat_bayar` */;
/*!50001 DROP VIEW IF EXISTS `lihat_bayar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lihat_bayar` AS select `o`.`idorder` AS `idorder`,`p`.`nama` AS `nama`,`p`.`no_ktp` AS `no_ktp`,`ci`.`tgl_check_in` AS `tgl_check_in`,`co`.`tgl_check_out` AS `tgl_check_out`,`ci`.`biaya` AS `biaya` from (((`order` `o` join `pelanggan` `p`) join `check_in` `ci`) join `check_out` `co`) where ((`o`.`idcheck_in` = `ci`.`idcheck_in`) and (`ci`.`idpelanggan` = `p`.`idpelanggan`) and (`co`.`idcheck_in` = `ci`.`idcheck_in`) and (`o`.`status_order` = 'baru')) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
