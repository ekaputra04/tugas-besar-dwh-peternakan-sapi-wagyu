# Tugas Besar Data Warehouse

## Anggota Kelompok:

Resandy Prisadana (2205551050)

I Putu Eka Putra Juniawan (2205551087)

Made Arya Darma Putra (2205551050)

Mata Kuliah: Pangkalan Data (D)

Dosen Pengampu: Dwi Putra Githa, S.T., M.T.

## Data Warehouse pada Studi Kasus Peternakan Sapi Wagyu

### Database Transaksional

Terdapat beberapa tabel utama pada database transaksional di antaranya:

```
tb_provinsi
tb_kabupaten
tb_wilayah_penjualan
tb_pelanggan
tb_pegawai
tb_pemasok_pakan
tb_jenis_pakan
tb_pakan
tb_ras_sapi_wagyu
tb_sapi_wagyu
tb_produk_daging
tb_transaksi_daging
tb_detail_transaksi_daging
tb_pemasokan_pakan
tb_detail_pemasokan_pakan
```

Serta terdapat beberapa tabel log yang bertujuan dalam proses Slowly Changing Dimension di antaranya:

```
tb_log_alamat_pelanggan
tb_log_nomor_telepon_pelanggan
tb_log_email_pelanggan
tb_log_alamat_pegawai
tb_log_nomor_telepon_pegawai
tb_log_email_pegawai
tb_log_alamat_pemasok_pakan
tb_log_nomor_telepon_pemasok_pakan
tb_log_email_pemasok_pakan
```

### Data Warehouse

Terdapat beberapa dimensi pada data warehouse di antaranya:

```
dimensi_waktu
dimensi_provinsi
dimensi_kabupaten
dimensi_wilayah
dimensi_sapi
dimensi_pegawai
dimensi_pelanggan
dimensi_pemasok_pakan
dimensi_produk
dimensi_pakan
```

Serta terdapat dua fakta yang akan dianalisis, yaitu seperti berikut:

```
fakta_pemasokan_pakan
fakta_penjualan_produk_daging
```

Pada file `select-informasi-dwh-peternakan-sapi-wagyu.sql` terdapat beberapa query untuk melakukan proses analisis. Beberapa analisis yang dapat dilakukan di antaranya:

Dimensi Kabupaten

```
1. Melihat informasi pemasokan dan informasi penjualan berdasarkan kabupaten
```

Dimensi Pakan

```
1. Melihat informasi pemasokan berdasarkan pakan
2. Melihat informasi pemasokan berdasarkan jenis_pakan
3. Melihat informasi pemasokan berdasarkan kualitas pakan

```

Dimensi Pegawai

```
1. Melihat informasi pemasokan dan informasi penjualan berdasarkan pegawai
2. Melihat informasi pemasokan dan informasi penjualan berdasarkan kabupaten pegawai
3. Melihat informasi pemasokan dan informasi penjualan berdasarkan provinsi pegawai
```

Dimensi Pelanggan

```
1. Melihat informasi penjualan berdasarkan pelanggan
2. Melihat informasi penjualan berdasarkan kabupaten pelanggan
3. Melihat informasi penjualan berdasarkan provinsi pelanggan
```

Dimensi Pemasok Pakan

```
1. Melihat informasi pemasokan berdasarkan pemasok pakan
2. Melihat informasi pemasokan berdasarkan kabupaten pemasok pakan
3. Melihat informasi pemasokan berdasarkan provinsi pemasok pakan
```

Dimensi Produk

```
1. Melihat informasi informasi penjualan berdasarkan produk
2. Melihat informasi informasi penjualan berdasarkan grade produk
3. Melihat informasi informasi penjualan berdasarkan harga produk
4. Melihat informasi informasi penjualan berdasarkan ras sapi
5. Melihat informasi informasi penjualan berdasarkan marbling daging
6. Melihat informasi informasi penjualan berdasarkan warna daging
7. Melihat informasi informasi penjualan berdasarkan tekstur daging
```

Dimensi Provinsi

```
1. Melihat informasi pemasokan dan informasi penjualan berdasarkan provinsi
```
