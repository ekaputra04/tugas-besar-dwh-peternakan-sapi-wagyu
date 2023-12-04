-- create database dwh-penyewaan-sapi-wagyu
CREATE DATABASE dwh_penyewaan_sapi_wagyu;

-- create table dimensi waktu
CREATE TABLE dimensi_waktu(
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
CREATE TABLE dimensi_sapi(
  row_key_sapi INT AUTO_INCREMENT NOT NULL,
  id_sapi_wagyu INT,
  nama_sapi_wagyu VARCHAR(64),
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
  UNIQUE(row_key_sapi, id_sapi_wagyu)
);

-- create table dimensi pelanggan
CREATE TABLE dimensi_pelanggan(
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
CREATE TABLE dimensi_produk(
  row_key_produk INT AUTO_INCREMENT NOT NULL,
  id_produk_daging INT,
  nama_produk VARCHAR(64),
  grade_produk INT (10),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_produk),
  UNIQUE(row_key_produk, id_produk_daging)
);

-- create table dimensi wilayah
CREATE TABLE dimensi_wilayah(
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
CREATE TABLE dimensi_pemasok_pakan(
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
CREATE TABLE dimensi_jenis_pakan(
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
CREATE TABLE dimensi_transaksi(
  row_key_transaksi INT AUTO_INCREMENT NOT NULL,
  id_transaksi_daging INT,
  tanggal_transaksi DATE,
  jumlah_daging_terjual DECIMAL(10, 2),
  grade_produk INT (10),
  nama_ras_sapi VARCHAR(64),
  total_harga DECIMAL(10, 2),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_transaksi),
  UNIQUE(row_key_transaksi, id_transaksi_daging)
);