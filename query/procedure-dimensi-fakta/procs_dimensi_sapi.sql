DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_sapi() BEGIN DROP TABLE IF EXISTS stg_sapi_wagyu;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_sapi_wagyu
SELECT
	k.id_sapi_wagyu AS id_sapi_wagyu,
	k.nama_sapi_wagyu AS nama_sapi_wagyu,
	k.umur_sapi AS umur_sapi,
	k.berat_sapi AS berat_sapi,
	k.riwayat_kesehatan_sapi AS riwayat_kesehatan_sapi,
	k.data_genetik_sapi AS data_genetik_sapi,
	p.nama_ras_sapi AS nama_ras_sapi,
	pd.marbling_daging AS marbling_daging,
	pd.warna_daging AS warna_daging,
	pd.tekstur_daging AS tekstur_daging
FROM
	dbt_peternakan_sapi_wagyu.tb_sapi_wagyu AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_ras_sapi_wagyu AS p ON p.id_ras_sapi = k.id_ras_sapi
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging as pd ON pd.id_sapi_wagyu = k.id_sapi_wagyu;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_sapi (
		id_sapi_wagyu,
		nama_sapi_wagyu,
		nama_ras_sapi,
		umur_sapi,
		berat_sapi,
		riwayat_kesehatan_sapi,
		data_genetik_sapi,
		marbling_daging,
		warna_daging,
		tekstur_daging,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_sapi_wagyu,
	k.nama_sapi_wagyu,
	k.nama_ras_sapi,
	k.umur_sapi,
	k.berat_sapi,
	k.riwayat_kesehatan_sapi,
	k.data_genetik_sapi,
	k.marbling_daging,
	k.warna_daging,
	k.tekstur_daging,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	RIGHT JOIN stg_sapi_wagyu AS k ON IFNULL(kdw.id_sapi_wagyu, '-1') = IFNULL(k.id_sapi_wagyu, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_sapi_wagyu IS NULL
GROUP BY
	k.id_sapi_wagyu
ORDER BY
	k.id_sapi_wagyu ASC;

DROP TABLE IF EXISTS temp_sapi_wagyu;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_sapi_wagyu
SELECT
	kdw.row_key_sapi,
	kdw.id_sapi_wagyu
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	JOIN stg_sapi_wagyu AS k ON kdw.id_sapi_wagyu = k.id_sapi_wagyu
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_sapi_wagyu, '') <> IFNULL(k.nama_sapi_wagyu, '')
	OR IFNULL(kdw.nama_ras_sapi, '') <> IFNULL(k.nama_ras_sapi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_sapi AS kdw,
	temp_sapi_wagyu
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_sapi = temp_sapi_wagyu.row_key_sapi
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_sapi (
		id_sapi_wagyu,
		nama_sapi_wagyu,
		nama_ras_sapi,
		umur_sapi,
		berat_sapi,
		riwayat_kesehatan_sapi,
		data_genetik_sapi,
		marbling_daging,
		warna_daging,
		tekstur_daging,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_sapi_wagyu,
	k.nama_sapi_wagyu,
	k.nama_ras_sapi,
	k.umur_sapi,
	k.berat_sapi,
	k.riwayat_kesehatan_sapi,
	k.data_genetik_sapi,
	k.marbling_daging,
	k.warna_daging,
	k.tekstur_daging,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	JOIN stg_sapi_wagyu AS k ON kdw.id_sapi_wagyu = k.id_sapi_wagyu
WHERE
	k.id_sapi_wagyu IN (
		SELECT
			DISTINCT id_sapi_wagyu
		FROM
			temp_sapi_wagyu
	)
GROUP BY
	k.id_sapi_wagyu
ORDER BY
	k.id_sapi_wagyu ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_sapi_wagyu;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_sapi_wagyu
SELECT
	kdw.row_key_sapi,
	kdw.id_sapi_wagyu
FROM
	dwh_peternakan_sapi_wagyu.dimensi_sapi AS kdw
	LEFT JOIN stg_sapi_wagyu AS k ON kdw.id_sapi_wagyu = k.id_sapi_wagyu
WHERE
	k.id_sapi_wagyu IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_sapi AS kdw,
	temp_sapi_wagyu
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_sapi = temp_sapi_wagyu.row_key_sapi
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_sapi_wagyu;

DROP TABLE IF EXISTS temp_sapi_wagyu;

END $ $ DELIMITER;