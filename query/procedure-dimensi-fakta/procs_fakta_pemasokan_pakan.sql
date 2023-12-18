DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_fakta_pemasokan_pakan() BEGIN
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

END $ $ DELIMITER