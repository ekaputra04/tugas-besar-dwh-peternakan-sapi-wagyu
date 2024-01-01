-- =========================================================================================
-- 																FAKTA PEMASOKAN PAKAN
-- 									Informasi total pasok dan total biaya pemasokan
-- 									Informasi total produk dan total penjualan produk
-- =========================================================================================
-- =========================================================================================
-- 																		DIMENSI KABUPATEN
-- =========================================================================================
-- 1. data kabupaten
-- -----------------------------------------------------------------------------------------
SELECT
	dim_kabupaten.`id_kabupaten`,
	dim_kabupaten.`nama_kabupaten`,
	dim_kabupaten.`nama_provinsi`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_kabupaten` AS dim_kabupaten
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_kabupaten` = dim_kabupaten.`row_key_kabupaten`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_kabupaten` = dim_kabupaten.`row_key_kabupaten`
GROUP BY
	dim_kabupaten.`id_kabupaten`;

-- 2 data provinsi 
-- -----------------------------------------------------------------------------------------
SELECT
	dim_kabupaten.`nama_provinsi`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_kabupaten` AS dim_kabupaten
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_kabupaten` = dim_kabupaten.`row_key_kabupaten`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_kabupaten` = dim_kabupaten.`row_key_kabupaten`
GROUP BY
	dim_kabupaten.`nama_provinsi`;

-- =========================================================================================
-- 																		DIMENSI PAKAN
-- =========================================================================================
-- 1. data pakan 
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pakan.`id_pakan`,
	dim_pakan.`nama_pakan`,
	dim_pakan.`kualitas_pakan`,
	dim_pakan.`harga_pakan`,
	dim_pakan.`nama_jenis_pakan`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pakan` AS dim_pakan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pakan` = dim_pakan.`row_key_pakan`
WHERE
	dim_pakan.`current_flag` = 'Y'
GROUP BY
	dim_pakan.`id_pakan`;

-- 2. data jenis_pakan
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pakan.`nama_jenis_pakan`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pakan` AS dim_pakan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pakan` = dim_pakan.`row_key_pakan`
GROUP BY
	dim_pakan.`nama_jenis_pakan`;

-- 3. data kualitas_pakan
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pakan.`kualitas_pakan`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pakan` AS dim_pakan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pakan` = dim_pakan.`row_key_pakan`
GROUP BY
	dim_pakan.`kualitas_pakan`;

-- =========================================================================================
-- 																		DIMENSI PEGAWAI
-- =========================================================================================
-- 1. data pegawai
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pegawai.`id_pegawai`,
	dim_pegawai.`nama_pegawai`,
	dim_pegawai.`nomor_telepon_pegawai`,
	dim_pegawai.`email_pegawai`,
	dim_pegawai.`alamat_pegawai`,
	dim_pegawai.`nama_kabupaten`,
	dim_pegawai.`nama_provinsi`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pegawai` AS dim_pegawai
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pegawai` = dim_pegawai.`row_key_pegawai`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_pegawai` = dim_pegawai.`row_key_pegawai`
GROUP BY
	dim_pegawai.`id_pegawai`;

-- 2. data kota
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pegawai.`nama_kabupaten`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pegawai` AS dim_pegawai
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pegawai` = dim_pegawai.`row_key_pegawai`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_pegawai` = dim_pegawai.`row_key_pegawai`
GROUP BY
	dim_pegawai.`nama_kabupaten`;

