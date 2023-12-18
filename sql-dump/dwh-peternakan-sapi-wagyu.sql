-- create database dwh_peternakan_sapi_wagyu
CREATE DATABASE dwh_peternakan_sapi_wagyu;

USE dwh_peternakan_sapi_wagyu;

-- create table dimensi waktu
CREATE TABLE dimensi_waktu (
  row_key_waktu INT AUTO_INCREMENT NOT NULL,
  id_waktu INT,
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
  UNIQUE(row_key_waktu, id_waktu),
  UNIQUE(tahun, kuartal, bulan, hari, tanggal)
);

CREATE TABLE dimensi_provinsi(
  row_key_provinsi INT AUTO_INCREMENT NOT NULL,
  id_provinsi INT,
  nama_provinsi VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_provinsi),
  UNIQUE(row_key_provinsi, id_provinsi)
);

CREATE TABLE dimensi_kabupaten(
  row_key_kabupaten INT AUTO_INCREMENT NOT NULL,
  id_kabupaten INT,
  nama_kabupaten VARCHAR(64),
  nama_provinsi VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_kabupaten),
  UNIQUE(row_key_kabupaten, id_kabupaten)
);

CREATE TABLE dimensi_wilayah (
  row_key_wilayah INT AUTO_INCREMENT NOT NULL,
  id_wilayah INT,
  nama_wilayah VARCHAR(64),
  nama_kabupaten VARCHAR(64),
  kode_pos VARCHAR(10),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_wilayah),
  UNIQUE(row_key_wilayah, id_wilayah)
);

CREATE TABLE dimensi_sapi (
  row_key_sapi INT AUTO_INCREMENT NOT NULL,
  id_sapi_wagyu INT,
  nama_sapi_wagyu VARCHAR(64),
  nama_ras_sapi VARCHAR(64),
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

CREATE TABLE dimensi_pegawai (
  row_key_pegawai INT AUTO_INCREMENT NOT NULL,
  id_pegawai INT,
  nama_pegawai VARCHAR(64),
  nomor_telepon_pegawai VARCHAR(12),
  email_pegawai VARCHAR(64),
  alamat_pegawai VARCHAR(64),
  nama_kabupaten VARCHAR(64),
  nama_provinsi VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_pegawai),
  UNIQUE(row_key_pegawai, id_pegawai)
);

CREATE TABLE dimensi_pelanggan (
  row_key_pelanggan INT AUTO_INCREMENT NOT NULL,
  id_pelanggan INT,
  nama_pelanggan VARCHAR(64),
  nomor_telepon_pelanggan VARCHAR(12),
  email_pelanggan VARCHAR(64),
  alamat_pelanggan VARCHAR(64),
  nama_kabupaten VARCHAR(64),
  nama_provinsi VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_pelanggan),
  UNIQUE(row_key_pelanggan, id_pelanggan)
);

CREATE TABLE dimensi_pemasok_pakan (
  row_key_pemasok_pakan INT AUTO_INCREMENT NOT NULL,
  id_pemasok_pakan INT,
  nama_pemasok_pakan VARCHAR(64),
  nomor_telepon_pemasok_pakan VARCHAR(12),
  email_pemasok_pakan VARCHAR(64),
  alamat_pemasok_pakan VARCHAR(64),
  nama_kabupaten VARCHAR(64),
  nama_provinsi VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_pemasok_pakan),
  UNIQUE(row_key_pemasok_pakan, id_pemasok_pakan)
);

CREATE TABLE dimensi_produk (
  row_key_produk INT AUTO_INCREMENT NOT NULL,
  id_produk_daging INT,
  id_sapi INT,
  nama_produk VARCHAR(64),
  grade_produk INT(10),
  harga_produk DECIMAL(10, 2),
  nama_ras_sapi VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_produk),
  UNIQUE(row_key_produk, id_produk_daging, id_sapi)
);

CREATE TABLE dimensi_pakan (
  row_key_pakan INT AUTO_INCREMENT NOT NULL,
  id_pakan INT,
  nama_pakan VARCHAR(64),
  kualitas_pakan INT(10),
  harga_pakan DECIMAL(10, 2),
  nama_jenis_pakan VARCHAR(64),
  valid_awal DATE,
  valid_akhir DATE,
  current_flag ENUM('Y', 'N'),
  PRIMARY KEY(row_key_pakan),
  UNIQUE(row_key_pakan, id_pakan)
);

