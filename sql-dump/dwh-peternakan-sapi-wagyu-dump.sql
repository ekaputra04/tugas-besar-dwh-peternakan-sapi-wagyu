/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - dwh_peternakan_sapi_wagyu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dwh_peternakan_sapi_wagyu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dwh_peternakan_sapi_wagyu`;

/*Table structure for table `dimensi_kabupaten` */

DROP TABLE IF EXISTS `dimensi_kabupaten`;

CREATE TABLE `dimensi_kabupaten` (
  `row_key_kabupaten` int(11) NOT NULL AUTO_INCREMENT,
  `id_kabupaten` int(11) DEFAULT NULL,
  `nama_kabupaten` varchar(64) DEFAULT NULL,
  `nama_provinsi` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_kabupaten`),
  UNIQUE KEY `row_key_kabupaten` (`row_key_kabupaten`,`id_kabupaten`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_kabupaten` */

insert  into `dimensi_kabupaten`(`row_key_kabupaten`,`id_kabupaten`,`nama_kabupaten`,`nama_provinsi`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Badung','Bali','2023-12-17','9999-12-31','Y'),
(2,2,'Bangli','Bali','2023-12-17','9999-12-31','Y'),
(3,3,'Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(4,4,'Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(5,5,'Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(6,6,'Karangasem','Bali','2023-12-17','9999-12-31','Y'),
(7,7,'Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(8,8,'Tabanan','Bali','2023-12-17','9999-12-31','Y'),
(9,9,'Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(10,10,'Aceh Barat Daya','Aceh','2023-12-17','9999-12-31','Y'),
(11,11,'Aceh Besar','Aceh','2023-12-17','9999-12-31','Y'),
(12,12,'Aceh Jaya','Aceh','2023-12-17','9999-12-31','Y'),
(13,13,'Aceh Selatan','Aceh','2023-12-17','9999-12-31','Y'),
(14,14,'Aceh Singkil','Aceh','2023-12-17','9999-12-31','Y'),
(15,15,'Aceh Tamiang','Aceh','2023-12-17','9999-12-31','Y'),
(16,16,'Aceh Tengah','Aceh','2023-12-17','9999-12-31','Y'),
(17,17,'Aceh Tenggara','Aceh','2023-12-17','9999-12-31','Y'),
(18,18,'Aceh Timur','Aceh','2023-12-17','9999-12-31','Y'),
(19,19,'Aceh Utara','Aceh','2023-12-17','9999-12-31','Y'),
(20,20,'Bener Meriah','Aceh','2023-12-17','9999-12-31','Y'),
(21,21,'Bireuen','Aceh','2023-12-17','9999-12-31','Y'),
(22,22,'Gayo Lues','Aceh','2023-12-17','9999-12-31','Y'),
(23,23,'Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(24,24,'Lhokseumawe','Aceh','2023-12-17','9999-12-31','Y'),
(25,25,'Nagan Raya','Aceh','2023-12-17','9999-12-31','Y'),
(26,26,'Pidie','Aceh','2023-12-17','9999-12-31','Y'),
(27,27,'Pidie Jaya','Aceh','2023-12-17','9999-12-31','Y'),
(28,28,'Sabang','Aceh','2023-12-17','9999-12-31','Y'),
(29,29,'Simeulue','Aceh','2023-12-17','9999-12-31','Y'),
(30,30,'Subulussalam','Aceh','2023-12-17','9999-12-31','Y'),
(31,31,'Asahan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(32,32,'Batu Bara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(33,33,'Binjai','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(34,34,'Dairi','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(35,35,'Deli Serdang','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(36,36,'Gunungsitoli','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(37,37,'Humbang Hasundutan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(38,38,'Karo','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(39,39,'Labuhan Batu','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(40,40,'Labuhan Batu Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(41,41,'Labuhan Batu Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(42,42,'Langkat','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(43,43,'Mandailing Natal','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(44,44,'Medan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(45,45,'Nias','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(46,46,'Nias Barat','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(47,47,'Nias Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(48,48,'Nias Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(49,49,'Padang Lawas','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(50,50,'Padang Lawas Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(51,51,'Pakpak Bharat','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(52,52,'Pematang Siantar','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(53,53,'Samosir','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(54,54,'Sibolga','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(55,55,'Simalungun','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(56,56,'Tanjung Balai','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(57,57,'Tapanuli Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(58,58,'Tapanuli Tengah','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(59,59,'Tapanuli Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(60,60,'Tebing Tinggi','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(61,61,'Agam','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(62,62,'Dharmasraya','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(63,63,'Kepulauan Mentawai','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(64,64,'Lima Puluh Kota','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(65,65,'Padang','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(66,66,'Padang Panjang','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(67,67,'Pariaman','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(68,68,'Pasaman','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(69,69,'Pasaman Barat','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(70,70,'Payakumbuh','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(71,71,'Sawahlunto','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(72,72,'Solok','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(73,73,'Solok Selatan','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(74,74,'Tanah Datar','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(75,75,'Bengkalis','Riau','2023-12-17','9999-12-31','Y'),
(76,76,'Indragiri Hilir','Riau','2023-12-17','9999-12-31','Y'),
(77,77,'Indragiri Hulu','Riau','2023-12-17','9999-12-31','Y'),
(78,78,'Kampar','Riau','2023-12-17','9999-12-31','Y'),
(79,79,'Kepulauan Meranti','Riau','2023-12-17','9999-12-31','Y'),
(80,80,'Pelalawan','Riau','2023-12-17','9999-12-31','Y'),
(81,81,'Rokan Hilir','Riau','2023-12-17','9999-12-31','Y'),
(82,82,'Rokan Hulu','Riau','2023-12-17','9999-12-31','Y'),
(83,83,'Siak','Riau','2023-12-17','9999-12-31','Y'),
(84,84,'Bungo','Jambi','2023-12-17','9999-12-31','Y'),
(85,85,'Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(86,86,'Kerinci','Jambi','2023-12-17','9999-12-31','Y'),
(87,87,'Merangin','Jambi','2023-12-17','9999-12-31','Y'),
(88,88,'Muaro Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(89,89,'Sarolangun','Jambi','2023-12-17','9999-12-31','Y'),
(90,90,'Tanjung Jabung Barat','Jambi','2023-12-17','9999-12-31','Y'),
(91,91,'Tanjung Jabung Timur','Jambi','2023-12-17','9999-12-31','Y'),
(92,92,'Tebo','Jambi','2023-12-17','9999-12-31','Y'),
(93,93,'Ogan Komering Ulu','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(94,94,'Ogan Komering Ilir','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(95,95,'Muara Enim','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(96,96,'Lahat','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(97,97,'Musi Rawas','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(98,98,'Musi Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(99,99,'Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(100,100,'Ogan Komering Ulu Selatan','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(101,101,'Ogan Komering Ulu Timur','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(102,102,'Ogan Ilir','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(103,103,'Empat Lawang','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(104,104,'Penukal Abab Lematang Ilir','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(105,105,'Musi Rawas Utara','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(106,106,'Musi Rawas Timur','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(107,107,'Musi Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(108,108,'Musi Banyuasin Timur','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(109,109,'Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(110,110,'Banyuasin Timur','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(111,111,'Banyuasin Selatan','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(112,112,'Banyuasin Tengah','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(113,113,'Ogan Komering Ulu Selatan','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(114,114,'Ogan Komering Ulu Timur','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(115,115,'Ogan Ilir','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(116,116,'Ogan Komering Ulu Selatan','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(117,117,'Ogan Komering Ulu Timur','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(118,118,'Bengkulu Selatan','Bengkulu','2023-12-17','9999-12-31','Y'),
(119,119,'Bengkulu Tengah','Bengkulu','2023-12-17','9999-12-31','Y'),
(120,120,'Bengkulu Utara','Bengkulu','2023-12-17','9999-12-31','Y'),
(121,121,'Kaur','Bengkulu','2023-12-17','9999-12-31','Y'),
(122,122,'Kepahiang','Bengkulu','2023-12-17','9999-12-31','Y'),
(123,123,'Lebong','Bengkulu','2023-12-17','9999-12-31','Y'),
(124,124,'Muko-Muko','Bengkulu','2023-12-17','9999-12-31','Y'),
(125,125,'Rejang Lebong','Bengkulu','2023-12-17','9999-12-31','Y'),
(126,126,'Seluma','Bengkulu','2023-12-17','9999-12-31','Y'),
(127,127,'Badung','Lampung','2023-12-17','9999-12-31','Y'),
(128,128,'Lampung Barat','Lampung','2023-12-17','9999-12-31','Y'),
(129,129,'Lampung Selatan','Lampung','2023-12-17','9999-12-31','Y'),
(130,130,'Lampung Tengah','Lampung','2023-12-17','9999-12-31','Y'),
(131,131,'Lampung Timur','Lampung','2023-12-17','9999-12-31','Y'),
(132,132,'Lampung Utara','Lampung','2023-12-17','9999-12-31','Y'),
(133,133,'Mesuji','Lampung','2023-12-17','9999-12-31','Y'),
(134,134,'Pesawaran','Lampung','2023-12-17','9999-12-31','Y'),
(135,135,'Pesisir Barat','Lampung','2023-12-17','9999-12-31','Y'),
(136,136,'Pringsewu','Lampung','2023-12-17','9999-12-31','Y'),
(137,137,'Tanggamus','Lampung','2023-12-17','9999-12-31','Y'),
(138,138,'Tulang Bawang','Lampung','2023-12-17','9999-12-31','Y'),
(139,139,'Tulang Bawang Barat','Lampung','2023-12-17','9999-12-31','Y'),
(140,140,'Way Kanan','Lampung','2023-12-17','9999-12-31','Y'),
(141,141,'Bangka','Bangka Belitung','2023-12-17','9999-12-31','Y'),
(142,142,'Bangka Barat','Bangka Belitung','2023-12-17','9999-12-31','Y'),
(143,143,'Bangka Selatan','Bangka Belitung','2023-12-17','9999-12-31','Y'),
(144,144,'Bangka Tengah','Bangka Belitung','2023-12-17','9999-12-31','Y'),
(145,145,'Belitung','Bangka Belitung','2023-12-17','9999-12-31','Y'),
(146,146,'Belitung Timur','Bangka Belitung','2023-12-17','9999-12-31','Y'),
(147,147,'Pangkal Pinang','Bangka Belitung','2023-12-17','9999-12-31','Y'),
(148,148,'Bintan','Kepulauan Riau','2023-12-17','9999-12-31','Y'),
(149,149,'Karimun','Kepulauan Riau','2023-12-17','9999-12-31','Y'),
(150,150,'Lingga','Kepulauan Riau','2023-12-17','9999-12-31','Y'),
(151,151,'Natuna','Kepulauan Riau','2023-12-17','9999-12-31','Y'),
(152,152,'Kota Batam','Kepulauan Riau','2023-12-17','9999-12-31','Y'),
(153,153,'Kota Tanjung Pinang','Kepulauan Riau','2023-12-17','9999-12-31','Y');

/*Table structure for table `dimensi_pakan` */

DROP TABLE IF EXISTS `dimensi_pakan`;

CREATE TABLE `dimensi_pakan` (
  `row_key_pakan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pakan` int(11) DEFAULT NULL,
  `nama_pakan` varchar(64) DEFAULT NULL,
  `kualitas_pakan` int(10) DEFAULT NULL,
  `harga_pakan` decimal(10,2) DEFAULT NULL,
  `nama_jenis_pakan` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_pakan`),
  UNIQUE KEY `row_key_pakan` (`row_key_pakan`,`id_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_pakan` */

insert  into `dimensi_pakan`(`row_key_pakan`,`id_pakan`,`nama_pakan`,`kualitas_pakan`,`harga_pakan`,`nama_jenis_pakan`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Pakan 1',9,1694741.79,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(2,2,'Pakan 2',6,1986375.13,'Elite Wagyu Feed Blend','2023-12-18','9999-12-31','Y'),
(3,3,'Pakan 3',9,1052596.45,'Wagyu Grain Mix','2023-12-18','9999-12-31','Y'),
(4,4,'Pakan 4',8,644208.20,'Elite Wagyu Feed Blend','2023-12-18','9999-12-31','Y'),
(5,5,'Pakan 5',7,703111.68,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(6,6,'Pakan 6',8,1486455.33,'Wagyu Balanced Diet','2023-12-18','9999-12-31','Y'),
(7,7,'Pakan 7',5,1402143.13,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(8,8,'Pakan 8',7,532225.50,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(9,9,'Pakan 9',10,1479765.42,'Elite Wagyu Feed Blend','2023-12-18','9999-12-31','Y'),
(10,10,'Pakan 10',10,949287.11,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(11,11,'Pakan 11',9,1744491.65,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(12,12,'Pakan 12',9,968391.05,'Wagyu Balanced Diet','2023-12-18','9999-12-31','Y'),
(13,13,'Pakan 13',8,1854318.15,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(14,14,'Pakan 14',6,1091462.16,'Wagyu Grain Mix','2023-12-18','9999-12-31','Y'),
(15,15,'Pakan 15',9,671762.73,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(16,16,'Pakan 16',9,1006192.91,'Premium Wagyu Feed','2023-12-18','9999-12-31','Y'),
(17,17,'Pakan 17',5,1211398.38,'Wagyu Grain Mix','2023-12-18','9999-12-31','Y'),
(18,18,'Pakan 18',8,1008031.03,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(19,19,'Pakan 19',5,1631387.84,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(20,20,'Pakan 20',8,915528.25,'Wagyu Grain Mix','2023-12-18','9999-12-31','Y'),
(21,21,'Pakan 21',9,1883787.93,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(22,22,'Pakan 22',8,1981482.45,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(23,23,'Pakan 23',6,561671.53,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(24,24,'Pakan 24',10,653268.22,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(25,25,'Pakan 25',5,1575618.34,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(26,26,'Pakan 26',5,1522377.52,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(27,27,'Pakan 27',5,1550415.77,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(28,28,'Pakan 28',8,1980040.62,'Elite Wagyu Feed Blend','2023-12-18','9999-12-31','Y'),
(29,29,'Pakan 29',9,1570268.94,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(30,30,'Pakan 30',7,1718969.61,'Grade A Wagyu Hay','2023-12-18','9999-12-31','Y'),
(31,31,'Pakan 31',10,1914802.70,'Wagyu Grain Mix','2023-12-18','9999-12-31','Y'),
(32,32,'Pakan 32',8,1540798.44,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(33,33,'Pakan 33',10,1394857.71,'Premium Wagyu Feed','2023-12-18','9999-12-31','Y'),
(34,34,'Pakan 34',6,1131531.58,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(35,35,'Pakan 35',9,631871.11,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(36,36,'Pakan 36',6,577744.30,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(37,37,'Pakan 37',10,1484748.21,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(38,38,'Pakan 38',7,1971359.75,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(39,39,'Pakan 39',9,911800.01,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(40,40,'Pakan 40',5,1567276.97,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(41,41,'Pakan 41',10,1720211.73,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(42,42,'Pakan 42',10,1083200.71,'Premium Wagyu Feed','2023-12-18','9999-12-31','Y'),
(43,43,'Pakan 43',8,1200706.41,'Premium Wagyu Feed','2023-12-18','9999-12-31','Y'),
(44,44,'Pakan 44',9,1603053.71,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(45,45,'Pakan 45',6,1090214.23,'Wagyu Grain Mix','2023-12-18','9999-12-31','Y'),
(46,46,'Pakan 46',9,1096142.07,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(47,47,'Pakan 47',7,1169387.95,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(48,48,'Pakan 48',9,1812570.40,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(49,49,'Pakan 49',10,1991235.37,'Wagyu Grain Mix','2023-12-18','9999-12-31','Y'),
(50,50,'Pakan 50',8,675540.88,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(51,51,'Pakan 51',7,1420470.35,'Elite Wagyu Feed Blend','2023-12-18','9999-12-31','Y'),
(52,52,'Pakan 52',8,502529.02,'Grade A Wagyu Hay','2023-12-18','9999-12-31','Y'),
(53,53,'Pakan 53',8,1809368.84,'Wagyu Balanced Diet','2023-12-18','9999-12-31','Y'),
(54,54,'Pakan 54',8,908671.64,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(55,55,'Pakan 55',5,1615507.23,'Wagyu Prime Forage','2023-12-18','9999-12-31','Y'),
(56,56,'Pakan 56',8,516590.53,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(57,57,'Pakan 57',7,1334477.49,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(58,58,'Pakan 58',9,1881957.68,'Grade A Wagyu Hay','2023-12-18','9999-12-31','Y'),
(59,59,'Pakan 59',5,1918821.12,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(60,60,'Pakan 60',8,1717083.18,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(61,61,'Pakan 61',6,1535030.78,'Grade A Wagyu Hay','2023-12-18','9999-12-31','Y'),
(62,62,'Pakan 62',8,1931831.82,'Premium Wagyu Feed','2023-12-18','9999-12-31','Y'),
(63,63,'Pakan 63',7,1280834.15,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(64,64,'Pakan 64',5,847746.51,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(65,65,'Pakan 65',9,1029499.26,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y'),
(66,66,'Pakan 66',6,950790.48,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(67,67,'Pakan 67',10,1231708.37,'Grade A Wagyu Hay','2023-12-18','9999-12-31','Y'),
(68,68,'Pakan 68',10,1961953.31,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(69,69,'Pakan 69',9,1681621.16,'Quality Wagyu Supplement','2023-12-18','9999-12-31','Y'),
(70,70,'Pakan 70',6,877852.22,'Wagyu Nutrition Blend','2023-12-18','9999-12-31','Y'),
(71,71,'Pakan 71',7,1392010.61,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(72,72,'Pakan 72',7,1353620.34,'Premium Wagyu Feed','2023-12-18','9999-12-31','Y'),
(73,73,'Pakan 73',7,538928.95,'Select Wagyu Forage','2023-12-18','9999-12-31','Y'),
(74,74,'Pakan 74',5,1709393.10,'High-Quality Wagyu Pellets','2023-12-18','9999-12-31','Y');

/*Table structure for table `dimensi_pegawai` */

DROP TABLE IF EXISTS `dimensi_pegawai`;

CREATE TABLE `dimensi_pegawai` (
  `row_key_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(64) DEFAULT NULL,
  `nomor_telepon_pegawai` varchar(12) DEFAULT NULL,
  `email_pegawai` varchar(64) DEFAULT NULL,
  `alamat_pegawai` varchar(64) DEFAULT NULL,
  `nama_kabupaten` varchar(64) DEFAULT NULL,
  `nama_provinsi` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_pegawai`),
  UNIQUE KEY `row_key_pegawai` (`row_key_pegawai`,`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_pegawai` */

insert  into `dimensi_pegawai`(`row_key_pegawai`,`id_pegawai`,`nama_pegawai`,`nomor_telepon_pegawai`,`email_pegawai`,`alamat_pegawai`,`nama_kabupaten`,`nama_provinsi`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Andi','081112233445','andi@email.com','Jl. Diponegoro No. 123','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(2,2,'Sinta','082223344556','sinta@email.com','Jl. Surya Kencana No. 456','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(3,3,'Rizal','083334455667','rizal@email.com','Jl. Raden Saleh No. 789','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(4,4,'Eva','084445566778','eva@email.com','Jl. Erlangga No. 101','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(5,5,'Yogi','085556677889','yogi@email.com','Jl. Yos Sudarso No. 202','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(6,6,'Lia','086667788900','lia@email.com','Jl. Lodaya No. 303','Karangasem','Bali','2023-12-17','9999-12-31','Y'),
(7,7,'Arif','087778899011','arif@email.com','Jl. Airlangga No. 404','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(8,8,'Sari','088889900122','sari@email.com','Jl. Sarijadi No. 505','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(9,9,'Rudi','089900011233','rudi@email.com','Jl. Rukun No. 606','Bangli','Bali','2023-12-17','9999-12-31','Y'),
(10,10,'Dina','081001122344','dina@email.com','Jl. Danau Toba No. 707','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(11,11,'Budi','082112233455','budi@email.com','Jl. Bukit Tinggi No. 808','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(12,12,'Maya','083223344566','maya@email.com','Jl. Merapi No. 909','Tabanan','Bali','2023-12-17','9999-12-31','Y'),
(13,13,'Irfan','084334455677','irfan@email.com','Jl. Irigasi No. 1010','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(14,14,'Citra','085445566788','citra@email.com','Jl. Cipaganti No. 1111','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(15,15,'Denny','086556677899','denny@email.com','Jl. Dermaga No. 1212','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(16,16,'Rina','087667788900','rina@email.com','Jl. Riau No. 1313','Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(17,17,'Fahmi','088778899011','fahmi@email.com','Jl. Farida No. 1414','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(18,18,'Lina','089889900122','lina@email.com','Jl. Lintang No. 1515','Bangli','Bali','2023-12-17','9999-12-31','Y'),
(19,19,'Asep','081990001233','asep@email.com','Jl. Anggrek No. 1616','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(20,20,'Susi','082001112344','susi@email.com','Jl. Surya No. 1717','Bangli','Bali','2023-12-17','9999-12-31','Y'),
(21,21,'Yoga','083112223455','yoga@email.com','Jl. Yudha No. 1818','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(22,22,'Nia','084223334566','nia@email.com','Jl. Nusantara No. 1919','Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(23,23,'Rendy','085334445677','rendy@email.com','Jl. Rendang No. 2020','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(24,24,'Rita','086445556788','rita@email.com','Jl. Rindang No. 2121','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(25,25,'Bima','087556667899','bima@email.com','Jl. Bima No. 2222','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(26,26,'Lia','088667778900','lia@email.com','Jl. Liana No. 2323','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(27,27,'Eko','089778889011','eko@email.com','Jl. Ekologi No. 2424','Bangli','Bali','2023-12-17','9999-12-31','Y'),
(28,28,'Nina','081889900122','nina@email.com','Jl. Nirwana No. 2525','Aceh Barat Daya','Aceh','2023-12-17','9999-12-31','Y'),
(29,29,'Rizki','082990001233','rizki@email.com','Jl. Rizkika No. 2626','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(30,30,'Dina','083001112344','dina@email.com','Jl. Dinanti No. 2727','Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(31,31,'Danang','084112223455','danang@email.com','Jl. Danau Toba No. 2828','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y');

/*Table structure for table `dimensi_pelanggan` */

DROP TABLE IF EXISTS `dimensi_pelanggan`;

CREATE TABLE `dimensi_pelanggan` (
  `row_key_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) DEFAULT NULL,
  `nama_pelanggan` varchar(64) DEFAULT NULL,
  `nomor_telepon_pelanggan` varchar(12) DEFAULT NULL,
  `email_pelanggan` varchar(64) DEFAULT NULL,
  `alamat_pelanggan` varchar(64) DEFAULT NULL,
  `nama_kabupaten` varchar(64) DEFAULT NULL,
  `nama_provinsi` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_pelanggan`),
  UNIQUE KEY `row_key_pelanggan` (`row_key_pelanggan`,`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_pelanggan` */

insert  into `dimensi_pelanggan`(`row_key_pelanggan`,`id_pelanggan`,`nama_pelanggan`,`nomor_telepon_pelanggan`,`email_pelanggan`,`alamat_pelanggan`,`nama_kabupaten`,`nama_provinsi`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Ahmad','081234567890','ahmad@email.com','Jl. Merdeka No. 123','Gunungsitoli','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(2,2,'Budi','082345678901','budi@email.com','Jl. Pahlawan No. 45','Tanjung Jabung Barat','Jambi','2023-12-17','9999-12-31','Y'),
(3,3,'Citra','083456789012','citra@email.com','Jl. Raya Cijantung No. 67','Nias','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(4,4,'Diana','084567890123','diana@email.com','Jl. Kemanggisan No. 89','Samosir','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(5,5,'Eka','085678901234','eka@email.com','Jl. Kebayoran Lama No. 12','Subulussalam','Aceh','2023-12-17','9999-12-31','Y'),
(6,6,'Fandi','086789012345','fandi@email.com','Jl. Dago No. 56','Sarolangun','Jambi','2023-12-17','9999-12-31','Y'),
(7,7,'Gita','087890123456','gita@email.com','Jl. Kuningan No. 78','Tapanuli Tengah','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(8,8,'Hadi','088901234567','hadi@email.com','Jl. Surya No. 90','Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(9,9,'Indah','089012345678','indah@email.com','Jl. Sawangan No. 23','Humbang Hasundutan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(10,10,'Joko','089123456789','joko@email.com','Jl. Gading No. 34','Aceh Tenggara','Aceh','2023-12-17','9999-12-31','Y'),
(11,11,'Kartika','089234567890','kartika@email.com','Jl. Meruya No. 56','Solok','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(12,12,'Lutfi','089345678901','lutfi@email.com','Jl. Permata No. 78','Aceh Jaya','Aceh','2023-12-17','9999-12-31','Y'),
(13,13,'Mira','089456789012','mira@email.com','Jl. Pondok Indah No. 90','Labuhan Batu Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(14,14,'Nanda','089567890123','nanda@email.com','Jl. Taman Sari No. 12','Lima Puluh Kota','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(15,15,'Oscar','089678901234','oscar@email.com','Jl. Cempaka No. 34','Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(16,16,'Putri','089789012345','putri@email.com','Jl. Kuta No. 56','Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(17,17,'Qowi','089890123456','qowi@email.com','Jl. Thamrin No. 78','Bener Meriah','Aceh','2023-12-17','9999-12-31','Y'),
(18,18,'Rahma','089901234567','rahma@email.com','Jl. Depok No. 90','Merangin','Jambi','2023-12-17','9999-12-31','Y'),
(19,19,'Surya','089012345678','surya@email.com','Jl. Tebet No. 23','Kampar','Riau','2023-12-17','9999-12-31','Y'),
(20,20,'Tari','089123456789','tari@email.com','Jl. Ciledug No. 34','Simeulue','Aceh','2023-12-17','9999-12-31','Y'),
(21,21,'Umar','089234567890','umar@email.com','Jl. Kalibata No. 56','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(22,22,'Vera','089345678901','vera@email.com','Jl. Tanah Abang No. 78','Simalungun','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(23,23,'Wira','089456789012','wira@email.com','Jl. Pasar Minggu No. 90','Pakpak Bharat','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(24,24,'Xena','089567890123','xena@email.com','Jl. Sunter No. 12','Muaro Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(25,25,'Yoga','089678901234','yoga@email.com','Jl. Kelapa Gading No. 34','Kerinci','Jambi','2023-12-17','9999-12-31','Y'),
(26,26,'Zara','089789012345','zara@email.com','Jl. Fatmawati No. 56','Pasaman Barat','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(27,27,'Adi','089890123456','adi@email.com','Jl. Kedoya No. 78','Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(28,28,'Bunga','089901234567','bunga@email.com','Jl. Cibubur No. 90','Bener Meriah','Aceh','2023-12-17','9999-12-31','Y'),
(29,29,'Cahya','089012345678','cahya@email.com','Jl. Cinere No. 23','Langkat','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(30,30,'Dini','089123456789','dini@email.com','Jl. Kalideres No. 34','Padang Lawas','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(31,31,'Eko','089234567890','eko@email.com','Jl. Cawang No. 56','Aceh Utara','Aceh','2023-12-17','9999-12-31','Y'),
(32,32,'Fina','089345678901','fina@email.com','Jl. Condet No. 78','Nias','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(33,33,'Gilang','089456789012','gilang@email.com','Jl. Gajah Mada No. 90','Pasaman Barat','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(34,34,'Henny','089567890123','henny@email.com','Jl. Hayam Wuruk No. 12','Aceh Selatan','Aceh','2023-12-17','9999-12-31','Y'),
(35,35,'Iqbal','089678901234','iqbal@email.com','Jl. Irian No. 34','Pematang Siantar','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(36,36,'Jasmine','089789012345','jasmine@email.com','Jl. Jatinegara No. 56','Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(37,37,'Koko','089890123456','koko@email.com','Jl. Kuningan No. 78','Tapanuli Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(38,38,'Lina','089901234567','lina@email.com','Jl. Lebak Bulus No. 90','Nagan Raya','Aceh','2023-12-17','9999-12-31','Y'),
(39,39,'Maman','089012345678','maman@email.com','Jl. Mangga Besar No. 23','Nias Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(40,40,'Nina','089123456789','nina@email.com','Jl. Nusa Indah No. 34','Tapanuli Tengah','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(41,41,'Omar','089234567890','omar@email.com','Jl. Otista No. 56','Padang Lawas Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(42,42,'Putu','089345678901','putu@email.com','Jl. Pluit No. 78','Indragiri Hilir','Riau','2023-12-17','9999-12-31','Y'),
(43,43,'Qory','089456789012','qory@email.com','Jl. Qatar No. 90','Asahan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(44,44,'Rini','089567890123','rini@email.com','Jl. Rawa Mangun No. 12','Lhokseumawe','Aceh','2023-12-17','9999-12-31','Y'),
(45,45,'Syaiful','089678901234','syaiful@email.com','Jl. Serpong No. 34','Sabang','Aceh','2023-12-17','9999-12-31','Y'),
(46,46,'Tina','089789012345','tina@email.com','Jl. Tanjung Priok No. 56','Lima Puluh Kota','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(47,47,'Uci','089890123456','uci@email.com','Jl. Utan Kayu No. 78','Labuhan Batu','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(48,48,'Vino','089901234567','vino@email.com','Jl. Veteran No. 90','Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(49,49,'Wulan','089012345678','wulan@email.com','Jl. Wijaya Kusuma No. 23','Rokan Hilir','Riau','2023-12-17','9999-12-31','Y'),
(50,50,'Xavier','089123456789','xavier@email.com','Jl. Xaverius No. 34','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(51,51,'Yani','089234567890','yani@email.com','Jl. Yos Sudarso No. 56','Muaro Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(52,52,'Zainal','089345678901','zainal@email.com','Jl. Zainal Abidin No. 78','Lhokseumawe','Aceh','2023-12-17','9999-12-31','Y'),
(53,53,'Rudi','081234567891','rudi@email.com','Jl. Sudirman No. 456','Sibolga','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(54,54,'Siti','082345678912','siti@email.com','Jl. Gatot Subroto No. 789','Muara Enim','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(55,55,'Irfan','083456789123','irfan@email.com','Jl. Asia Afrika No. 101','Aceh Timur','Aceh','2023-12-17','9999-12-31','Y'),
(56,56,'Dewi','084567891234','dewi@email.com','Jl. Braga No. 202','Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(57,57,'Arif','085678912345','arif@email.com','Jl. Pasteur No. 303','Nias Barat','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(58,58,'Lina','086789123456','lina@email.com','Jl. Sukajadi No. 404','Batu Bara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(59,59,'Bambang','087890234567','bambang@email.com','Jl. Setiabudi No. 505','Aceh Timur','Aceh','2023-12-17','9999-12-31','Y'),
(60,60,'Sari','088901345678','sari@email.com','Jl. Dago Pakar No. 606','Ogan Komering Ulu','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(61,61,'Fajar','089012456789','fajar@email.com','Jl. Lembang No. 707','Aceh Selatan','Aceh','2023-12-17','9999-12-31','Y'),
(62,62,'Dina','089123567890','dina@email.com','Jl. Juanda No. 808','Rokan Hulu','Riau','2023-12-17','9999-12-31','Y'),
(63,63,'Andi','089234678901','andi@email.com','Jl. Cihampelas No. 909','Solok','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(64,64,'Ratna','089345789012','ratna@email.com','Jl. Tubagus Ismail No. 1010','Aceh Singkil','Aceh','2023-12-17','9999-12-31','Y'),
(65,65,'Eko','089456890123','eko@email.com','Jl. Pajajaran No. 1111','Samosir','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(66,66,'Yuli','089567901234','yuli@email.com','Jl. Dipatiukur No. 1212','Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(67,67,'Hendra','089678012345','hendra@email.com','Jl. Ganeca No. 1313','Simalungun','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(68,68,'Nina','089789123456','nina@email.com','Jl. Ir. H. Juanda No. 1414','Karangasem','Bali','2023-12-17','9999-12-31','Y'),
(69,69,'Ferry','089890234567','ferry@email.com','Jl. Kopo No. 1515','Tebing Tinggi','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(70,70,'Desi','089901345678','desi@email.com','Jl. Cipaganti No. 1616','Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(71,71,'Asep','089012456789','asep@email.com','Jl. Surapati No. 1717','Nias Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(72,72,'Rina','089123567890','rina@email.com','Jl. Lengkong No. 1818','Indragiri Hulu','Riau','2023-12-17','9999-12-31','Y'),
(73,73,'Budi','089234678901','budi@email.com','Jl. Trunojoyo No. 1919','Medan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(74,74,'Ani','089345789012','ani@email.com','Jl. Citarum No. 2020','Muaro Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(75,75,'Dodi','089456890123','dodi@email.com','Jl. Tamansari No. 2121','Aceh Besar','Aceh','2023-12-17','9999-12-31','Y'),
(76,76,'Tuti','089567901234','tuti@email.com','Jl. Ir. Djuanda No. 2222','Bungo','Jambi','2023-12-17','9999-12-31','Y'),
(77,77,'Dicky','089678012345','dicky@email.com','Jl. Merdeka No. 2323','Tebo','Jambi','2023-12-17','9999-12-31','Y'),
(78,78,'Cici','089789123456','cici@email.com','Jl. Asia No. 2424','Karangasem','Bali','2023-12-17','9999-12-31','Y'),
(79,79,'Joko','089890234567','joko@email.com','Jl. Sunda No. 2525','Pematang Siantar','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(80,80,'Rina','089901345678','rina@email.com','Jl. Java No. 2626','Medan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(81,81,'Iwan','089012456789','iwan@email.com','Jl. Bali No. 2727','Dharmasraya','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(82,82,'Eva','089123567890','eva@email.com','Jl. Kalimantan No. 2828','Indragiri Hilir','Riau','2023-12-17','9999-12-31','Y'),
(83,83,'Yanto','089234678901','yanto@email.com','Jl. Sulawesi No. 2929','Muara Enim','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(84,84,'Vivi','089345789012','vivi@email.com','Jl. Maluku No. 3030','Padang Lawas Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(85,85,'Rizki','089456890123','rizki@email.com','Jl. Papua No. 3131','Kepulauan Mentawai','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(86,86,'Nadia','089567901234','nadia@email.com','Jl. Timor No. 3232','Padang','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(87,87,'Iqbal','089678012345','iqbal@email.com','Jl. Nias No. 3333','Humbang Hasundutan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(88,88,'Cindy','089789123456','cindy@email.com','Jl. Sumatra No. 3434','Merangin','Jambi','2023-12-17','9999-12-31','Y'),
(89,89,'Doni','089890234567','doni@email.com','Jl. Flores No. 3535','Nagan Raya','Aceh','2023-12-17','9999-12-31','Y'),
(90,90,'Lulu','089901345678','lulu@email.com','Jl. Rote No. 3636','Dharmasraya','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(91,91,'Rendy','089012456789','rendy@email.com','Jl. Alor No. 3737','Deli Serdang','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(92,92,'Yuni','089123567890','yuni@email.com','Jl. Seram No. 3838','Muaro Jambi','Jambi','2023-12-17','9999-12-31','Y'),
(93,93,'Jodi','089234678901','jodi@email.com','Jl. Halmahera No. 3939','Deli Serdang','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(94,94,'Maya','089345789012','maya@email.com','Jl. Irian No. 4040','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(95,95,'Yoga','089456890123','yoga@email.com','Jl. Biak No. 4141','Karo','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(96,96,'Rina','089567901234','rina@email.com','Jl. Aru No. 4242','Lima Puluh Kota','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(97,97,'Ilham','089678012345','ilham@email.com','Jl. Tidore No. 4343','Tabanan','Bali','2023-12-17','9999-12-31','Y'),
(98,98,'Dina','089789123456','dina@email.com','Jl. Selayar No. 4444','Mandailing Natal','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(99,99,'Ryan','089890234567','ryan@email.com','Jl. Kayu Manis No. 4545','Tanjung Jabung Timur','Jambi','2023-12-17','9999-12-31','Y'),
(100,100,'Lia','089901345678','lia@email.com','Jl. Palembang No. 4646','Sabang','Aceh','2023-12-17','9999-12-31','Y'),
(101,101,'Rian','089012456789','rian@email.com','Jl. Lampung No. 4747','Pariaman','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(102,102,'Fina','089123567890','fina@email.com','Jl. Bengkulu No. 4848','Nias Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(103,103,'Galih','089234678901','galih@email.com','Jl. Gorontalo No. 4949','Labuhan Batu Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(104,104,'Dini','089345789012','dini@email.com','Jl. Kendari No. 5050','Sibolga','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(105,105,'Rina','081112223344','rina@email.com','Jl. Riau No. 123','Padang Lawas Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(106,106,'Farhan','082223334455','farhan@email.com','Jl. Farid No. 456','Merangin','Jambi','2023-12-17','9999-12-31','Y'),
(107,107,'Nadia','083334445566','nadia@email.com','Jl. Nusantara No. 789','Merangin','Jambi','2023-12-17','9999-12-31','Y'),
(108,108,'Dika','084445556677','dika@email.com','Jl. Diponegoro No. 101','Solok Selatan','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(109,109,'Elsa','085556667788','elsa@email.com','Jl. Elang No. 202','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(110,110,'Budi','086667778899','budi@email.com','Jl. Budiman No. 303','Muara Enim','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(111,111,'Santi','087778889900','santi@email.com','Jl. Santoso No. 404','Pasaman','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(112,112,'Hadi','088889900011','hadi@email.com','Jl. Hadirah No. 505','Samosir','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(113,113,'Lina','089900011122','lina@email.com','Jl. Linawati No. 606','Tebing Tinggi','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(114,114,'Dino','081001122233','dino@email.com','Jl. Dinoyo No. 707','Langkat','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(115,115,'Rita','082112233344','rita@email.com','Jl. Riau No. 808','Subulussalam','Aceh','2023-12-17','9999-12-31','Y'),
(116,116,'Yoga','083223344455','yoga@email.com','Jl. Yogya No. 909','Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(117,117,'Eva','084334455566','eva@email.com','Jl. Evakuasi No. 1010','Lhokseumawe','Aceh','2023-12-17','9999-12-31','Y'),
(118,118,'Rian','085445566677','rian@email.com','Jl. Riang No. 1111','Nias Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(119,119,'Siska','086556677788','siska@email.com','Jl. Siskamana No. 1212','Pasaman Barat','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(120,120,'Fahmi','087667788899','fahmi@email.com','Jl. Fajar No. 1313','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(121,121,'Ayu','088778899900','ayu@email.com','Jl. Ayuning No. 1414','Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(122,122,'Guntur','089889900011','guntur@email.com','Jl. Gunung No. 1515','Aceh Barat Daya','Aceh','2023-12-17','9999-12-31','Y'),
(123,123,'Ratna','081990001122','ratna@email.com','Jl. Ratuku No. 1616','Labuhan Batu','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(124,124,'Irfan','082001112233','irfan@email.com','Jl. Irfandi No. 1717','Lima Puluh Kota','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(125,125,'Citra','083112223344','citra@email.com','Jl. Citraganda No. 1818','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(126,126,'Andi','084223334455','andi@email.com','Jl. Andika No. 1919','Simeulue','Aceh','2023-12-17','9999-12-31','Y'),
(127,127,'Sari','085334445566','sari@email.com','Jl. Sariku No. 2020','Subulussalam','Aceh','2023-12-17','9999-12-31','Y'),
(128,128,'Joko','086445556677','joko@email.com','Jl. Jokowi No. 2121','Agam','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(129,129,'Lia','087556667788','lia@email.com','Jl. Liar No. 2222','Aceh Tenggara','Aceh','2023-12-17','9999-12-31','Y'),
(130,130,'Rudi','088667778899','rudi@email.com','Jl. Rudiana No. 2323','Bangli','Bali','2023-12-17','9999-12-31','Y'),
(131,131,'Maya','089778889900','maya@email.com','Jl. Mayang No. 2424','Simalungun','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(132,132,'Eko','081889900011','eko@email.com','Jl. Ekonomi No. 2525','Solok','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(133,133,'Vina','082990001122','vina@email.com','Jl. Vinata No. 2626','Tebo','Jambi','2023-12-17','9999-12-31','Y'),
(134,134,'Rifqi','083001112233','rifqi@email.com','Jl. Rifqiku No. 2727','Nias Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(135,135,'Wulan','084112223344','wulan@email.com','Jl. Wulandari No. 2828','Tebing Tinggi','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(136,136,'Danang','085223334455','danang@email.com','Jl. Danau No. 2929','Tanjung Balai','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(137,137,'Sinta','086334445566','sinta@email.com','Jl. Sintaku No. 3030','Musi Banyuasin','Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(138,138,'Yogi','087445556677','yogi@email.com','Jl. Yogya No. 3131','Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(139,139,'Mira','088556667788','mira@email.com','Jl. Miranti No. 3232','Bireuen','Aceh','2023-12-17','9999-12-31','Y'),
(140,140,'Ari','089667778899','ari@email.com','Jl. Aritana No. 3333','Deli Serdang','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(141,141,'Dewa','081778889900','dewa@email.com','Jl. Dewangga No. 3434','Aceh Besar','Aceh','2023-12-17','9999-12-31','Y'),
(142,142,'Rina','082889900011','rina@email.com','Jl. Rinau No. 3535','Padang Lawas','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(143,143,'Bima','083990001122','bima@email.com','Jl. Bimantara No. 3636','Aceh Selatan','Aceh','2023-12-17','9999-12-31','Y'),
(144,144,'Laras','084001112233','laras@email.com','Jl. Larasati No. 3737','Aceh Tengah','Aceh','2023-12-17','9999-12-31','Y'),
(145,145,'Yanuar','085112223344','yanuar@email.com','Jl. Yanuar No. 3838','Labuhan Batu Utara','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(146,146,'Ella','086223334455','ella@email.com','Jl. Ellangga No. 3939','Tapanuli Tengah','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(147,147,'Firman','087334445566','firman@email.com','Jl. Firmananda No. 4040','Padang Panjang','Sumatera Barat','2023-12-17','9999-12-31','Y'),
(148,148,'Dinda','088445556677','dinda@email.com','Jl. Dindaku No. 4141','Simalungun','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(149,149,'Rizal','089556667788','rizal@email.com','Jl. Rizalu No. 4242','Indragiri Hulu','Riau','2023-12-17','9999-12-31','Y'),
(150,150,'Citra','081667778899','citra@email.com','Jl. Citra No. 4343','Aceh Utara','Aceh','2023-12-17','9999-12-31','Y'),
(151,151,'Gita','082778889900','gita@email.com','Jl. Gitaku No. 4444','Tebing Tinggi','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(152,152,'Yudha','083889900011','yudha@email.com','Jl. Yudhaku No. 4545','Nias Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(153,153,'Rima','084990001122','rima@email.com','Jl. Rimaku No. 4646','Samosir','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(154,154,'Adi','085001112233','adi@email.com','Jl. Adiku No. 4747','Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(155,155,'Eka','086112223344','eka@email.com','Jl. Ekaku No. 4848','Tapanuli Selatan','Sumatera Utara','2023-12-17','9999-12-31','Y'),
(156,156,'Budi','087223334455','budi@email.com','Jl. Budiku No. 4949','Aceh Singkil','Aceh','2023-12-17','9999-12-31','Y'),
(157,157,'Suci','088334445566','suci@email.com','Jl. Suciku No. 5050','Lahat','Sumatera Selatan','2023-12-17','9999-12-31','Y');

/*Table structure for table `dimensi_pemasok_pakan` */

DROP TABLE IF EXISTS `dimensi_pemasok_pakan`;

CREATE TABLE `dimensi_pemasok_pakan` (
  `row_key_pemasok_pakan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemasok_pakan` int(11) DEFAULT NULL,
  `nama_pemasok_pakan` varchar(64) DEFAULT NULL,
  `nomor_telepon_pemasok_pakan` varchar(12) DEFAULT NULL,
  `email_pemasok_pakan` varchar(64) DEFAULT NULL,
  `alamat_pemasok_pakan` varchar(64) DEFAULT NULL,
  `nama_kabupaten` varchar(64) DEFAULT NULL,
  `nama_provinsi` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_pemasok_pakan`),
  UNIQUE KEY `row_key_pemasok_pakan` (`row_key_pemasok_pakan`,`id_pemasok_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_pemasok_pakan` */

insert  into `dimensi_pemasok_pakan`(`row_key_pemasok_pakan`,`id_pemasok_pakan`,`nama_pemasok_pakan`,`nomor_telepon_pemasok_pakan`,`email_pemasok_pakan`,`alamat_pemasok_pakan`,`nama_kabupaten`,`nama_provinsi`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Pakanco','081234567890','info@pakanco.com','Jl. Pakan Sejahtera No. 123','Aceh Besar','Aceh','2023-12-17','9999-12-31','Y'),
(2,2,'Nutrifeed','081234567891','sales@nutrifeed.com','Jl. Nutrisi Tepat No. 456','Tabanan','Bali','2023-12-17','9999-12-31','Y'),
(3,3,'Primefeed','081234567892','primefeed@gmail.com','Jl. Utama Ransum No. 789','Karangasem','Bali','2023-12-17','9999-12-31','Y'),
(4,4,'Agronourish','081234567893','info@agronourish.co.id','Jl. Agronomi No. 234','Karangasem','Bali','2023-12-17','9999-12-31','Y'),
(5,5,'Feedmaster','081234567894','feedmaster@info.com','Jl. Pangan Lengkap No. 567','Aceh Jaya','Aceh','2023-12-17','9999-12-31','Y'),
(6,6,'Vitagreen','081234567895','vitagreen@company.net','Jl. Vitalitas No. 890','Aceh Tamiang','Aceh','2023-12-17','9999-12-31','Y'),
(7,7,'Harmonyfeeds','081234567896','harmonyfeeds@gmail.com','Jl. Harmoni No. 123','Aceh Tamiang','Aceh','2023-12-17','9999-12-31','Y'),
(8,8,'Bionutri','081234567897','info@bionutri.id','Jl. Bioteknologi No. 456','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(9,9,'Agrosupplies','081234567898','agrosupplies@company.net','Jl. Agrikultur No. 789','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(10,10,'Ecoration','081234567899','ecoration.sales@gmail.com','Jl. Ekologi No. 234','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(11,11,'Greenharvest','081234567810','info@greenharvest.co.id','Jl. Panen Hijau No. 567','Tabanan','Bali','2023-12-17','9999-12-31','Y'),
(12,12,'Organicfeeds','081234567811','organicfeeds@info.com','Jl. Organik No. 890','Tabanan','Bali','2023-12-17','9999-12-31','Y'),
(13,13,'Purenutrition','081234567812','sales@purenutrition.com','Jl. Murni No. 121','Aceh Tengah','Aceh','2023-12-17','9999-12-31','Y'),
(14,14,'Naturefeed','081234567813','naturefeed@gmail.com','Jl. Alam No. 342','Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(15,15,'Healthyharvest','081234567814','info@healthyharvest.co.id','Jl. Sehat No. 321','Gayo Lues','Aceh','2023-12-17','9999-12-31','Y'),
(16,16,'Vitalrations','081234567815','vitalrations@company.net','Jl. Vitalitas No. 876','Badung','Bali','2023-12-17','9999-12-31','Y'),
(17,17,'Agrovita','081234567816','agrovita@gmail.com','Jl. Agronomi No. 543','Aceh Barat Daya','Aceh','2023-12-17','9999-12-31','Y'),
(18,18,'Ecoblend','081234567817','ecoblend@info.com','Jl. Ekologi No. 210','Bener Meriah','Aceh','2023-12-17','9999-12-31','Y'),
(19,19,'Profeed','081234567818','profeed.sales@gmail.com','Jl. Profesional No. 109','Bireuen','Aceh','2023-12-17','9999-12-31','Y'),
(20,20,'Premiumfeeds','081234567819','info@premiumfeeds.co.id','Jl. Premium No. 876','Aceh Utara','Aceh','2023-12-17','9999-12-31','Y'),
(21,21,'Biorations','081234567820','biorations@gmail.com','Jl. Bioteknologi No. 543','Aceh Barat Daya','Aceh','2023-12-17','9999-12-31','Y'),
(22,22,'Harvesthealth','081234567821','info@harvesthealth.com','Jl. Panen Sehat No. 210','Aceh Singkil','Aceh','2023-12-17','9999-12-31','Y'),
(23,23,'Organicharvest','081234567822','organicharvest@info.com','Jl. Organik No. 109','Aceh Tengah','Aceh','2023-12-17','9999-12-31','Y'),
(24,24,'Greenvitality','081234567823','greenvitality@company.net','Jl. Hijau Vital No. 876','Aceh Besar','Aceh','2023-12-17','9999-12-31','Y'),
(25,25,'Agrobalance','081234567824','agrobalance@gmail.com','Jl. Agronomi No. 543','Aceh Barat','Aceh','2023-12-17','9999-12-31','Y'),
(26,26,'Natureblend','081234567825','natureblend@info.com','Jl. Alam No. 210','Aceh Barat Daya','Aceh','2023-12-17','9999-12-31','Y'),
(27,27,'Vitarations','081234567826','vitarations@gmail.com','Jl. Vitalitas No. 109','Langsa','Aceh','2023-12-17','9999-12-31','Y'),
(28,28,'Ecoharvest','081234567827','ecoharvest@company.net','Jl. Ekologi No. 876','Aceh Barat Daya','Aceh','2023-12-17','9999-12-31','Y'),
(29,29,'Greenbalance','081234567828','greenbalance@gmail.com','Jl. Hijau Seimbang No. 543','Gianyar','Bali','2023-12-17','9999-12-31','Y'),
(30,30,'Pureharvest','081234567829','pureharvest@info.com','Jl. Murni No. 210','Aceh Selatan','Aceh','2023-12-17','9999-12-31','Y'),
(31,31,'Harmonyrations','081234567830','harmony.rations@gmail.com','Jl. Harmoni No. 109','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(32,32,'Biobalance','081234567831','biobalance@company.net','Jl. Bioteknologi No. 876','Klungkung','Bali','2023-12-17','9999-12-31','Y'),
(33,33,'Agroharvest','081234567832','agroharvest@gmail.com','Jl. Agronomi No. 543','Aceh Utara','Aceh','2023-12-17','9999-12-31','Y'),
(34,34,'Naturehealth','081234567833','nature.health@info.com','Jl. Alam No. 210','Buleleng','Bali','2023-12-17','9999-12-31','Y'),
(35,35,'Ecovita','081234567834','ecovita@gmail.com','Jl. Ekologi No. 109','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(36,36,'Premiumbalance','081234567835','premium.balance@company.net','Jl. Premium No. 876','Aceh Tengah','Aceh','2023-12-17','9999-12-31','Y'),
(37,37,'Vitablend','081234567836','vitablend@gmail.com','Jl. Vitalitas No. 543','Aceh Tamiang','Aceh','2023-12-17','9999-12-31','Y'),
(38,38,'Greenhealth','081234567837','green.health@info.com','Jl. Hijau No. 210','Lhokseumawe','Aceh','2023-12-17','9999-12-31','Y'),
(39,39,'Harmonyhealth','081234567838','harmony.health@gmail.com','Jl. Harmoni No. 109','Jembrana','Bali','2023-12-17','9999-12-31','Y'),
(40,40,'Purevitality','081234567839','pure.vitality@company.net','Jl. Murni No. 876','Lhokseumawe','Aceh','2023-12-17','9999-12-31','Y'),
(41,41,'Natureharvest','081234567840','nature.harvest@gmail.com','Jl. Alam No. 543','Jembrana','Bali','2023-12-17','9999-12-31','Y');

/*Table structure for table `dimensi_produk` */

DROP TABLE IF EXISTS `dimensi_produk`;

CREATE TABLE `dimensi_produk` (
  `row_key_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk_daging` int(11) DEFAULT NULL,
  `id_sapi` int(11) DEFAULT NULL,
  `nama_produk` varchar(64) DEFAULT NULL,
  `grade_produk` int(10) DEFAULT NULL,
  `harga_produk` decimal(10,2) DEFAULT NULL,
  `nama_ras_sapi` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_produk`),
  UNIQUE KEY `row_key_produk` (`row_key_produk`,`id_produk_daging`,`id_sapi`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_produk` */

insert  into `dimensi_produk`(`row_key_produk`,`id_produk_daging`,`id_sapi`,`nama_produk`,`grade_produk`,`harga_produk`,`nama_ras_sapi`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,1,'Wagyu Ribeye',5,200000.00,'Black Wagyu','2023-12-18','9999-12-31','Y'),
(2,2,2,'Wagyu Sirloin',4,180000.00,'Red Wagyu','2023-12-18','9999-12-31','Y'),
(3,3,3,'Wagyu Tenderloin',5,220000.00,'Black Wagyu','2023-12-18','9999-12-31','Y'),
(4,4,4,'Wagyu Striploin',4,190000.00,'Fullblood Wagyu','2023-12-18','9999-12-31','Y'),
(5,5,5,'Wagyu Brisket',3,150000.00,'Red Wagyu','2023-12-18','9999-12-31','Y'),
(6,6,3,'Wagyu Chuck',3,160000.00,'Black Wagyu','2023-12-18','9999-12-31','Y'),
(7,7,6,'Wagyu Chuck',3,160000.00,'Fullblood Wagyu','2023-12-18','9999-12-31','Y'),
(8,8,7,'Wagyu Top Round',4,175000.00,'Black Wagyu','2023-12-18','9999-12-31','Y'),
(9,9,2,'Wagyu Bottom Round',3,155000.00,'Red Wagyu','2023-12-18','9999-12-31','Y'),
(10,10,4,'Wagyu Short Plate',4,185000.00,'Fullblood Wagyu','2023-12-18','9999-12-31','Y'),
(11,11,9,'Wagyu Flank',3,170000.00,'Fullblood Wagyu','2023-12-18','9999-12-31','Y'),
(12,12,1,'Wagyu Hanger Steak',4,190000.00,'Black Wagyu','2023-12-18','9999-12-31','Y'),
(13,13,3,'Wagyu Skirt Steak',3,175000.00,'Black Wagyu','2023-12-18','9999-12-31','Y'),
(14,14,5,'Wagyu Bavette',4,200000.00,'Red Wagyu','2023-12-18','9999-12-31','Y'),
(15,15,8,'Wagyu Tri-Tip',3,180000.00,'Red Wagyu','2023-12-18','9999-12-31','Y'),
(16,16,9,'Wagyu Coulotte',4,195000.00,'Fullblood Wagyu','2023-12-18','9999-12-31','Y'),
(17,17,2,'Wagyu Picanha',5,210000.00,'Red Wagyu','2023-12-18','9999-12-31','Y');

/*Table structure for table `dimensi_provinsi` */

DROP TABLE IF EXISTS `dimensi_provinsi`;

CREATE TABLE `dimensi_provinsi` (
  `row_key_provinsi` int(11) NOT NULL AUTO_INCREMENT,
  `id_provinsi` int(11) DEFAULT NULL,
  `nama_provinsi` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_provinsi`),
  UNIQUE KEY `row_key_provinsi` (`row_key_provinsi`,`id_provinsi`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_provinsi` */

insert  into `dimensi_provinsi`(`row_key_provinsi`,`id_provinsi`,`nama_provinsi`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Aceh','2023-12-17','9999-12-31','Y'),
(2,2,'Sumatera Utara','2023-12-17','9999-12-31','Y'),
(3,3,'Sumatera Barat','2023-12-17','9999-12-31','Y'),
(4,4,'Riau','2023-12-17','9999-12-31','Y'),
(5,5,'Jambi','2023-12-17','9999-12-31','Y'),
(6,6,'Sumatera Selatan','2023-12-17','9999-12-31','Y'),
(7,7,'Bengkulu','2023-12-17','9999-12-31','Y'),
(8,8,'Lampung','2023-12-17','9999-12-31','Y'),
(9,9,'Bangka Belitung','2023-12-17','9999-12-31','Y'),
(10,10,'Kepulauan Riau','2023-12-17','9999-12-31','Y'),
(11,11,'DKI Jakarta','2023-12-17','9999-12-31','Y'),
(12,12,'Jawa Barat','2023-12-17','9999-12-31','Y'),
(13,13,'Jawa Tengah','2023-12-17','9999-12-31','Y'),
(14,14,'Jawa Timur','2023-12-17','9999-12-31','Y'),
(15,15,'Banten','2023-12-17','9999-12-31','Y'),
(16,16,'Bali','2023-12-17','9999-12-31','Y'),
(17,17,'Nusa Tenggara Barat','2023-12-17','9999-12-31','Y'),
(18,18,'Nusa Tenggara Timur','2023-12-17','9999-12-31','Y'),
(19,19,'Kalimantan Barat','2023-12-17','9999-12-31','Y'),
(20,20,'Kalimantan Tengah','2023-12-17','9999-12-31','Y'),
(21,21,'Kalimantan Selatan','2023-12-17','9999-12-31','Y'),
(22,22,'Kalimantan Timur','2023-12-17','9999-12-31','Y'),
(23,23,'Kalimantan Utara','2023-12-17','9999-12-31','Y'),
(24,24,'Sulawesi Utara','2023-12-17','9999-12-31','Y'),
(25,25,'Sulawesi Tengah','2023-12-17','9999-12-31','Y'),
(26,26,'Sulawesi Selatan','2023-12-17','9999-12-31','Y'),
(27,27,'Sulawesi Tenggara','2023-12-17','9999-12-31','Y'),
(28,28,'Gorontalo','2023-12-17','9999-12-31','Y'),
(29,29,'Maluku','2023-12-17','9999-12-31','Y'),
(30,30,'Maluku Utara','2023-12-17','9999-12-31','Y'),
(31,31,'Papua','2023-12-17','9999-12-31','Y'),
(32,32,'Papua Barat','2023-12-17','9999-12-31','Y');

/*Table structure for table `dimensi_sapi` */

DROP TABLE IF EXISTS `dimensi_sapi`;

CREATE TABLE `dimensi_sapi` (
  `row_key_sapi` int(11) NOT NULL AUTO_INCREMENT,
  `id_sapi_wagyu` int(11) DEFAULT NULL,
  `nama_sapi_wagyu` varchar(64) DEFAULT NULL,
  `nama_ras_sapi` varchar(64) DEFAULT NULL,
  `umur_sapi` decimal(10,2) DEFAULT NULL,
  `berat_sapi` decimal(10,2) DEFAULT NULL,
  `riwayat_kesehatan_sapi` varchar(255) DEFAULT NULL,
  `data_genetik_sapi` varchar(255) DEFAULT NULL,
  `marbling_daging` varchar(64) DEFAULT NULL,
  `warna_daging` varchar(64) DEFAULT NULL,
  `tekstur_daging` varchar(64) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_sapi`),
  UNIQUE KEY `row_key_sapi` (`row_key_sapi`,`id_sapi_wagyu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_sapi` */

insert  into `dimensi_sapi`(`row_key_sapi`,`id_sapi_wagyu`,`nama_sapi_wagyu`,`nama_ras_sapi`,`umur_sapi`,`berat_sapi`,`riwayat_kesehatan_sapi`,`data_genetik_sapi`,`marbling_daging`,`warna_daging`,`tekstur_daging`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Wagyu001','Black Wagyu',2.50,300.50,'Sehat, vaksin lengkap','DNA123456','High','Merah','Halus','2023-12-18','9999-12-31','Y'),
(2,2,'Wagyu002','Red Wagyu',3.20,400.75,'Beberapa masalah pencernaan','DNA654321','Medium','Merah Muda','Halus','2023-12-18','9999-12-31','Y'),
(3,3,'Wagyu003','Black Wagyu',2.80,350.25,'Sering berjemur','DNA789012','High','Merah','Halus','2023-12-18','9999-12-31','Y'),
(4,4,'Wagyu004','Fullblood Wagyu',2.00,280.00,'Vaksin rutin','DNA345678','Medium','Merah Muda','Halus','2023-12-18','9999-12-31','Y'),
(5,5,'Wagyu005','Red Wagyu',3.50,420.80,'Sehat, rajin berolahraga','DNA901234','Low','Merah Tua','Berlemak','2023-12-18','9999-12-31','Y'),
(6,6,'Wagyu006','Fullblood Wagyu',2.30,320.60,'Masalah kulit ringan','DNA567890','Low','Merah Tua','Berlemak','2023-12-18','9999-12-31','Y'),
(7,7,'Wagyu007','Black Wagyu',2.70,380.40,'Vaksin kurang lengkap','DNA123890','Medium','Merah Muda','Halus','2023-12-18','9999-12-31','Y'),
(8,8,'Wagyu008','Red Wagyu',3.80,450.00,'Sehat, aktif bergerak','DNA678901','Low','Merah Tua','Halus','2023-12-18','9999-12-31','Y'),
(9,9,'Wagyu009','Fullblood Wagyu',2.20,310.20,'Sering batuk','DNA234567','Low','Merah Tua','Berlemak','2023-12-18','9999-12-31','Y');

/*Table structure for table `dimensi_waktu` */

DROP TABLE IF EXISTS `dimensi_waktu`;

CREATE TABLE `dimensi_waktu` (
  `row_key_waktu` int(11) NOT NULL AUTO_INCREMENT,
  `id_waktu` int(11) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `kuartal` enum('1','2','3','4') DEFAULT NULL,
  `bulan` enum('Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember') DEFAULT NULL,
  `hari` enum('Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_waktu`),
  UNIQUE KEY `row_key_waktu` (`row_key_waktu`,`id_waktu`),
  UNIQUE KEY `tahun` (`tahun`,`kuartal`,`bulan`,`hari`,`tanggal`)
) ENGINE=InnoDB AUTO_INCREMENT=6143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_waktu` */

insert  into `dimensi_waktu`(`row_key_waktu`,`id_waktu`,`tahun`,`kuartal`,`bulan`,`hari`,`tanggal`,`current_flag`) values 
(4096,1,2023,'1','Januari','Minggu','2023-01-01','Y'),
(4097,2,2023,'1','Januari','Senin','2023-01-02','Y'),
(4098,3,2023,'1','Januari','Selasa','2023-01-03','Y'),
(4099,4,2023,'1','Januari','Rabu','2023-01-04','Y'),
(4100,5,2023,'1','Januari','Kamis','2023-01-05','Y'),
(4101,6,2023,'1','Januari','Jumat','2023-01-06','Y'),
(4102,7,2023,'1','Januari','Sabtu','2023-01-07','Y'),
(4103,8,2023,'1','Januari','Minggu','2023-01-08','Y'),
(4104,9,2023,'1','Januari','Senin','2023-01-09','Y'),
(4105,10,2023,'1','Januari','Selasa','2023-01-10','Y'),
(4106,11,2023,'1','Januari','Rabu','2023-01-11','Y'),
(4107,12,2023,'1','Januari','Kamis','2023-01-12','Y'),
(4108,13,2023,'1','Januari','Jumat','2023-01-13','Y'),
(4109,14,2023,'1','Januari','Sabtu','2023-01-14','Y'),
(4110,15,2023,'1','Januari','Minggu','2023-01-15','Y'),
(4111,16,2023,'1','Januari','Senin','2023-01-16','Y'),
(4112,17,2023,'1','Januari','Selasa','2023-01-17','Y'),
(4113,18,2023,'1','Januari','Rabu','2023-01-18','Y'),
(4114,19,2023,'1','Januari','Kamis','2023-01-19','Y'),
(4115,20,2023,'1','Januari','Jumat','2023-01-20','Y'),
(4116,21,2023,'1','Januari','Sabtu','2023-01-21','Y'),
(4117,22,2023,'1','Januari','Minggu','2023-01-22','Y'),
(4118,23,2023,'1','Januari','Senin','2023-01-23','Y'),
(4119,24,2023,'1','Januari','Selasa','2023-01-24','Y'),
(4120,25,2023,'1','Januari','Rabu','2023-01-25','Y'),
(4121,26,2023,'1','Januari','Kamis','2023-01-26','Y'),
(4122,27,2023,'1','Januari','Jumat','2023-01-27','Y'),
(4123,28,2023,'1','Januari','Sabtu','2023-01-28','Y'),
(4124,29,2023,'1','Januari','Minggu','2023-01-29','Y'),
(4125,30,2023,'1','Januari','Senin','2023-01-30','Y'),
(4126,31,2023,'1','Januari','Selasa','2023-01-31','Y'),
(4127,32,2023,'1','Februari','Rabu','2023-02-01','Y'),
(4128,33,2023,'1','Februari','Kamis','2023-02-02','Y'),
(4129,34,2023,'1','Februari','Jumat','2023-02-03','Y'),
(4130,35,2023,'1','Februari','Sabtu','2023-02-04','Y'),
(4131,36,2023,'1','Februari','Minggu','2023-02-05','Y'),
(4132,37,2023,'1','Februari','Senin','2023-02-06','Y'),
(4133,38,2023,'1','Februari','Selasa','2023-02-07','Y'),
(4134,39,2023,'1','Februari','Rabu','2023-02-08','Y'),
(4135,40,2023,'1','Februari','Kamis','2023-02-09','Y'),
(4136,41,2023,'1','Februari','Jumat','2023-02-10','Y'),
(4137,42,2023,'1','Februari','Sabtu','2023-02-11','Y'),
(4138,43,2023,'1','Februari','Minggu','2023-02-12','Y'),
(4139,44,2023,'1','Februari','Senin','2023-02-13','Y'),
(4140,45,2023,'1','Februari','Selasa','2023-02-14','Y'),
(4141,46,2023,'1','Februari','Rabu','2023-02-15','Y'),
(4142,47,2023,'1','Februari','Kamis','2023-02-16','Y'),
(4143,48,2023,'1','Februari','Jumat','2023-02-17','Y'),
(4144,49,2023,'1','Februari','Sabtu','2023-02-18','Y'),
(4145,50,2023,'1','Februari','Minggu','2023-02-19','Y'),
(4146,51,2023,'1','Februari','Senin','2023-02-20','Y'),
(4147,52,2023,'1','Februari','Selasa','2023-02-21','Y'),
(4148,53,2023,'1','Februari','Rabu','2023-02-22','Y'),
(4149,54,2023,'1','Februari','Kamis','2023-02-23','Y'),
(4150,55,2023,'1','Februari','Jumat','2023-02-24','Y'),
(4151,56,2023,'1','Februari','Sabtu','2023-02-25','Y'),
(4152,57,2023,'1','Februari','Minggu','2023-02-26','Y'),
(4153,58,2023,'1','Februari','Senin','2023-02-27','Y'),
(4154,59,2023,'1','Februari','Selasa','2023-02-28','Y'),
(4155,60,2023,'1','Maret','Rabu','2023-03-01','Y'),
(4156,61,2023,'1','Maret','Kamis','2023-03-02','Y'),
(4157,62,2023,'1','Maret','Jumat','2023-03-03','Y'),
(4158,63,2023,'1','Maret','Sabtu','2023-03-04','Y'),
(4159,64,2023,'1','Maret','Minggu','2023-03-05','Y'),
(4160,65,2023,'1','Maret','Senin','2023-03-06','Y'),
(4161,66,2023,'1','Maret','Selasa','2023-03-07','Y'),
(4162,67,2023,'1','Maret','Rabu','2023-03-08','Y'),
(4163,68,2023,'1','Maret','Kamis','2023-03-09','Y'),
(4164,69,2023,'1','Maret','Jumat','2023-03-10','Y'),
(4165,70,2023,'1','Maret','Sabtu','2023-03-11','Y'),
(4166,71,2023,'1','Maret','Minggu','2023-03-12','Y'),
(4167,72,2023,'1','Maret','Senin','2023-03-13','Y'),
(4168,73,2023,'1','Maret','Selasa','2023-03-14','Y'),
(4169,74,2023,'1','Maret','Rabu','2023-03-15','Y'),
(4170,75,2023,'1','Maret','Kamis','2023-03-16','Y'),
(4171,76,2023,'1','Maret','Jumat','2023-03-17','Y'),
(4172,77,2023,'1','Maret','Sabtu','2023-03-18','Y'),
(4173,78,2023,'1','Maret','Minggu','2023-03-19','Y'),
(4174,79,2023,'1','Maret','Senin','2023-03-20','Y'),
(4175,80,2023,'1','Maret','Selasa','2023-03-21','Y'),
(4176,81,2023,'1','Maret','Rabu','2023-03-22','Y'),
(4177,82,2023,'1','Maret','Kamis','2023-03-23','Y'),
(4178,83,2023,'1','Maret','Jumat','2023-03-24','Y'),
(4179,84,2023,'1','Maret','Sabtu','2023-03-25','Y'),
(4180,85,2023,'1','Maret','Minggu','2023-03-26','Y'),
(4181,86,2023,'1','Maret','Senin','2023-03-27','Y'),
(4182,87,2023,'1','Maret','Selasa','2023-03-28','Y'),
(4183,88,2023,'1','Maret','Rabu','2023-03-29','Y'),
(4184,89,2023,'1','Maret','Kamis','2023-03-30','Y'),
(4185,90,2023,'1','Maret','Jumat','2023-03-31','Y'),
(4186,91,2023,'2','April','Sabtu','2023-04-01','Y'),
(4187,92,2023,'2','April','Minggu','2023-04-02','Y'),
(4188,93,2023,'2','April','Senin','2023-04-03','Y'),
(4189,94,2023,'2','April','Selasa','2023-04-04','Y'),
(4190,95,2023,'2','April','Rabu','2023-04-05','Y'),
(4191,96,2023,'2','April','Kamis','2023-04-06','Y'),
(4192,97,2023,'2','April','Jumat','2023-04-07','Y'),
(4193,98,2023,'2','April','Sabtu','2023-04-08','Y'),
(4194,99,2023,'2','April','Minggu','2023-04-09','Y'),
(4195,100,2023,'2','April','Senin','2023-04-10','Y'),
(4196,101,2023,'2','April','Selasa','2023-04-11','Y'),
(4197,102,2023,'2','April','Rabu','2023-04-12','Y'),
(4198,103,2023,'2','April','Kamis','2023-04-13','Y'),
(4199,104,2023,'2','April','Jumat','2023-04-14','Y'),
(4200,105,2023,'2','April','Sabtu','2023-04-15','Y'),
(4201,106,2023,'2','April','Minggu','2023-04-16','Y'),
(4202,107,2023,'2','April','Senin','2023-04-17','Y'),
(4203,108,2023,'2','April','Selasa','2023-04-18','Y'),
(4204,109,2023,'2','April','Rabu','2023-04-19','Y'),
(4205,110,2023,'2','April','Kamis','2023-04-20','Y'),
(4206,111,2023,'2','April','Jumat','2023-04-21','Y'),
(4207,112,2023,'2','April','Sabtu','2023-04-22','Y'),
(4208,113,2023,'2','April','Minggu','2023-04-23','Y'),
(4209,114,2023,'2','April','Senin','2023-04-24','Y'),
(4210,115,2023,'2','April','Selasa','2023-04-25','Y'),
(4211,116,2023,'2','April','Rabu','2023-04-26','Y'),
(4212,117,2023,'2','April','Kamis','2023-04-27','Y'),
(4213,118,2023,'2','April','Jumat','2023-04-28','Y'),
(4214,119,2023,'2','April','Sabtu','2023-04-29','Y'),
(4215,120,2023,'2','April','Minggu','2023-04-30','Y'),
(4216,121,2023,'2','Mei','Senin','2023-05-01','Y'),
(4217,122,2023,'2','Mei','Selasa','2023-05-02','Y'),
(4218,123,2023,'2','Mei','Rabu','2023-05-03','Y'),
(4219,124,2023,'2','Mei','Kamis','2023-05-04','Y'),
(4220,125,2023,'2','Mei','Jumat','2023-05-05','Y'),
(4221,126,2023,'2','Mei','Sabtu','2023-05-06','Y'),
(4222,127,2023,'2','Mei','Minggu','2023-05-07','Y'),
(4223,128,2023,'2','Mei','Senin','2023-05-08','Y'),
(4224,129,2023,'2','Mei','Selasa','2023-05-09','Y'),
(4225,130,2023,'2','Mei','Rabu','2023-05-10','Y'),
(4226,131,2023,'2','Mei','Kamis','2023-05-11','Y'),
(4227,132,2023,'2','Mei','Jumat','2023-05-12','Y'),
(4228,133,2023,'2','Mei','Sabtu','2023-05-13','Y'),
(4229,134,2023,'2','Mei','Minggu','2023-05-14','Y'),
(4230,135,2023,'2','Mei','Senin','2023-05-15','Y'),
(4231,136,2023,'2','Mei','Selasa','2023-05-16','Y'),
(4232,137,2023,'2','Mei','Rabu','2023-05-17','Y'),
(4233,138,2023,'2','Mei','Kamis','2023-05-18','Y'),
(4234,139,2023,'2','Mei','Jumat','2023-05-19','Y'),
(4235,140,2023,'2','Mei','Sabtu','2023-05-20','Y'),
(4236,141,2023,'2','Mei','Minggu','2023-05-21','Y'),
(4237,142,2023,'2','Mei','Senin','2023-05-22','Y'),
(4238,143,2023,'2','Mei','Selasa','2023-05-23','Y'),
(4239,144,2023,'2','Mei','Rabu','2023-05-24','Y'),
(4240,145,2023,'2','Mei','Kamis','2023-05-25','Y'),
(4241,146,2023,'2','Mei','Jumat','2023-05-26','Y'),
(4242,147,2023,'2','Mei','Sabtu','2023-05-27','Y'),
(4243,148,2023,'2','Mei','Minggu','2023-05-28','Y'),
(4244,149,2023,'2','Mei','Senin','2023-05-29','Y'),
(4245,150,2023,'2','Mei','Selasa','2023-05-30','Y'),
(4246,151,2023,'2','Mei','Rabu','2023-05-31','Y'),
(4247,152,2023,'2','Juni','Kamis','2023-06-01','Y'),
(4248,153,2023,'2','Juni','Jumat','2023-06-02','Y'),
(4249,154,2023,'2','Juni','Sabtu','2023-06-03','Y'),
(4250,155,2023,'2','Juni','Minggu','2023-06-04','Y'),
(4251,156,2023,'2','Juni','Senin','2023-06-05','Y'),
(4252,157,2023,'2','Juni','Selasa','2023-06-06','Y'),
(4253,158,2023,'2','Juni','Rabu','2023-06-07','Y'),
(4254,159,2023,'2','Juni','Kamis','2023-06-08','Y'),
(4255,160,2023,'2','Juni','Jumat','2023-06-09','Y'),
(4256,161,2023,'2','Juni','Sabtu','2023-06-10','Y'),
(4257,162,2023,'2','Juni','Minggu','2023-06-11','Y'),
(4258,163,2023,'2','Juni','Senin','2023-06-12','Y'),
(4259,164,2023,'2','Juni','Selasa','2023-06-13','Y'),
(4260,165,2023,'2','Juni','Rabu','2023-06-14','Y'),
(4261,166,2023,'2','Juni','Kamis','2023-06-15','Y'),
(4262,167,2023,'2','Juni','Jumat','2023-06-16','Y'),
(4263,168,2023,'2','Juni','Sabtu','2023-06-17','Y'),
(4264,169,2023,'2','Juni','Minggu','2023-06-18','Y'),
(4265,170,2023,'2','Juni','Senin','2023-06-19','Y'),
(4266,171,2023,'2','Juni','Selasa','2023-06-20','Y'),
(4267,172,2023,'2','Juni','Rabu','2023-06-21','Y'),
(4268,173,2023,'2','Juni','Kamis','2023-06-22','Y'),
(4269,174,2023,'2','Juni','Jumat','2023-06-23','Y'),
(4270,175,2023,'2','Juni','Sabtu','2023-06-24','Y'),
(4271,176,2023,'2','Juni','Minggu','2023-06-25','Y'),
(4272,177,2023,'2','Juni','Senin','2023-06-26','Y'),
(4273,178,2023,'2','Juni','Selasa','2023-06-27','Y'),
(4274,179,2023,'2','Juni','Rabu','2023-06-28','Y'),
(4275,180,2023,'2','Juni','Kamis','2023-06-29','Y'),
(4276,181,2023,'2','Juni','Jumat','2023-06-30','Y'),
(4277,182,2023,'3','Juli','Sabtu','2023-07-01','Y'),
(4278,183,2023,'3','Juli','Minggu','2023-07-02','Y'),
(4279,184,2023,'3','Juli','Senin','2023-07-03','Y'),
(4280,185,2023,'3','Juli','Selasa','2023-07-04','Y'),
(4281,186,2023,'3','Juli','Rabu','2023-07-05','Y'),
(4282,187,2023,'3','Juli','Kamis','2023-07-06','Y'),
(4283,188,2023,'3','Juli','Jumat','2023-07-07','Y'),
(4284,189,2023,'3','Juli','Sabtu','2023-07-08','Y'),
(4285,190,2023,'3','Juli','Minggu','2023-07-09','Y'),
(4286,191,2023,'3','Juli','Senin','2023-07-10','Y'),
(4287,192,2023,'3','Juli','Selasa','2023-07-11','Y'),
(4288,193,2023,'3','Juli','Rabu','2023-07-12','Y'),
(4289,194,2023,'3','Juli','Kamis','2023-07-13','Y'),
(4290,195,2023,'3','Juli','Jumat','2023-07-14','Y'),
(4291,196,2023,'3','Juli','Sabtu','2023-07-15','Y'),
(4292,197,2023,'3','Juli','Minggu','2023-07-16','Y'),
(4293,198,2023,'3','Juli','Senin','2023-07-17','Y'),
(4294,199,2023,'3','Juli','Selasa','2023-07-18','Y'),
(4295,200,2023,'3','Juli','Rabu','2023-07-19','Y'),
(4296,201,2023,'3','Juli','Kamis','2023-07-20','Y'),
(4297,202,2023,'3','Juli','Jumat','2023-07-21','Y'),
(4298,203,2023,'3','Juli','Sabtu','2023-07-22','Y'),
(4299,204,2023,'3','Juli','Minggu','2023-07-23','Y'),
(4300,205,2023,'3','Juli','Senin','2023-07-24','Y'),
(4301,206,2023,'3','Juli','Selasa','2023-07-25','Y'),
(4302,207,2023,'3','Juli','Rabu','2023-07-26','Y'),
(4303,208,2023,'3','Juli','Kamis','2023-07-27','Y'),
(4304,209,2023,'3','Juli','Jumat','2023-07-28','Y'),
(4305,210,2023,'3','Juli','Sabtu','2023-07-29','Y'),
(4306,211,2023,'3','Juli','Minggu','2023-07-30','Y'),
(4307,212,2023,'3','Juli','Senin','2023-07-31','Y'),
(4308,213,2023,'3','Agustus','Selasa','2023-08-01','Y'),
(4309,214,2023,'3','Agustus','Rabu','2023-08-02','Y'),
(4310,215,2023,'3','Agustus','Kamis','2023-08-03','Y'),
(4311,216,2023,'3','Agustus','Jumat','2023-08-04','Y'),
(4312,217,2023,'3','Agustus','Sabtu','2023-08-05','Y'),
(4313,218,2023,'3','Agustus','Minggu','2023-08-06','Y'),
(4314,219,2023,'3','Agustus','Senin','2023-08-07','Y'),
(4315,220,2023,'3','Agustus','Selasa','2023-08-08','Y'),
(4316,221,2023,'3','Agustus','Rabu','2023-08-09','Y'),
(4317,222,2023,'3','Agustus','Kamis','2023-08-10','Y'),
(4318,223,2023,'3','Agustus','Jumat','2023-08-11','Y'),
(4319,224,2023,'3','Agustus','Sabtu','2023-08-12','Y'),
(4320,225,2023,'3','Agustus','Minggu','2023-08-13','Y'),
(4321,226,2023,'3','Agustus','Senin','2023-08-14','Y'),
(4322,227,2023,'3','Agustus','Selasa','2023-08-15','Y'),
(4323,228,2023,'3','Agustus','Rabu','2023-08-16','Y'),
(4324,229,2023,'3','Agustus','Kamis','2023-08-17','Y'),
(4325,230,2023,'3','Agustus','Jumat','2023-08-18','Y'),
(4326,231,2023,'3','Agustus','Sabtu','2023-08-19','Y'),
(4327,232,2023,'3','Agustus','Minggu','2023-08-20','Y'),
(4328,233,2023,'3','Agustus','Senin','2023-08-21','Y'),
(4329,234,2023,'3','Agustus','Selasa','2023-08-22','Y'),
(4330,235,2023,'3','Agustus','Rabu','2023-08-23','Y'),
(4331,236,2023,'3','Agustus','Kamis','2023-08-24','Y'),
(4332,237,2023,'3','Agustus','Jumat','2023-08-25','Y'),
(4333,238,2023,'3','Agustus','Sabtu','2023-08-26','Y'),
(4334,239,2023,'3','Agustus','Minggu','2023-08-27','Y'),
(4335,240,2023,'3','Agustus','Senin','2023-08-28','Y'),
(4336,241,2023,'3','Agustus','Selasa','2023-08-29','Y'),
(4337,242,2023,'3','Agustus','Rabu','2023-08-30','Y'),
(4338,243,2023,'3','Agustus','Kamis','2023-08-31','Y'),
(4339,244,2023,'3','September','Jumat','2023-09-01','Y'),
(4340,245,2023,'3','September','Sabtu','2023-09-02','Y'),
(4341,246,2023,'3','September','Minggu','2023-09-03','Y'),
(4342,247,2023,'3','September','Senin','2023-09-04','Y'),
(4343,248,2023,'3','September','Selasa','2023-09-05','Y'),
(4344,249,2023,'3','September','Rabu','2023-09-06','Y'),
(4345,250,2023,'3','September','Kamis','2023-09-07','Y'),
(4346,251,2023,'3','September','Jumat','2023-09-08','Y'),
(4347,252,2023,'3','September','Sabtu','2023-09-09','Y'),
(4348,253,2023,'3','September','Minggu','2023-09-10','Y'),
(4349,254,2023,'3','September','Senin','2023-09-11','Y'),
(4350,255,2023,'3','September','Selasa','2023-09-12','Y'),
(4351,256,2023,'3','September','Rabu','2023-09-13','Y'),
(4352,257,2023,'3','September','Kamis','2023-09-14','Y'),
(4353,258,2023,'3','September','Jumat','2023-09-15','Y'),
(4354,259,2023,'3','September','Sabtu','2023-09-16','Y'),
(4355,260,2023,'3','September','Minggu','2023-09-17','Y'),
(4356,261,2023,'3','September','Senin','2023-09-18','Y'),
(4357,262,2023,'3','September','Selasa','2023-09-19','Y'),
(4358,263,2023,'3','September','Rabu','2023-09-20','Y'),
(4359,264,2023,'3','September','Kamis','2023-09-21','Y'),
(4360,265,2023,'3','September','Jumat','2023-09-22','Y'),
(4361,266,2023,'3','September','Sabtu','2023-09-23','Y'),
(4362,267,2023,'3','September','Minggu','2023-09-24','Y'),
(4363,268,2023,'3','September','Senin','2023-09-25','Y'),
(4364,269,2023,'3','September','Selasa','2023-09-26','Y'),
(4365,270,2023,'3','September','Rabu','2023-09-27','Y'),
(4366,271,2023,'3','September','Kamis','2023-09-28','Y'),
(4367,272,2023,'3','September','Jumat','2023-09-29','Y'),
(4368,273,2023,'3','September','Sabtu','2023-09-30','Y'),
(4369,274,2023,'4','Oktober','Minggu','2023-10-01','Y'),
(4370,275,2023,'4','Oktober','Senin','2023-10-02','Y'),
(4371,276,2023,'4','Oktober','Selasa','2023-10-03','Y'),
(4372,277,2023,'4','Oktober','Rabu','2023-10-04','Y'),
(4373,278,2023,'4','Oktober','Kamis','2023-10-05','Y'),
(4374,279,2023,'4','Oktober','Jumat','2023-10-06','Y'),
(4375,280,2023,'4','Oktober','Sabtu','2023-10-07','Y'),
(4376,281,2023,'4','Oktober','Minggu','2023-10-08','Y'),
(4377,282,2023,'4','Oktober','Senin','2023-10-09','Y'),
(4378,283,2023,'4','Oktober','Selasa','2023-10-10','Y'),
(4379,284,2023,'4','Oktober','Rabu','2023-10-11','Y'),
(4380,285,2023,'4','Oktober','Kamis','2023-10-12','Y'),
(4381,286,2023,'4','Oktober','Jumat','2023-10-13','Y'),
(4382,287,2023,'4','Oktober','Sabtu','2023-10-14','Y'),
(4383,288,2023,'4','Oktober','Minggu','2023-10-15','Y'),
(4384,289,2023,'4','Oktober','Senin','2023-10-16','Y'),
(4385,290,2023,'4','Oktober','Selasa','2023-10-17','Y'),
(4386,291,2023,'4','Oktober','Rabu','2023-10-18','Y'),
(4387,292,2023,'4','Oktober','Kamis','2023-10-19','Y'),
(4388,293,2023,'4','Oktober','Jumat','2023-10-20','Y'),
(4389,294,2023,'4','Oktober','Sabtu','2023-10-21','Y'),
(4390,295,2023,'4','Oktober','Minggu','2023-10-22','Y'),
(4391,296,2023,'4','Oktober','Senin','2023-10-23','Y'),
(4392,297,2023,'4','Oktober','Selasa','2023-10-24','Y'),
(4393,298,2023,'4','Oktober','Rabu','2023-10-25','Y'),
(4394,299,2023,'4','Oktober','Kamis','2023-10-26','Y'),
(4395,300,2023,'4','Oktober','Jumat','2023-10-27','Y'),
(4396,301,2023,'4','Oktober','Sabtu','2023-10-28','Y'),
(4397,302,2023,'4','Oktober','Minggu','2023-10-29','Y'),
(4398,303,2023,'4','Oktober','Senin','2023-10-30','Y'),
(4399,304,2023,'4','Oktober','Selasa','2023-10-31','Y'),
(4400,305,2023,'4','November','Rabu','2023-11-01','Y'),
(4401,306,2023,'4','November','Kamis','2023-11-02','Y'),
(4402,307,2023,'4','November','Jumat','2023-11-03','Y'),
(4403,308,2023,'4','November','Sabtu','2023-11-04','Y'),
(4404,309,2023,'4','November','Minggu','2023-11-05','Y'),
(4405,310,2023,'4','November','Senin','2023-11-06','Y'),
(4406,311,2023,'4','November','Selasa','2023-11-07','Y'),
(4407,312,2023,'4','November','Rabu','2023-11-08','Y'),
(4408,313,2023,'4','November','Kamis','2023-11-09','Y'),
(4409,314,2023,'4','November','Jumat','2023-11-10','Y'),
(4410,315,2023,'4','November','Sabtu','2023-11-11','Y'),
(4411,316,2023,'4','November','Minggu','2023-11-12','Y'),
(4412,317,2023,'4','November','Senin','2023-11-13','Y'),
(4413,318,2023,'4','November','Selasa','2023-11-14','Y'),
(4414,319,2023,'4','November','Rabu','2023-11-15','Y'),
(4415,320,2023,'4','November','Kamis','2023-11-16','Y'),
(4416,321,2023,'4','November','Jumat','2023-11-17','Y'),
(4417,322,2023,'4','November','Sabtu','2023-11-18','Y'),
(4418,323,2023,'4','November','Minggu','2023-11-19','Y'),
(4419,324,2023,'4','November','Senin','2023-11-20','Y'),
(4420,325,2023,'4','November','Selasa','2023-11-21','Y'),
(4421,326,2023,'4','November','Rabu','2023-11-22','Y'),
(4422,327,2023,'4','November','Kamis','2023-11-23','Y'),
(4423,328,2023,'4','November','Jumat','2023-11-24','Y'),
(4424,329,2023,'4','November','Sabtu','2023-11-25','Y'),
(4425,330,2023,'4','November','Minggu','2023-11-26','Y'),
(4426,331,2023,'4','November','Senin','2023-11-27','Y'),
(4427,332,2023,'4','November','Selasa','2023-11-28','Y'),
(4428,333,2023,'4','November','Rabu','2023-11-29','Y'),
(4429,334,2023,'4','November','Kamis','2023-11-30','Y'),
(4430,335,2023,'4','Desember','Jumat','2023-12-01','Y'),
(4431,336,2023,'4','Desember','Sabtu','2023-12-02','Y'),
(4432,337,2023,'4','Desember','Minggu','2023-12-03','Y'),
(4433,338,2023,'4','Desember','Senin','2023-12-04','Y'),
(4434,339,2023,'4','Desember','Selasa','2023-12-05','Y'),
(4435,340,2023,'4','Desember','Rabu','2023-12-06','Y'),
(4436,341,2023,'4','Desember','Kamis','2023-12-07','Y'),
(4437,342,2023,'4','Desember','Jumat','2023-12-08','Y'),
(4438,343,2023,'4','Desember','Sabtu','2023-12-09','Y'),
(4439,344,2023,'4','Desember','Minggu','2023-12-10','Y'),
(4440,345,2023,'4','Desember','Senin','2023-12-11','Y'),
(4441,346,2023,'4','Desember','Selasa','2023-12-12','Y'),
(4442,347,2023,'4','Desember','Rabu','2023-12-13','Y'),
(4443,348,2023,'4','Desember','Kamis','2023-12-14','Y'),
(4444,349,2023,'4','Desember','Jumat','2023-12-15','Y'),
(4445,350,2023,'4','Desember','Sabtu','2023-12-16','Y'),
(4446,351,2023,'4','Desember','Minggu','2023-12-17','Y'),
(4447,352,2023,'4','Desember','Senin','2023-12-18','Y'),
(4448,353,2023,'4','Desember','Selasa','2023-12-19','Y'),
(4449,354,2023,'4','Desember','Rabu','2023-12-20','Y'),
(4450,355,2023,'4','Desember','Kamis','2023-12-21','Y'),
(4451,356,2023,'4','Desember','Jumat','2023-12-22','Y'),
(4452,357,2023,'4','Desember','Sabtu','2023-12-23','Y'),
(4453,358,2023,'4','Desember','Minggu','2023-12-24','Y'),
(4454,359,2023,'4','Desember','Senin','2023-12-25','Y'),
(4455,360,2023,'4','Desember','Selasa','2023-12-26','Y'),
(4456,361,2023,'4','Desember','Rabu','2023-12-27','Y'),
(4457,362,2023,'4','Desember','Kamis','2023-12-28','Y'),
(4458,363,2023,'4','Desember','Jumat','2023-12-29','Y'),
(4459,364,2023,'4','Desember','Sabtu','2023-12-30','Y'),
(4460,365,2023,'4','Desember','Minggu','2023-12-31','Y'),
(4461,366,2024,'1','Januari','Senin','2024-01-01','Y'),
(4462,367,2024,'1','Januari','Selasa','2024-01-02','Y'),
(4463,368,2024,'1','Januari','Rabu','2024-01-03','Y'),
(4464,369,2024,'1','Januari','Kamis','2024-01-04','Y'),
(4465,370,2024,'1','Januari','Jumat','2024-01-05','Y'),
(4466,371,2024,'1','Januari','Sabtu','2024-01-06','Y'),
(4467,372,2024,'1','Januari','Minggu','2024-01-07','Y'),
(4468,373,2024,'1','Januari','Senin','2024-01-08','Y'),
(4469,374,2024,'1','Januari','Selasa','2024-01-09','Y'),
(4470,375,2024,'1','Januari','Rabu','2024-01-10','Y'),
(4471,376,2024,'1','Januari','Kamis','2024-01-11','Y'),
(4472,377,2024,'1','Januari','Jumat','2024-01-12','Y'),
(4473,378,2024,'1','Januari','Sabtu','2024-01-13','Y'),
(4474,379,2024,'1','Januari','Minggu','2024-01-14','Y'),
(4475,380,2024,'1','Januari','Senin','2024-01-15','Y'),
(4476,381,2024,'1','Januari','Selasa','2024-01-16','Y'),
(4477,382,2024,'1','Januari','Rabu','2024-01-17','Y'),
(4478,383,2024,'1','Januari','Kamis','2024-01-18','Y'),
(4479,384,2024,'1','Januari','Jumat','2024-01-19','Y'),
(4480,385,2024,'1','Januari','Sabtu','2024-01-20','Y'),
(4481,386,2024,'1','Januari','Minggu','2024-01-21','Y'),
(4482,387,2024,'1','Januari','Senin','2024-01-22','Y'),
(4483,388,2024,'1','Januari','Selasa','2024-01-23','Y'),
(4484,389,2024,'1','Januari','Rabu','2024-01-24','Y'),
(4485,390,2024,'1','Januari','Kamis','2024-01-25','Y'),
(4486,391,2024,'1','Januari','Jumat','2024-01-26','Y'),
(4487,392,2024,'1','Januari','Sabtu','2024-01-27','Y'),
(4488,393,2024,'1','Januari','Minggu','2024-01-28','Y'),
(4489,394,2024,'1','Januari','Senin','2024-01-29','Y'),
(4490,395,2024,'1','Januari','Selasa','2024-01-30','Y'),
(4491,396,2024,'1','Januari','Rabu','2024-01-31','Y'),
(4492,397,2024,'1','Februari','Kamis','2024-02-01','Y'),
(4493,398,2024,'1','Februari','Jumat','2024-02-02','Y'),
(4494,399,2024,'1','Februari','Sabtu','2024-02-03','Y'),
(4495,400,2024,'1','Februari','Minggu','2024-02-04','Y'),
(4496,401,2024,'1','Februari','Senin','2024-02-05','Y'),
(4497,402,2024,'1','Februari','Selasa','2024-02-06','Y'),
(4498,403,2024,'1','Februari','Rabu','2024-02-07','Y'),
(4499,404,2024,'1','Februari','Kamis','2024-02-08','Y'),
(4500,405,2024,'1','Februari','Jumat','2024-02-09','Y'),
(4501,406,2024,'1','Februari','Sabtu','2024-02-10','Y'),
(4502,407,2024,'1','Februari','Minggu','2024-02-11','Y'),
(4503,408,2024,'1','Februari','Senin','2024-02-12','Y'),
(4504,409,2024,'1','Februari','Selasa','2024-02-13','Y'),
(4505,410,2024,'1','Februari','Rabu','2024-02-14','Y'),
(4506,411,2024,'1','Februari','Kamis','2024-02-15','Y'),
(4507,412,2024,'1','Februari','Jumat','2024-02-16','Y'),
(4508,413,2024,'1','Februari','Sabtu','2024-02-17','Y'),
(4509,414,2024,'1','Februari','Minggu','2024-02-18','Y'),
(4510,415,2024,'1','Februari','Senin','2024-02-19','Y'),
(4511,416,2024,'1','Februari','Selasa','2024-02-20','Y'),
(4512,417,2024,'1','Februari','Rabu','2024-02-21','Y'),
(4513,418,2024,'1','Februari','Kamis','2024-02-22','Y'),
(4514,419,2024,'1','Februari','Jumat','2024-02-23','Y'),
(4515,420,2024,'1','Februari','Sabtu','2024-02-24','Y'),
(4516,421,2024,'1','Februari','Minggu','2024-02-25','Y'),
(4517,422,2024,'1','Februari','Senin','2024-02-26','Y'),
(4518,423,2024,'1','Februari','Selasa','2024-02-27','Y'),
(4519,424,2024,'1','Februari','Rabu','2024-02-28','Y'),
(4520,425,2024,'1','Februari','Kamis','2024-02-29','Y'),
(4521,426,2024,'1','Maret','Jumat','2024-03-01','Y'),
(4522,427,2024,'1','Maret','Sabtu','2024-03-02','Y'),
(4523,428,2024,'1','Maret','Minggu','2024-03-03','Y'),
(4524,429,2024,'1','Maret','Senin','2024-03-04','Y'),
(4525,430,2024,'1','Maret','Selasa','2024-03-05','Y'),
(4526,431,2024,'1','Maret','Rabu','2024-03-06','Y'),
(4527,432,2024,'1','Maret','Kamis','2024-03-07','Y'),
(4528,433,2024,'1','Maret','Jumat','2024-03-08','Y'),
(4529,434,2024,'1','Maret','Sabtu','2024-03-09','Y'),
(4530,435,2024,'1','Maret','Minggu','2024-03-10','Y'),
(4531,436,2024,'1','Maret','Senin','2024-03-11','Y'),
(4532,437,2024,'1','Maret','Selasa','2024-03-12','Y'),
(4533,438,2024,'1','Maret','Rabu','2024-03-13','Y'),
(4534,439,2024,'1','Maret','Kamis','2024-03-14','Y'),
(4535,440,2024,'1','Maret','Jumat','2024-03-15','Y'),
(4536,441,2024,'1','Maret','Sabtu','2024-03-16','Y'),
(4537,442,2024,'1','Maret','Minggu','2024-03-17','Y'),
(4538,443,2024,'1','Maret','Senin','2024-03-18','Y'),
(4539,444,2024,'1','Maret','Selasa','2024-03-19','Y'),
(4540,445,2024,'1','Maret','Rabu','2024-03-20','Y'),
(4541,446,2024,'1','Maret','Kamis','2024-03-21','Y'),
(4542,447,2024,'1','Maret','Jumat','2024-03-22','Y'),
(4543,448,2024,'1','Maret','Sabtu','2024-03-23','Y'),
(4544,449,2024,'1','Maret','Minggu','2024-03-24','Y'),
(4545,450,2024,'1','Maret','Senin','2024-03-25','Y'),
(4546,451,2024,'1','Maret','Selasa','2024-03-26','Y'),
(4547,452,2024,'1','Maret','Rabu','2024-03-27','Y'),
(4548,453,2024,'1','Maret','Kamis','2024-03-28','Y'),
(4549,454,2024,'1','Maret','Jumat','2024-03-29','Y'),
(4550,455,2024,'1','Maret','Sabtu','2024-03-30','Y'),
(4551,456,2024,'1','Maret','Minggu','2024-03-31','Y'),
(4552,457,2024,'2','April','Senin','2024-04-01','Y'),
(4553,458,2024,'2','April','Selasa','2024-04-02','Y'),
(4554,459,2024,'2','April','Rabu','2024-04-03','Y'),
(4555,460,2024,'2','April','Kamis','2024-04-04','Y'),
(4556,461,2024,'2','April','Jumat','2024-04-05','Y'),
(4557,462,2024,'2','April','Sabtu','2024-04-06','Y'),
(4558,463,2024,'2','April','Minggu','2024-04-07','Y'),
(4559,464,2024,'2','April','Senin','2024-04-08','Y'),
(4560,465,2024,'2','April','Selasa','2024-04-09','Y'),
(4561,466,2024,'2','April','Rabu','2024-04-10','Y'),
(4562,467,2024,'2','April','Kamis','2024-04-11','Y'),
(4563,468,2024,'2','April','Jumat','2024-04-12','Y'),
(4564,469,2024,'2','April','Sabtu','2024-04-13','Y'),
(4565,470,2024,'2','April','Minggu','2024-04-14','Y'),
(4566,471,2024,'2','April','Senin','2024-04-15','Y'),
(4567,472,2024,'2','April','Selasa','2024-04-16','Y'),
(4568,473,2024,'2','April','Rabu','2024-04-17','Y'),
(4569,474,2024,'2','April','Kamis','2024-04-18','Y'),
(4570,475,2024,'2','April','Jumat','2024-04-19','Y'),
(4571,476,2024,'2','April','Sabtu','2024-04-20','Y'),
(4572,477,2024,'2','April','Minggu','2024-04-21','Y'),
(4573,478,2024,'2','April','Senin','2024-04-22','Y'),
(4574,479,2024,'2','April','Selasa','2024-04-23','Y'),
(4575,480,2024,'2','April','Rabu','2024-04-24','Y'),
(4576,481,2024,'2','April','Kamis','2024-04-25','Y'),
(4577,482,2024,'2','April','Jumat','2024-04-26','Y'),
(4578,483,2024,'2','April','Sabtu','2024-04-27','Y'),
(4579,484,2024,'2','April','Minggu','2024-04-28','Y'),
(4580,485,2024,'2','April','Senin','2024-04-29','Y'),
(4581,486,2024,'2','April','Selasa','2024-04-30','Y'),
(4582,487,2024,'2','Mei','Rabu','2024-05-01','Y'),
(4583,488,2024,'2','Mei','Kamis','2024-05-02','Y'),
(4584,489,2024,'2','Mei','Jumat','2024-05-03','Y'),
(4585,490,2024,'2','Mei','Sabtu','2024-05-04','Y'),
(4586,491,2024,'2','Mei','Minggu','2024-05-05','Y'),
(4587,492,2024,'2','Mei','Senin','2024-05-06','Y'),
(4588,493,2024,'2','Mei','Selasa','2024-05-07','Y'),
(4589,494,2024,'2','Mei','Rabu','2024-05-08','Y'),
(4590,495,2024,'2','Mei','Kamis','2024-05-09','Y'),
(4591,496,2024,'2','Mei','Jumat','2024-05-10','Y'),
(4592,497,2024,'2','Mei','Sabtu','2024-05-11','Y'),
(4593,498,2024,'2','Mei','Minggu','2024-05-12','Y'),
(4594,499,2024,'2','Mei','Senin','2024-05-13','Y'),
(4595,500,2024,'2','Mei','Selasa','2024-05-14','Y'),
(4596,501,2024,'2','Mei','Rabu','2024-05-15','Y'),
(4597,502,2024,'2','Mei','Kamis','2024-05-16','Y'),
(4598,503,2024,'2','Mei','Jumat','2024-05-17','Y'),
(4599,504,2024,'2','Mei','Sabtu','2024-05-18','Y'),
(4600,505,2024,'2','Mei','Minggu','2024-05-19','Y'),
(4601,506,2024,'2','Mei','Senin','2024-05-20','Y'),
(4602,507,2024,'2','Mei','Selasa','2024-05-21','Y'),
(4603,508,2024,'2','Mei','Rabu','2024-05-22','Y'),
(4604,509,2024,'2','Mei','Kamis','2024-05-23','Y'),
(4605,510,2024,'2','Mei','Jumat','2024-05-24','Y'),
(4606,511,2024,'2','Mei','Sabtu','2024-05-25','Y'),
(4607,512,2024,'2','Mei','Minggu','2024-05-26','Y'),
(4608,513,2024,'2','Mei','Senin','2024-05-27','Y'),
(4609,514,2024,'2','Mei','Selasa','2024-05-28','Y'),
(4610,515,2024,'2','Mei','Rabu','2024-05-29','Y'),
(4611,516,2024,'2','Mei','Kamis','2024-05-30','Y'),
(4612,517,2024,'2','Mei','Jumat','2024-05-31','Y'),
(4613,518,2024,'2','Juni','Sabtu','2024-06-01','Y'),
(4614,519,2024,'2','Juni','Minggu','2024-06-02','Y'),
(4615,520,2024,'2','Juni','Senin','2024-06-03','Y'),
(4616,521,2024,'2','Juni','Selasa','2024-06-04','Y'),
(4617,522,2024,'2','Juni','Rabu','2024-06-05','Y'),
(4618,523,2024,'2','Juni','Kamis','2024-06-06','Y'),
(4619,524,2024,'2','Juni','Jumat','2024-06-07','Y'),
(4620,525,2024,'2','Juni','Sabtu','2024-06-08','Y'),
(4621,526,2024,'2','Juni','Minggu','2024-06-09','Y'),
(4622,527,2024,'2','Juni','Senin','2024-06-10','Y'),
(4623,528,2024,'2','Juni','Selasa','2024-06-11','Y'),
(4624,529,2024,'2','Juni','Rabu','2024-06-12','Y'),
(4625,530,2024,'2','Juni','Kamis','2024-06-13','Y'),
(4626,531,2024,'2','Juni','Jumat','2024-06-14','Y'),
(4627,532,2024,'2','Juni','Sabtu','2024-06-15','Y'),
(4628,533,2024,'2','Juni','Minggu','2024-06-16','Y'),
(4629,534,2024,'2','Juni','Senin','2024-06-17','Y'),
(4630,535,2024,'2','Juni','Selasa','2024-06-18','Y'),
(4631,536,2024,'2','Juni','Rabu','2024-06-19','Y'),
(4632,537,2024,'2','Juni','Kamis','2024-06-20','Y'),
(4633,538,2024,'2','Juni','Jumat','2024-06-21','Y'),
(4634,539,2024,'2','Juni','Sabtu','2024-06-22','Y'),
(4635,540,2024,'2','Juni','Minggu','2024-06-23','Y'),
(4636,541,2024,'2','Juni','Senin','2024-06-24','Y'),
(4637,542,2024,'2','Juni','Selasa','2024-06-25','Y'),
(4638,543,2024,'2','Juni','Rabu','2024-06-26','Y'),
(4639,544,2024,'2','Juni','Kamis','2024-06-27','Y'),
(4640,545,2024,'2','Juni','Jumat','2024-06-28','Y'),
(4641,546,2024,'2','Juni','Sabtu','2024-06-29','Y'),
(4642,547,2024,'2','Juni','Minggu','2024-06-30','Y'),
(4643,548,2024,'3','Juli','Senin','2024-07-01','Y'),
(4644,549,2024,'3','Juli','Selasa','2024-07-02','Y'),
(4645,550,2024,'3','Juli','Rabu','2024-07-03','Y'),
(4646,551,2024,'3','Juli','Kamis','2024-07-04','Y'),
(4647,552,2024,'3','Juli','Jumat','2024-07-05','Y'),
(4648,553,2024,'3','Juli','Sabtu','2024-07-06','Y'),
(4649,554,2024,'3','Juli','Minggu','2024-07-07','Y'),
(4650,555,2024,'3','Juli','Senin','2024-07-08','Y'),
(4651,556,2024,'3','Juli','Selasa','2024-07-09','Y'),
(4652,557,2024,'3','Juli','Rabu','2024-07-10','Y'),
(4653,558,2024,'3','Juli','Kamis','2024-07-11','Y'),
(4654,559,2024,'3','Juli','Jumat','2024-07-12','Y'),
(4655,560,2024,'3','Juli','Sabtu','2024-07-13','Y'),
(4656,561,2024,'3','Juli','Minggu','2024-07-14','Y'),
(4657,562,2024,'3','Juli','Senin','2024-07-15','Y'),
(4658,563,2024,'3','Juli','Selasa','2024-07-16','Y'),
(4659,564,2024,'3','Juli','Rabu','2024-07-17','Y'),
(4660,565,2024,'3','Juli','Kamis','2024-07-18','Y'),
(4661,566,2024,'3','Juli','Jumat','2024-07-19','Y'),
(4662,567,2024,'3','Juli','Sabtu','2024-07-20','Y'),
(4663,568,2024,'3','Juli','Minggu','2024-07-21','Y'),
(4664,569,2024,'3','Juli','Senin','2024-07-22','Y'),
(4665,570,2024,'3','Juli','Selasa','2024-07-23','Y'),
(4666,571,2024,'3','Juli','Rabu','2024-07-24','Y'),
(4667,572,2024,'3','Juli','Kamis','2024-07-25','Y'),
(4668,573,2024,'3','Juli','Jumat','2024-07-26','Y'),
(4669,574,2024,'3','Juli','Sabtu','2024-07-27','Y'),
(4670,575,2024,'3','Juli','Minggu','2024-07-28','Y'),
(4671,576,2024,'3','Juli','Senin','2024-07-29','Y'),
(4672,577,2024,'3','Juli','Selasa','2024-07-30','Y'),
(4673,578,2024,'3','Juli','Rabu','2024-07-31','Y'),
(4674,579,2024,'3','Agustus','Kamis','2024-08-01','Y'),
(4675,580,2024,'3','Agustus','Jumat','2024-08-02','Y'),
(4676,581,2024,'3','Agustus','Sabtu','2024-08-03','Y'),
(4677,582,2024,'3','Agustus','Minggu','2024-08-04','Y'),
(4678,583,2024,'3','Agustus','Senin','2024-08-05','Y'),
(4679,584,2024,'3','Agustus','Selasa','2024-08-06','Y'),
(4680,585,2024,'3','Agustus','Rabu','2024-08-07','Y'),
(4681,586,2024,'3','Agustus','Kamis','2024-08-08','Y'),
(4682,587,2024,'3','Agustus','Jumat','2024-08-09','Y'),
(4683,588,2024,'3','Agustus','Sabtu','2024-08-10','Y'),
(4684,589,2024,'3','Agustus','Minggu','2024-08-11','Y'),
(4685,590,2024,'3','Agustus','Senin','2024-08-12','Y'),
(4686,591,2024,'3','Agustus','Selasa','2024-08-13','Y'),
(4687,592,2024,'3','Agustus','Rabu','2024-08-14','Y'),
(4688,593,2024,'3','Agustus','Kamis','2024-08-15','Y'),
(4689,594,2024,'3','Agustus','Jumat','2024-08-16','Y'),
(4690,595,2024,'3','Agustus','Sabtu','2024-08-17','Y'),
(4691,596,2024,'3','Agustus','Minggu','2024-08-18','Y'),
(4692,597,2024,'3','Agustus','Senin','2024-08-19','Y'),
(4693,598,2024,'3','Agustus','Selasa','2024-08-20','Y'),
(4694,599,2024,'3','Agustus','Rabu','2024-08-21','Y'),
(4695,600,2024,'3','Agustus','Kamis','2024-08-22','Y'),
(4696,601,2024,'3','Agustus','Jumat','2024-08-23','Y'),
(4697,602,2024,'3','Agustus','Sabtu','2024-08-24','Y'),
(4698,603,2024,'3','Agustus','Minggu','2024-08-25','Y'),
(4699,604,2024,'3','Agustus','Senin','2024-08-26','Y'),
(4700,605,2024,'3','Agustus','Selasa','2024-08-27','Y'),
(4701,606,2024,'3','Agustus','Rabu','2024-08-28','Y'),
(4702,607,2024,'3','Agustus','Kamis','2024-08-29','Y'),
(4703,608,2024,'3','Agustus','Jumat','2024-08-30','Y'),
(4704,609,2024,'3','Agustus','Sabtu','2024-08-31','Y'),
(4705,610,2024,'3','September','Minggu','2024-09-01','Y'),
(4706,611,2024,'3','September','Senin','2024-09-02','Y'),
(4707,612,2024,'3','September','Selasa','2024-09-03','Y'),
(4708,613,2024,'3','September','Rabu','2024-09-04','Y'),
(4709,614,2024,'3','September','Kamis','2024-09-05','Y'),
(4710,615,2024,'3','September','Jumat','2024-09-06','Y'),
(4711,616,2024,'3','September','Sabtu','2024-09-07','Y'),
(4712,617,2024,'3','September','Minggu','2024-09-08','Y'),
(4713,618,2024,'3','September','Senin','2024-09-09','Y'),
(4714,619,2024,'3','September','Selasa','2024-09-10','Y'),
(4715,620,2024,'3','September','Rabu','2024-09-11','Y'),
(4716,621,2024,'3','September','Kamis','2024-09-12','Y'),
(4717,622,2024,'3','September','Jumat','2024-09-13','Y'),
(4718,623,2024,'3','September','Sabtu','2024-09-14','Y'),
(4719,624,2024,'3','September','Minggu','2024-09-15','Y'),
(4720,625,2024,'3','September','Senin','2024-09-16','Y'),
(4721,626,2024,'3','September','Selasa','2024-09-17','Y'),
(4722,627,2024,'3','September','Rabu','2024-09-18','Y'),
(4723,628,2024,'3','September','Kamis','2024-09-19','Y'),
(4724,629,2024,'3','September','Jumat','2024-09-20','Y'),
(4725,630,2024,'3','September','Sabtu','2024-09-21','Y'),
(4726,631,2024,'3','September','Minggu','2024-09-22','Y'),
(4727,632,2024,'3','September','Senin','2024-09-23','Y'),
(4728,633,2024,'3','September','Selasa','2024-09-24','Y'),
(4729,634,2024,'3','September','Rabu','2024-09-25','Y'),
(4730,635,2024,'3','September','Kamis','2024-09-26','Y'),
(4731,636,2024,'3','September','Jumat','2024-09-27','Y'),
(4732,637,2024,'3','September','Sabtu','2024-09-28','Y'),
(4733,638,2024,'3','September','Minggu','2024-09-29','Y'),
(4734,639,2024,'3','September','Senin','2024-09-30','Y'),
(4735,640,2024,'4','Oktober','Selasa','2024-10-01','Y'),
(4736,641,2024,'4','Oktober','Rabu','2024-10-02','Y'),
(4737,642,2024,'4','Oktober','Kamis','2024-10-03','Y'),
(4738,643,2024,'4','Oktober','Jumat','2024-10-04','Y'),
(4739,644,2024,'4','Oktober','Sabtu','2024-10-05','Y'),
(4740,645,2024,'4','Oktober','Minggu','2024-10-06','Y'),
(4741,646,2024,'4','Oktober','Senin','2024-10-07','Y'),
(4742,647,2024,'4','Oktober','Selasa','2024-10-08','Y'),
(4743,648,2024,'4','Oktober','Rabu','2024-10-09','Y'),
(4744,649,2024,'4','Oktober','Kamis','2024-10-10','Y'),
(4745,650,2024,'4','Oktober','Jumat','2024-10-11','Y'),
(4746,651,2024,'4','Oktober','Sabtu','2024-10-12','Y'),
(4747,652,2024,'4','Oktober','Minggu','2024-10-13','Y'),
(4748,653,2024,'4','Oktober','Senin','2024-10-14','Y'),
(4749,654,2024,'4','Oktober','Selasa','2024-10-15','Y'),
(4750,655,2024,'4','Oktober','Rabu','2024-10-16','Y'),
(4751,656,2024,'4','Oktober','Kamis','2024-10-17','Y'),
(4752,657,2024,'4','Oktober','Jumat','2024-10-18','Y'),
(4753,658,2024,'4','Oktober','Sabtu','2024-10-19','Y'),
(4754,659,2024,'4','Oktober','Minggu','2024-10-20','Y'),
(4755,660,2024,'4','Oktober','Senin','2024-10-21','Y'),
(4756,661,2024,'4','Oktober','Selasa','2024-10-22','Y'),
(4757,662,2024,'4','Oktober','Rabu','2024-10-23','Y'),
(4758,663,2024,'4','Oktober','Kamis','2024-10-24','Y'),
(4759,664,2024,'4','Oktober','Jumat','2024-10-25','Y'),
(4760,665,2024,'4','Oktober','Sabtu','2024-10-26','Y'),
(4761,666,2024,'4','Oktober','Minggu','2024-10-27','Y'),
(4762,667,2024,'4','Oktober','Senin','2024-10-28','Y'),
(4763,668,2024,'4','Oktober','Selasa','2024-10-29','Y'),
(4764,669,2024,'4','Oktober','Rabu','2024-10-30','Y'),
(4765,670,2024,'4','Oktober','Kamis','2024-10-31','Y'),
(4766,671,2024,'4','November','Jumat','2024-11-01','Y'),
(4767,672,2024,'4','November','Sabtu','2024-11-02','Y'),
(4768,673,2024,'4','November','Minggu','2024-11-03','Y'),
(4769,674,2024,'4','November','Senin','2024-11-04','Y'),
(4770,675,2024,'4','November','Selasa','2024-11-05','Y'),
(4771,676,2024,'4','November','Rabu','2024-11-06','Y'),
(4772,677,2024,'4','November','Kamis','2024-11-07','Y'),
(4773,678,2024,'4','November','Jumat','2024-11-08','Y'),
(4774,679,2024,'4','November','Sabtu','2024-11-09','Y'),
(4775,680,2024,'4','November','Minggu','2024-11-10','Y'),
(4776,681,2024,'4','November','Senin','2024-11-11','Y'),
(4777,682,2024,'4','November','Selasa','2024-11-12','Y'),
(4778,683,2024,'4','November','Rabu','2024-11-13','Y'),
(4779,684,2024,'4','November','Kamis','2024-11-14','Y'),
(4780,685,2024,'4','November','Jumat','2024-11-15','Y'),
(4781,686,2024,'4','November','Sabtu','2024-11-16','Y'),
(4782,687,2024,'4','November','Minggu','2024-11-17','Y'),
(4783,688,2024,'4','November','Senin','2024-11-18','Y'),
(4784,689,2024,'4','November','Selasa','2024-11-19','Y'),
(4785,690,2024,'4','November','Rabu','2024-11-20','Y'),
(4786,691,2024,'4','November','Kamis','2024-11-21','Y'),
(4787,692,2024,'4','November','Jumat','2024-11-22','Y'),
(4788,693,2024,'4','November','Sabtu','2024-11-23','Y'),
(4789,694,2024,'4','November','Minggu','2024-11-24','Y'),
(4790,695,2024,'4','November','Senin','2024-11-25','Y'),
(4791,696,2024,'4','November','Selasa','2024-11-26','Y'),
(4792,697,2024,'4','November','Rabu','2024-11-27','Y'),
(4793,698,2024,'4','November','Kamis','2024-11-28','Y'),
(4794,699,2024,'4','November','Jumat','2024-11-29','Y'),
(4795,700,2024,'4','November','Sabtu','2024-11-30','Y'),
(4796,701,2024,'4','Desember','Minggu','2024-12-01','Y'),
(4797,702,2024,'4','Desember','Senin','2024-12-02','Y'),
(4798,703,2024,'4','Desember','Selasa','2024-12-03','Y'),
(4799,704,2024,'4','Desember','Rabu','2024-12-04','Y'),
(4800,705,2024,'4','Desember','Kamis','2024-12-05','Y'),
(4801,706,2024,'4','Desember','Jumat','2024-12-06','Y'),
(4802,707,2024,'4','Desember','Sabtu','2024-12-07','Y'),
(4803,708,2024,'4','Desember','Minggu','2024-12-08','Y'),
(4804,709,2024,'4','Desember','Senin','2024-12-09','Y'),
(4805,710,2024,'4','Desember','Selasa','2024-12-10','Y'),
(4806,711,2024,'4','Desember','Rabu','2024-12-11','Y'),
(4807,712,2024,'4','Desember','Kamis','2024-12-12','Y'),
(4808,713,2024,'4','Desember','Jumat','2024-12-13','Y'),
(4809,714,2024,'4','Desember','Sabtu','2024-12-14','Y'),
(4810,715,2024,'4','Desember','Minggu','2024-12-15','Y'),
(4811,716,2024,'4','Desember','Senin','2024-12-16','Y'),
(4812,717,2024,'4','Desember','Selasa','2024-12-17','Y'),
(4813,718,2024,'4','Desember','Rabu','2024-12-18','Y'),
(4814,719,2024,'4','Desember','Kamis','2024-12-19','Y'),
(4815,720,2024,'4','Desember','Jumat','2024-12-20','Y'),
(4816,721,2024,'4','Desember','Sabtu','2024-12-21','Y'),
(4817,722,2024,'4','Desember','Minggu','2024-12-22','Y'),
(4818,723,2024,'4','Desember','Senin','2024-12-23','Y'),
(4819,724,2024,'4','Desember','Selasa','2024-12-24','Y'),
(4820,725,2024,'4','Desember','Rabu','2024-12-25','Y'),
(4821,726,2024,'4','Desember','Kamis','2024-12-26','Y'),
(4822,727,2024,'4','Desember','Jumat','2024-12-27','Y'),
(4823,728,2024,'4','Desember','Sabtu','2024-12-28','Y'),
(4824,729,2024,'4','Desember','Minggu','2024-12-29','Y'),
(4825,730,2024,'4','Desember','Senin','2024-12-30','Y'),
(4826,731,2024,'4','Desember','Selasa','2024-12-31','Y'),
(4827,732,2025,'1','Januari','Rabu','2025-01-01','Y'),
(4828,733,2025,'1','Januari','Kamis','2025-01-02','Y'),
(4829,734,2025,'1','Januari','Jumat','2025-01-03','Y'),
(4830,735,2025,'1','Januari','Sabtu','2025-01-04','Y'),
(4831,736,2025,'1','Januari','Minggu','2025-01-05','Y'),
(4832,737,2025,'1','Januari','Senin','2025-01-06','Y'),
(4833,738,2025,'1','Januari','Selasa','2025-01-07','Y'),
(4834,739,2025,'1','Januari','Rabu','2025-01-08','Y'),
(4835,740,2025,'1','Januari','Kamis','2025-01-09','Y'),
(4836,741,2025,'1','Januari','Jumat','2025-01-10','Y'),
(4837,742,2025,'1','Januari','Sabtu','2025-01-11','Y'),
(4838,743,2025,'1','Januari','Minggu','2025-01-12','Y'),
(4839,744,2025,'1','Januari','Senin','2025-01-13','Y'),
(4840,745,2025,'1','Januari','Selasa','2025-01-14','Y'),
(4841,746,2025,'1','Januari','Rabu','2025-01-15','Y'),
(4842,747,2025,'1','Januari','Kamis','2025-01-16','Y'),
(4843,748,2025,'1','Januari','Jumat','2025-01-17','Y'),
(4844,749,2025,'1','Januari','Sabtu','2025-01-18','Y'),
(4845,750,2025,'1','Januari','Minggu','2025-01-19','Y'),
(4846,751,2025,'1','Januari','Senin','2025-01-20','Y'),
(4847,752,2025,'1','Januari','Selasa','2025-01-21','Y'),
(4848,753,2025,'1','Januari','Rabu','2025-01-22','Y'),
(4849,754,2025,'1','Januari','Kamis','2025-01-23','Y'),
(4850,755,2025,'1','Januari','Jumat','2025-01-24','Y'),
(4851,756,2025,'1','Januari','Sabtu','2025-01-25','Y'),
(4852,757,2025,'1','Januari','Minggu','2025-01-26','Y'),
(4853,758,2025,'1','Januari','Senin','2025-01-27','Y'),
(4854,759,2025,'1','Januari','Selasa','2025-01-28','Y'),
(4855,760,2025,'1','Januari','Rabu','2025-01-29','Y'),
(4856,761,2025,'1','Januari','Kamis','2025-01-30','Y'),
(4857,762,2025,'1','Januari','Jumat','2025-01-31','Y'),
(4858,763,2025,'1','Februari','Sabtu','2025-02-01','Y'),
(4859,764,2025,'1','Februari','Minggu','2025-02-02','Y'),
(4860,765,2025,'1','Februari','Senin','2025-02-03','Y'),
(4861,766,2025,'1','Februari','Selasa','2025-02-04','Y'),
(4862,767,2025,'1','Februari','Rabu','2025-02-05','Y'),
(4863,768,2025,'1','Februari','Kamis','2025-02-06','Y'),
(4864,769,2025,'1','Februari','Jumat','2025-02-07','Y'),
(4865,770,2025,'1','Februari','Sabtu','2025-02-08','Y'),
(4866,771,2025,'1','Februari','Minggu','2025-02-09','Y'),
(4867,772,2025,'1','Februari','Senin','2025-02-10','Y'),
(4868,773,2025,'1','Februari','Selasa','2025-02-11','Y'),
(4869,774,2025,'1','Februari','Rabu','2025-02-12','Y'),
(4870,775,2025,'1','Februari','Kamis','2025-02-13','Y'),
(4871,776,2025,'1','Februari','Jumat','2025-02-14','Y'),
(4872,777,2025,'1','Februari','Sabtu','2025-02-15','Y'),
(4873,778,2025,'1','Februari','Minggu','2025-02-16','Y'),
(4874,779,2025,'1','Februari','Senin','2025-02-17','Y'),
(4875,780,2025,'1','Februari','Selasa','2025-02-18','Y'),
(4876,781,2025,'1','Februari','Rabu','2025-02-19','Y'),
(4877,782,2025,'1','Februari','Kamis','2025-02-20','Y'),
(4878,783,2025,'1','Februari','Jumat','2025-02-21','Y'),
(4879,784,2025,'1','Februari','Sabtu','2025-02-22','Y'),
(4880,785,2025,'1','Februari','Minggu','2025-02-23','Y'),
(4881,786,2025,'1','Februari','Senin','2025-02-24','Y'),
(4882,787,2025,'1','Februari','Selasa','2025-02-25','Y'),
(4883,788,2025,'1','Februari','Rabu','2025-02-26','Y'),
(4884,789,2025,'1','Februari','Kamis','2025-02-27','Y'),
(4885,790,2025,'1','Februari','Jumat','2025-02-28','Y'),
(4886,791,2025,'1','Maret','Sabtu','2025-03-01','Y'),
(4887,792,2025,'1','Maret','Minggu','2025-03-02','Y'),
(4888,793,2025,'1','Maret','Senin','2025-03-03','Y'),
(4889,794,2025,'1','Maret','Selasa','2025-03-04','Y'),
(4890,795,2025,'1','Maret','Rabu','2025-03-05','Y'),
(4891,796,2025,'1','Maret','Kamis','2025-03-06','Y'),
(4892,797,2025,'1','Maret','Jumat','2025-03-07','Y'),
(4893,798,2025,'1','Maret','Sabtu','2025-03-08','Y'),
(4894,799,2025,'1','Maret','Minggu','2025-03-09','Y'),
(4895,800,2025,'1','Maret','Senin','2025-03-10','Y'),
(4896,801,2025,'1','Maret','Selasa','2025-03-11','Y'),
(4897,802,2025,'1','Maret','Rabu','2025-03-12','Y'),
(4898,803,2025,'1','Maret','Kamis','2025-03-13','Y'),
(4899,804,2025,'1','Maret','Jumat','2025-03-14','Y'),
(4900,805,2025,'1','Maret','Sabtu','2025-03-15','Y'),
(4901,806,2025,'1','Maret','Minggu','2025-03-16','Y'),
(4902,807,2025,'1','Maret','Senin','2025-03-17','Y'),
(4903,808,2025,'1','Maret','Selasa','2025-03-18','Y'),
(4904,809,2025,'1','Maret','Rabu','2025-03-19','Y'),
(4905,810,2025,'1','Maret','Kamis','2025-03-20','Y'),
(4906,811,2025,'1','Maret','Jumat','2025-03-21','Y'),
(4907,812,2025,'1','Maret','Sabtu','2025-03-22','Y'),
(4908,813,2025,'1','Maret','Minggu','2025-03-23','Y'),
(4909,814,2025,'1','Maret','Senin','2025-03-24','Y'),
(4910,815,2025,'1','Maret','Selasa','2025-03-25','Y'),
(4911,816,2025,'1','Maret','Rabu','2025-03-26','Y'),
(4912,817,2025,'1','Maret','Kamis','2025-03-27','Y'),
(4913,818,2025,'1','Maret','Jumat','2025-03-28','Y'),
(4914,819,2025,'1','Maret','Sabtu','2025-03-29','Y'),
(4915,820,2025,'1','Maret','Minggu','2025-03-30','Y'),
(4916,821,2025,'1','Maret','Senin','2025-03-31','Y'),
(4917,822,2025,'2','April','Selasa','2025-04-01','Y'),
(4918,823,2025,'2','April','Rabu','2025-04-02','Y'),
(4919,824,2025,'2','April','Kamis','2025-04-03','Y'),
(4920,825,2025,'2','April','Jumat','2025-04-04','Y'),
(4921,826,2025,'2','April','Sabtu','2025-04-05','Y'),
(4922,827,2025,'2','April','Minggu','2025-04-06','Y'),
(4923,828,2025,'2','April','Senin','2025-04-07','Y'),
(4924,829,2025,'2','April','Selasa','2025-04-08','Y'),
(4925,830,2025,'2','April','Rabu','2025-04-09','Y'),
(4926,831,2025,'2','April','Kamis','2025-04-10','Y'),
(4927,832,2025,'2','April','Jumat','2025-04-11','Y'),
(4928,833,2025,'2','April','Sabtu','2025-04-12','Y'),
(4929,834,2025,'2','April','Minggu','2025-04-13','Y'),
(4930,835,2025,'2','April','Senin','2025-04-14','Y'),
(4931,836,2025,'2','April','Selasa','2025-04-15','Y'),
(4932,837,2025,'2','April','Rabu','2025-04-16','Y'),
(4933,838,2025,'2','April','Kamis','2025-04-17','Y'),
(4934,839,2025,'2','April','Jumat','2025-04-18','Y'),
(4935,840,2025,'2','April','Sabtu','2025-04-19','Y'),
(4936,841,2025,'2','April','Minggu','2025-04-20','Y'),
(4937,842,2025,'2','April','Senin','2025-04-21','Y'),
(4938,843,2025,'2','April','Selasa','2025-04-22','Y'),
(4939,844,2025,'2','April','Rabu','2025-04-23','Y'),
(4940,845,2025,'2','April','Kamis','2025-04-24','Y'),
(4941,846,2025,'2','April','Jumat','2025-04-25','Y'),
(4942,847,2025,'2','April','Sabtu','2025-04-26','Y'),
(4943,848,2025,'2','April','Minggu','2025-04-27','Y'),
(4944,849,2025,'2','April','Senin','2025-04-28','Y'),
(4945,850,2025,'2','April','Selasa','2025-04-29','Y'),
(4946,851,2025,'2','April','Rabu','2025-04-30','Y'),
(4947,852,2025,'2','Mei','Kamis','2025-05-01','Y'),
(4948,853,2025,'2','Mei','Jumat','2025-05-02','Y'),
(4949,854,2025,'2','Mei','Sabtu','2025-05-03','Y'),
(4950,855,2025,'2','Mei','Minggu','2025-05-04','Y'),
(4951,856,2025,'2','Mei','Senin','2025-05-05','Y'),
(4952,857,2025,'2','Mei','Selasa','2025-05-06','Y'),
(4953,858,2025,'2','Mei','Rabu','2025-05-07','Y'),
(4954,859,2025,'2','Mei','Kamis','2025-05-08','Y'),
(4955,860,2025,'2','Mei','Jumat','2025-05-09','Y'),
(4956,861,2025,'2','Mei','Sabtu','2025-05-10','Y'),
(4957,862,2025,'2','Mei','Minggu','2025-05-11','Y'),
(4958,863,2025,'2','Mei','Senin','2025-05-12','Y'),
(4959,864,2025,'2','Mei','Selasa','2025-05-13','Y'),
(4960,865,2025,'2','Mei','Rabu','2025-05-14','Y'),
(4961,866,2025,'2','Mei','Kamis','2025-05-15','Y'),
(4962,867,2025,'2','Mei','Jumat','2025-05-16','Y'),
(4963,868,2025,'2','Mei','Sabtu','2025-05-17','Y'),
(4964,869,2025,'2','Mei','Minggu','2025-05-18','Y'),
(4965,870,2025,'2','Mei','Senin','2025-05-19','Y'),
(4966,871,2025,'2','Mei','Selasa','2025-05-20','Y'),
(4967,872,2025,'2','Mei','Rabu','2025-05-21','Y'),
(4968,873,2025,'2','Mei','Kamis','2025-05-22','Y'),
(4969,874,2025,'2','Mei','Jumat','2025-05-23','Y'),
(4970,875,2025,'2','Mei','Sabtu','2025-05-24','Y'),
(4971,876,2025,'2','Mei','Minggu','2025-05-25','Y'),
(4972,877,2025,'2','Mei','Senin','2025-05-26','Y'),
(4973,878,2025,'2','Mei','Selasa','2025-05-27','Y'),
(4974,879,2025,'2','Mei','Rabu','2025-05-28','Y'),
(4975,880,2025,'2','Mei','Kamis','2025-05-29','Y'),
(4976,881,2025,'2','Mei','Jumat','2025-05-30','Y'),
(4977,882,2025,'2','Mei','Sabtu','2025-05-31','Y'),
(4978,883,2025,'2','Juni','Minggu','2025-06-01','Y'),
(4979,884,2025,'2','Juni','Senin','2025-06-02','Y'),
(4980,885,2025,'2','Juni','Selasa','2025-06-03','Y'),
(4981,886,2025,'2','Juni','Rabu','2025-06-04','Y'),
(4982,887,2025,'2','Juni','Kamis','2025-06-05','Y'),
(4983,888,2025,'2','Juni','Jumat','2025-06-06','Y'),
(4984,889,2025,'2','Juni','Sabtu','2025-06-07','Y'),
(4985,890,2025,'2','Juni','Minggu','2025-06-08','Y'),
(4986,891,2025,'2','Juni','Senin','2025-06-09','Y'),
(4987,892,2025,'2','Juni','Selasa','2025-06-10','Y'),
(4988,893,2025,'2','Juni','Rabu','2025-06-11','Y'),
(4989,894,2025,'2','Juni','Kamis','2025-06-12','Y'),
(4990,895,2025,'2','Juni','Jumat','2025-06-13','Y'),
(4991,896,2025,'2','Juni','Sabtu','2025-06-14','Y'),
(4992,897,2025,'2','Juni','Minggu','2025-06-15','Y'),
(4993,898,2025,'2','Juni','Senin','2025-06-16','Y'),
(4994,899,2025,'2','Juni','Selasa','2025-06-17','Y'),
(4995,900,2025,'2','Juni','Rabu','2025-06-18','Y'),
(4996,901,2025,'2','Juni','Kamis','2025-06-19','Y'),
(4997,902,2025,'2','Juni','Jumat','2025-06-20','Y'),
(4998,903,2025,'2','Juni','Sabtu','2025-06-21','Y'),
(4999,904,2025,'2','Juni','Minggu','2025-06-22','Y'),
(5000,905,2025,'2','Juni','Senin','2025-06-23','Y'),
(5001,906,2025,'2','Juni','Selasa','2025-06-24','Y'),
(5002,907,2025,'2','Juni','Rabu','2025-06-25','Y'),
(5003,908,2025,'2','Juni','Kamis','2025-06-26','Y'),
(5004,909,2025,'2','Juni','Jumat','2025-06-27','Y'),
(5005,910,2025,'2','Juni','Sabtu','2025-06-28','Y'),
(5006,911,2025,'2','Juni','Minggu','2025-06-29','Y'),
(5007,912,2025,'2','Juni','Senin','2025-06-30','Y'),
(5008,913,2025,'3','Juli','Selasa','2025-07-01','Y'),
(5009,914,2025,'3','Juli','Rabu','2025-07-02','Y'),
(5010,915,2025,'3','Juli','Kamis','2025-07-03','Y'),
(5011,916,2025,'3','Juli','Jumat','2025-07-04','Y'),
(5012,917,2025,'3','Juli','Sabtu','2025-07-05','Y'),
(5013,918,2025,'3','Juli','Minggu','2025-07-06','Y'),
(5014,919,2025,'3','Juli','Senin','2025-07-07','Y'),
(5015,920,2025,'3','Juli','Selasa','2025-07-08','Y'),
(5016,921,2025,'3','Juli','Rabu','2025-07-09','Y'),
(5017,922,2025,'3','Juli','Kamis','2025-07-10','Y'),
(5018,923,2025,'3','Juli','Jumat','2025-07-11','Y'),
(5019,924,2025,'3','Juli','Sabtu','2025-07-12','Y'),
(5020,925,2025,'3','Juli','Minggu','2025-07-13','Y'),
(5021,926,2025,'3','Juli','Senin','2025-07-14','Y'),
(5022,927,2025,'3','Juli','Selasa','2025-07-15','Y'),
(5023,928,2025,'3','Juli','Rabu','2025-07-16','Y'),
(5024,929,2025,'3','Juli','Kamis','2025-07-17','Y'),
(5025,930,2025,'3','Juli','Jumat','2025-07-18','Y'),
(5026,931,2025,'3','Juli','Sabtu','2025-07-19','Y'),
(5027,932,2025,'3','Juli','Minggu','2025-07-20','Y'),
(5028,933,2025,'3','Juli','Senin','2025-07-21','Y'),
(5029,934,2025,'3','Juli','Selasa','2025-07-22','Y'),
(5030,935,2025,'3','Juli','Rabu','2025-07-23','Y'),
(5031,936,2025,'3','Juli','Kamis','2025-07-24','Y'),
(5032,937,2025,'3','Juli','Jumat','2025-07-25','Y'),
(5033,938,2025,'3','Juli','Sabtu','2025-07-26','Y'),
(5034,939,2025,'3','Juli','Minggu','2025-07-27','Y'),
(5035,940,2025,'3','Juli','Senin','2025-07-28','Y'),
(5036,941,2025,'3','Juli','Selasa','2025-07-29','Y'),
(5037,942,2025,'3','Juli','Rabu','2025-07-30','Y'),
(5038,943,2025,'3','Juli','Kamis','2025-07-31','Y'),
(5039,944,2025,'3','Agustus','Jumat','2025-08-01','Y'),
(5040,945,2025,'3','Agustus','Sabtu','2025-08-02','Y'),
(5041,946,2025,'3','Agustus','Minggu','2025-08-03','Y'),
(5042,947,2025,'3','Agustus','Senin','2025-08-04','Y'),
(5043,948,2025,'3','Agustus','Selasa','2025-08-05','Y'),
(5044,949,2025,'3','Agustus','Rabu','2025-08-06','Y'),
(5045,950,2025,'3','Agustus','Kamis','2025-08-07','Y'),
(5046,951,2025,'3','Agustus','Jumat','2025-08-08','Y'),
(5047,952,2025,'3','Agustus','Sabtu','2025-08-09','Y'),
(5048,953,2025,'3','Agustus','Minggu','2025-08-10','Y'),
(5049,954,2025,'3','Agustus','Senin','2025-08-11','Y'),
(5050,955,2025,'3','Agustus','Selasa','2025-08-12','Y'),
(5051,956,2025,'3','Agustus','Rabu','2025-08-13','Y'),
(5052,957,2025,'3','Agustus','Kamis','2025-08-14','Y'),
(5053,958,2025,'3','Agustus','Jumat','2025-08-15','Y'),
(5054,959,2025,'3','Agustus','Sabtu','2025-08-16','Y'),
(5055,960,2025,'3','Agustus','Minggu','2025-08-17','Y'),
(5056,961,2025,'3','Agustus','Senin','2025-08-18','Y'),
(5057,962,2025,'3','Agustus','Selasa','2025-08-19','Y'),
(5058,963,2025,'3','Agustus','Rabu','2025-08-20','Y'),
(5059,964,2025,'3','Agustus','Kamis','2025-08-21','Y'),
(5060,965,2025,'3','Agustus','Jumat','2025-08-22','Y'),
(5061,966,2025,'3','Agustus','Sabtu','2025-08-23','Y'),
(5062,967,2025,'3','Agustus','Minggu','2025-08-24','Y'),
(5063,968,2025,'3','Agustus','Senin','2025-08-25','Y'),
(5064,969,2025,'3','Agustus','Selasa','2025-08-26','Y'),
(5065,970,2025,'3','Agustus','Rabu','2025-08-27','Y'),
(5066,971,2025,'3','Agustus','Kamis','2025-08-28','Y'),
(5067,972,2025,'3','Agustus','Jumat','2025-08-29','Y'),
(5068,973,2025,'3','Agustus','Sabtu','2025-08-30','Y'),
(5069,974,2025,'3','Agustus','Minggu','2025-08-31','Y'),
(5070,975,2025,'3','September','Senin','2025-09-01','Y'),
(5071,976,2025,'3','September','Selasa','2025-09-02','Y'),
(5072,977,2025,'3','September','Rabu','2025-09-03','Y'),
(5073,978,2025,'3','September','Kamis','2025-09-04','Y'),
(5074,979,2025,'3','September','Jumat','2025-09-05','Y'),
(5075,980,2025,'3','September','Sabtu','2025-09-06','Y'),
(5076,981,2025,'3','September','Minggu','2025-09-07','Y'),
(5077,982,2025,'3','September','Senin','2025-09-08','Y'),
(5078,983,2025,'3','September','Selasa','2025-09-09','Y'),
(5079,984,2025,'3','September','Rabu','2025-09-10','Y'),
(5080,985,2025,'3','September','Kamis','2025-09-11','Y'),
(5081,986,2025,'3','September','Jumat','2025-09-12','Y'),
(5082,987,2025,'3','September','Sabtu','2025-09-13','Y'),
(5083,988,2025,'3','September','Minggu','2025-09-14','Y'),
(5084,989,2025,'3','September','Senin','2025-09-15','Y'),
(5085,990,2025,'3','September','Selasa','2025-09-16','Y'),
(5086,991,2025,'3','September','Rabu','2025-09-17','Y'),
(5087,992,2025,'3','September','Kamis','2025-09-18','Y'),
(5088,993,2025,'3','September','Jumat','2025-09-19','Y'),
(5089,994,2025,'3','September','Sabtu','2025-09-20','Y'),
(5090,995,2025,'3','September','Minggu','2025-09-21','Y'),
(5091,996,2025,'3','September','Senin','2025-09-22','Y'),
(5092,997,2025,'3','September','Selasa','2025-09-23','Y'),
(5093,998,2025,'3','September','Rabu','2025-09-24','Y'),
(5094,999,2025,'3','September','Kamis','2025-09-25','Y'),
(5095,1000,2025,'3','September','Jumat','2025-09-26','Y'),
(5096,1001,2025,'3','September','Sabtu','2025-09-27','Y'),
(5097,1002,2025,'3','September','Minggu','2025-09-28','Y'),
(5098,1003,2025,'3','September','Senin','2025-09-29','Y'),
(5099,1004,2025,'3','September','Selasa','2025-09-30','Y'),
(5100,1005,2025,'4','Oktober','Rabu','2025-10-01','Y'),
(5101,1006,2025,'4','Oktober','Kamis','2025-10-02','Y'),
(5102,1007,2025,'4','Oktober','Jumat','2025-10-03','Y'),
(5103,1008,2025,'4','Oktober','Sabtu','2025-10-04','Y'),
(5104,1009,2025,'4','Oktober','Minggu','2025-10-05','Y'),
(5105,1010,2025,'4','Oktober','Senin','2025-10-06','Y'),
(5106,1011,2025,'4','Oktober','Selasa','2025-10-07','Y'),
(5107,1012,2025,'4','Oktober','Rabu','2025-10-08','Y'),
(5108,1013,2025,'4','Oktober','Kamis','2025-10-09','Y'),
(5109,1014,2025,'4','Oktober','Jumat','2025-10-10','Y'),
(5110,1015,2025,'4','Oktober','Sabtu','2025-10-11','Y'),
(5111,1016,2025,'4','Oktober','Minggu','2025-10-12','Y'),
(5112,1017,2025,'4','Oktober','Senin','2025-10-13','Y'),
(5113,1018,2025,'4','Oktober','Selasa','2025-10-14','Y'),
(5114,1019,2025,'4','Oktober','Rabu','2025-10-15','Y'),
(5115,1020,2025,'4','Oktober','Kamis','2025-10-16','Y'),
(5116,1021,2025,'4','Oktober','Jumat','2025-10-17','Y'),
(5117,1022,2025,'4','Oktober','Sabtu','2025-10-18','Y'),
(5118,1023,2025,'4','Oktober','Minggu','2025-10-19','Y'),
(5119,1024,2025,'4','Oktober','Senin','2025-10-20','Y'),
(5120,1025,2025,'4','Oktober','Selasa','2025-10-21','Y'),
(5121,1026,2025,'4','Oktober','Rabu','2025-10-22','Y'),
(5122,1027,2025,'4','Oktober','Kamis','2025-10-23','Y'),
(5123,1028,2025,'4','Oktober','Jumat','2025-10-24','Y'),
(5124,1029,2025,'4','Oktober','Sabtu','2025-10-25','Y'),
(5125,1030,2025,'4','Oktober','Minggu','2025-10-26','Y'),
(5126,1031,2025,'4','Oktober','Senin','2025-10-27','Y'),
(5127,1032,2025,'4','Oktober','Selasa','2025-10-28','Y'),
(5128,1033,2025,'4','Oktober','Rabu','2025-10-29','Y'),
(5129,1034,2025,'4','Oktober','Kamis','2025-10-30','Y'),
(5130,1035,2025,'4','Oktober','Jumat','2025-10-31','Y'),
(5131,1036,2025,'4','November','Sabtu','2025-11-01','Y'),
(5132,1037,2025,'4','November','Minggu','2025-11-02','Y'),
(5133,1038,2025,'4','November','Senin','2025-11-03','Y'),
(5134,1039,2025,'4','November','Selasa','2025-11-04','Y'),
(5135,1040,2025,'4','November','Rabu','2025-11-05','Y'),
(5136,1041,2025,'4','November','Kamis','2025-11-06','Y'),
(5137,1042,2025,'4','November','Jumat','2025-11-07','Y'),
(5138,1043,2025,'4','November','Sabtu','2025-11-08','Y'),
(5139,1044,2025,'4','November','Minggu','2025-11-09','Y'),
(5140,1045,2025,'4','November','Senin','2025-11-10','Y'),
(5141,1046,2025,'4','November','Selasa','2025-11-11','Y'),
(5142,1047,2025,'4','November','Rabu','2025-11-12','Y'),
(5143,1048,2025,'4','November','Kamis','2025-11-13','Y'),
(5144,1049,2025,'4','November','Jumat','2025-11-14','Y'),
(5145,1050,2025,'4','November','Sabtu','2025-11-15','Y'),
(5146,1051,2025,'4','November','Minggu','2025-11-16','Y'),
(5147,1052,2025,'4','November','Senin','2025-11-17','Y'),
(5148,1053,2025,'4','November','Selasa','2025-11-18','Y'),
(5149,1054,2025,'4','November','Rabu','2025-11-19','Y'),
(5150,1055,2025,'4','November','Kamis','2025-11-20','Y'),
(5151,1056,2025,'4','November','Jumat','2025-11-21','Y'),
(5152,1057,2025,'4','November','Sabtu','2025-11-22','Y'),
(5153,1058,2025,'4','November','Minggu','2025-11-23','Y'),
(5154,1059,2025,'4','November','Senin','2025-11-24','Y'),
(5155,1060,2025,'4','November','Selasa','2025-11-25','Y'),
(5156,1061,2025,'4','November','Rabu','2025-11-26','Y'),
(5157,1062,2025,'4','November','Kamis','2025-11-27','Y'),
(5158,1063,2025,'4','November','Jumat','2025-11-28','Y'),
(5159,1064,2025,'4','November','Sabtu','2025-11-29','Y'),
(5160,1065,2025,'4','November','Minggu','2025-11-30','Y'),
(5161,1066,2025,'4','Desember','Senin','2025-12-01','Y'),
(5162,1067,2025,'4','Desember','Selasa','2025-12-02','Y'),
(5163,1068,2025,'4','Desember','Rabu','2025-12-03','Y'),
(5164,1069,2025,'4','Desember','Kamis','2025-12-04','Y'),
(5165,1070,2025,'4','Desember','Jumat','2025-12-05','Y'),
(5166,1071,2025,'4','Desember','Sabtu','2025-12-06','Y'),
(5167,1072,2025,'4','Desember','Minggu','2025-12-07','Y'),
(5168,1073,2025,'4','Desember','Senin','2025-12-08','Y'),
(5169,1074,2025,'4','Desember','Selasa','2025-12-09','Y'),
(5170,1075,2025,'4','Desember','Rabu','2025-12-10','Y'),
(5171,1076,2025,'4','Desember','Kamis','2025-12-11','Y'),
(5172,1077,2025,'4','Desember','Jumat','2025-12-12','Y'),
(5173,1078,2025,'4','Desember','Sabtu','2025-12-13','Y'),
(5174,1079,2025,'4','Desember','Minggu','2025-12-14','Y'),
(5175,1080,2025,'4','Desember','Senin','2025-12-15','Y'),
(5176,1081,2025,'4','Desember','Selasa','2025-12-16','Y'),
(5177,1082,2025,'4','Desember','Rabu','2025-12-17','Y'),
(5178,1083,2025,'4','Desember','Kamis','2025-12-18','Y'),
(5179,1084,2025,'4','Desember','Jumat','2025-12-19','Y'),
(5180,1085,2025,'4','Desember','Sabtu','2025-12-20','Y'),
(5181,1086,2025,'4','Desember','Minggu','2025-12-21','Y'),
(5182,1087,2025,'4','Desember','Senin','2025-12-22','Y'),
(5183,1088,2025,'4','Desember','Selasa','2025-12-23','Y'),
(5184,1089,2025,'4','Desember','Rabu','2025-12-24','Y'),
(5185,1090,2025,'4','Desember','Kamis','2025-12-25','Y'),
(5186,1091,2025,'4','Desember','Jumat','2025-12-26','Y'),
(5187,1092,2025,'4','Desember','Sabtu','2025-12-27','Y'),
(5188,1093,2025,'4','Desember','Minggu','2025-12-28','Y'),
(5189,1094,2025,'4','Desember','Senin','2025-12-29','Y'),
(5190,1095,2025,'4','Desember','Selasa','2025-12-30','Y'),
(5191,1096,2025,'4','Desember','Rabu','2025-12-31','Y');

/*Table structure for table `dimensi_wilayah` */

DROP TABLE IF EXISTS `dimensi_wilayah`;

CREATE TABLE `dimensi_wilayah` (
  `row_key_wilayah` int(11) NOT NULL AUTO_INCREMENT,
  `id_wilayah` int(11) DEFAULT NULL,
  `nama_wilayah` varchar(64) DEFAULT NULL,
  `nama_kabupaten` varchar(64) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `valid_awal` date DEFAULT NULL,
  `valid_akhir` date DEFAULT NULL,
  `current_flag` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`row_key_wilayah`),
  UNIQUE KEY `row_key_wilayah` (`row_key_wilayah`,`id_wilayah`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dimensi_wilayah` */

insert  into `dimensi_wilayah`(`row_key_wilayah`,`id_wilayah`,`nama_wilayah`,`nama_kabupaten`,`kode_pos`,`valid_awal`,`valid_akhir`,`current_flag`) values 
(1,1,'Denpasar','Badung','80111','2023-12-18','9999-12-31','Y'),
(2,2,'Kuta','Badung','80361','2023-12-18','9999-12-31','Y'),
(3,3,'Seminyak','Badung','80361','2023-12-18','9999-12-31','Y'),
(4,4,'Bangli','Bangli','80611','2023-12-18','9999-12-31','Y'),
(5,5,'Kintamani','Bangli','80652','2023-12-18','9999-12-31','Y'),
(6,6,'Singaraja','Buleleng','81113','2023-12-18','9999-12-31','Y'),
(7,7,'Lovina','Buleleng','81152','2023-12-18','9999-12-31','Y'),
(8,8,'Ubud','Gianyar','80571','2023-12-18','9999-12-31','Y'),
(9,9,'Gianyar','Gianyar','80511','2023-12-18','9999-12-31','Y'),
(10,10,'Negara','Jembrana','82212','2023-12-18','9999-12-31','Y'),
(11,11,'Melaya','Jembrana','82251','2023-12-18','9999-12-31','Y'),
(12,12,'Amlapura','Karangasem','80811','2023-12-18','9999-12-31','Y'),
(13,13,'Candidasa','Karangasem','80851','2023-12-18','9999-12-31','Y'),
(14,14,'Semarapura','Klungkung','80711','2023-12-18','9999-12-31','Y'),
(15,15,'Nusa Penida','Klungkung','80771','2023-12-18','9999-12-31','Y'),
(16,16,'Tabanan','Tabanan','82111','2023-12-18','9999-12-31','Y'),
(17,17,'Kediri','Tabanan','82121','2023-12-18','9999-12-31','Y');

/*Table structure for table `fakta_pemasokan_pakan` */

DROP TABLE IF EXISTS `fakta_pemasokan_pakan`;

CREATE TABLE `fakta_pemasokan_pakan` (
  `row_key_waktu` int(11) NOT NULL,
  `row_key_kabupaten` int(11) NOT NULL,
  `row_key_provinsi` int(11) NOT NULL,
  `row_key_pemasok_pakan` int(11) NOT NULL,
  `row_key_pegawai` int(11) NOT NULL,
  `row_key_pakan` int(11) NOT NULL,
  `total_pakan` bigint(20) DEFAULT NULL,
  `total_biaya_pemasokan` decimal(10,2) DEFAULT NULL,
  UNIQUE KEY `row_key_waktu` (`row_key_waktu`,`row_key_kabupaten`,`row_key_provinsi`,`row_key_pemasok_pakan`,`row_key_pegawai`,`row_key_pakan`),
  KEY `row_key_kabupaten` (`row_key_kabupaten`),
  KEY `row_key_provinsi` (`row_key_provinsi`),
  KEY `row_key_pemasok_pakan` (`row_key_pemasok_pakan`),
  KEY `row_key_pegawai` (`row_key_pegawai`),
  KEY `row_key_pakan` (`row_key_pakan`),
  CONSTRAINT `fakta_pemasokan_pakan_ibfk_1` FOREIGN KEY (`row_key_waktu`) REFERENCES `dimensi_waktu` (`row_key_waktu`),
  CONSTRAINT `fakta_pemasokan_pakan_ibfk_2` FOREIGN KEY (`row_key_kabupaten`) REFERENCES `dimensi_kabupaten` (`row_key_kabupaten`),
  CONSTRAINT `fakta_pemasokan_pakan_ibfk_3` FOREIGN KEY (`row_key_provinsi`) REFERENCES `dimensi_provinsi` (`row_key_provinsi`),
  CONSTRAINT `fakta_pemasokan_pakan_ibfk_4` FOREIGN KEY (`row_key_pemasok_pakan`) REFERENCES `dimensi_pemasok_pakan` (`row_key_pemasok_pakan`),
  CONSTRAINT `fakta_pemasokan_pakan_ibfk_5` FOREIGN KEY (`row_key_pegawai`) REFERENCES `dimensi_pegawai` (`row_key_pegawai`),
  CONSTRAINT `fakta_pemasokan_pakan_ibfk_6` FOREIGN KEY (`row_key_pakan`) REFERENCES `dimensi_pakan` (`row_key_pakan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fakta_pemasokan_pakan` */

insert  into `fakta_pemasokan_pakan`(`row_key_waktu`,`row_key_kabupaten`,`row_key_provinsi`,`row_key_pemasok_pakan`,`row_key_pegawai`,`row_key_pakan`,`total_pakan`,`total_biaya_pemasokan`) values 
(4096,22,1,15,1,2,10,19863751.30),
(4096,22,1,15,1,3,9,9473368.05),
(4096,22,1,15,1,9,5,7398827.10),
(4097,9,1,25,2,6,3,4459365.99),
(4097,9,1,25,2,7,10,14021431.30),
(4097,9,1,25,2,8,17,9047833.50),
(4098,12,1,5,3,1,15,25421126.85),
(4098,12,1,5,3,3,2,2105192.90),
(4098,12,1,5,3,5,12,8437340.16),
(4099,13,1,30,4,2,4,7945500.52),
(4099,13,1,30,4,4,2,1288416.40),
(4099,13,1,30,4,5,3,2109335.04),
(4099,13,1,30,4,11,5,8722458.25),
(4100,3,16,10,5,10,7,6645009.77),
(4100,3,16,10,5,11,7,12211441.55),
(4100,3,16,10,5,12,17,16462647.85),
(4101,19,1,20,6,4,6,3865249.20),
(4101,19,1,20,6,9,11,16277419.62),
(4102,5,16,35,7,2,4,7945500.52),
(4102,5,16,35,7,6,11,16351008.63),
(4102,5,16,35,7,7,3,4206429.39),
(4103,7,16,8,8,5,3,2109335.04),
(4103,7,16,8,8,10,8,7594296.88),
(4103,7,16,8,8,11,2,3488983.30),
(4104,20,1,18,9,2,9,17877376.17),
(4104,20,1,18,9,6,4,5945821.32),
(4104,20,1,18,9,7,9,12619288.17),
(4105,10,1,28,10,1,11,18642159.69),
(4105,10,1,28,10,4,5,3221041.00),
(4105,10,1,28,10,8,6,3193353.00),
(4106,24,1,38,11,5,7,4921781.76),
(4106,24,1,38,11,6,12,17837463.96),
(4106,24,1,38,11,11,4,6977966.60),
(4107,8,16,12,12,1,10,16947417.90),
(4107,8,16,12,12,8,5,2661127.50),
(4107,8,16,12,12,10,3,2847861.33),
(4108,14,1,22,13,1,8,13557934.32),
(4108,14,1,22,13,2,9,17877376.17),
(4108,14,1,22,13,12,7,6778737.35),
(4109,19,1,33,14,5,6,4218670.08),
(4109,19,1,33,14,7,2,2804286.26),
(4109,19,1,33,14,12,3,2905173.15),
(4110,6,16,3,15,3,8,8420771.60),
(4110,6,16,3,15,9,4,5919061.68),
(4110,6,16,3,15,11,6,10466949.90);

/*Table structure for table `fakta_penjualan_produk_daging` */

DROP TABLE IF EXISTS `fakta_penjualan_produk_daging`;

CREATE TABLE `fakta_penjualan_produk_daging` (
  `row_key_waktu` int(11) NOT NULL,
  `row_key_kabupaten` int(11) NOT NULL,
  `row_key_provinsi` int(11) NOT NULL,
  `row_key_pelanggan` int(11) NOT NULL,
  `row_key_pegawai` int(11) NOT NULL,
  `row_key_produk` int(11) NOT NULL,
  `total_produk` int(11) NOT NULL,
  `total_penjualan_produk` decimal(10,2) DEFAULT NULL,
  UNIQUE KEY `row_key_waktu` (`row_key_waktu`,`row_key_kabupaten`,`row_key_provinsi`,`row_key_pelanggan`,`row_key_pegawai`,`row_key_produk`),
  KEY `row_key_kabupaten` (`row_key_kabupaten`),
  KEY `row_key_provinsi` (`row_key_provinsi`),
  KEY `row_key_pelanggan` (`row_key_pelanggan`),
  KEY `row_key_pegawai` (`row_key_pegawai`),
  KEY `row_key_produk` (`row_key_produk`),
  CONSTRAINT `fakta_penjualan_produk_daging_ibfk_1` FOREIGN KEY (`row_key_waktu`) REFERENCES `dimensi_waktu` (`row_key_waktu`),
  CONSTRAINT `fakta_penjualan_produk_daging_ibfk_2` FOREIGN KEY (`row_key_kabupaten`) REFERENCES `dimensi_kabupaten` (`row_key_kabupaten`),
  CONSTRAINT `fakta_penjualan_produk_daging_ibfk_3` FOREIGN KEY (`row_key_provinsi`) REFERENCES `dimensi_provinsi` (`row_key_provinsi`),
  CONSTRAINT `fakta_penjualan_produk_daging_ibfk_4` FOREIGN KEY (`row_key_pelanggan`) REFERENCES `dimensi_pelanggan` (`row_key_pelanggan`),
  CONSTRAINT `fakta_penjualan_produk_daging_ibfk_5` FOREIGN KEY (`row_key_pegawai`) REFERENCES `dimensi_pegawai` (`row_key_pegawai`),
  CONSTRAINT `fakta_penjualan_produk_daging_ibfk_6` FOREIGN KEY (`row_key_produk`) REFERENCES `dimensi_produk` (`row_key_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fakta_penjualan_produk_daging` */

insert  into `fakta_penjualan_produk_daging`(`row_key_waktu`,`row_key_kabupaten`,`row_key_provinsi`,`row_key_pelanggan`,`row_key_pegawai`,`row_key_produk`,`total_produk`,`total_penjualan_produk`) values 
(4100,99,6,15,7,3,5,1100000.00),
(4107,86,5,25,14,8,10,1750000.00),
(4129,23,1,8,3,1,7,1400000.00),
(4141,58,2,40,22,5,3,450000.00),
(4156,12,1,12,8,12,8,1520000.00),
(4172,30,1,5,2,9,6,930000.00),
(4192,49,2,30,18,2,4,720000.00),
(4207,29,1,20,11,11,2,340000.00),
(4216,28,1,45,30,7,9,1440000.00),
(4227,17,1,10,5,4,5,950000.00),
(4249,52,2,35,23,6,12,1920000.00),
(4266,87,5,18,9,10,3,555000.00),
(4284,45,2,3,1,1,8,1600000.00),
(4312,64,3,14,6,9,4,620000.00),
(4325,20,1,28,17,2,10,1800000.00),
(4340,58,2,7,4,8,7,1225000.00),
(4353,76,4,42,27,3,2,440000.00),
(4369,4,16,16,10,11,5,850000.00),
(4382,69,3,33,21,12,9,1710000.00),
(4402,51,2,23,12,4,6,1140000.00),
(4430,37,2,9,5,10,8,1480000.00),
(4443,25,1,38,24,6,4,640000.00),
(4457,78,4,19,11,1,11,2200000.00),
(4465,90,5,2,1,5,7,1050000.00),
(4478,85,5,27,16,8,5,875000.00),
(4494,89,5,6,3,2,9,1620000.00),
(4506,31,2,43,29,12,3,570000.00),
(4522,99,6,15,7,11,6,1020000.00),
(4538,19,1,31,19,3,4,880000.00),
(4558,9,1,21,13,7,10,1600000.00),
(4573,64,3,46,31,1,8,1600000.00),
(4582,72,3,11,6,4,2,380000.00),
(4593,23,1,36,24,10,7,1295000.00),
(4615,20,1,17,8,9,5,775000.00),
(4632,45,2,32,20,6,11,1760000.00),
(4650,88,5,24,14,5,3,450000.00),
(4678,40,2,13,7,8,6,1050000.00),
(4691,42,2,29,18,11,4,680000.00),
(4706,23,1,8,4,1,10,2000000.00),
(4719,24,1,44,30,12,7,1330000.00),
(4735,29,1,20,11,7,2,320000.00),
(4748,13,1,34,22,3,8,1760000.00),
(4768,55,2,22,12,9,5,775000.00),
(4796,17,1,10,5,5,12,1800000.00),
(4809,47,2,39,25,2,4,720000.00),
(4823,87,5,18,11,11,7,1190000.00);

/* Function  structure for function  `func_capitalisasi` */

/*!50003 DROP FUNCTION IF EXISTS `func_capitalisasi` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `func_capitalisasi`(input VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN DECLARE len INT;

DECLARE i INT;

SET
	len = CHAR_LENGTH(input);

SET
	input = LOWER(input);

SET
	i = 0;

WHILE (i < len) DO IF (
	MID(input, i, 1) = ' '
	OR i = 0
) THEN IF (i < len) THEN
SET
	input = CONCAT(
		LEFT(input, i),
		UPPER(MID(input, i + 1, 1)),
		RIGHT(input, len - i - 1)
	);

END IF;

END IF;

SET
	i = i + 1;

END WHILE;

RETURN input;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_kabupaten` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_kabupaten` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_kabupaten`()
BEGIN DROP TABLE IF EXISTS stg_kabupaten;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_kabupaten
SELECT
	k.id_kabupaten AS id_kabupaten,
	-- CASE
	-- 	WHEN k.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
	-- 	WHEN k.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
	-- 	WHEN k.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
	-- 	WHEN k.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
	-- 	WHEN k.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
	-- 	WHEN k.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
	-- 	WHEN k.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
	-- 	WHEN k.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
	-- END AS nama_kabupaten,
	-- CASE
	-- 	WHEN p.nama_provinsi LIKE 'b%l%i' THEN 'Bali'
	-- 	WHEN p.nama_provinsi LIKE 'j%w%t%r' THEN 'Jawa Timur'
	-- 	WHEN p.nama_provinsi LIKE 'j%w%t%n%h' THEN 'Jawa Tengah'
	-- 	WHEN p.nama_provinsi LIKE 'y%g%a' THEN 'Yogyakarta'
	-- 	WHEN p.nama_provinsi LIKE 'j%w%b%r%t' THEN 'Jawa Barat'
	-- 	WHEN p.nama_provinsi LIKE 'a%c%h' THEN 'Aceh'
	-- 	WHEN p.nama_provinsi LIKE 'k%l%t%r' THEN 'Kalimantan Timur'
	-- 	WHEN p.nama_provinsi LIKE 'k%l%b%r%t' THEN 'Kalimantan Barat'
	-- END AS nama_provinsi
	COALESCE(
		CASE
			WHEN k.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
			WHEN k.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
			WHEN k.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
			WHEN k.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
			WHEN k.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
			WHEN k.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
			WHEN k.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
			WHEN k.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
			ELSE k.nama_kabupaten
		END,
		k.nama_kabupaten
	) AS nama_kabupaten,
	COALESCE(
		CASE
			WHEN p.nama_provinsi LIKE 'b%l%i' THEN 'Bali'
			WHEN p.nama_provinsi LIKE 'j%w%t%r' THEN 'Jawa Timur'
			WHEN p.nama_provinsi LIKE 'j%w%t%n%h' THEN 'Jawa Tengah'
			WHEN p.nama_provinsi LIKE 'y%g%a' THEN 'Yogyakarta'
			WHEN p.nama_provinsi LIKE 'j%w%b%r%t' THEN 'Jawa Barat'
			WHEN p.nama_provinsi LIKE 'a%c%h' THEN 'Aceh'
			WHEN p.nama_provinsi LIKE 'k%l%t%r' THEN 'Kalimantan Timur'
			WHEN p.nama_provinsi LIKE 'k%l%b%r%t' THEN 'Kalimantan Barat'
			ELSE p.nama_provinsi
		END,
		p.nama_provinsi
	) AS nama_provinsi
FROM
	dbt_peternakan_sapi_wagyu.tb_kabupaten AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_kabupaten (
		id_kabupaten,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_kabupaten,
	k.nama_kabupaten,
	k.nama_provinsi,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	RIGHT JOIN stg_kabupaten AS k ON IFNULL(kdw.id_kabupaten, '-1') = IFNULL(k.id_kabupaten, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_kabupaten IS NULL
GROUP BY
	k.id_kabupaten
ORDER BY
	k.id_kabupaten ASC;

DROP TABLE IF EXISTS temp_kabupaten;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_kabupaten
SELECT
	kdw.row_key_kabupaten,
	kdw.id_kabupaten
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	JOIN stg_kabupaten AS k ON kdw.id_kabupaten = k.id_kabupaten
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_kabupaten, '') <> IFNULL(k.nama_kabupaten, '')
	OR IFNULL(kdw.nama_provinsi, '') <> IFNULL(k.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_kabupaten AS kdw,
	temp_kabupaten
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_kabupaten = temp_kabupaten.row_key_kabupaten
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_kabupaten (
		id_kabupaten,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_kabupaten,
	k.nama_kabupaten,
	k.nama_provinsi,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	JOIN stg_kabupaten AS k ON kdw.id_kabupaten = k.id_kabupaten
WHERE
	k.id_kabupaten IN (
		SELECT
			DISTINCT id_kabupaten
		FROM
			temp_kabupaten
	)
GROUP BY
	k.id_kabupaten
ORDER BY
	k.id_kabupaten ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_kabupaten;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_kabupaten
SELECT
	kdw.row_key_kabupaten,
	kdw.id_kabupaten
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	LEFT JOIN stg_kabupaten AS k ON kdw.id_kabupaten = k.id_kabupaten
WHERE
	k.id_kabupaten IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_kabupaten AS kdw,
	temp_kabupaten
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_kabupaten = temp_kabupaten.row_key_kabupaten
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_kabupaten;

DROP TABLE IF EXISTS temp_kabupaten;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_pakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_pakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_pakan`()
BEGIN DROP TABLE IF EXISTS stg_pakan;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_pakan
SELECT
	k.id_pakan AS id_pakan,
	p.nama_jenis_pakan AS nama_jenis_pakan,
	k.nama_pakan AS nama_pakan,
	k.kualitas_pakan AS kualitas_pakan,
	k.harga_pakan AS harga_pakan
FROM
	dbt_peternakan_sapi_wagyu.tb_pakan AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_jenis_pakan AS p ON p.id_jenis_pakan = k.id_jenis_pakan;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_pakan (
		id_pakan,
		nama_pakan,
		kualitas_pakan,
		harga_pakan,
		nama_jenis_pakan,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_pakan,
	k.nama_pakan,
	k.kualitas_pakan,
	k.harga_pakan,
	k.nama_jenis_pakan,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	RIGHT JOIN stg_pakan AS k ON IFNULL(kdw.id_pakan, '-1') = IFNULL(k.id_pakan, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_pakan IS NULL
GROUP BY
	k.id_pakan
ORDER BY
	k.id_pakan ASC;

DROP TABLE IF EXISTS temp_pakan;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pakan
SELECT
	kdw.row_key_pakan,
	kdw.id_pakan
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	JOIN stg_pakan AS k ON kdw.id_pakan = k.id_pakan
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_pakan, '') <> IFNULL(k.nama_pakan, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_pakan AS kdw,
	temp_pakan
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_pakan = temp_pakan.row_key_pakan
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_pakan (
		id_pakan,
		nama_pakan,
		kualitas_pakan,
		harga_pakan,
		nama_jenis_pakan,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_pakan,
	k.nama_pakan,
	k.kualitas_pakan,
	k.harga_pakan,
	k.nama_jenis_pakan,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	JOIN stg_pakan AS k ON kdw.id_pakan = k.id_pakan
WHERE
	k.id_pakan IN (
		SELECT
			DISTINCT id_pakan
		FROM
			temp_pakan
	)
GROUP BY
	k.id_pakan
ORDER BY
	k.id_pakan ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pakan;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pakan
SELECT
	kdw.row_key_pakan,
	kdw.id_pakan
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	LEFT JOIN stg_pakan AS k ON kdw.id_pakan = k.id_pakan
WHERE
	k.id_pakan IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_pakan AS kdw,
	temp_pakan
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_pakan = temp_pakan.row_key_pakan
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pakan;

DROP TABLE IF EXISTS temp_pakan;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_pegawai` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_pegawai` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_pegawai`()
BEGIN DROP TABLE IF EXISTS stg_pegawai;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_pegawai
SELECT
	pg.id_pegawai AS id_pegawai,
	func_capitalisasi(pg.nama_pegawai) AS nama_pegawai,
	pg.alamat_pegawai AS alamat_pegawai,
	pg.nomor_telepon_pegawai AS nomor_telepon_pegawai,
	pg.email_pegawai AS email_pegawai,
	COALESCE(
		CASE
			WHEN k.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
			WHEN k.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
			WHEN k.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
			WHEN k.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
			WHEN k.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
			WHEN k.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
			WHEN k.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
			WHEN k.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
			WHEN k.nama_kabupaten LIKE 's%b%y%' THEN 'Surabaya'
			WHEN k.nama_kabupaten LIKE 'k%t%n' THEN 'Klaten'
		END,
		k.nama_kabupaten
	) AS nama_kabupaten,
	COALESCE(
		CASE
			WHEN p.nama_provinsi LIKE 'b%l%i' THEN 'Bali'
			WHEN p.nama_provinsi LIKE 'j%w%t%r' THEN 'Jawa Timur'
			WHEN p.nama_provinsi LIKE 'j%w%t%n%h' THEN 'Jawa Tengah'
			WHEN p.nama_provinsi LIKE 'y%g%a' THEN 'Yogyakarta'
			WHEN p.nama_provinsi LIKE 'j%w%b%r%t' THEN 'Jawa Barat'
			WHEN p.nama_provinsi LIKE 'a%c%h' THEN 'Aceh'
			WHEN p.nama_provinsi LIKE 'k%l%t%r' THEN 'Kalimantan Timur'
			WHEN p.nama_provinsi LIKE 'k%l%b%r%t' THEN 'Kalimantan Barat'
		END,
		p.nama_provinsi
	) AS nama_provinsi
FROM
	dbt_peternakan_sapi_wagyu.tb_pegawai AS pg
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS k ON k.id_kabupaten = pg.id_kabupaten
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_pegawai (
		id_pegawai,
		nama_pegawai,
		nomor_telepon_pegawai,
		email_pegawai,
		alamat_pegawai,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	pg.id_pegawai,
	pg.nama_pegawai,
	pg.nomor_telepon_pegawai,
	pg.email_pegawai,
	pg.alamat_pegawai,
	pg.nama_kabupaten,
	pg.nama_provinsi,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	RIGHT JOIN stg_pegawai AS pg ON IFNULL(pgdw.id_pegawai, '-1') = IFNULL(pg.id_pegawai, '-1')
	AND pgdw.current_flag = 'Y'
WHERE
	pgdw.id_pegawai IS NULL
GROUP BY
	pg.id_pegawai
ORDER BY
	pg.id_pegawai ASC;

DROP TABLE IF EXISTS temp_pegawai;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pegawai
SELECT
	pgdw.row_key_pegawai,
	pgdw.id_pegawai
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	JOIN stg_pegawai AS pg ON pgdw.id_pegawai = pg.id_pegawai
	AND pgdw.current_flag = 'Y'
WHERE
	IFNULL(pgdw.nama_pegawai, '') <> IFNULL(pg.nama_pegawai, '')
	OR IFNULL(pgdw.nomor_telepon_pegawai, '') <> IFNULL(pg.nomor_telepon_pegawai, '')
	OR IFNULL(pgdw.alamat_pegawai, '') <> IFNULL(pg.alamat_pegawai, '')
	OR IFNULL(pgdw.nama_kabupaten, '') <> IFNULL(pg.nama_kabupaten, '')
	OR IFNULL(pgdw.nama_provinsi, '') <> IFNULL(pg.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_pegawai AS pgdw,
	temp_pegawai
SET
	pgdw.current_flag = 'N',
	pgdw.valid_akhir = CURDATE()
WHERE
	pgdw.row_key_pegawai = temp_pegawai.row_key_pegawai
	AND pgdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_pegawai (
		id_pegawai,
		nama_pegawai,
		nomor_telepon_pegawai,
		alamat_pegawai,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	pg.id_pegawai,
	pg.nama_pegawai,
	pg.nomor_telepon_pegawai,
	pg.alamat_pegawai,
	pg.nama_kabupaten,
	pg.nama_provinsi,
	pgdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	JOIN stg_pegawai AS pg ON pgdw.id_pegawai = pg.id_pegawai
WHERE
	pg.id_pegawai IN (
		SELECT
			DISTINCT id_pegawai
		FROM
			temp_pegawai
	)
GROUP BY
	pg.id_pegawai
ORDER BY
	pg.id_pegawai ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pegawai;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pegawai
SELECT
	pgdw.row_key_pegawai,
	pgdw.id_pegawai
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	LEFT JOIN stg_pegawai AS pg ON pgdw.id_pegawai = pg.id_pegawai
WHERE
	pg.id_pegawai IS NULL
	AND pgdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_pegawai AS pgdw,
	temp_pegawai
SET
	pgdw.current_flag = 'N',
	pgdw.valid_akhir = CURDATE()
WHERE
	pgdw.row_key_pegawai = temp_pegawai.row_key_pegawai
	AND pgdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pegawai;

DROP TABLE IF EXISTS temp_pegawai;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_pelanggan` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_pelanggan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_pelanggan`()
BEGIN DROP TABLE IF EXISTS stg_pelanggan;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_pelanggan
SELECT
  pg.id_pelanggan AS id_pelanggan,
  func_capitalisasi(pg.nama_pelanggan) AS nama_pelanggan,
  pg.alamat_pelanggan AS alamat_pelanggan,
  pg.nomor_telepon_pelanggan AS nomor_telepon_pelanggan,
  pg.email_pelanggan AS email_pelanggan,
  COALESCE(
    CASE
      WHEN k.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
      WHEN k.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
      WHEN k.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
      WHEN k.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
      WHEN k.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
      WHEN k.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
      WHEN k.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
      WHEN k.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
      WHEN k.nama_kabupaten LIKE 's%b%y%' THEN 'Surabaya'
      WHEN k.nama_kabupaten LIKE 'k%t%n' THEN 'Klaten'
    END,
    k.nama_kabupaten
  ) AS nama_kabupaten,
  COALESCE(
    CASE
      WHEN p.nama_provinsi LIKE 'b%l%i' THEN 'Bali'
      WHEN p.nama_provinsi LIKE 'j%w%t%r' THEN 'Jawa Timur'
      WHEN p.nama_provinsi LIKE 'j%w%t%n%h' THEN 'Jawa Tengah'
      WHEN p.nama_provinsi LIKE 'y%g%a' THEN 'Yogyakarta'
      WHEN p.nama_provinsi LIKE 'j%w%b%r%t' THEN 'Jawa Barat'
      WHEN p.nama_provinsi LIKE 'a%c%h' THEN 'Aceh'
      WHEN p.nama_provinsi LIKE 'k%l%t%r' THEN 'Kalimantan Timur'
      WHEN p.nama_provinsi LIKE 'k%l%b%r%t' THEN 'Kalimantan Barat'
    END,
    p.nama_provinsi
  ) AS nama_provinsi
FROM
  dbt_peternakan_sapi_wagyu.tb_pelanggan AS pg
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS k ON k.id_kabupaten = pg.id_kabupaten
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
  dimensi_pelanggan (
    id_pelanggan,
    nama_pelanggan,
    nomor_telepon_pelanggan,
    email_pelanggan,
    alamat_pelanggan,
    nama_kabupaten,
    nama_provinsi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  pg.id_pelanggan,
  pg.nama_pelanggan,
  pg.nomor_telepon_pelanggan,
  pg.email_pelanggan,
  pg.alamat_pelanggan,
  pg.nama_kabupaten,
  pg.nama_provinsi,
  CURDATE(),
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  RIGHT JOIN stg_pelanggan AS pg ON IFNULL(pgdw.id_pelanggan, '-1') = IFNULL(pg.id_pelanggan, '-1')
  AND pgdw.current_flag = 'Y'
WHERE
  pgdw.id_pelanggan IS NULL
GROUP BY
  pg.id_pelanggan
ORDER BY
  pg.id_pelanggan ASC;

DROP TABLE IF EXISTS temp_pelanggan;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pelanggan
SELECT
  pgdw.row_key_pelanggan,
  pgdw.id_pelanggan
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  JOIN stg_pelanggan AS pg ON pgdw.id_pelanggan = pg.id_pelanggan
  AND pgdw.current_flag = 'Y'
WHERE
  IFNULL(pgdw.nama_pelanggan, '') <> IFNULL(pg.nama_pelanggan, '')
  OR IFNULL(pgdw.nomor_telepon_pelanggan, '') <> IFNULL(pg.nomor_telepon_pelanggan, '')
  OR IFNULL(pgdw.alamat_pelanggan, '') <> IFNULL(pg.alamat_pelanggan, '')
  OR IFNULL(pgdw.nama_kabupaten, '') <> IFNULL(pg.nama_kabupaten, '')
  OR IFNULL(pgdw.nama_provinsi, '') <> IFNULL(pg.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
  dimensi_pelanggan AS pgdw,
  temp_pelanggan
SET
  pgdw.current_flag = 'N',
  pgdw.valid_akhir = CURDATE()
WHERE
  pgdw.row_key_pelanggan = temp_pelanggan.row_key_pelanggan
  AND pgdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
  dimensi_pelanggan (
    id_pelanggan,
    nama_pelanggan,
    nomor_telepon_pelanggan,
    alamat_pelanggan,
    nama_kabupaten,
    nama_provinsi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  pg.id_pelanggan,
  pg.nama_pelanggan,
  pg.nomor_telepon_pelanggan,
  pg.alamat_pelanggan,
  pg.nama_kabupaten,
  pg.nama_provinsi,
  pgdw.valid_akhir,
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  JOIN stg_pelanggan AS pg ON pgdw.id_pelanggan = pg.id_pelanggan
WHERE
  pg.id_pelanggan IN (
    SELECT
      DISTINCT id_pelanggan
    FROM
      temp_pelanggan
  )
GROUP BY
  pg.id_pelanggan
ORDER BY
  pg.id_pelanggan ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pelanggan;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pelanggan
SELECT
  pgdw.row_key_pelanggan,
  pgdw.id_pelanggan
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  LEFT JOIN stg_pelanggan AS pg ON pgdw.id_pelanggan = pg.id_pelanggan
WHERE
  pg.id_pelanggan IS NULL
  AND pgdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
  dimensi_pelanggan AS pgdw,
  temp_pelanggan
SET
  pgdw.current_flag = 'N',
  pgdw.valid_akhir = CURDATE()
WHERE
  pgdw.row_key_pelanggan = temp_pelanggan.row_key_pelanggan
  AND pgdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pelanggan;

DROP TABLE IF EXISTS temp_pelanggan;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_pemasok_pakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_pemasok_pakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_pemasok_pakan`()
BEGIN DROP TABLE IF EXISTS stg_pemasok_pakan;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_pemasok_pakan
SELECT
    pg.id_pemasok_pakan AS id_pemasok_pakan,
    func_capitalisasi(pg.nama_pemasok_pakan) AS nama_pemasok_pakan,
    pg.alamat_pemasok_pakan AS alamat_pemasok_pakan,
    pg.no_telepon_pemasok_pakan AS no_telepon_pemasok_pakan,
    pg.email_pemasok_pakan AS email_pemasok_pakan,
    COALESCE(
        CASE
            WHEN k.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
            WHEN k.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
            WHEN k.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
            WHEN k.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
            WHEN k.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
            WHEN k.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
            WHEN k.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
            WHEN k.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
            WHEN k.nama_kabupaten LIKE 's%b%y%' THEN 'Surabaya'
            WHEN k.nama_kabupaten LIKE 'k%t%n' THEN 'Klaten'
        END,
        k.nama_kabupaten
    ) AS nama_kabupaten,
    COALESCE(
        CASE
            WHEN p.nama_provinsi LIKE 'b%l%i' THEN 'Bali'
            WHEN p.nama_provinsi LIKE 'j%w%t%r' THEN 'Jawa Timur'
            WHEN p.nama_provinsi LIKE 'j%w%t%n%h' THEN 'Jawa Tengah'
            WHEN p.nama_provinsi LIKE 'y%g%a' THEN 'Yogyakarta'
            WHEN p.nama_provinsi LIKE 'j%w%b%r%t' THEN 'Jawa Barat'
            WHEN p.nama_provinsi LIKE 'a%c%h' THEN 'Aceh'
            WHEN p.nama_provinsi LIKE 'k%l%t%r' THEN 'Kalimantan Timur'
            WHEN p.nama_provinsi LIKE 'k%l%b%r%t' THEN 'Kalimantan Barat'
        END,
        p.nama_provinsi
    ) AS nama_provinsi
FROM
    dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS pg
    INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS k ON k.id_kabupaten = pg.id_kabupaten
    INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
    dimensi_pemasok_pakan (
        id_pemasok_pakan,
        nama_pemasok_pakan,
        nomor_telepon_pemasok_pakan,
        email_pemasok_pakan,
        alamat_pemasok_pakan,
        nama_kabupaten,
        nama_provinsi,
        valid_awal,
        valid_akhir,
        current_flag
    )
SELECT
    pg.id_pemasok_pakan,
    pg.nama_pemasok_pakan,
    pg.no_telepon_pemasok_pakan,
    pg.email_pemasok_pakan,
    pg.alamat_pemasok_pakan,
    pg.nama_kabupaten,
    pg.nama_provinsi,
    CURDATE(),
    '9999-12-31',
    'Y'
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    RIGHT JOIN stg_pemasok_pakan AS pg ON IFNULL(pgdw.id_pemasok_pakan, '-1') = IFNULL(pg.id_pemasok_pakan, '-1')
    AND pgdw.current_flag = 'Y'
WHERE
    pgdw.id_pemasok_pakan IS NULL
GROUP BY
    pg.id_pemasok_pakan
ORDER BY
    pg.id_pemasok_pakan ASC;

DROP TABLE IF EXISTS temp_pemasok_pakan;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pemasok_pakan
SELECT
    pgdw.row_key_pemasok_pakan,
    pgdw.id_pemasok_pakan
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    JOIN stg_pemasok_pakan AS pg ON pgdw.id_pemasok_pakan = pg.id_pemasok_pakan
    AND pgdw.current_flag = 'Y'
WHERE
    IFNULL(pgdw.nama_pemasok_pakan, '') <> IFNULL(pg.nama_pemasok_pakan, '')
    OR IFNULL(pgdw.nomor_telepon_pemasok_pakan, '') <> IFNULL(pg.no_telepon_pemasok_pakan, '')
    OR IFNULL(pgdw.alamat_pemasok_pakan, '') <> IFNULL(pg.alamat_pemasok_pakan, '')
    OR IFNULL(pgdw.nama_kabupaten, '') <> IFNULL(pg.nama_kabupaten, '')
    OR IFNULL(pgdw.nama_provinsi, '') <> IFNULL(pg.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
    dimensi_pemasok_pakan AS pgdw,
    temp_pemasok_pakan
SET
    pgdw.current_flag = 'N',
    pgdw.valid_akhir = CURDATE()
WHERE
    pgdw.row_key_pemasok_pakan = temp_pemasok_pakan.row_key_pemasok_pakan
    AND pgdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
    dimensi_pemasok_pakan (
        id_pemasok_pakan,
        nama_pemasok_pakan,
        nomor_telepon_pemasok_pakan,
        alamat_pemasok_pakan,
        nama_kabupaten,
        nama_provinsi,
        valid_awal,
        valid_akhir,
        current_flag
    )
SELECT
    pg.id_pemasok_pakan,
    pg.nama_pemasok_pakan,
    pg.no_telepon_pemasok_pakan,
    pg.alamat_pemasok_pakan,
    pg.nama_kabupaten,
    pg.nama_provinsi,
    pgdw.valid_akhir,
    '9999-12-31',
    'Y'
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    JOIN stg_pemasok_pakan AS pg ON pgdw.id_pemasok_pakan = pg.id_pemasok_pakan
WHERE
    pg.id_pemasok_pakan IN (
        SELECT
            DISTINCT id_pemasok_pakan
        FROM
            temp_pemasok_pakan
    )
GROUP BY
    pg.id_pemasok_pakan
ORDER BY
    pg.id_pemasok_pakan ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pemasok_pakan;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pemasok_pakan
SELECT
    pgdw.row_key_pemasok_pakan,
    pgdw.id_pemasok_pakan
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    LEFT JOIN stg_pemasok_pakan AS pg ON pgdw.id_pemasok_pakan = pg.id_pemasok_pakan
WHERE
    pg.id_pemasok_pakan IS NULL
    AND pgdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
    dimensi_pemasok_pakan AS pgdw,
    temp_pemasok_pakan
SET
    pgdw.current_flag = 'N',
    pgdw.valid_akhir = CURDATE()
WHERE
    pgdw.row_key_pemasok_pakan = temp_pemasok_pakan.row_key_pemasok_pakan
    AND pgdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pemasok_pakan;

DROP TABLE IF EXISTS temp_pemasok_pakan;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_produk` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_produk` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_produk`()
BEGIN -- Membuat tabel staging untuk data produk daging
DROP TABLE IF EXISTS stg_produk;

CREATE TEMPORARY TABLE stg_produk
SELECT
  produk.id_produk_daging AS id_produk_daging,
  produk.id_sapi_wagyu AS id_sapi_wagyu,
  produk.nama_produk AS nama_produk,
  produk.grade_produk AS grade_produk,
  produk.marbling_daging AS marbling_daging,
  produk.warna_daging AS warna_daging,
  produk.tekstur_daging AS tekstur_daging,
  produk.harga_per_kg AS harga,
  ras.nama_ras_sapi AS nama_ras_sapi,
  'Y' AS current_flag
FROM
  dbt_peternakan_sapi_wagyu.tb_produk_daging AS produk
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_sapi_wagyu AS sapi ON sapi.id_sapi_wagyu = produk.id_sapi_wagyu
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_ras_sapi_wagyu AS ras ON ras.id_ras_sapi = sapi.id_ras_sapi;

-- Memasukkan data baru ke dalam dimensi produk daging
INSERT INTO
  dimensi_produk (
    id_produk_daging,
    id_sapi,
    nama_produk,
    grade_produk,
    harga_produk,
    nama_ras_sapi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  k.id_produk_daging,
  k.id_sapi_wagyu,
  k.nama_produk,
  k.grade_produk,
  k.harga,
  k.nama_ras_sapi,
  CURDATE(),
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS kdw
  RIGHT JOIN stg_produk AS k ON IFNULL(kdw.id_produk_daging, '-1') = IFNULL(k.id_produk_daging, '-1')
  AND kdw.current_flag = 'Y'
WHERE
  kdw.id_produk_daging IS NULL
GROUP BY
  k.id_produk_daging
ORDER BY
  k.id_produk_daging ASC;

DROP TABLE IF EXISTS temp_produk;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_produk
SELECT
  dp.row_key_produk,
  dp.id_produk_daging
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS dp
  JOIN stg_produk AS k ON dp.id_produk_daging = k.id_produk_daging
  AND dp.current_flag = 'Y'
WHERE
  IFNULL(dp.nama_produk, '') <> IFNULL(k.nama_produk, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
  dimensi_produk AS dp,
  temp_produk
SET
  dp.current_flag = 'N',
  dp.valid_akhir = CURDATE()
WHERE
  dp.row_key_produk = temp_produk.row_key_produk
  AND dp.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
  dimensi_produk (
    id_produk_daging,
    id_sapi,
    nama_produk,
    grade_produk,
    harga_produk,
    nama_ras_sapi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  k.id_produk_daging,
  k.id_sapi_wagyu,
  k.nama_produk,
  k.grade_produk,
  k.harga,
  k.nama_ras_sapi,
  kdw.valid_akhir,
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS kdw
  JOIN stg_produk AS k ON kdw.id_produk_daging = k.id_produk_daging
WHERE
  k.id_produk_daging IN (
    SELECT
      DISTINCT id_produk_daging
    FROM
      temp_produk
  )
GROUP BY
  k.id_produk_daging
ORDER BY
  k.id_produk_daging ASC;

DROP TABLE IF EXISTS temp_produk;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_produk
SELECT
  kdw.row_key_produk,
  kdw.id_produk_daging
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS kdw
  LEFT JOIN stg_produk AS k ON kdw.id_produk_daging = k.id_produk_daging
WHERE
  k.id_produk_daging IS NULL
  AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
  dimensi_produk AS kdw,
  temp_produk
SET
  kdw.current_flag = 'N',
  kdw.valid_akhir = CURDATE()
WHERE
  kdw.row_key_produk = temp_produk.row_key_produk
  AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_produk;

DROP TABLE IF EXISTS temp_produk;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_provinsi` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_provinsi` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_provinsi`()
BEGIN DROP TABLE IF EXISTS stg_provinsi;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_provinsi
SELECT
	p.id_provinsi AS id_provinsi,
	COALESCE(
		CASE
			WHEN p.nama_provinsi LIKE 'b%l%i' THEN 'Bali'
			WHEN p.nama_provinsi LIKE 'j%w%t%r' THEN 'Jawa Timur'
			WHEN p.nama_provinsi LIKE 'j%w%t%n%h' THEN 'Jawa Tengah'
			WHEN p.nama_provinsi LIKE 'y%g%a' THEN 'Yogyakarta'
			WHEN p.nama_provinsi LIKE 'j%w%b%r%t' THEN 'Jawa Barat'
			WHEN p.nama_provinsi LIKE 'a%c%h' THEN 'Aceh'
			WHEN p.nama_provinsi LIKE 'k%l%t%r' THEN 'Kalimantan Timur'
			WHEN p.nama_provinsi LIKE 'k%l%b%r%t' THEN 'Kalimantan Barat'
		END,
		p.nama_provinsi
	) AS nama_provinsi
FROM
	dbt_peternakan_sapi_wagyu.tb_provinsi AS p;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_provinsi (
		id_provinsi,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	p.id_provinsi,
	p.nama_provinsi,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	RIGHT JOIN stg_provinsi AS p ON IFNULL(pdw.id_provinsi, '-1') = IFNULL(p.id_provinsi, '-1')
	AND pdw.current_flag = 'Y'
WHERE
	pdw.id_provinsi IS NULL
GROUP BY
	p.id_provinsi
ORDER BY
	p.id_provinsi ASC;

DROP TABLE IF EXISTS temp_provinsi;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_provinsi
SELECT
	pdw.row_key_provinsi,
	pdw.id_provinsi
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	JOIN stg_provinsi AS p ON pdw.id_provinsi = p.id_provinsi
	AND pdw.current_flag = 'Y'
WHERE
	IFNULL(pdw.nama_provinsi, '') <> IFNULL(p.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_provinsi AS pdw,
	temp_provinsi
SET
	pdw.current_flag = 'N',
	pdw.valid_akhir = CURDATE()
WHERE
	pdw.row_key_provinsi = temp_provinsi.row_key_provinsi
	AND pdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_provinsi (
		id_provinsi,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	p.id_provinsi,
	p.nama_provinsi,
	pdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	JOIN stg_provinsi AS p ON pdw.id_provinsi = p.id_provinsi
WHERE
	p.id_provinsi IN (
		SELECT
			DISTINCT id_provinsi
		FROM
			temp_provinsi
	)
GROUP BY
	p.id_provinsi
ORDER BY
	p.id_provinsi ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_provinsi;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_provinsi
SELECT
	pdw.row_key_provinsi,
	pdw.id_provinsi
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	LEFT JOIN stg_provinsi AS p ON pdw.id_provinsi = p.id_provinsi
WHERE
	p.id_provinsi IS NULL
	AND pdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_provinsi AS pdw,
	temp_provinsi
SET
	pdw.current_flag = 'N',
	pdw.valid_akhir = CURDATE()
WHERE
	pdw.row_key_provinsi = temp_provinsi.row_key_provinsi
	AND pdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_provinsi;

DROP TABLE IF EXISTS temp_provinsi;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_sapi` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_sapi` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_sapi`()
BEGIN DROP TABLE IF EXISTS stg_sapi_wagyu;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_sapi_wagyu
SELECT
	k.id_sapi_wagyu AS id_sapi_wagyu,
	k.nama_sapi_wagyu AS nama_sapi_wagyu,
	k.umur_sapi AS umur_sapi,
	k.berat_sapi AS berat_sapi,
	k.riwayat_kesehatan_sapi AS riwayat_kesehatan_sapi,
	k.data_genetik_sapi AS data_genetik_sapi,
	p.nama_ras_sapi AS nama_ras_sapi,
	pd.marbling_daging AS marbling_daging,
	pd.warna_daging AS warna_daging,
	pd.tekstur_daging AS tekstur_daging
FROM
	dbt_peternakan_sapi_wagyu.tb_sapi_wagyu AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_ras_sapi_wagyu AS p ON p.id_ras_sapi = k.id_ras_sapi
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging as pd ON pd.id_sapi_wagyu = k.id_sapi_wagyu;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_sapi (
		id_sapi_wagyu,
		nama_sapi_wagyu,
		nama_ras_sapi,
		umur_sapi,
		berat_sapi,
		riwayat_kesehatan_sapi,
		data_genetik_sapi,
		marbling_daging,
		warna_daging,
		tekstur_daging,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_sapi_wagyu,
	k.nama_sapi_wagyu,
	k.nama_ras_sapi,
	k.umur_sapi,
	k.berat_sapi,
	k.riwayat_kesehatan_sapi,
	k.data_genetik_sapi,
	k.marbling_daging,
	k.warna_daging,
	k.tekstur_daging,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	RIGHT JOIN stg_sapi_wagyu AS k ON IFNULL(kdw.id_sapi_wagyu, '-1') = IFNULL(k.id_sapi_wagyu, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_sapi_wagyu IS NULL
GROUP BY
	k.id_sapi_wagyu
ORDER BY
	k.id_sapi_wagyu ASC;

DROP TABLE IF EXISTS temp_sapi_wagyu;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_sapi_wagyu
SELECT
	kdw.row_key_sapi,
	kdw.id_sapi_wagyu
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	JOIN stg_sapi_wagyu AS k ON kdw.id_sapi_wagyu = k.id_sapi_wagyu
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_sapi_wagyu, '') <> IFNULL(k.nama_sapi_wagyu, '')
	OR IFNULL(kdw.nama_ras_sapi, '') <> IFNULL(k.nama_ras_sapi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_sapi AS kdw,
	temp_sapi_wagyu
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_sapi = temp_sapi_wagyu.row_key_sapi
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_sapi (
		id_sapi_wagyu,
		nama_sapi_wagyu,
		nama_ras_sapi,
		umur_sapi,
		berat_sapi,
		riwayat_kesehatan_sapi,
		data_genetik_sapi,
		marbling_daging,
		warna_daging,
		tekstur_daging,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_sapi_wagyu,
	k.nama_sapi_wagyu,
	k.nama_ras_sapi,
	k.umur_sapi,
	k.berat_sapi,
	k.riwayat_kesehatan_sapi,
	k.data_genetik_sapi,
	k.marbling_daging,
	k.warna_daging,
	k.tekstur_daging,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	JOIN stg_sapi_wagyu AS k ON kdw.id_sapi_wagyu = k.id_sapi_wagyu
WHERE
	k.id_sapi_wagyu IN (
		SELECT
			DISTINCT id_sapi_wagyu
		FROM
			temp_sapi_wagyu
	)
GROUP BY
	k.id_sapi_wagyu
ORDER BY
	k.id_sapi_wagyu ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_sapi_wagyu;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_sapi_wagyu
SELECT
	kdw.row_key_sapi,
	kdw.id_sapi_wagyu
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	LEFT JOIN stg_sapi_wagyu AS k ON kdw.id_sapi_wagyu = k.id_sapi_wagyu
WHERE
	k.id_sapi_wagyu IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_sapi AS kdw,
	temp_sapi_wagyu
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_sapi = temp_sapi_wagyu.row_key_sapi
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_sapi_wagyu;

DROP TABLE IF EXISTS temp_sapi_wagyu;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_waktu_pertgl` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_waktu_pertgl` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_waktu_pertgl`(IN tgl_awal DATE, IN tgl_akhir DATE)
BEGIN
SET
	@counterLoop := 1;

SET
	@endCounterLoop := DATEDIFF(tgl_akhir, tgl_awal) + 1;

SET
	@tglawal = tgl_awal;

SET
	@tahunAwal = YEAR(tgl_awal);

SET
	@tahunAkhir = YEAR(tgl_akhir);

DROP TABLE IF EXISTS temp_waktu;

-- membuat tabel temp untuk memproduksi data waktu
CREATE TEMPORARY TABLE temp_waktu(id_waktu INT, tanggal DATE);

-- loop untuk memproduksi data waktu sebanyak parameter tanggal
read_loop: LOOP IF @counterLoop > @endCounterLoop THEN LEAVE read_loop;

ELSE
INSERT INTO
	temp_waktu(id_waktu, tanggal)
VALUES
	(
		@counterLoop,
		@tglawal + INTERVAL (@counterLoop -1) DAY
	);

SET
	@counterLoop := @counterLoop + 1;

END IF;

END LOOP;

-- memperbaharui data waktu yang lama jika menginputkan tanggal yang baru
UPDATE
	dimensi_waktu AS wtdw,
	temp_waktu
SET
	wtdw.current_flag = 'N'
WHERE
	wtdw.current_flag = 'Y'
	AND temp_waktu.tanggal <> wtdw.tanggal;

-- memperbaharui data waktu yang lama jika menginputkan tanggal yang lama
UPDATE
	dimensi_waktu AS wtdw,
	temp_waktu
SET
	wtdw.current_flag = 'Y'
WHERE
	wtdw.current_flag = 'N'
	AND temp_waktu.tanggal = wtdw.tanggal;

-- memasukkan data waktu baru ke dalam tabel dimensional
INSERT INTO
	dimensi_waktu (
		id_waktu,
		tahun,
		kuartal,
		bulan,
		hari,
		tanggal,
		current_flag
	)
SELECT
	temp_waktu.id_waktu,
	DATE_FORMAT(tanggal, "%Y"),
	QUARTER(tanggal),
	CASE
		MONTH(tanggal)
		WHEN 1 THEN 'Januari'
		WHEN 2 THEN 'Februari'
		WHEN 3 THEN 'Maret'
		WHEN 4 THEN 'April'
		WHEN 5 THEN 'Mei'
		WHEN 6 THEN 'Juni'
		WHEN 7 THEN 'Juli'
		WHEN 8 THEN 'Agustus'
		WHEN 9 THEN 'September'
		WHEN 10 THEN 'Oktober'
		WHEN 11 THEN 'November'
		WHEN 12 THEN 'Desember'
	END,
	CASE
		DAYOFWEEK(tanggal)
		WHEN 1 THEN 'Minggu'
		WHEN 2 THEN 'Senin'
		WHEN 3 THEN 'Selasa'
		WHEN 4 THEN 'Rabu'
		WHEN 5 THEN 'Kamis'
		WHEN 6 THEN 'Jumat'
		WHEN 7 THEN 'Sabtu'
	END,
	temp_waktu.tanggal,
	'Y'
FROM
	temp_waktu ON DUPLICATE KEY
UPDATE
	dimensi_waktu.id_waktu = dimensi_waktu.id_waktu;

-- drop tabel temp
DROP TABLE IF EXISTS temp_waktu;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_dimensi_wilayah` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_dimensi_wilayah` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_dimensi_wilayah`()
BEGIN DROP TABLE IF EXISTS stg_wilayah;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_wilayah
SELECT
	k.id_wilayah_penjualan AS id_wilayah,
	k.nama_wilayah AS nama_wilayah,
	COALESCE(
		CASE
			WHEN p.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
			WHEN p.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
			WHEN p.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
			WHEN p.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
			WHEN p.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
			WHEN p.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
			WHEN p.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
			WHEN p.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
			ELSE p.nama_kabupaten
		END,
		p.nama_kabupaten
	) AS nama_kabupaten,
	k.kode_pos AS kode_pos
FROM
	dbt_peternakan_sapi_wagyu.tb_wilayah_penjualan AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS p ON p.id_kabupaten = k.id_kabupaten;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_wilayah (
		id_wilayah,
		nama_wilayah,
		nama_kabupaten,
		kode_pos,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_wilayah,
	k.nama_wilayah,
	k.nama_kabupaten,
	k.kode_pos,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	RIGHT JOIN stg_wilayah AS k ON IFNULL(kdw.id_wilayah, '-1') = IFNULL(k.id_wilayah, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_wilayah IS NULL
GROUP BY
	k.id_wilayah
ORDER BY
	k.id_wilayah ASC;

DROP TABLE IF EXISTS temp_wilayah;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_wilayah
SELECT
	kdw.row_key_wilayah,
	kdw.id_wilayah
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	JOIN stg_wilayah AS k ON kdw.id_wilayah = k.id_wilayah
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_wilayah, '') <> IFNULL(k.nama_wilayah, '')
	OR IFNULL(kdw.nama_kabupaten, '') <> IFNULL(k.nama_kabupaten, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_wilayah AS kdw,
	temp_wilayah
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_wilayah = temp_wilayah.row_key_wilayah
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_wilayah (
		id_wilayah,
		nama_wilayah,
		nama_kabupaten,
		kode_pos,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_wilayah,
	k.nama_wilayah,
	k.nama_kabupaten,
	k.kode_pos,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	JOIN stg_wilayah AS k ON kdw.id_wilayah = k.id_wilayah
WHERE
	k.id_wilayah IN (
		SELECT
			DISTINCT id_wilayah
		FROM
			temp_wilayah
	)
GROUP BY
	k.id_wilayah
ORDER BY
	k.id_wilayah ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_wilayah;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_wilayah
SELECT
	kdw.row_key_wilayah,
	kdw.id_wilayah
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	LEFT JOIN stg_wilayah AS k ON kdw.id_wilayah = k.id_wilayah
WHERE
	k.id_wilayah IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_wilayah AS kdw,
	temp_wilayah
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_wilayah = temp_wilayah.row_key_wilayah
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_wilayah;

DROP TABLE IF EXISTS temp_wilayah;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_fakta_pemasokan` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_fakta_pemasokan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_fakta_pemasokan`()
BEGIN
INSERT INTO
	fakta_pemasokan (
		row_key_waktu,
		row_key_kabupaten,
		row_key_provinsi,
		row_key_pemasok_pakan,
		row_key_pegawai,
		row_key_pakan,
		total_pakan,
		total_biaya_pemasokan
	)
SELECT
	wtdw.row_key_waktu,
	kdw.row_key_kabupaten,
	pdw.row_key_provinsi,
	spdw.row_key_pemasok_pakan,
	pgdw.row_key_pegawai,
	adw.row_key_pakan,
	SUM(pasd.jumlah_pasok),
	SUM(pasd.harga_beli * pasd.jumlah_pasok)
FROM
	dbt_peternakan_sapi_wagyu.tb_pemasokan_pakan AS pemasokan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_detail_pemasokan AS det_pasokan ON pasd.id_pasokan_pakan = pas.id_pasokan_pakan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pakan AS pakan ON pakan.id_pakan = det_pasokan.id_pakan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS pemasok ON pemasok.id_pemasok_pakan = pemasokan.id_pemasok_pakan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS kabupaten ON kabupaten.id_kabupaten = pemasok.id_kabupaten
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS provinsi ON provinsi.id_provinsi = kabupaten.id_provinsi
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pegawai AS pegawai ON pegawai.id_pegawai = pemasokan.id_pegawai
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_waktu AS dim_waktu ON dim_waktu.tanggal = pemasokan.tanggal_pasok
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS dim_kabupaten ON dim_kabupaten.id_kabupaten = kabupaten.id_kabupaten
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_provinsi AS dim_provinsi ON dim_provinsi.id_provinsi = provinsi.id_provinsi
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS dim_pemasok ON dim_pemasok.id_pemasok_pakan = pemasok.id_pemasok_pakan
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pegawai AS dim_pegawai ON dim_pegawai.id_pegawai = pegawai.id_pegawai
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pakan AS dim_pakan ON dim_pakan.id_pakan = pakan.id_pakan
WHERE
	dim_waktu.current_flag = 'Y'
	AND dim_kabupaten.current_flag = 'Y'
	AND dim_provinsi.current_flag = 'Y'
	AND dim_pemasok.current_flag = 'Y'
	AND dim_pegawai.current_flag = 'Y'
	AND dim_pakan.current_flag = 'Y'
GROUP BY
	pemasokan.tgl_pasok,
	kabupaten.id_kabupaten,
	provinsi.id_provinsi,
	pemasokan.id_pemasok_pakan,
	pemasokan.id_pegawai,
	det_pasokan.id_pakan
ORDER BY
	pemasokan.tgl_pasok,
	kabupaten.id_kabupaten,
	provinsi.id_provinsi,
	pemasokan.id_pemasok_pakan,
	pemasokan.id_pegawai,
	det_pasokan.id_pakan ON DUPLICATE KEY
UPDATE
	fakta_pemasokan.row_key_waktu = fakta_pemasokan.row_key_waktu;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_fakta_pemasokan_pakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_fakta_pemasokan_pakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_fakta_pemasokan_pakan`()
BEGIN
INSERT INTO
	fakta_pemasokan_pakan (
		row_key_waktu,
		row_key_kabupaten,
		row_key_provinsi,
		row_key_pemasok_pakan,
		row_key_pegawai,
		row_key_pakan,
		total_pakan,
		total_biaya_pemasokan
	)
SELECT
	dim_waktu.row_key_waktu,
	dim_kabupaten.row_key_kabupaten,
	dim_provinsi.row_key_provinsi,
	dim_pemasok.row_key_pemasok_pakan,
	dim_pegawai.row_key_pegawai,
	dim_pakan.row_key_pakan,
	SUM(det_pasokan.jumlah_pasokan_pakan),
	SUM(det_pasokan.total_harga_pakan)
FROM
	dbt_peternakan_sapi_wagyu.tb_pemasokan_pakan AS pemasokan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_detail_pemasokan_pakan AS det_pasokan ON det_pasokan.id_pasokan_pakan = pemasokan.id_pasokan_pakan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pakan AS pakan ON pakan.id_pakan = det_pasokan.id_pakan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS pemasok ON pemasok.id_pemasok_pakan = pemasokan.id_pemasok_pakan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS kabupaten ON kabupaten.id_kabupaten = pemasok.id_kabupaten
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS provinsi ON provinsi.id_provinsi = kabupaten.id_provinsi
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pegawai AS pegawai ON pegawai.id_pegawai = pemasokan.id_pegawai
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_waktu AS dim_waktu ON dim_waktu.tanggal = DATE(pemasokan.tanggal_pasok)
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS dim_kabupaten ON dim_kabupaten.id_kabupaten = kabupaten.id_kabupaten
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_provinsi AS dim_provinsi ON dim_provinsi.id_provinsi = provinsi.id_provinsi
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS dim_pemasok ON dim_pemasok.id_pemasok_pakan = pemasok.id_pemasok_pakan
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pegawai AS dim_pegawai ON dim_pegawai.id_pegawai = pegawai.id_pegawai
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pakan AS dim_pakan ON dim_pakan.id_pakan = pakan.id_pakan
WHERE
	dim_waktu.current_flag = 'Y'
	AND dim_kabupaten.current_flag = 'Y'
	AND dim_provinsi.current_flag = 'Y'
	AND dim_pemasok.current_flag = 'Y'
	AND dim_pegawai.current_flag = 'Y'
	AND dim_pakan.current_flag = 'Y'
GROUP BY
	DATE(pemasokan.tanggal_pasok),
	kabupaten.id_kabupaten,
	provinsi.id_provinsi,
	pemasokan.id_pemasok_pakan,
	pemasokan.id_pegawai,
	det_pasokan.id_pakan
ORDER BY
	pemasokan.tanggal_pasok,
	kabupaten.id_kabupaten,
	provinsi.id_provinsi,
	pemasokan.id_pemasok_pakan,
	pemasokan.id_pegawai,
	det_pasokan.id_pakan ON DUPLICATE KEY
UPDATE
	fakta_pemasokan_pakan.row_key_waktu = fakta_pemasokan_pakan.row_key_waktu;

END */$$
DELIMITER ;

/* Procedure structure for procedure `procs_fakta_penjualan_produk_daging` */

/*!50003 DROP PROCEDURE IF EXISTS  `procs_fakta_penjualan_produk_daging` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procs_fakta_penjualan_produk_daging`()
BEGIN
INSERT INTO
	fakta_penjualan_produk_daging (
		row_key_waktu,
		row_key_kabupaten,
		row_key_provinsi,
		row_key_pelanggan,
		row_key_pegawai,
		row_key_produk,
		total_produk,
		total_penjualan_produk
	)
SELECT
	dim_waktu.row_key_waktu,
	dim_kabupaten.row_key_kabupaten,
	dim_provinsi.row_key_provinsi,
	dim_pelanggan.row_key_pelanggan,
	dim_pegawai.row_key_pegawai,
	dim_produk.row_key_produk,
	SUM(det_penjualan.jumlah_produk_terjual),
	SUM(det_penjualan.total_harga_pesan)
FROM
	dbt_peternakan_sapi_wagyu.tb_transaksi_daging AS penjualan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_detail_transaksi_daging AS det_penjualan ON det_penjualan.id_transaksi_daging = penjualan.id_transaksi_daging
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging AS produk ON produk.id_produk_daging = det_penjualan.id_produk_daging
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pelanggan AS pelanggan ON pelanggan.id_pelanggan = penjualan.id_pelanggan
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS kabupaten ON kabupaten.id_kabupaten = pelanggan.id_kabupaten
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS provinsi ON provinsi.id_provinsi = kabupaten.id_provinsi
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_pegawai AS pegawai ON pegawai.id_pegawai = penjualan.id_pegawai
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_waktu AS dim_waktu ON dim_waktu.tanggal = DATE(penjualan.tanggal_transaksi)
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS dim_kabupaten ON dim_kabupaten.id_kabupaten = kabupaten.id_kabupaten
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_provinsi AS dim_provinsi ON dim_provinsi.id_provinsi = provinsi.id_provinsi
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS dim_pelanggan ON dim_pelanggan.id_pelanggan = pelanggan.id_pelanggan
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pegawai AS dim_pegawai ON dim_pegawai.id_pegawai = pegawai.id_pegawai
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_produk AS dim_produk ON dim_produk.id_produk_daging = produk.id_produk_daging
WHERE
	dim_waktu.current_flag = 'Y'
	AND dim_kabupaten.current_flag = 'Y'
	AND dim_provinsi.current_flag = 'Y'
	AND dim_pelanggan.current_flag = 'Y'
	AND dim_pegawai.current_flag = 'Y'
	AND dim_produk.current_flag = 'Y'
GROUP BY
	DATE(penjualan.tanggal_transaksi),
	kabupaten.id_kabupaten,
	provinsi.id_provinsi,
	penjualan.id_pelanggan,
	penjualan.id_pegawai,
	det_penjualan.id_produk_daging
ORDER BY
	penjualan.tanggal_transaksi,
	kabupaten.id_kabupaten,
	provinsi.id_provinsi,
	penjualan.id_pelanggan,
	penjualan.id_pegawai,
	det_penjualan.id_produk_daging ON DUPLICATE KEY
UPDATE
	fakta_penjualan_produk_daging.row_key_waktu = fakta_penjualan_produk_daging.row_key_waktu;

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
