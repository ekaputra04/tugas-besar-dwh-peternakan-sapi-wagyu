CREATE DATABASE dbt_budidaya_sapi_wagyu

CREATE TABLE tb_pelanggan(
id_pelanggan CHAR(10),
nama_pelanggan VARCHAR (64),
alamat_pelanggan VARCHAR (64),
nomor_telepon_pelanggan VARCHAR(12),
email_pelanggan VARCHAR (64),
PRIMARY KEY (id_pelanggan)
);

CREATE TABLE tb_pegawai(
id_pegawai CHAR(10),
nama_pegawai VARCHAR (64),
alamat_pegawai VARCHAR (64),
nomor_telepon_pegawai VARCHAR(12),
email_peegawai VARCHAR (64),
PRIMARY KEY (id_pegawai)
);

CREATE TABLE tb_wilayah_penjualan (
id_wilayah CHAR(10),
nama_wilayah VARCHAR (64),
alamat_wilayah VARCHAR (8),
kode_pos INT,
PRIMARY KEY (id_wilayah)
);

ALTER TABLE tb_wilayah_penjualan MODIFY COLUMN alamat_wilayah VARCHAR(64);

CREATE TABLE tb_transaksi_daging(
id_transaksi_daging CHAR(10),
id_pelanggan CHAR(10),
id_pegawai CHAR(10),
id_wilayah CHAR(10),
tanggal_transaksi_daging DATE,
total_harga_transaksi_daging INT,
PRIMARY KEY (id_transaksi_daging),
FOREIGN KEY (id_pelanggan) REFERENCES tb_pelanggan(id_pelanggan),
FOREIGN KEY (id_pegawai) REFERENCES tb_pegawai(id_pegawai),
FOREIGN KEY (id_wilayah) REFERENCES tb_wilayah_penjualan(id_wilayah)
);

CREATE TABLE tb_jenis_pakan(
id_jenis_pakan CHAR(10),
nama_jenis_pakan VARCHAR(64),
kualitas_pakan VARCHAR(32),
PRIMARY KEY (id_jenis_pakan)
);

CREATE TABLE tb_sapi_wagyu_individu(
id_sapi_wagyu_individu CHAR(10),
nama_sapi_wagyu VARCHAR(64),
umur_sapi INT,
berat_sapi INT,
ras_sapi_wagyu VARCHAR(32),
riwayat_kesehatan_sapi VARCHAR(255),
data_genetik_sapi VARCHAR(255),
jenis_kelamin ENUM ("jantan", "betina"),
PRIMARY KEY (id_sapi_wagyu_individu)
);

CREATE TABLE tb_produk_daging(
id_produk_daging CHAR(10),
id_sapi_wagyu_individu CHAR(10),
nama_produk VARCHAR(64),
grade_produk VARCHAR(8),
produk_ras_sapi_wagyu VARCHAR(32),
marbling_daging VARCHAR(32),
warna_daging VARCHAR(32),
tekstur_daging VARCHAR(32),
PRIMARY KEY (id_produk_daging),
FOREIGN KEY (id_sapi_wagyu_individu) REFERENCES tb_sapi_wagyu_individu(id_sapi_wagyu_individu)
);

CREATE TABLE tb_pemasok_makanan(
id_pemasok_makanan CHAR(10),
id_jenis_pakan CHAR(10),
nama_pemasok_makanan VARCHAR(64),
alamat_pemasok_makanan VARCHAR(64),
no_telepon_pemasok VARCHAR(12),
email_pemasok VARCHAR(64),
PRIMARY KEY (id_pemasok_makanan),
FOREIGN KEY (id_jenis_pakan) REFERENCES tb_jenis_pakan(id_jenis_pakan)
);

CREATE TABLE tb_detail_transaksi_daging(
id_detail_transaksi_daging CHAR(10),
id_transaksi_daging CHAR(10),
id_produk_daging CHAR(10),
id_pemasok_makanan CHAR(10),
jumlah_produk_terjual INT,
harga_transaksi_daging INT,
PRIMARY KEY (id_detail_transaksi_daging),
FOREIGN KEY (id_transaksi_daging) REFERENCES tb_transaksi_daging(id_transaksi_daging),
FOREIGN KEY (id_produk_daging) REFERENCES tb_produk_daging(id_produk_daging),
FOREIGN KEY (id_pemasok_makanan) REFERENCES tb_pemasok_makanan(id_pemasok_makanan)
);