-- 3. data provinsi
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pegawai.`nama_provinsi`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pegawai` AS dim_pegawai
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pegawai` = dim_pegawai.`row_key_pegawai`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_pegawai` = dim_pegawai.`row_key_pegawai`
GROUP BY
	dim_pegawai.`nama_provinsi`;

-- =========================================================================================
-- 																		DIMENSI PELANGGAN
-- =========================================================================================
-- 1. data pelanggan
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pelanggan.`id_pelanggan`,
	dim_pelanggan.`nama_pelanggan`,
	dim_pelanggan.`nomor_telepon_pelanggan`,
	dim_pelanggan.`email_pelanggan`,
	dim_pelanggan.`alamat_pelanggan`,
	dim_pelanggan.`nama_kabupaten`,
	dim_pelanggan.`nama_provinsi`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pelanggan` AS dim_pelanggan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_pelanggan` = dim_pelanggan.`row_key_pelanggan`
GROUP BY
	dim_pelanggan.`id_pelanggan`;

-- 2. data kota
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pelanggan.`nama_kabupaten`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pelanggan` AS dim_pelanggan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_pelanggan` = dim_pelanggan.`row_key_pelanggan`
GROUP BY
	dim_pelanggan.`nama_kabupaten`;

-- 3. data provinsi
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pelanggan.`nama_provinsi`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pelanggan` AS dim_pelanggan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_pelanggan` = dim_pelanggan.`row_key_pelanggan`
GROUP BY
	dim_pelanggan.`nama_provinsi`;

-- =========================================================================================
-- 																		DIMENSI PEMASOK PAKAN
-- =========================================================================================
-- 1. data pemasok_pakan
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pemasok_pakan.`id_pemasok_pakan`,
	dim_pemasok_pakan.`nama_pemasok_pakan`,
	dim_pemasok_pakan.`nomor_telepon_pemasok_pakan`,
	dim_pemasok_pakan.`email_pemasok_pakan`,
	dim_pemasok_pakan.`alamat_pemasok_pakan`,
	dim_pemasok_pakan.`nama_kabupaten`,
	dim_pemasok_pakan.`nama_provinsi`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pemasok_pakan` AS dim_pemasok_pakan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pemasok_pakan` = dim_pemasok_pakan.`row_key_pemasok_pakan`
GROUP BY
	dim_pemasok_pakan.`id_pemasok_pakan`;

-- 2. data kabupaten
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pemasok_pakan.`nama_kabupaten`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pemasok_pakan` AS dim_pemasok_pakan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pemasok_pakan` = dim_pemasok_pakan.`row_key_pemasok_pakan`
GROUP BY
	dim_pemasok_pakan.`nama_kabupaten`;

-- 3. data provinsi
-- -----------------------------------------------------------------------------------------
SELECT
	dim_pemasok_pakan.`nama_provinsi`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_pemasok_pakan` AS dim_pemasok_pakan
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_pemasok_pakan` = dim_pemasok_pakan.`row_key_pemasok_pakan`
GROUP BY
	dim_pemasok_pakan.`nama_provinsi`;

-- =========================================================================================
-- 																		DIMENSI PRODUK
-- =========================================================================================
-- 1. data produk
-- -----------------------------------------------------------------------------------------
SELECT
	dim_produk.`id_produk_daging`,
	dim_produk.`nama_produk`,
	dim_produk.`grade_produk`,
	dim_produk.`harga_produk`,
	dim_produk.`nama_ras_sapi`,
	dim_sapi.`marbling_daging`,
	dim_sapi.`warna_daging`,
	dim_sapi.`tekstur_daging`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_produk` AS dim_produk
	JOIN dwh_peternakan_sapi_wagyu.`dimensi_sapi` AS dim_sapi ON dim_sapi.`id_sapi_wagyu` = dim_produk.`id_sapi`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_produk` = dim_produk.`row_key_produk`
GROUP BY
	dim_produk.`id_produk_daging`;

-- 2. data grade produk
-- -----------------------------------------------------------------------------------------
SELECT
	dim_produk.`grade_produk`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_produk` AS dim_produk
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_produk` = dim_produk.`row_key_produk`
GROUP BY
	dim_produk.`grade_produk`;

-- 3. data harga produk
-- -----------------------------------------------------------------------------------------
SELECT
	dim_produk.`harga_produk`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_produk` AS dim_produk
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_produk` = dim_produk.`row_key_produk`
GROUP BY
	dim_produk.`harga_produk`;

-- 4. data ras_sapi
-- -----------------------------------------------------------------------------------------
SELECT
	dim_produk.`nama_ras_sapi`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_produk` AS dim_produk
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_produk` = dim_produk.`row_key_produk`
GROUP BY
	dim_produk.`nama_ras_sapi`;

-- 5. data marbling daging
-- -----------------------------------------------------------------------------------------
SELECT
	dim_sapi.`marbling_daging`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_produk` AS dim_produk
	JOIN dwh_peternakan_sapi_wagyu.`dimensi_sapi` AS dim_sapi ON dim_sapi.`id_sapi_wagyu` = dim_produk.`id_sapi`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_produk` = dim_produk.`row_key_produk`
GROUP BY
	dim_sapi.`marbling_daging`;

-- 6. data warna daging
-- -----------------------------------------------------------------------------------------
SELECT
	dim_sapi.`warna_daging`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_produk` AS dim_produk
	JOIN dwh_peternakan_sapi_wagyu.`dimensi_sapi` AS dim_sapi ON dim_sapi.`id_sapi_wagyu` = dim_produk.`id_sapi`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_produk` = dim_produk.`row_key_produk`
GROUP BY
	dim_sapi.`warna_daging`;

-- 7. data tekstur daging
-- -----------------------------------------------------------------------------------------
SELECT
	dim_sapi.`tekstur_daging`,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_produk` AS dim_produk
	JOIN dwh_peternakan_sapi_wagyu.`dimensi_sapi` AS dim_sapi ON dim_sapi.`id_sapi_wagyu` = dim_produk.`id_sapi`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_produk` = dim_produk.`row_key_produk`
GROUP BY
	dim_sapi.`tekstur_daging`;

-- =========================================================================================
-- 																		DIMENSI PROVINSI
-- =========================================================================================
-- 1. data provinsi
-- -----------------------------------------------------------------------------------------
SELECT
	dim_provinsi.`id_provinsi`,
	dim_provinsi.`nama_provinsi`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_provinsi` AS dim_provinsi
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_provinsi` = dim_provinsi.`row_key_provinsi`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_provinsi` = dim_provinsi.`row_key_provinsi`
GROUP BY
	dim_provinsi.`id_provinsi`;

-- =========================================================================================
-- 																		DIMENSI WAKTU
-- =========================================================================================
-- 1. data waktu dan informasi pemasokan dan penjualan
-- -----------------------------------------------------------------------------------------
SELECT
	dim_waktu.`id_waktu`,
	dim_waktu.`tahun`,
	dim_waktu.`kuartal`,
	dim_waktu.`bulan`,
	dim_waktu.`hari`,
	dim_waktu.`tanggal`,
	SUM(pemasokan_fact.`total_pakan`) AS total_pakan,
	SUM(pemasokan_fact.`total_biaya_pemasokan`) AS total_biaya_pakan,
	SUM(penjualan_fact.`total_produk`) AS total_produk,
	SUM(penjualan_fact.`total_penjualan_produk`) AS total_penjualan_produk
FROM
	dwh_peternakan_sapi_wagyu.`dimensi_waktu` AS dim_waktu
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_pemasokan_pakan` AS pemasokan_fact ON pemasokan_fact.`row_key_waktu` = dim_waktu.`row_key_waktu`
	LEFT JOIN dwh_peternakan_sapi_wagyu.`fakta_penjualan_produk_daging` AS penjualan_fact ON penjualan_fact.`row_key_waktu` = dim_waktu.`row_key_waktu`
GROUP BY
	dim_waktu.`id_waktu`;