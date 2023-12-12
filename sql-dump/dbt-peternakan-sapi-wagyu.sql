-- create database db_peternakan_sapi_wagyu
CREATE DATABASE dbt_peternakan_sapi_wagyu;

-- create table pelanggan
CREATE TABLE tb_pelanggan (
  id_pelanggan INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nama_pelanggan VARCHAR(64),
  alamat_pelanggan VARCHAR(64),
  nomor_telepon_pelanggan VARCHAR(12),
  email_pelanggan VARCHAR(64)
);

-- create table pegawai
CREATE TABLE tb_pegawai (
  id_pegawai INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nama_pegawai VARCHAR(64),
  alamat_pegawai VARCHAR(64),
  nomor_telepon_pegawai VARCHAR(12),
  email_pegawai VARCHAR(64)
);

-- create table tb_wilayah_penjualan
CREATE TABLE tb_wilayah_penjualan (
  id_wilayah_penjualan INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_kabupaten int,
  nama_wilayah VARCHAR(64),
  kode_pos VARCHAR(10),
  FOREIGN KEY (id_kabupaten) REFERENCES tb_kabupaten (id_kabupaten)
);

-- create table tb_wilayah_kabupaten
CREATE TABLE tb_kabupaten (
  id_kabupaten INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_provinsi INT,
  nama_kabupaten VARCHAR(64),
  FOREIGN KEY (id_provinsi) REFERENCES tb_provinsi (id_provinsi)
);

-- create table tb_provinsi
CREATE TABLE tb_provinsi (
  id_provinsi INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nama_provinsi VARCHAR(64),
);

-- create table transaksi_daging
CREATE TABLE tb_transaksi_daging (
  id_transaksi_daging INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_pelanggan INT,
  id_pegawai INT,
  id_wilayah_penjualan INT,
  tanggal_transaksi DATETIME,
  total_harga DECIMAL(10, 2),
  FOREIGN KEY (id_pelanggan) REFERENCES tb_pelanggan(id_pelanggan),
  FOREIGN KEY (id_pegawai) REFERENCES tb_pegawai(id_pegawai),
  FOREIGN KEY (id_wilayah_penjualan) REFERENCES tb_wilayah_penjualan(id_wilayah_penjualan)
);

-- create table tb_jenis_pakan
CREATE TABLE tb_jenis_pakan (
  id_jenis_pakan INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nama_jenis_pakan VARCHAR(64),
  kualitas_pakan INT(10),
  harga_pakan DECIMAL(10, 2)
);

-- create table tb_pemasok_makanan
CREATE TABLE tb_pemasok_pakan (
  id_pemasok_pakan INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_jenis_pakan INT,
  nama_pemasok_pakan VARCHAR(64),
  alamat_pemasok_pakan VARCHAR(64),
  no_telepon_pemasok_pakan VARCHAR(12),
  email_pemasok_pakan VARCHAR(64),
  FOREIGN KEY (id_jenis_pakan) REFERENCES tb_jenis_pakan(id_jenis_pakan)
);

CREATE TABLE tb_log_pemasok_pakan (
  id_log_pemasok_pakan INT PRIMARY KEY AUTO_INCREMENT,
  id_pemasok_pakan INT,
  nama_pemasok_pakan VARCHAR(64),
  tanggal_penambahan DATE
);

CREATE TABLE tb_log_perubahan_umur (
  id_Log_perubahan_umur INT PRIMARY KEY AUTO_INCREMENT,
    id_sapi_wagyu INT,
    umur_sebelum INT,
    umur_sesudah INT,
    tanggal_perubahan DATE,
    FOREIGN KEY (id_sapi_wagyu) REFERENCES tb_sapi_wagyu (id_sapi_wagyu)
  );

-- create table tb_ras_sapi_wagyu
CREATE TABLE tb_ras_sapi_wagyu (
  id_ras_sapi INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nama_ras_sapi VARCHAR(64)
);

-- create table tb_sapi_wagyu
CREATE TABLE tb_sapi_wagyu (
  id_sapi_wagyu INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_ras_sapi INT,
  nama_sapi_wagyu VARCHAR(64),
  umur_sapi DECIMAL(10, 2),
  berat_sapi DECIMAL(10, 2),
  riwayat_kesehatan_sapi VARCHAR(255),
  data_genetik_sapi VARCHAR(255),
  jenis_kelamin ENUM('jantan', 'betina'),
  FOREIGN KEY (id_ras_sapi) REFERENCES tb_ras_sapi_wagyu(id_ras_sapi)
);

-- create table tb_produk_daging
CREATE TABLE tb_produk_daging (
  id_produk_daging INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_sapi_wagyu INT,
  nama_produk VARCHAR(64),
  grade_produk INT(10),
  marbling_daging VARCHAR(64),
  warna_daging VARCHAR(64),
  tekstur_daging VARCHAR(64),
  harga_per_kg DECIMAL(10, 2),
  FOREIGN KEY (id_sapi_wagyu) REFERENCES tb_sapi_wagyu(id_sapi_wagyu)
);

-- create table tb_detail_transaksi_daging
CREATE TABLE tb_detail_transaksi_daging (
  id_detail_transaksi_daging INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_transaksi_daging INT,
  id_produk_daging INT,
  id_pemasok_pakan INT,
  jumlah_produk_terjual DECIMAL(10, 2),
  total_harga_pesan DECIMAL(10, 2),
  FOREIGN KEY (id_transaksi_daging) REFERENCES tb_transaksi_daging(id_transaksi_daging),
  FOREIGN KEY (id_produk_daging) REFERENCES tb_produk_daging(id_produk_daging),
  FOREIGN KEY (id_pemasok_pakan) REFERENCES tb_pemasok_pakan(id_pemasok_pakan)
);