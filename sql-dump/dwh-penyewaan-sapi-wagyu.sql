-- create database dwh_penyewaan_sapi_wagyu
CREATE DATABASE dwh_penyewaan_sapi_wagyu;

-- create table dimensi waktu
CREATE TABLE dimensi_waktu (
  row_key_waktu INT AUTO_INCREMENT NOT NULL,
  kode_waktu CHAR(5) NOT NULL,
  tahun YEAR,
  kuartal ENUM('1', '2', '3', '4'),
  bulan ENUM(
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ),
  hari ENUM(
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ),
  tanggal DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_waktu),
  UNIQUE(row_key_waktu, kode_waktu),
  UNIQUE(tahun, kuartal, bulan, hari, tanggal)
);

-- create table dimensi sapi
CREATE TABLE dimensi_sapi (
  row_key_sapi INT AUTO_INCREMENT NOT NULL,
  id_sapi INT,
  nama_sapi VARCHAR(64),
  umur_sapi DECIMAL(10, 2),
  berat_sapi DECIMAL(10, 2),
  riwayat_kesehatan_sapi VARCHAR(255),
  data_genetik_sapi VARCHAR(255),
  marbling_daging VARCHAR(64),
  warna_daging VARCHAR(64),
  tekstur_daging VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_sapi),
  UNIQUE(row_key_sapi, id_sapi)
);

-- create table dimensi pelanggan
CREATE TABLE dimensi_pelanggan (
  row_key_pelanggan INT AUTO_INCREMENT NOT NULL,
  id_pelanggan INT,
  nama_pelanggan VARCHAR(64),
  alamat_pelanggan VARCHAR(64),
  nomor_telepon_pelanggan VARCHAR(12),
  email_pelanggan VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_pelanggan),
  UNIQUE(row_key_pelanggan, id_pelanggan)
);

-- create table dimensi produk
CREATE TABLE dimensi_produk (
  row_key_produk INT AUTO_INCREMENT NOT NULL,
  id_produk_daging INT,
  nama_produk VARCHAR(64),
  grade_produk INT(10),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_produk),
  UNIQUE(row_key_produk, id_produk_daging)
);

-- create table dimensi wilayah
CREATE TABLE dimensi_wilayah (
  row_key_wilayah INT AUTO_INCREMENT NOT NULL,
  id_wilayah_penjualan INT,
  nama_wilayah VARCHAR(64),
  kode_pos VARCHAR(10),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_wilayah),
  UNIQUE(row_key_wilayah, id_wilayah_penjualan)
);

-- create table dimensi pemasok pakan
CREATE TABLE dimensi_pemasok_pakan (
  row_key_pemasok_pakan INT AUTO_INCREMENT NOT NULL,
  id_pemasok_pakan INT,
  nama_pemasok_pakan VARCHAR(64),
  alamat_pemasok_pakan VARCHAR(64),
  no_telepon_pemasok_pakan VARCHAR(12),
  email_pemasok_pakan VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_pemasok_pakan),
  UNIQUE(row_key_pemasok_pakan, id_pemasok_pakan)
);

-- create table dimensi jenis pakan
CREATE TABLE dimensi_jenis_pakan (
  row_key_jenis_pakan INT AUTO_INCREMENT NOT NULL,
  id_jenis_pakan INT,
  nama_jenis_pakan VARCHAR(64),
  kualitas_pakan INT(10),
  harga_pakan DECIMAL(10, 2),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_jenis_pakan),
  UNIQUE(row_key_jenis_pakan, id_jenis_pakan)
);

-- create table dimensi transaksi
CREATE TABLE dimensi_transaksi (
  row_key_transaksi INT AUTO_INCREMENT NOT NULL,
  id_transaksi_daging INT,
  tanggal_transaksi DATE,
  jumlah_daging_terjual DECIMAL(10, 2),
  grade_produk INT(10),
  nama_ras_sapi VARCHAR(64),
  total_harga DECIMAL(10, 2),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_transaksi),
  UNIQUE(row_key_transaksi, id_transaksi_daging)
);

-- create table kualitas_fact
CREATE TABLE kualitas_fact (
  id_kualitas INT AUTO_INCREMENT,
  id_sapi INT,
  marbling_daging VARCHAR(32),
  warna_daging VARCHAR(32),
  tekstur_daging VARCHAR(32),
  data_genetik VARCHAR(32),
  data_kesehatan VARCHAR(32),
  total_sapi INT,
  total_bagian_tubuh INT,
  PRIMARY KEY(id_kualitas),
  FOREIGN KEY(id_sapi) REFERENCES dimensi_sapi(id_sapi)
);

-- create table penjualan_fact
CREATE TABLE penjualan_fact (
  id_penjualan INT AUTO_INCREMENT,
  id_transaksi INT,
  id_produk INT,
  id_pelanggan INT,
  id_wilayah INT,
  id_waktu INT,
  jumlah_daging_terjual INT,
  grade_daging_terjual VARCHAR(32),
  ras_sapi_terjual VARCHAR(32),
  total_penjualan_daging INT,
  PRIMARY KEY(id_penjualan),
  FOREIGN KEY(id_transaksi) REFERENCES dimensi_transaksi(id_transaksi),
  FOREIGN KEY(id_produk) REFERENCES dimensi_produk(id_produk),
  FOREIGN KEY(id_pelanggan) REFERENCES dimensi_pelanggan(id_pelanggan),
  FOREIGN KEY(id_wilayah) REFERENCES dimensi_wilayah(id_wilayah),
  FOREIGN KEY(id_waktu) REFERENCES dimensi_waktu(id_waktu)
);

-- create table pemasok_fact
CREATE TABLE pemasok_fact (
  id_pemasok INT AUTO_INCREMENT,
  id_jenis_pakan INT,
  id_pemasok_pakan INT,
  jumlah_pemasok_makan INT,
  kualitas_pakan VARCHAR(32),
  kinerja_pemasok VARCHAR(32),
  PRIMARY KEY(id_pemasok),
  FOREIGN KEY(id_jenis_pakan) REFERENCES dimensi_jenis_pakan(id_jenis_pakan),
  FOREIGN KEY(id_pemasok_pakan) REFERENCES dimensi_pemasok_pakan(id_pemasok_pakan)
);