CREATE TABLE fakta_pemasokan_pakan(
  row_key_waktu INT NOT NULL,
  row_key_kabupaten INT NOT NULL,
  row_key_provinsi INT NOT NULL,
  row_key_pemasok_pakan INT NOT NULL,
  row_key_pegawai INT NOT NULL,
  row_key_pakan INT NOT NULL,
  total_pakan BIGINT,
  total_biaya_pemasokan DECIMAL(10, 2),
  FOREIGN KEY(row_key_waktu) REFERENCES dimensi_waktu(row_key_waktu),
  FOREIGN KEY(row_key_kabupaten) REFERENCES dimensi_kabupaten(row_key_kabupaten),
  FOREIGN KEY(row_key_provinsi) REFERENCES dimensi_provinsi(row_key_provinsi),
  FOREIGN KEY(row_key_pemasok_pakan) REFERENCES dimensi_pemasok_pakan(row_key_pemasok_pakan),
  FOREIGN KEY(row_key_pegawai) REFERENCES dimensi_pegawai(row_key_pegawai),
  FOREIGN KEY(row_key_pakan) REFERENCES dimensi_pakan(row_key_pakan),
  UNIQUE(
    row_key_waktu,
    row_key_kabupaten,
    row_key_provinsi,
    row_key_pemasok_pakan,
    row_key_pegawai,
    row_key_pakan
  )
);

CREATE TABLE fakta_penjualan_produk_daging(
  row_key_waktu INT NOT NULL,
  row_key_kabupaten INT NOT NULL,
  row_key_provinsi INT NOT NULL,
  row_key_pelanggan INT NOT NULL,
  row_key_pegawai INT NOT NULL,
  row_key_produk INT NOT NULL,
  total_produk INT NOT NULL,
  total_penjualan_produk DECIMAL(10, 2),
  FOREIGN KEY(row_key_waktu) REFERENCES dimensi_waktu(row_key_waktu),
  FOREIGN KEY(row_key_kabupaten) REFERENCES dimensi_kabupaten(row_key_kabupaten),
  FOREIGN KEY(row_key_provinsi) REFERENCES dimensi_provinsi(row_key_provinsi),
  FOREIGN KEY(row_key_pelanggan) REFERENCES dimensi_pelanggan(row_key_pelanggan),
  FOREIGN KEY(row_key_pegawai) REFERENCES dimensi_pegawai(row_key_pegawai),
  FOREIGN KEY(row_key_produk) REFERENCES dimensi_produk(row_key_produk),
  UNIQUE(
    row_key_waktu,
    row_key_kabupaten,
    row_key_provinsi,
    row_key_pelanggan,
    row_key_pegawai,
    row_key_produk
  )
);

-- CREATE TABLE kualitas_fact (
--   row_key_waktu INT NOT NULL,
--   id_kualitas INT AUTO_INCREMENT,
--   id_sapi INT,
--   marbling_daging VARCHAR(32),
--   warna_daging VARCHAR(32),
--   tekstur_daging VARCHAR(32),
--   data_genetik VARCHAR(32),
--   data_kesehatan VARCHAR(32),
--   PRIMARY KEY(id_kualitas),
--   FOREIGN KEY(id_sapi) REFERENCES dimensi_sapi(id_sapi)
-- );
-- -- create table penjualan_fact
-- CREATE TABLE penjualan_fact (
--   id_penjualan INT AUTO_INCREMENT,
--   id_transaksi INT,
--   id_produk INT,
--   id_pelanggan INT,
--   id_wilayah INT,
--   id_waktu INT,
--   jumlah_daging_terjual INT,
--   grade_daging_terjual VARCHAR(32),
--   ras_sapi_terjual VARCHAR(32),
--   total_penjualan_daging INT,
--   PRIMARY KEY(id_penjualan),
--   FOREIGN KEY(id_transaksi) REFERENCES dimensi_transaksi(id_transaksi),
--   FOREIGN KEY(id_produk) REFERENCES dimensi_produk(id_produk),
--   FOREIGN KEY(id_pelanggan) REFERENCES dimensi_pelanggan(id_pelanggan),
--   FOREIGN KEY(id_wilayah) REFERENCES dimensi_wilayah(id_wilayah),
--   FOREIGN KEY(id_waktu) REFERENCES dimensi_waktu(id_waktu)
-- );
-- -- create table pemasok_fact
-- CREATE TABLE pemasok_fact (
--   id_pemasok INT AUTO_INCREMENT,
--   id_jenis_pakan INT,
--   id_pemasok_pakan INT,
--   jumlah_pemasok_makan INT,
--   kualitas_pakan VARCHAR(32),
--   kinerja_pemasok VARCHAR(32),
--   PRIMARY KEY(id_pemasok),
--   FOREIGN KEY(id_jenis_pakan) REFERENCES dimensi_jenis_pakan(id_jenis_pakan),
--   FOREIGN KEY(id_pemasok_pakan) REFERENCES dimensi_pemasok_pakan(id_pemasok_pakan)
-- );