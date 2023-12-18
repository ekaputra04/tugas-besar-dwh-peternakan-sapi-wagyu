DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_fakta_penjualan_produk_daging() BEGIN
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

END $ $ DELIMITER