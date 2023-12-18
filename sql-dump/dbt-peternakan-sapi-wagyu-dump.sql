/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - dbt_peternakan_sapi_wagyu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbt_peternakan_sapi_wagyu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dbt_peternakan_sapi_wagyu`;

/*Table structure for table `tb_detail_pemasokan_pakan` */

DROP TABLE IF EXISTS `tb_detail_pemasokan_pakan`;

CREATE TABLE `tb_detail_pemasokan_pakan` (
  `id_detail_pasokan_pakan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasokan_pakan` int(11) DEFAULT NULL,
  `id_pakan` int(11) DEFAULT NULL,
  `jumlah_pasokan_pakan` int(11) DEFAULT NULL,
  `total_harga_pakan` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detail_pasokan_pakan`),
  KEY `id_pasokan_pakan` (`id_pasokan_pakan`),
  KEY `id_pakan` (`id_pakan`),
  CONSTRAINT `tb_detail_pemasokan_pakan_ibfk_1` FOREIGN KEY (`id_pasokan_pakan`) REFERENCES `tb_pasokan_pakan` (`id_pasokan_pakan`),
  CONSTRAINT `tb_detail_pemasokan_pakan_ibfk_2` FOREIGN KEY (`id_pakan`) REFERENCES `tb_pakan` (`id_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_detail_pemasokan_pakan` */

insert  into `tb_detail_pemasokan_pakan`(`id_detail_pasokan_pakan`,`id_pasokan_pakan`,`id_pakan`,`jumlah_pasokan_pakan`,`total_harga_pakan`) values 
(1,1,3,5,5262982.25),
(2,2,8,10,5322255.00),
(3,3,1,7,11863192.53),
(4,4,5,3,2109335.04),
(5,5,12,8,7747128.40),
(6,6,9,6,8878592.52),
(7,7,2,4,7945500.52),
(8,8,11,2,3488983.30),
(9,9,7,9,12619288.17),
(10,10,4,5,3221041.00),
(11,11,6,12,17837463.96),
(12,12,10,3,2847861.33),
(13,13,1,8,13557934.32),
(14,14,5,6,4218670.08),
(15,15,9,4,5919061.68),
(16,1,2,10,19863751.30),
(17,2,8,7,3725578.50),
(18,3,3,2,2105192.90),
(19,4,11,5,8722458.25),
(20,5,12,9,8715519.45),
(21,6,4,6,3865249.20),
(22,7,7,3,4206429.39),
(23,8,10,8,7594296.88),
(24,9,6,4,5945821.32),
(25,10,1,11,18642159.69),
(26,11,5,7,4921781.76),
(27,12,8,5,2661127.50),
(28,13,2,9,17877376.17),
(29,14,12,3,2905173.15),
(30,15,11,6,10466949.90),
(31,1,3,4,4210385.80),
(32,2,7,10,14021431.30),
(33,3,1,8,13557934.32),
(34,4,4,2,1288416.40),
(35,5,10,7,6645009.77),
(36,6,9,5,7398827.10),
(37,7,6,11,16351008.63),
(38,8,5,3,2109335.04),
(39,9,2,9,17877376.17),
(40,10,8,6,3193353.00),
(41,11,11,4,6977966.60),
(42,12,1,10,16947417.90),
(43,13,12,7,6778737.35),
(44,14,7,2,2804286.26),
(45,15,3,8,8420771.60),
(46,1,9,5,7398827.10),
(47,2,6,3,4459365.99),
(48,3,5,12,8437340.16),
(49,4,2,4,7945500.52),
(50,5,11,7,12211441.55);

/*Table structure for table `tb_detail_transaksi_daging` */

DROP TABLE IF EXISTS `tb_detail_transaksi_daging`;

CREATE TABLE `tb_detail_transaksi_daging` (
  `id_detail_transaksi_daging` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi_daging` int(11) DEFAULT NULL,
  `id_produk_daging` int(11) DEFAULT NULL,
  `jumlah_produk_terjual` decimal(10,2) DEFAULT NULL,
  `total_harga_pesan` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi_daging`),
  KEY `id_transaksi_daging` (`id_transaksi_daging`),
  KEY `id_produk_daging` (`id_produk_daging`),
  CONSTRAINT `tb_detail_transaksi_daging_ibfk_1` FOREIGN KEY (`id_transaksi_daging`) REFERENCES `tb_transaksi_daging` (`id_transaksi_daging`),
  CONSTRAINT `tb_detail_transaksi_daging_ibfk_2` FOREIGN KEY (`id_produk_daging`) REFERENCES `tb_produk_daging` (`id_produk_daging`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_detail_transaksi_daging` */

insert  into `tb_detail_transaksi_daging`(`id_detail_transaksi_daging`,`id_transaksi_daging`,`id_produk_daging`,`jumlah_produk_terjual`,`total_harga_pesan`) values 
(1,1,3,5.00,1100000.00),
(2,2,8,10.00,1750000.00),
(3,3,1,7.00,1400000.00),
(4,4,5,3.00,450000.00),
(5,5,12,8.00,1520000.00),
(6,6,9,6.00,930000.00),
(7,7,2,4.00,720000.00),
(8,8,11,2.00,340000.00),
(9,9,7,9.00,1440000.00),
(10,10,4,5.00,950000.00),
(11,11,6,12.00,1920000.00),
(12,12,10,3.00,555000.00),
(13,13,1,8.00,1600000.00),
(14,14,5,6.00,900000.00),
(15,15,9,4.00,620000.00),
(16,16,2,10.00,1800000.00),
(17,17,8,7.00,1225000.00),
(18,18,3,2.00,440000.00),
(19,19,11,5.00,850000.00),
(20,20,12,9.00,1710000.00),
(21,21,4,6.00,1140000.00),
(22,22,7,3.00,480000.00),
(23,23,10,8.00,1480000.00),
(24,24,6,4.00,640000.00),
(25,25,1,11.00,2200000.00),
(26,26,5,7.00,1050000.00),
(27,27,8,5.00,875000.00),
(28,28,2,9.00,1620000.00),
(29,29,12,3.00,570000.00),
(30,30,11,6.00,1020000.00),
(31,31,3,4.00,880000.00),
(32,32,7,10.00,1600000.00),
(33,33,1,8.00,1600000.00),
(34,34,4,2.00,380000.00),
(35,35,10,7.00,1295000.00),
(36,36,9,5.00,775000.00),
(37,37,6,11.00,1760000.00),
(38,38,5,3.00,450000.00),
(39,39,2,9.00,1620000.00),
(40,40,8,6.00,1050000.00),
(41,41,11,4.00,680000.00),
(42,42,1,10.00,2000000.00),
(43,43,12,7.00,1330000.00),
(44,44,7,2.00,320000.00),
(45,45,3,8.00,1760000.00),
(46,46,9,5.00,775000.00),
(47,47,6,3.00,480000.00),
(48,48,5,12.00,1800000.00),
(49,49,2,4.00,720000.00),
(50,50,11,7.00,1190000.00);

/*Table structure for table `tb_jenis_pakan` */

DROP TABLE IF EXISTS `tb_jenis_pakan`;

CREATE TABLE `tb_jenis_pakan` (
  `id_jenis_pakan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis_pakan` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_jenis_pakan` */

insert  into `tb_jenis_pakan`(`id_jenis_pakan`,`nama_jenis_pakan`) values 
(1,'Premium Wagyu Feed'),
(2,'High-Quality Wagyu Pellets'),
(3,'Wagyu Grain Mix'),
(4,'Select Wagyu Forage'),
(5,'Wagyu Nutrition Blend'),
(6,'Quality Wagyu Supplement'),
(7,'Wagyu Balanced Diet'),
(8,'Grade A Wagyu Hay'),
(9,'Wagyu Prime Forage'),
(10,'Elite Wagyu Feed Blend'),
(11,'Wagyu Growth Formula'),
(12,'Wagyu Performance Pellets'),
(13,'Optimal Wagyu Nutrition'),
(14,'Premium Wagyu Diet Mix'),
(15,'Superior Wagyu Forage'),
(16,'Wagyu Essence Blend'),
(17,'Pure Wagyu Nutrition'),
(18,'Top-Grade Wagyu Feed'),
(19,'Ultimate Wagyu Forage'),
(20,'Premium Wagyu Nutrition');

/*Table structure for table `tb_kabupaten` */

DROP TABLE IF EXISTS `tb_kabupaten`;

CREATE TABLE `tb_kabupaten` (
  `id_kabupaten` int(11) NOT NULL AUTO_INCREMENT,
  `id_provinsi` int(11) DEFAULT NULL,
  `nama_kabupaten` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_kabupaten`),
  KEY `id_provinsi` (`id_provinsi`),
  CONSTRAINT `tb_kabupaten_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `tb_provinsi` (`id_provinsi`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_kabupaten` */

insert  into `tb_kabupaten`(`id_kabupaten`,`id_provinsi`,`nama_kabupaten`) values 
(1,16,'Badung'),
(2,16,'Bangli'),
(3,16,'Buleleng'),
(4,16,'Gianyar'),
(5,16,'Jembrana'),
(6,16,'Karangasem'),
(7,16,'Klungkung'),
(8,16,'Tabanan'),
(9,1,'Aceh Barat'),
(10,1,'Aceh Barat Daya'),
(11,1,'Aceh Besar'),
(12,1,'Aceh Jaya'),
(13,1,'Aceh Selatan'),
(14,1,'Aceh Singkil'),
(15,1,'Aceh Tamiang'),
(16,1,'Aceh Tengah'),
(17,1,'Aceh Tenggara'),
(18,1,'Aceh Timur'),
(19,1,'Aceh Utara'),
(20,1,'Bener Meriah'),
(21,1,'Bireuen'),
(22,1,'Gayo Lues'),
(23,1,'Langsa'),
(24,1,'Lhokseumawe'),
(25,1,'Nagan Raya'),
(26,1,'Pidie'),
(27,1,'Pidie Jaya'),
(28,1,'Sabang'),
(29,1,'Simeulue'),
(30,1,'Subulussalam'),
(31,2,'Asahan'),
(32,2,'Batu Bara'),
(33,2,'Binjai'),
(34,2,'Dairi'),
(35,2,'Deli Serdang'),
(36,2,'Gunungsitoli'),
(37,2,'Humbang Hasundutan'),
(38,2,'Karo'),
(39,2,'Labuhan Batu'),
(40,2,'Labuhan Batu Selatan'),
(41,2,'Labuhan Batu Utara'),
(42,2,'Langkat'),
(43,2,'Mandailing Natal'),
(44,2,'Medan'),
(45,2,'Nias'),
(46,2,'Nias Barat'),
(47,2,'Nias Selatan'),
(48,2,'Nias Utara'),
(49,2,'Padang Lawas'),
(50,2,'Padang Lawas Utara'),
(51,2,'Pakpak Bharat'),
(52,2,'Pematang Siantar'),
(53,2,'Samosir'),
(54,2,'Sibolga'),
(55,2,'Simalungun'),
(56,2,'Tanjung Balai'),
(57,2,'Tapanuli Selatan'),
(58,2,'Tapanuli Tengah'),
(59,2,'Tapanuli Utara'),
(60,2,'Tebing Tinggi'),
(61,3,'Agam'),
(62,3,'Dharmasraya'),
(63,3,'Kepulauan Mentawai'),
(64,3,'Lima Puluh Kota'),
(65,3,'Padang'),
(66,3,'Padang Panjang'),
(67,3,'Pariaman'),
(68,3,'Pasaman'),
(69,3,'Pasaman Barat'),
(70,3,'Payakumbuh'),
(71,3,'Sawahlunto'),
(72,3,'Solok'),
(73,3,'Solok Selatan'),
(74,3,'Tanah Datar'),
(75,4,'Bengkalis'),
(76,4,'Indragiri Hilir'),
(77,4,'Indragiri Hulu'),
(78,4,'Kampar'),
(79,4,'Kepulauan Meranti'),
(80,4,'Pelalawan'),
(81,4,'Rokan Hilir'),
(82,4,'Rokan Hulu'),
(83,4,'Siak'),
(84,5,'Bungo'),
(85,5,'Jambi'),
(86,5,'Kerinci'),
(87,5,'Merangin'),
(88,5,'Muaro Jambi'),
(89,5,'Sarolangun'),
(90,5,'Tanjung Jabung Barat'),
(91,5,'Tanjung Jabung Timur'),
(92,5,'Tebo'),
(93,6,'Ogan Komering Ulu'),
(94,6,'Ogan Komering Ilir'),
(95,6,'Muara Enim'),
(96,6,'Lahat'),
(97,6,'Musi Rawas'),
(98,6,'Musi Banyuasin'),
(99,6,'Banyuasin'),
(100,6,'Ogan Komering Ulu Selatan'),
(101,6,'Ogan Komering Ulu Timur'),
(102,6,'Ogan Ilir'),
(103,6,'Empat Lawang'),
(104,6,'Penukal Abab Lematang Ilir'),
(105,6,'Musi Rawas Utara'),
(106,6,'Musi Rawas Timur'),
(107,6,'Musi Banyuasin'),
(108,6,'Musi Banyuasin Timur'),
(109,6,'Banyuasin'),
(110,6,'Banyuasin Timur'),
(111,6,'Banyuasin Selatan'),
(112,6,'Banyuasin Tengah'),
(113,6,'Ogan Komering Ulu Selatan'),
(114,6,'Ogan Komering Ulu Timur'),
(115,6,'Ogan Ilir'),
(116,6,'Ogan Komering Ulu Selatan'),
(117,6,'Ogan Komering Ulu Timur'),
(118,7,'Bengkulu Selatan'),
(119,7,'Bengkulu Tengah'),
(120,7,'Bengkulu Utara'),
(121,7,'Kaur'),
(122,7,'Kepahiang'),
(123,7,'Lebong'),
(124,7,'Muko-Muko'),
(125,7,'Rejang Lebong'),
(126,7,'Seluma'),
(127,8,'Bandar Lampung'),
(128,8,'Lampung Barat'),
(129,8,'Lampung Selatan'),
(130,8,'Lampung Tengah'),
(131,8,'Lampung Timur'),
(132,8,'Lampung Utara'),
(133,8,'Mesuji'),
(134,8,'Pesawaran'),
(135,8,'Pesisir Barat'),
(136,8,'Pringsewu'),
(137,8,'Tanggamus'),
(138,8,'Tulang Bawang'),
(139,8,'Tulang Bawang Barat'),
(140,8,'Way Kanan'),
(141,9,'Bangka'),
(142,9,'Bangka Barat'),
(143,9,'Bangka Selatan'),
(144,9,'Bangka Tengah'),
(145,9,'Belitung'),
(146,9,'Belitung Timur'),
(147,9,'Pangkal Pinang'),
(148,10,'Bintan'),
(149,10,'Karimun'),
(150,10,'Lingga'),
(151,10,'Natuna'),
(152,10,'Kota Batam'),
(153,10,'Kota Tanjung Pinang');

/*Table structure for table `tb_log_alamat_pegawai` */

DROP TABLE IF EXISTS `tb_log_alamat_pegawai`;

CREATE TABLE `tb_log_alamat_pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `alamat_lama` varchar(64) DEFAULT NULL,
  `alamat_baru` varchar(64) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `tb_log_alamat_pegawai_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_alamat_pegawai` */

insert  into `tb_log_alamat_pegawai`(`id`,`id_pegawai`,`alamat_lama`,`alamat_baru`,`tanggal_perubahan`) values 
(1,2,'Jl. Surya Kencana No. 456','Batubulan','2023-12-17 15:21:38'),
(2,4,'Jl. Diponegoro No. 123','Jl. Melati No. 123','2023-12-17 16:17:05'),
(3,5,'Jl. Surya Kencana No. 456','Jl. Mawar No. 456','2023-12-17 16:17:20'),
(4,6,'Jl. Raden Saleh No. 789','Jl. Kamboja No. 789','2023-12-17 16:17:31');

/*Table structure for table `tb_log_alamat_pelanggan` */

DROP TABLE IF EXISTS `tb_log_alamat_pelanggan`;

CREATE TABLE `tb_log_alamat_pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) DEFAULT NULL,
  `alamat_lama` varchar(64) DEFAULT NULL,
  `alamat_baru` varchar(64) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `tb_log_alamat_pelanggan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_alamat_pelanggan` */

insert  into `tb_log_alamat_pelanggan`(`id`,`id_pelanggan`,`alamat_lama`,`alamat_baru`,`tanggal_perubahan`) values 
(1,1,'Sukawati','Bedulu','2023-12-17 15:08:10'),
(2,2,'Jl. Pahlawan No. 45','Keramas','2023-12-17 15:08:32');

/*Table structure for table `tb_log_alamat_pemasok_pakan` */

DROP TABLE IF EXISTS `tb_log_alamat_pemasok_pakan`;

CREATE TABLE `tb_log_alamat_pemasok_pakan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemasok_pakan` int(11) DEFAULT NULL,
  `alamat_lama` varchar(64) DEFAULT NULL,
  `alamat_baru` varchar(64) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pemasok_pakan` (`id_pemasok_pakan`),
  CONSTRAINT `tb_log_alamat_pemasok_pakan_ibfk_1` FOREIGN KEY (`id_pemasok_pakan`) REFERENCES `tb_pemasok_pakan` (`id_pemasok_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_alamat_pemasok_pakan` */

insert  into `tb_log_alamat_pemasok_pakan`(`id`,`id_pemasok_pakan`,`alamat_lama`,`alamat_baru`,`tanggal_perubahan`) values 
(1,2,'Jl. Nutrisi Tepat No. 456','Blangsinga','2023-12-17 15:32:59');

/*Table structure for table `tb_log_email_pegawai` */

DROP TABLE IF EXISTS `tb_log_email_pegawai`;

CREATE TABLE `tb_log_email_pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `email_lama` varchar(15) DEFAULT NULL,
  `email_baru` varchar(15) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `tb_log_email_pegawai_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_email_pegawai` */

insert  into `tb_log_email_pegawai`(`id`,`id_pegawai`,`email_lama`,`email_baru`,`tanggal_perubahan`) values 
(1,3,'rizal@email.com','rizal@gmail.com','2023-12-17 15:21:38');

/*Table structure for table `tb_log_email_pelanggan` */

DROP TABLE IF EXISTS `tb_log_email_pelanggan`;

CREATE TABLE `tb_log_email_pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) DEFAULT NULL,
  `email_lama` varchar(15) DEFAULT NULL,
  `email_baru` varchar(15) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `tb_log_email_pelanggan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_email_pelanggan` */

insert  into `tb_log_email_pelanggan`(`id`,`id_pelanggan`,`email_lama`,`email_baru`,`tanggal_perubahan`) values 
(1,2,'budi@email.com','budi@gmail.com','2023-12-17 15:11:41'),
(2,1,'ahmad@email.com','ahmad@gmail.com','2023-12-17 15:12:17');

/*Table structure for table `tb_log_email_pemasok_pakan` */

DROP TABLE IF EXISTS `tb_log_email_pemasok_pakan`;

CREATE TABLE `tb_log_email_pemasok_pakan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemasok_pakan` int(11) DEFAULT NULL,
  `email_lama` varchar(15) DEFAULT NULL,
  `email_baru` varchar(15) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pemasok_pakan` (`id_pemasok_pakan`),
  CONSTRAINT `tb_log_email_pemasok_pakan_ibfk_1` FOREIGN KEY (`id_pemasok_pakan`) REFERENCES `tb_pemasok_pakan` (`id_pemasok_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_email_pemasok_pakan` */

insert  into `tb_log_email_pemasok_pakan`(`id`,`id_pemasok_pakan`,`email_lama`,`email_baru`,`tanggal_perubahan`) values 
(1,3,'primefeed@gmail','primefeed2@gmai','2023-12-17 15:32:59');

/*Table structure for table `tb_log_nomor_telepon_pegawai` */

DROP TABLE IF EXISTS `tb_log_nomor_telepon_pegawai`;

CREATE TABLE `tb_log_nomor_telepon_pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `nomor_telepon_lama` varchar(15) DEFAULT NULL,
  `nomor_telepon_baru` varchar(15) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `tb_log_nomor_telepon_pegawai_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_nomor_telepon_pegawai` */

insert  into `tb_log_nomor_telepon_pegawai`(`id`,`id_pegawai`,`nomor_telepon_lama`,`nomor_telepon_baru`,`tanggal_perubahan`) values 
(1,1,'081112233445','081236273728','2023-12-17 15:21:38'),
(2,6,'083334455667','083334773627','2023-12-17 16:17:31'),
(3,5,'082223344556','082223336473','2023-12-17 16:17:36');

/*Table structure for table `tb_log_nomor_telepon_pelanggan` */

DROP TABLE IF EXISTS `tb_log_nomor_telepon_pelanggan`;

CREATE TABLE `tb_log_nomor_telepon_pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) DEFAULT NULL,
  `nomor_telepon_lama` varchar(15) DEFAULT NULL,
  `nomor_telepon_baru` varchar(15) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `tb_log_nomor_telepon_pelanggan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_nomor_telepon_pelanggan` */

insert  into `tb_log_nomor_telepon_pelanggan`(`id`,`id_pelanggan`,`nomor_telepon_lama`,`nomor_telepon_baru`,`tanggal_perubahan`) values 
(1,2,'081234567667','081234374837','2023-12-17 15:06:34');

/*Table structure for table `tb_log_nomor_telepon_pemasok_pakan` */

DROP TABLE IF EXISTS `tb_log_nomor_telepon_pemasok_pakan`;

CREATE TABLE `tb_log_nomor_telepon_pemasok_pakan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemasok_pakan` int(11) DEFAULT NULL,
  `nomor_telepon_lama` varchar(15) DEFAULT NULL,
  `nomor_telepon_baru` varchar(15) DEFAULT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pemasok_pakan` (`id_pemasok_pakan`),
  CONSTRAINT `tb_log_nomor_telepon_pemasok_pakan_ibfk_1` FOREIGN KEY (`id_pemasok_pakan`) REFERENCES `tb_pemasok_pakan` (`id_pemasok_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_nomor_telepon_pemasok_pakan` */

insert  into `tb_log_nomor_telepon_pemasok_pakan`(`id`,`id_pemasok_pakan`,`nomor_telepon_lama`,`nomor_telepon_baru`,`tanggal_perubahan`) values 
(1,1,'081234567890','08183748374','2023-12-17 15:32:59');

/*Table structure for table `tb_pakan` */

DROP TABLE IF EXISTS `tb_pakan`;

CREATE TABLE `tb_pakan` (
  `id_pakan` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis_pakan` int(11) DEFAULT NULL,
  `nama_pakan` varchar(64) DEFAULT NULL,
  `kualitas_pakan` int(10) DEFAULT NULL,
  `harga_pakan` decimal(10,2) DEFAULT NULL,
  `stok_pakan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pakan`),
  KEY `id_jenis_pakan` (`id_jenis_pakan`),
  CONSTRAINT `tb_pakan_ibfk_1` FOREIGN KEY (`id_jenis_pakan`) REFERENCES `tb_jenis_pakan` (`id_jenis_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_pakan` */

insert  into `tb_pakan`(`id_pakan`,`id_jenis_pakan`,`nama_pakan`,`kualitas_pakan`,`harga_pakan`,`stok_pakan`) values 
(1,9,'Pakan 1',9,1694741.79,-25),
(2,10,'Pakan 2',6,1986375.13,-19),
(3,3,'Pakan 3',9,1052596.45,-2),
(4,10,'Pakan 4',8,644208.20,5),
(5,2,'Pakan 5',7,703111.68,-15),
(6,7,'Pakan 6',8,1486455.33,-11),
(7,9,'Pakan 7',5,1402143.13,-5),
(8,6,'Pakan 8',7,532225.50,-13),
(9,10,'Pakan 9',10,1479765.42,-3),
(10,5,'Pakan 10',10,949287.11,0),
(11,4,'Pakan 11',9,1744491.65,-5),
(12,7,'Pakan 12',9,968391.05,-7),
(13,9,'Pakan 13',8,1854318.15,20),
(14,3,'Pakan 14',6,1091462.16,17),
(15,4,'Pakan 15',9,671762.73,15),
(16,1,'Pakan 16',9,1006192.91,15),
(17,3,'Pakan 17',5,1211398.38,16),
(18,9,'Pakan 18',8,1008031.03,20),
(19,6,'Pakan 19',5,1631387.84,17),
(20,3,'Pakan 20',8,915528.25,18),
(21,4,'Pakan 21',9,1883787.93,16),
(22,5,'Pakan 22',8,1981482.45,19),
(23,4,'Pakan 23',6,561671.53,18),
(24,5,'Pakan 24',10,653268.22,19),
(25,5,'Pakan 25',5,1575618.34,18),
(26,6,'Pakan 26',5,1522377.52,16),
(27,2,'Pakan 27',5,1550415.77,17),
(28,10,'Pakan 28',8,1980040.62,16),
(29,2,'Pakan 29',9,1570268.94,16),
(30,8,'Pakan 30',7,1718969.61,19),
(31,3,'Pakan 31',10,1914802.70,20),
(32,9,'Pakan 32',8,1540798.44,17),
(33,1,'Pakan 33',10,1394857.71,16),
(34,9,'Pakan 34',6,1131531.58,17),
(35,6,'Pakan 35',9,631871.11,16),
(36,6,'Pakan 36',6,577744.30,19),
(37,4,'Pakan 37',10,1484748.21,18),
(38,6,'Pakan 38',7,1971359.75,19),
(39,5,'Pakan 39',9,911800.01,16),
(40,9,'Pakan 40',5,1567276.97,17),
(41,4,'Pakan 41',10,1720211.73,15),
(42,1,'Pakan 42',10,1083200.71,28),
(43,1,'Pakan 43',8,1200706.41,31),
(44,5,'Pakan 44',9,1603053.71,28),
(45,3,'Pakan 45',6,1090214.23,29),
(46,6,'Pakan 46',9,1096142.07,30),
(47,4,'Pakan 47',7,1169387.95,28),
(48,2,'Pakan 48',9,1812570.40,31),
(49,3,'Pakan 49',10,1991235.37,28),
(50,6,'Pakan 50',8,675540.88,31),
(51,10,'Pakan 51',7,1420470.35,28),
(52,8,'Pakan 52',8,502529.02,32),
(53,7,'Pakan 53',8,1809368.84,30),
(54,5,'Pakan 54',8,908671.64,31),
(55,9,'Pakan 55',5,1615507.23,30),
(56,5,'Pakan 56',8,516590.53,27),
(57,2,'Pakan 57',7,1334477.49,30),
(58,8,'Pakan 58',9,1881957.68,27),
(59,5,'Pakan 59',5,1918821.12,30),
(60,2,'Pakan 60',8,1717083.18,28),
(61,8,'Pakan 61',6,1535030.78,31),
(62,1,'Pakan 62',8,1931831.82,32),
(63,2,'Pakan 63',7,1280834.15,30),
(64,4,'Pakan 64',5,847746.51,32),
(65,2,'Pakan 65',9,1029499.26,30),
(66,6,'Pakan 66',6,950790.48,32),
(67,8,'Pakan 67',10,1231708.37,30),
(68,6,'Pakan 68',10,1961953.31,28),
(69,6,'Pakan 69',9,1681621.16,31),
(70,5,'Pakan 70',6,877852.22,31),
(71,4,'Pakan 71',7,1392010.61,32),
(72,1,'Pakan 72',7,1353620.34,31),
(73,4,'Pakan 73',7,538928.95,31),
(74,2,'Pakan 74',5,1709393.10,32);

/*Table structure for table `tb_pegawai` */

DROP TABLE IF EXISTS `tb_pegawai`;

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `id_kabupaten` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(64) DEFAULT NULL,
  `alamat_pegawai` varchar(64) DEFAULT NULL,
  `nomor_telepon_pegawai` varchar(12) DEFAULT NULL,
  `email_pegawai` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`),
  KEY `id_kabupaten` (`id_kabupaten`),
  CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`id_kabupaten`) REFERENCES `tb_kabupaten` (`id_kabupaten`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_pegawai` */

insert  into `tb_pegawai`(`id_pegawai`,`id_kabupaten`,`nama_pegawai`,`alamat_pegawai`,`nomor_telepon_pegawai`,`email_pegawai`) values 
(1,5,'Andi','Jl. Diponegoro No. 123','081112233445','andi@email.com'),
(2,3,'Sinta','Jl. Surya Kencana No. 456','082223344556','sinta@email.com'),
(3,9,'Rizal','Jl. Raden Saleh No. 789','083334455667','rizal@email.com'),
(4,7,'Eva','Jl. Erlangga No. 101','084445566778','eva@email.com'),
(5,7,'Yogi','Jl. Yos Sudarso No. 202','085556677889','yogi@email.com'),
(6,6,'Lia','Jl. Lodaya No. 303','086667788900','lia@email.com'),
(7,7,'Arif','Jl. Airlangga No. 404','087778899011','arif@email.com'),
(8,9,'Sari','Jl. Sarijadi No. 505','088889900122','sari@email.com'),
(9,2,'Rudi','Jl. Rukun No. 606','089900011233','rudi@email.com'),
(10,3,'Dina','Jl. Danau Toba No. 707','081001122344','dina@email.com'),
(11,5,'Budi','Jl. Bukit Tinggi No. 808','082112233455','budi@email.com'),
(12,8,'Maya','Jl. Merapi No. 909','083223344566','maya@email.com'),
(13,7,'Irfan','Jl. Irigasi No. 1010','084334455677','irfan@email.com'),
(14,7,'Citra','Jl. Cipaganti No. 1111','085445566788','citra@email.com'),
(15,5,'Denny','Jl. Dermaga No. 1212','086556677899','denny@email.com'),
(16,4,'Rina','Jl. Riau No. 1313','087667788900','rina@email.com'),
(17,3,'Fahmi','Jl. Farida No. 1414','088778899011','fahmi@email.com'),
(18,2,'Lina','Jl. Lintang No. 1515','089889900122','lina@email.com'),
(19,9,'Asep','Jl. Anggrek No. 1616','081990001233','asep@email.com'),
(20,2,'Susi','Jl. Surya No. 1717','082001112344','susi@email.com'),
(21,9,'Yoga','Jl. Yudha No. 1818','083112223455','yoga@email.com'),
(22,4,'Nia','Jl. Nusantara No. 1919','084223334566','nia@email.com'),
(23,7,'Rendy','Jl. Rendang No. 2020','085334445677','rendy@email.com'),
(24,3,'Rita','Jl. Rindang No. 2121','086445556788','rita@email.com'),
(25,5,'Bima','Jl. Bima No. 2222','087556667899','bima@email.com'),
(26,5,'Lia','Jl. Liana No. 2323','088667778900','lia@email.com'),
(27,2,'Eko','Jl. Ekologi No. 2424','089778889011','eko@email.com'),
(28,10,'Nina','Jl. Nirwana No. 2525','081889900122','nina@email.com'),
(29,7,'Rizki','Jl. Rizkika No. 2626','082990001233','rizki@email.com'),
(30,4,'Dina','Jl. Dinanti No. 2727','083001112344','dina@email.com'),
(31,9,'Danang','Jl. Danau Toba No. 2828','084112223455','danang@email.com');

/*Table structure for table `tb_pelanggan` */

DROP TABLE IF EXISTS `tb_pelanggan`;

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(64) DEFAULT NULL,
  `alamat_pelanggan` varchar(64) DEFAULT NULL,
  `id_kabupaten` int(11) DEFAULT NULL,
  `nomor_telepon_pelanggan` varchar(12) DEFAULT NULL,
  `email_pelanggan` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`),
  KEY `id_kabupaten` (`id_kabupaten`),
  CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`id_kabupaten`) REFERENCES `tb_kabupaten` (`id_kabupaten`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_pelanggan` */

insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`alamat_pelanggan`,`id_kabupaten`,`nomor_telepon_pelanggan`,`email_pelanggan`) values 
(1,'Ahmad','Jl. Merdeka No. 123',36,'081234567890','ahmad@email.com'),
(2,'Budi','Jl. Pahlawan No. 45',90,'082345678901','budi@email.com'),
(3,'Citra','Jl. Raya Cijantung No. 67',45,'083456789012','citra@email.com'),
(4,'Diana','Jl. Kemanggisan No. 89',53,'084567890123','diana@email.com'),
(5,'Eka','Jl. Kebayoran Lama No. 12',30,'085678901234','eka@email.com'),
(6,'Fandi','Jl. Dago No. 56',89,'086789012345','fandi@email.com'),
(7,'Gita','Jl. Kuningan No. 78',58,'087890123456','gita@email.com'),
(8,'Hadi','Jl. Surya No. 90',23,'088901234567','hadi@email.com'),
(9,'Indah','Jl. Sawangan No. 23',37,'089012345678','indah@email.com'),
(10,'Joko','Jl. Gading No. 34',17,'089123456789','joko@email.com'),
(11,'Kartika','Jl. Meruya No. 56',72,'089234567890','kartika@email.com'),
(12,'Lutfi','Jl. Permata No. 78',12,'089345678901','lutfi@email.com'),
(13,'Mira','Jl. Pondok Indah No. 90',40,'089456789012','mira@email.com'),
(14,'Nanda','Jl. Taman Sari No. 12',64,'089567890123','nanda@email.com'),
(15,'Oscar','Jl. Cempaka No. 34',99,'089678901234','oscar@email.com'),
(16,'Putri','Jl. Kuta No. 56',4,'089789012345','putri@email.com'),
(17,'Qowi','Jl. Thamrin No. 78',20,'089890123456','qowi@email.com'),
(18,'Rahma','Jl. Depok No. 90',87,'089901234567','rahma@email.com'),
(19,'Surya','Jl. Tebet No. 23',78,'089012345678','surya@email.com'),
(20,'Tari','Jl. Ciledug No. 34',29,'089123456789','tari@email.com'),
(21,'Umar','Jl. Kalibata No. 56',9,'089234567890','umar@email.com'),
(22,'Vera','Jl. Tanah Abang No. 78',55,'089345678901','vera@email.com'),
(23,'Wira','Jl. Pasar Minggu No. 90',51,'089456789012','wira@email.com'),
(24,'Xena','Jl. Sunter No. 12',88,'089567890123','xena@email.com'),
(25,'Yoga','Jl. Kelapa Gading No. 34',86,'089678901234','yoga@email.com'),
(26,'Zara','Jl. Fatmawati No. 56',69,'089789012345','zara@email.com'),
(27,'Adi','Jl. Kedoya No. 78',85,'089890123456','adi@email.com'),
(28,'Bunga','Jl. Cibubur No. 90',20,'089901234567','bunga@email.com'),
(29,'Cahya','Jl. Cinere No. 23',42,'089012345678','cahya@email.com'),
(30,'Dini','Jl. Kalideres No. 34',49,'089123456789','dini@email.com'),
(31,'Eko','Jl. Cawang No. 56',19,'089234567890','eko@email.com'),
(32,'Fina','Jl. Condet No. 78',45,'089345678901','fina@email.com'),
(33,'Gilang','Jl. Gajah Mada No. 90',69,'089456789012','gilang@email.com'),
(34,'Henny','Jl. Hayam Wuruk No. 12',13,'089567890123','henny@email.com'),
(35,'Iqbal','Jl. Irian No. 34',52,'089678901234','iqbal@email.com'),
(36,'Jasmine','Jl. Jatinegara No. 56',23,'089789012345','jasmine@email.com'),
(37,'Koko','Jl. Kuningan No. 78',59,'089890123456','koko@email.com'),
(38,'Lina','Jl. Lebak Bulus No. 90',25,'089901234567','lina@email.com'),
(39,'Maman','Jl. Mangga Besar No. 23',47,'089012345678','maman@email.com'),
(40,'Nina','Jl. Nusa Indah No. 34',58,'089123456789','nina@email.com'),
(41,'Omar','Jl. Otista No. 56',50,'089234567890','omar@email.com'),
(42,'Putu','Jl. Pluit No. 78',76,'089345678901','putu@email.com'),
(43,'Qory','Jl. Qatar No. 90',31,'089456789012','qory@email.com'),
(44,'Rini','Jl. Rawa Mangun No. 12',24,'089567890123','rini@email.com'),
(45,'Syaiful','Jl. Serpong No. 34',28,'089678901234','syaiful@email.com'),
(46,'Tina','Jl. Tanjung Priok No. 56',64,'089789012345','tina@email.com'),
(47,'Uci','Jl. Utan Kayu No. 78',39,'089890123456','uci@email.com'),
(48,'Vino','Jl. Veteran No. 90',99,'089901234567','vino@email.com'),
(49,'Wulan','Jl. Wijaya Kusuma No. 23',81,'089012345678','wulan@email.com'),
(50,'Xavier','Jl. Xaverius No. 34',7,'089123456789','xavier@email.com'),
(51,'Yani','Jl. Yos Sudarso No. 56',88,'089234567890','yani@email.com'),
(52,'Zainal','Jl. Zainal Abidin No. 78',24,'089345678901','zainal@email.com'),
(53,'Rudi','Jl. Sudirman No. 456',54,'081234567891','rudi@email.com'),
(54,'Siti','Jl. Gatot Subroto No. 789',95,'082345678912','siti@email.com'),
(55,'Irfan','Jl. Asia Afrika No. 101',18,'083456789123','irfan@email.com'),
(56,'Dewi','Jl. Braga No. 202',99,'084567891234','dewi@email.com'),
(57,'Arif','Jl. Pasteur No. 303',46,'085678912345','arif@email.com'),
(58,'Lina','Jl. Sukajadi No. 404',32,'086789123456','lina@email.com'),
(59,'Bambang','Jl. Setiabudi No. 505',18,'087890234567','bambang@email.com'),
(60,'Sari','Jl. Dago Pakar No. 606',93,'088901345678','sari@email.com'),
(61,'Fajar','Jl. Lembang No. 707',13,'089012456789','fajar@email.com'),
(62,'Dina','Jl. Juanda No. 808',82,'089123567890','dina@email.com'),
(63,'Andi','Jl. Cihampelas No. 909',72,'089234678901','andi@email.com'),
(64,'Ratna','Jl. Tubagus Ismail No. 1010',14,'089345789012','ratna@email.com'),
(65,'Eko','Jl. Pajajaran No. 1111',53,'089456890123','eko@email.com'),
(66,'Yuli','Jl. Dipatiukur No. 1212',23,'089567901234','yuli@email.com'),
(67,'Hendra','Jl. Ganeca No. 1313',55,'089678012345','hendra@email.com'),
(68,'Nina','Jl. Ir. H. Juanda No. 1414',6,'089789123456','nina@email.com'),
(69,'Ferry','Jl. Kopo No. 1515',60,'089890234567','ferry@email.com'),
(70,'Desi','Jl. Cipaganti No. 1616',85,'089901345678','desi@email.com'),
(71,'Asep','Jl. Surapati No. 1717',47,'089012456789','asep@email.com'),
(72,'Rina','Jl. Lengkong No. 1818',77,'089123567890','rina@email.com'),
(73,'Budi','Jl. Trunojoyo No. 1919',44,'089234678901','budi@email.com'),
(74,'Ani','Jl. Citarum No. 2020',88,'089345789012','ani@email.com'),
(75,'Dodi','Jl. Tamansari No. 2121',11,'089456890123','dodi@email.com'),
(76,'Tuti','Jl. Ir. Djuanda No. 2222',84,'089567901234','tuti@email.com'),
(77,'Dicky','Jl. Merdeka No. 2323',92,'089678012345','dicky@email.com'),
(78,'Cici','Jl. Asia No. 2424',6,'089789123456','cici@email.com'),
(79,'Joko','Jl. Sunda No. 2525',52,'089890234567','joko@email.com'),
(80,'Rina','Jl. Java No. 2626',44,'089901345678','rina@email.com'),
(81,'Iwan','Jl. Bali No. 2727',62,'089012456789','iwan@email.com'),
(82,'Eva','Jl. Kalimantan No. 2828',76,'089123567890','eva@email.com'),
(83,'Yanto','Jl. Sulawesi No. 2929',95,'089234678901','yanto@email.com'),
(84,'Vivi','Jl. Maluku No. 3030',50,'089345789012','vivi@email.com'),
(85,'Rizki','Jl. Papua No. 3131',63,'089456890123','rizki@email.com'),
(86,'Nadia','Jl. Timor No. 3232',65,'089567901234','nadia@email.com'),
(87,'Iqbal','Jl. Nias No. 3333',37,'089678012345','iqbal@email.com'),
(88,'Cindy','Jl. Sumatra No. 3434',87,'089789123456','cindy@email.com'),
(89,'Doni','Jl. Flores No. 3535',25,'089890234567','doni@email.com'),
(90,'Lulu','Jl. Rote No. 3636',62,'089901345678','lulu@email.com'),
(91,'Rendy','Jl. Alor No. 3737',35,'089012456789','rendy@email.com'),
(92,'Yuni','Jl. Seram No. 3838',88,'089123567890','yuni@email.com'),
(93,'Jodi','Jl. Halmahera No. 3939',35,'089234678901','jodi@email.com'),
(94,'Maya','Jl. Irian No. 4040',9,'089345789012','maya@email.com'),
(95,'Yoga','Jl. Biak No. 4141',38,'089456890123','yoga@email.com'),
(96,'Rina','Jl. Aru No. 4242',64,'089567901234','rina@email.com'),
(97,'Ilham','Jl. Tidore No. 4343',8,'089678012345','ilham@email.com'),
(98,'Dina','Jl. Selayar No. 4444',43,'089789123456','dina@email.com'),
(99,'Ryan','Jl. Kayu Manis No. 4545',91,'089890234567','ryan@email.com'),
(100,'Lia','Jl. Palembang No. 4646',28,'089901345678','lia@email.com'),
(101,'Rian','Jl. Lampung No. 4747',67,'089012456789','rian@email.com'),
(102,'Fina','Jl. Bengkulu No. 4848',48,'089123567890','fina@email.com'),
(103,'Galih','Jl. Gorontalo No. 4949',40,'089234678901','galih@email.com'),
(104,'Dini','Jl. Kendari No. 5050',54,'089345789012','dini@email.com'),
(105,'Rina','Jl. Riau No. 123',50,'081112223344','rina@email.com'),
(106,'Farhan','Jl. Farid No. 456',87,'082223334455','farhan@email.com'),
(107,'Nadia','Jl. Nusantara No. 789',87,'083334445566','nadia@email.com'),
(108,'Dika','Jl. Diponegoro No. 101',73,'084445556677','dika@email.com'),
(109,'Elsa','Jl. Elang No. 202',3,'085556667788','elsa@email.com'),
(110,'Budi','Jl. Budiman No. 303',95,'086667778899','budi@email.com'),
(111,'Santi','Jl. Santoso No. 404',68,'087778889900','santi@email.com'),
(112,'Hadi','Jl. Hadirah No. 505',53,'088889900011','hadi@email.com'),
(113,'Lina','Jl. Linawati No. 606',60,'089900011122','lina@email.com'),
(114,'Dino','Jl. Dinoyo No. 707',42,'081001122233','dino@email.com'),
(115,'Rita','Jl. Riau No. 808',30,'082112233344','rita@email.com'),
(116,'Yoga','Jl. Yogya No. 909',23,'083223344455','yoga@email.com'),
(117,'Eva','Jl. Evakuasi No. 1010',24,'084334455566','eva@email.com'),
(118,'Rian','Jl. Riang No. 1111',48,'085445566677','rian@email.com'),
(119,'Siska','Jl. Siskamana No. 1212',69,'086556677788','siska@email.com'),
(120,'Fahmi','Jl. Fajar No. 1313',3,'087667788899','fahmi@email.com'),
(121,'Ayu','Jl. Ayuning No. 1414',4,'088778899900','ayu@email.com'),
(122,'Guntur','Jl. Gunung No. 1515',10,'089889900011','guntur@email.com'),
(123,'Ratna','Jl. Ratuku No. 1616',39,'081990001122','ratna@email.com'),
(124,'Irfan','Jl. Irfandi No. 1717',64,'082001112233','irfan@email.com'),
(125,'Citra','Jl. Citraganda No. 1818',5,'083112223344','citra@email.com'),
(126,'Andi','Jl. Andika No. 1919',29,'084223334455','andi@email.com'),
(127,'Sari','Jl. Sariku No. 2020',30,'085334445566','sari@email.com'),
(128,'Joko','Jl. Jokowi No. 2121',61,'086445556677','joko@email.com'),
(129,'Lia','Jl. Liar No. 2222',17,'087556667788','lia@email.com'),
(130,'Rudi','Jl. Rudiana No. 2323',2,'088667778899','rudi@email.com'),
(131,'Maya','Jl. Mayang No. 2424',55,'089778889900','maya@email.com'),
(132,'Eko','Jl. Ekonomi No. 2525',72,'081889900011','eko@email.com'),
(133,'Vina','Jl. Vinata No. 2626',92,'082990001122','vina@email.com'),
(134,'Rifqi','Jl. Rifqiku No. 2727',48,'083001112233','rifqi@email.com'),
(135,'Wulan','Jl. Wulandari No. 2828',60,'084112223344','wulan@email.com'),
(136,'Danang','Jl. Danau No. 2929',56,'085223334455','danang@email.com'),
(137,'Sinta','Jl. Sintaku No. 3030',98,'086334445566','sinta@email.com'),
(138,'Yogi','Jl. Yogya No. 3131',23,'087445556677','yogi@email.com'),
(139,'Mira','Jl. Miranti No. 3232',21,'088556667788','mira@email.com'),
(140,'Ari','Jl. Aritana No. 3333',35,'089667778899','ari@email.com'),
(141,'Dewa','Jl. Dewangga No. 3434',11,'081778889900','dewa@email.com'),
(142,'Rina','Jl. Rinau No. 3535',49,'082889900011','rina@email.com'),
(143,'Bima','Jl. Bimantara No. 3636',13,'083990001122','bima@email.com'),
(144,'Laras','Jl. Larasati No. 3737',16,'084001112233','laras@email.com'),
(145,'Yanuar','Jl. Yanuar No. 3838',41,'085112223344','yanuar@email.com'),
(146,'Ella','Jl. Ellangga No. 3939',58,'086223334455','ella@email.com'),
(147,'Firman','Jl. Firmananda No. 4040',66,'087334445566','firman@email.com'),
(148,'Dinda','Jl. Dindaku No. 4141',55,'088445556677','dinda@email.com'),
(149,'Rizal','Jl. Rizalu No. 4242',77,'089556667788','rizal@email.com'),
(150,'Citra','Jl. Citra No. 4343',19,'081667778899','citra@email.com'),
(151,'Gita','Jl. Gitaku No. 4444',60,'082778889900','gita@email.com'),
(152,'Yudha','Jl. Yudhaku No. 4545',47,'083889900011','yudha@email.com'),
(153,'Rima','Jl. Rimaku No. 4646',53,'084990001122','rima@email.com'),
(154,'Adi','Jl. Adiku No. 4747',23,'085001112233','adi@email.com'),
(155,'Eka','Jl. Ekaku No. 4848',57,'086112223344','eka@email.com'),
(156,'Budi','Jl. Budiku No. 4949',14,'087223334455','budi@email.com'),
(157,'Suci','Jl. Suciku No. 5050',96,'088334445566','suci@email.com');

/*Table structure for table `tb_pemasok_pakan` */

DROP TABLE IF EXISTS `tb_pemasok_pakan`;

CREATE TABLE `tb_pemasok_pakan` (
  `id_pemasok_pakan` int(11) NOT NULL AUTO_INCREMENT,
  `id_kabupaten` int(11) DEFAULT NULL,
  `nama_pemasok_pakan` varchar(64) DEFAULT NULL,
  `alamat_pemasok_pakan` varchar(64) DEFAULT NULL,
  `no_telepon_pemasok_pakan` varchar(12) DEFAULT NULL,
  `email_pemasok_pakan` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_pemasok_pakan`),
  KEY `id_kabupaten` (`id_kabupaten`),
  CONSTRAINT `tb_pemasok_pakan_ibfk_1` FOREIGN KEY (`id_kabupaten`) REFERENCES `tb_kabupaten` (`id_kabupaten`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_pemasok_pakan` */

insert  into `tb_pemasok_pakan`(`id_pemasok_pakan`,`id_kabupaten`,`nama_pemasok_pakan`,`alamat_pemasok_pakan`,`no_telepon_pemasok_pakan`,`email_pemasok_pakan`) values 
(1,11,'PakanCo','Jl. Pakan Sejahtera No. 123','081234567890','info@pakanco.com'),
(2,8,'NutriFeed','Jl. Nutrisi Tepat No. 456','081234567891','sales@nutrifeed.com'),
(3,6,'PrimeFeed','Jl. Utama Ransum No. 789','081234567892','primefeed@gmail.com'),
(4,6,'AgroNourish','Jl. Agronomi No. 234','081234567893','info@agronourish.co.id'),
(5,12,'FeedMaster','Jl. Pangan Lengkap No. 567','081234567894','feedmaster@info.com'),
(6,15,'VitaGreen','Jl. Vitalitas No. 890','081234567895','vitagreen@company.net'),
(7,15,'HarmonyFeeds','Jl. Harmoni No. 123','081234567896','harmonyfeeds@gmail.com'),
(8,7,'BioNutri','Jl. Bioteknologi No. 456','081234567897','info@bionutri.id'),
(9,9,'AgroSupplies','Jl. Agrikultur No. 789','081234567898','agrosupplies@company.net'),
(10,3,'EcoRation','Jl. Ekologi No. 234','081234567899','ecoration.sales@gmail.com'),
(11,8,'GreenHarvest','Jl. Panen Hijau No. 567','081234567810','info@greenharvest.co.id'),
(12,8,'OrganicFeeds','Jl. Organik No. 890','081234567811','organicfeeds@info.com'),
(13,16,'PureNutrition','Jl. Murni No. 121','081234567812','sales@purenutrition.com'),
(14,4,'NatureFeed','Jl. Alam No. 342','081234567813','naturefeed@gmail.com'),
(15,22,'HealthyHarvest','Jl. Sehat No. 321','081234567814','info@healthyharvest.co.id'),
(16,1,'VitalRations','Jl. Vitalitas No. 876','081234567815','vitalrations@company.net'),
(17,10,'AgroVita','Jl. Agronomi No. 543','081234567816','agrovita@gmail.com'),
(18,20,'EcoBlend','Jl. Ekologi No. 210','081234567817','ecoblend@info.com'),
(19,21,'ProFeed','Jl. Profesional No. 109','081234567818','profeed.sales@gmail.com'),
(20,19,'PremiumFeeds','Jl. Premium No. 876','081234567819','info@premiumfeeds.co.id'),
(21,10,'BioRations','Jl. Bioteknologi No. 543','081234567820','biorations@gmail.com'),
(22,14,'HarvestHealth','Jl. Panen Sehat No. 210','081234567821','info@harvesthealth.com'),
(23,16,'OrganicHarvest','Jl. Organik No. 109','081234567822','organicharvest@info.com'),
(24,11,'GreenVitality','Jl. Hijau Vital No. 876','081234567823','greenvitality@company.net'),
(25,9,'AgroBalance','Jl. Agronomi No. 543','081234567824','agrobalance@gmail.com'),
(26,10,'NatureBlend','Jl. Alam No. 210','081234567825','natureblend@info.com'),
(27,23,'VitaRations','Jl. Vitalitas No. 109','081234567826','vitarations@gmail.com'),
(28,10,'EcoHarvest','Jl. Ekologi No. 876','081234567827','ecoharvest@company.net'),
(29,4,'GreenBalance','Jl. Hijau Seimbang No. 543','081234567828','greenbalance@gmail.com'),
(30,13,'PureHarvest','Jl. Murni No. 210','081234567829','pureharvest@info.com'),
(31,5,'HarmonyRations','Jl. Harmoni No. 109','081234567830','harmony.rations@gmail.com'),
(32,7,'BioBalance','Jl. Bioteknologi No. 876','081234567831','biobalance@company.net'),
(33,19,'AgroHarvest','Jl. Agronomi No. 543','081234567832','agroharvest@gmail.com'),
(34,3,'NatureHealth','Jl. Alam No. 210','081234567833','nature.health@info.com'),
(35,5,'EcoVita','Jl. Ekologi No. 109','081234567834','ecovita@gmail.com'),
(36,16,'PremiumBalance','Jl. Premium No. 876','081234567835','premium.balance@company.net'),
(37,15,'VitaBlend','Jl. Vitalitas No. 543','081234567836','vitablend@gmail.com'),
(38,24,'GreenHealth','Jl. Hijau No. 210','081234567837','green.health@info.com'),
(39,5,'HarmonyHealth','Jl. Harmoni No. 109','081234567838','harmony.health@gmail.com'),
(40,24,'PureVitality','Jl. Murni No. 876','081234567839','pure.vitality@company.net'),
(41,5,'NatureHarvest','Jl. Alam No. 543','081234567840','nature.harvest@gmail.com');

/*Table structure for table `tb_pemasokan_pakan` */

DROP TABLE IF EXISTS `tb_pemasokan_pakan`;

CREATE TABLE `tb_pemasokan_pakan` (
  `id_pasokan_pakan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_pemasok_pakan` int(11) DEFAULT NULL,
  `tanggal_pasok` datetime DEFAULT NULL,
  `total_biaya_pasok` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pasokan_pakan`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `id_pemasok_pakan` (`id_pemasok_pakan`),
  CONSTRAINT `tb_pemasokan_pakan_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`),
  CONSTRAINT `tb_pemasokan_pakan_ibfk_2` FOREIGN KEY (`id_pemasok_pakan`) REFERENCES `tb_pemasok_pakan` (`id_pemasok_pakan`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_pemasokan_pakan` */

insert  into `tb_pemasokan_pakan`(`id_pasokan_pakan`,`id_pegawai`,`id_pemasok_pakan`,`tanggal_pasok`,`total_biaya_pasok`) values 
(1,1,15,'2023-01-01 08:00:00',38235946.45),
(2,2,25,'2023-01-02 09:30:00',29828631.29),
(3,3,5,'2023-01-03 10:45:00',37763660.66),
(4,4,30,'2023-01-04 11:15:00',22165710.46),
(5,5,10,'2023-01-05 12:30:00',36519099.17),
(6,6,20,'2023-01-06 14:00:00',22092669.32),
(7,7,35,'2023-01-07 15:20:00',31252939.29),
(8,8,8,'2023-01-08 16:45:00',14792615.47),
(9,9,18,'2023-01-09 18:00:00',37792485.66),
(10,10,28,'2023-01-10 19:30:00',26976554.19),
(11,11,38,'2023-01-11 20:45:00',32137213.07),
(12,12,12,'2023-01-12 22:15:00',24606406.98),
(13,13,22,'2023-01-13 23:30:00',39414047.84),
(14,14,33,'2023-01-14 01:00:00',11578129.99),
(15,15,3,'2023-01-15 02:20:00',26626783.93);

/*Table structure for table `tb_produk_daging` */

DROP TABLE IF EXISTS `tb_produk_daging`;

CREATE TABLE `tb_produk_daging` (
  `id_produk_daging` int(11) NOT NULL AUTO_INCREMENT,
  `id_sapi_wagyu` int(11) DEFAULT NULL,
  `nama_produk` varchar(64) DEFAULT NULL,
  `grade_produk` int(10) DEFAULT NULL,
  `marbling_daging` varchar(64) DEFAULT NULL,
  `warna_daging` varchar(64) DEFAULT NULL,
  `tekstur_daging` varchar(64) DEFAULT NULL,
  `harga_per_kg` decimal(10,2) DEFAULT NULL,
  `stok_daging` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produk_daging`),
  KEY `id_sapi_wagyu` (`id_sapi_wagyu`),
  CONSTRAINT `tb_produk_daging_ibfk_1` FOREIGN KEY (`id_sapi_wagyu`) REFERENCES `tb_sapi_wagyu` (`id_sapi_wagyu`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_produk_daging` */

insert  into `tb_produk_daging`(`id_produk_daging`,`id_sapi_wagyu`,`nama_produk`,`grade_produk`,`marbling_daging`,`warna_daging`,`tekstur_daging`,`harga_per_kg`,`stok_daging`) values 
(1,1,'Wagyu Ribeye',5,'High','Merah','Halus',200000.00,6),
(2,2,'Wagyu Sirloin',4,'Medium','Merah Muda','Halus',180000.00,4),
(3,3,'Wagyu Tenderloin',5,'High','Merah','Halus',220000.00,11),
(4,4,'Wagyu Striploin',4,'Medium','Merah Muda','Halus',190000.00,32),
(5,5,'Wagyu Brisket',3,'Low','Merah Tua','Berlemak',150000.00,29),
(6,3,'Wagyu Chuck',3,'Low','Merah Tua','Berlemak',160000.00,25),
(7,6,'Wagyu Chuck',3,'Low','Merah Tua','Berlemak',160000.00,31),
(8,7,'Wagyu Top Round',4,'Medium','Merah Muda','Halus',175000.00,20),
(9,2,'Wagyu Bottom Round',3,'Low','Merah Tua','Berlemak',155000.00,40),
(10,4,'Wagyu Short Plate',4,'Medium','Merah Muda','Berlemak',185000.00,24),
(11,9,'Wagyu Flank',3,'Low','Merah Tua','Berlemak',170000.00,26),
(12,1,'Wagyu Hanger Steak',4,'Medium','Merah Muda','Halus',190000.00,11),
(13,3,'Wagyu Skirt Steak',3,'Low','Merah Tua','Berlemak',175000.00,47),
(14,5,'Wagyu Bavette',4,'Medium','Merah Muda','Berlemak',200000.00,36),
(15,8,'Wagyu Tri-Tip',3,'Low','Merah Tua','Halus',180000.00,44),
(16,9,'Wagyu Coulotte',4,'Medium','Merah Muda','Berlemak',195000.00,39),
(17,2,'Wagyu Picanha',5,'High','Merah','Halus',210000.00,32);

/*Table structure for table `tb_provinsi` */

DROP TABLE IF EXISTS `tb_provinsi`;

CREATE TABLE `tb_provinsi` (
  `id_provinsi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_provinsi` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_provinsi`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_provinsi` */

insert  into `tb_provinsi`(`id_provinsi`,`nama_provinsi`) values 
(1,'Aceh'),
(2,'Sumatera Utara'),
(3,'Sumatera Barat'),
(4,'Riau'),
(5,'Jambi'),
(6,'Sumatera Selatan'),
(7,'Bengkulu'),
(8,'Lampung'),
(9,'Bangka Belitung'),
(10,'Kepulauan Riau'),
(11,'DKI Jakarta'),
(12,'Jawa Barat'),
(13,'Jawa Tengah'),
(14,'Jawa Timur'),
(15,'Banten'),
(16,'Bali'),
(17,'Nusa Tenggara Barat'),
(18,'Nusa Tenggara Timur'),
(19,'Kalimantan Barat'),
(20,'Kalimantan Tengah'),
(21,'Kalimantan Selatan'),
(22,'Kalimantan Timur'),
(23,'Kalimantan Utara'),
(24,'Sulawesi Utara'),
(25,'Sulawesi Tengah'),
(26,'Sulawesi Selatan'),
(27,'Sulawesi Tenggara'),
(28,'Gorontalo'),
(29,'Maluku'),
(30,'Maluku Utara'),
(31,'Papua'),
(32,'Papua Barat');

/*Table structure for table `tb_ras_sapi_wagyu` */

DROP TABLE IF EXISTS `tb_ras_sapi_wagyu`;

CREATE TABLE `tb_ras_sapi_wagyu` (
  `id_ras_sapi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ras_sapi` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_ras_sapi`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_ras_sapi_wagyu` */

insert  into `tb_ras_sapi_wagyu`(`id_ras_sapi`,`nama_ras_sapi`) values 
(1,'Black Wagyu'),
(2,'Red Wagyu'),
(3,'Fullblood Wagyu'),
(4,'Crossbred Wagyu'),
(5,'Japanese Wagyu'),
(6,'American Wagyu'),
(7,'Australian Wagyu'),
(8,'Canadian Wagyu'),
(9,'Kobe Wagyu'),
(10,'Tajima Wagyu'),
(11,'Shorthorn Wagyu'),
(12,'Miyazaki Wagyu'),
(13,'Matsusaka Wagyu'),
(14,'Ohmi Wagyu'),
(15,'Gunma Wagyu'),
(16,'Iwate Wagyu'),
(17,'Ishigaki Wagyu'),
(18,'Mottainai Wagyu'),
(19,'Tochigi Wagyu'),
(20,'Oita Wagyu'),
(21,'Saga Wagyu'),
(22,'Kumamoto Wagyu'),
(23,'Hokkaido Wagyu'),
(24,'Chugoku Wagyu'),
(25,'Kyushu Wagyu'),
(26,'Tosa Wagyu'),
(27,'Shimane Wagyu'),
(28,'Tanba Wagyu'),
(29,'Kochi Wagyu'),
(30,'Kagoshima Wagyu'),
(31,'Okayama Wagyu'),
(32,'Tokushima Wagyu'),
(33,'Wagyu F1'),
(34,'Wagyu F2'),
(35,'Wagyu F3'),
(36,'Wagyu F4'),
(37,'Wagyu F5');

/*Table structure for table `tb_sapi_wagyu` */

DROP TABLE IF EXISTS `tb_sapi_wagyu`;

CREATE TABLE `tb_sapi_wagyu` (
  `id_sapi_wagyu` int(11) NOT NULL AUTO_INCREMENT,
  `id_ras_sapi` int(11) DEFAULT NULL,
  `nama_sapi_wagyu` varchar(64) DEFAULT NULL,
  `umur_sapi` decimal(10,2) DEFAULT NULL,
  `berat_sapi` decimal(10,2) DEFAULT NULL,
  `riwayat_kesehatan_sapi` varchar(255) DEFAULT NULL,
  `data_genetik_sapi` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('jantan','betina') DEFAULT NULL,
  PRIMARY KEY (`id_sapi_wagyu`),
  KEY `id_ras_sapi` (`id_ras_sapi`),
  CONSTRAINT `tb_sapi_wagyu_ibfk_1` FOREIGN KEY (`id_ras_sapi`) REFERENCES `tb_ras_sapi_wagyu` (`id_ras_sapi`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_sapi_wagyu` */

insert  into `tb_sapi_wagyu`(`id_sapi_wagyu`,`id_ras_sapi`,`nama_sapi_wagyu`,`umur_sapi`,`berat_sapi`,`riwayat_kesehatan_sapi`,`data_genetik_sapi`,`jenis_kelamin`) values 
(1,1,'Wagyu001',2.50,300.50,'Sehat, vaksin lengkap','DNA123456','jantan'),
(2,2,'Wagyu002',3.20,400.75,'Beberapa masalah pencernaan','DNA654321','betina'),
(3,1,'Wagyu003',2.80,350.25,'Sering berjemur','DNA789012','jantan'),
(4,3,'Wagyu004',2.00,280.00,'Vaksin rutin','DNA345678','betina'),
(5,2,'Wagyu005',3.50,420.80,'Sehat, rajin berolahraga','DNA901234','jantan'),
(6,3,'Wagyu006',2.30,320.60,'Masalah kulit ringan','DNA567890','betina'),
(7,1,'Wagyu007',2.70,380.40,'Vaksin kurang lengkap','DNA123890','jantan'),
(8,2,'Wagyu008',3.80,450.00,'Sehat, aktif bergerak','DNA678901','betina'),
(9,3,'Wagyu009',2.20,310.20,'Sering batuk','DNA234567','jantan'),
(10,1,'Wagyu010',3.00,360.30,'Rajin berjemur','DNA890123','betina'),
(11,1,'Wagyu011',2.40,290.20,'Vaksin terakhir kurang','DNA345678','jantan'),
(12,2,'Wagyu012',3.10,390.10,'Beberapa alergi makanan','DNA901234','betina'),
(13,3,'Wagyu013',2.90,370.30,'Sering keseleo','DNA567890','jantan'),
(14,1,'Wagyu014',2.10,310.50,'Sehat, rutin cek gigi','DNA123890','betina'),
(15,2,'Wagyu015',3.40,420.90,'Rajin berjemur','DNA678901','jantan'),
(16,3,'Wagyu016',2.20,300.80,'Masalah pernapasan','DNA234567','betina'),
(17,1,'Wagyu017',2.80,360.70,'Vaksin lengkap','DNA890123','jantan'),
(18,2,'Wagyu018',3.70,430.40,'Aktif bergerak','DNA345678','betina'),
(19,3,'Wagyu019',2.30,330.60,'Sehat, rajin olahraga','DNA901234','jantan'),
(20,1,'Wagyu020',3.00,380.50,'Sering batuk','DNA567890','betina'),
(21,2,'Wagyu021',2.50,320.90,'Rajin berjemur','DNA234567','jantan'),
(22,3,'Wagyu022',3.20,400.20,'Sehat, vaksin lengkap','DNA890123','betina'),
(23,1,'Wagyu023',2.70,350.30,'Aktif bergerak','DNA345678','jantan'),
(24,2,'Wagyu024',3.50,410.80,'Beberapa alergi makanan','DNA901234','betina'),
(25,3,'Wagyu025',2.60,340.60,'Sering keseleo','DNA567890','jantan'),
(26,1,'Wagyu026',2.00,300.40,'Vaksin terakhir kurang','DNA123890','betina'),
(27,2,'Wagyu027',3.30,390.70,'Sehat, rutin cek gigi','DNA678901','jantan'),
(28,3,'Wagyu028',2.40,320.10,'Rajin berjemur','DNA234567','betina'),
(29,1,'Wagyu029',3.10,380.50,'Masalah pernapasan','DNA890123','jantan'),
(30,2,'Wagyu030',2.90,370.30,'Vaksin lengkap','DNA345678','betina'),
(31,3,'Wagyu031',2.20,310.60,'Aktif bergerak','DNA901234','jantan'),
(32,1,'Wagyu032',3.70,430.80,'Sering batuk','DNA567890','betina'),
(33,2,'Wagyu033',2.80,350.40,'Rajin berjemur','DNA234567','jantan'),
(34,3,'Wagyu034',3.50,410.70,'Sehat, vaksin lengkap','DNA890123','betina'),
(35,1,'Wagyu035',2.30,330.20,'Beberapa alergi makanan','DNA345678','jantan'),
(36,2,'Wagyu036',3.00,380.30,'Sering keseleo','DNA901234','betina'),
(37,3,'Wagyu037',2.50,320.60,'Rajin berjemur','DNA567890','jantan'),
(38,1,'Wagyu038',3.20,400.50,'Aktif bergerak','DNA234567','betina'),
(39,2,'Wagyu039',2.70,350.70,'Sehat, rutin cek gigi','DNA890123','jantan'),
(40,3,'Wagyu040',3.50,410.20,'Rajin berjemur','DNA345678','betina'),
(41,1,'Wagyu041',2.60,340.80,'Vaksin terakhir kurang','DNA901234','jantan'),
(42,2,'Wagyu042',2.00,300.30,'Beberapa alergi makanan','DNA567890','betina'),
(43,3,'Wagyu043',3.30,390.60,'Sering keseleo','DNA234567','jantan'),
(44,1,'Wagyu044',2.40,290.50,'Sehat, rajin olahraga','DNA890123','betina'),
(45,2,'Wagyu045',3.10,390.80,'Sering batuk','DNA345678','jantan'),
(46,3,'Wagyu046',2.90,370.20,'Rajin berjemur','DNA901234','betina'),
(47,1,'Wagyu047',2.10,310.40,'Sehat, vaksin lengkap','DNA567890','jantan'),
(48,2,'Wagyu048',3.40,420.70,'Beberapa alergi makanan','DNA234567','betina'),
(49,3,'Wagyu049',2.20,300.60,'Sering keseleo','DNA890123','jantan'),
(50,1,'Wagyu050',3.00,380.40,'Vaksin terakhir kurang','DNA345678','betina');

/*Table structure for table `tb_transaksi_daging` */

DROP TABLE IF EXISTS `tb_transaksi_daging`;

CREATE TABLE `tb_transaksi_daging` (
  `id_transaksi_daging` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_wilayah_penjualan` int(11) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi_daging`),
  KEY `id_pelanggan` (`id_pelanggan`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `id_wilayah_penjualan` (`id_wilayah_penjualan`),
  CONSTRAINT `tb_transaksi_daging_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`),
  CONSTRAINT `tb_transaksi_daging_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`),
  CONSTRAINT `tb_transaksi_daging_ibfk_3` FOREIGN KEY (`id_wilayah_penjualan`) REFERENCES `tb_wilayah_penjualan` (`id_wilayah_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_transaksi_daging` */

insert  into `tb_transaksi_daging`(`id_transaksi_daging`,`id_pelanggan`,`id_pegawai`,`id_wilayah_penjualan`,`tanggal_transaksi`,`total_harga`) values 
(1,15,7,10,'2023-01-05 08:30:00',2300000.50),
(2,25,14,17,'2023-01-12 12:45:00',3550000.75),
(3,8,3,5,'2023-02-03 14:20:00',2350000.30),
(4,40,22,15,'2023-02-15 09:10:00',2650000.40),
(5,12,8,16,'2023-03-02 16:05:00',2620000.60),
(6,5,2,7,'2023-03-18 10:30:00',1730000.20),
(7,30,18,12,'2023-04-07 11:15:00',2320000.90),
(8,20,11,12,'2023-04-22 13:40:00',1640000.45),
(9,45,30,3,'2023-05-01 17:00:00',3940000.30),
(10,10,5,8,'2023-05-12 08:45:00',1950000.80),
(11,35,23,10,'2023-06-03 14:20:00',4020000.25),
(12,18,9,7,'2023-06-20 12:10:00',1955000.70),
(13,3,1,4,'2023-07-08 15:30:00',2350000.50),
(14,48,35,17,'2023-07-19 09:25:00',3700000.60),
(15,14,6,3,'2023-08-05 11:40:00',1820000.40),
(16,28,17,8,'2023-08-18 16:15:00',3500000.90),
(17,7,4,13,'2023-09-02 10:50:00',2125000.30),
(18,42,27,17,'2023-09-15 13:05:00',2840000.80),
(19,16,10,3,'2023-10-01 17:30:00',2150000.70),
(20,33,21,8,'2023-10-14 08:15:00',3710000.50),
(21,23,12,15,'2023-11-03 14:40:00',2640000.60),
(22,50,37,2,'2023-11-16 12:25:00',3380000.40),
(23,9,5,10,'2023-12-01 16:50:00',2430000.20),
(24,38,24,7,'2023-12-14 09:35:00',2840000.70),
(25,19,11,2,'2023-12-28 11:20:00',3600000.90),
(26,2,1,13,'2024-01-05 08:30:00',1850000.50),
(27,27,16,8,'2024-01-18 12:45:00',2575000.75),
(28,6,3,5,'2024-02-03 14:20:00',2670000.30),
(29,43,29,15,'2024-02-15 09:10:00',2870000.40),
(30,15,7,2,'2024-03-02 16:05:00',2120000.60),
(31,31,19,7,'2024-03-18 10:30:00',1730000.20),
(32,21,13,12,'2024-04-07 11:15:00',3200000.90),
(33,46,31,5,'2024-04-22 13:40:00',1601350.45),
(34,11,6,3,'2024-05-01 17:00:00',2880000.30),
(35,36,24,8,'2024-05-12 08:45:00',2395000.80),
(36,17,8,10,'2024-06-03 14:20:00',2875000.25),
(37,32,20,7,'2024-06-20 12:10:00',3260000.70),
(38,24,14,4,'2024-07-08 15:30:00',1230000.50),
(39,49,36,7,'2024-07-19 09:25:00',4520000.60),
(40,13,7,3,'2024-08-05 11:40:00',2300000.40),
(41,29,18,8,'2024-08-18 16:15:00',2380000.90),
(42,8,4,1,'2024-09-02 10:50:00',2950000.30),
(43,44,30,2,'2024-09-15 13:05:00',3730000.80),
(44,20,11,3,'2024-10-01 17:30:00',1670000.70),
(45,34,22,8,'2024-10-14 08:15:00',3760000.50),
(46,22,12,15,'2024-11-03 14:40:00',2275000.60),
(47,47,34,2,'2024-11-16 12:25:00',3380000.40),
(48,10,5,10,'2024-12-01 16:50:00',2770000.20),
(49,39,25,7,'2024-12-14 09:35:00',2820000.70),
(50,18,11,9,'2024-12-28 11:20:00',2590000.90);

/*Table structure for table `tb_wilayah_penjualan` */

DROP TABLE IF EXISTS `tb_wilayah_penjualan`;

CREATE TABLE `tb_wilayah_penjualan` (
  `id_wilayah_penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `id_kabupaten` int(11) DEFAULT NULL,
  `nama_wilayah` varchar(64) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_wilayah_penjualan`),
  KEY `id_kabupaten` (`id_kabupaten`),
  CONSTRAINT `tb_wilayah_penjualan_ibfk_1` FOREIGN KEY (`id_kabupaten`) REFERENCES `tb_kabupaten` (`id_kabupaten`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_wilayah_penjualan` */

insert  into `tb_wilayah_penjualan`(`id_wilayah_penjualan`,`id_kabupaten`,`nama_wilayah`,`kode_pos`) values 
(1,1,'Denpasar','80111'),
(2,1,'Kuta','80361'),
(3,1,'Seminyak','80361'),
(4,2,'Bangli','80611'),
(5,2,'Kintamani','80652'),
(6,3,'Singaraja','81113'),
(7,3,'Lovina','81152'),
(8,4,'Ubud','80571'),
(9,4,'Gianyar','80511'),
(10,5,'Negara','82212'),
(11,5,'Melaya','82251'),
(12,6,'Amlapura','80811'),
(13,6,'Candidasa','80851'),
(14,7,'Semarapura','80711'),
(15,7,'Nusa Penida','80771'),
(16,8,'Tabanan','82111'),
(17,8,'Kediri','82121');

/* Trigger structure for table `tb_detail_pemasokan_pakan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `hitung_total_harga_pakan_detail_pemasokan` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `hitung_total_harga_pakan_detail_pemasokan` BEFORE INSERT ON `tb_detail_pemasokan_pakan` FOR EACH ROW BEGIN DECLARE harga DECIMAL(10, 2);

SELECT
  harga_pakan INTO harga
FROM
  tb_pakan
WHERE
  id_pakan = NEW.id_pakan;

-- Hitung total_harga_pakan
SET
  NEW.total_harga_pakan = harga * NEW.jumlah_pasokan_pakan;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_detail_transaksi_daging` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_insert_tb_detail_transaksi_daging` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_insert_tb_detail_transaksi_daging` AFTER INSERT ON `tb_detail_transaksi_daging` FOR EACH ROW BEGIN 
-- Mengurangkan jumlah stok daging
UPDATE tb_produk_daging
SET stok_daging = stok_daging - NEW.jumlah_produk_terjual
WHERE id_produk_daging = NEW.id_produk_daging;

-- Memperbarui total harga produk yang terjual
UPDATE tb_transaksi_daging
SET total_harga = total_harga + NEW.total_harga_pesan
WHERE id_transaksi_daging = NEW.id_transaksi_daging;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_kabupaten` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_nama_kabupaten` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_nama_kabupaten` BEFORE INSERT ON `tb_kabupaten` FOR EACH ROW BEGIN DECLARE new_alamat VARCHAR(255);

SET
    new_alamat = UPPER(NEW.nama_kabupaten);

-- Mengubah alamat menjadi huruf kapital
IF new_alamat LIKE '%D%P%S%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'DPS', 'DENPASAR');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%G%Y%R%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'GYR', 'GIANYAR');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%B%D%G%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'BDG', 'BADUNG');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%B%G%L%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'BGL', 'BANGLI');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%B%L%L%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'BLL', 'BULELENG');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%J%B%N%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'JBN', 'JEMBRANA');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%K%R%G%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'KRG', 'KARANGASEM');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%K%L%K%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'KLK', 'KLUNGKUNG');

SET
    NEW.nama_kabupaten = new_alamat;

ELSEIF new_alamat LIKE '%T%B%N%' THEN
SET
    new_alamat = REPLACE(new_alamat, 'TBN', 'TABANAN');

SET
    NEW.nama_kabupaten = new_alamat;

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pegawai` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pegawai_alamat` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pegawai_alamat` AFTER UPDATE ON `tb_pegawai` FOR EACH ROW BEGIN 
  IF OLD.alamat_pegawai != NEW.alamat_pegawai THEN
INSERT INTO
  tb_log_alamat_pegawai (
    id_pegawai,
    alamat_lama,
    alamat_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pegawai,
    OLD.alamat_pegawai,
    NEW.alamat_pegawai,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pegawai` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pegawai_nomor_telepon` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pegawai_nomor_telepon` AFTER UPDATE ON `tb_pegawai` FOR EACH ROW BEGIN 
  IF OLD.nomor_telepon_pegawai != NEW.nomor_telepon_pegawai THEN
INSERT INTO
  tb_log_nomor_telepon_pegawai (
    id_pegawai,
    nomor_telepon_lama,
    nomor_telepon_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pegawai,
    OLD.nomor_telepon_pegawai,
    NEW.nomor_telepon_pegawai,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pegawai` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pegawai_email` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pegawai_email` AFTER UPDATE ON `tb_pegawai` FOR EACH ROW BEGIN IF OLD.email_pegawai != NEW.email_pegawai THEN
INSERT INTO
  tb_log_email_pegawai (
    id_pegawai,
    email_lama,
    email_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pegawai,
    OLD.email_pegawai,
    NEW.email_pegawai,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pelanggan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pelanggan_alamat` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pelanggan_alamat` AFTER UPDATE ON `tb_pelanggan` FOR EACH ROW BEGIN IF OLD.alamat_pelanggan != NEW.alamat_pelanggan THEN
INSERT INTO
  tb_log_alamat_pelanggan (
    id_pelanggan,
    alamat_lama,
    alamat_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pelanggan,
    OLD.alamat_pelanggan,
    NEW.alamat_pelanggan,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pelanggan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pelanggan_nomor_telepon` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pelanggan_nomor_telepon` AFTER UPDATE ON `tb_pelanggan` FOR EACH ROW BEGIN 
  IF OLD.nomor_telepon_pelanggan != NEW.nomor_telepon_pelanggan THEN
INSERT INTO
  tb_log_nomor_telepon_pelanggan (
    id_pelanggan,
    nomor_telepon_lama,
    nomor_telepon_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pelanggan,
    OLD.nomor_telepon_pelanggan,
    NEW.nomor_telepon_pelanggan,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pelanggan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pelanggan_email` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pelanggan_email` AFTER UPDATE ON `tb_pelanggan` FOR EACH ROW BEGIN 
  IF OLD.email_pelanggan != NEW.email_pelanggan THEN
INSERT INTO
  tb_log_email_pelanggan (
    id_pelanggan,
    email_lama,
    email_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pelanggan,
    OLD.email_pelanggan,
    NEW.email_pelanggan,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pemasok_pakan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pemasok_pakan_alamat` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pemasok_pakan_alamat` AFTER UPDATE ON `tb_pemasok_pakan` FOR EACH ROW BEGIN 
  IF OLD.alamat_pemasok_pakan != NEW.alamat_pemasok_pakan THEN
INSERT INTO
  tb_log_alamat_pemasok_pakan (
    id_pemasok_pakan,
    alamat_lama,
    alamat_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pemasok_pakan,
    OLD.alamat_pemasok_pakan,
    NEW.alamat_pemasok_pakan,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pemasok_pakan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pemasok_pakan_email` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pemasok_pakan_email` AFTER UPDATE ON `tb_pemasok_pakan` FOR EACH ROW BEGIN 
  IF OLD.email_pemasok_pakan != NEW.email_pemasok_pakan THEN
INSERT INTO
  tb_log_email_pemasok_pakan (
    id_pemasok_pakan,
    email_lama,
    email_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pemasok_pakan,
    OLD.email_pemasok_pakan,
    NEW.email_pemasok_pakan,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/* Trigger structure for table `tb_pemasok_pakan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_update_tb_pemasok_pakan_nomor_telepon` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_update_tb_pemasok_pakan_nomor_telepon` AFTER UPDATE ON `tb_pemasok_pakan` FOR EACH ROW BEGIN 
  IF OLD.no_telepon_pemasok_pakan != NEW.no_telepon_pemasok_pakan THEN
INSERT INTO
  tb_log_nomor_telepon_pemasok_pakan (
    id_pemasok_pakan,
    nomor_telepon_lama,
    nomor_telepon_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pemasok_pakan,
    OLD.no_telepon_pemasok_pakan,
    NEW.no_telepon_pemasok_pakan,
    NOW()
  );

END IF;

END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
