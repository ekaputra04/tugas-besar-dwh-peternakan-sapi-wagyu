DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_pakan() BEGIN DROP TABLE IF EXISTS stg_pakan;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_pakan
SELECT
	k.id_pakan AS id_pakan,
	p.nama_jenis_pakan AS nama_jenis_pakan,
	k.nama_pakan AS nama_pakan,
	k.kualitas_pakan AS kualitas_pakan,
	k.harga_pakan AS harga_pakan
FROM
	dbt_peternakan_sapi_wagyu.tb_pakan AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_jenis_pakan AS p ON p.id_jenis_pakan = k.id_jenis_pakan;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_pakan (
		id_pakan,
		nama_pakan,
		kualitas_pakan,
		harga_pakan,
		nama_jenis_pakan,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_pakan,
	k.nama_pakan,
	k.kualitas_pakan,
	k.harga_pakan,
	k.nama_jenis_pakan,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	RIGHT JOIN stg_pakan AS k ON IFNULL(kdw.id_pakan, '-1') = IFNULL(k.id_pakan, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_pakan IS NULL
GROUP BY
	k.id_pakan
ORDER BY
	k.id_pakan ASC;

DROP TABLE IF EXISTS temp_pakan;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pakan
SELECT
	kdw.row_key_pakan,
	kdw.id_pakan
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	JOIN stg_pakan AS k ON kdw.id_pakan = k.id_pakan
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_pakan, '') <> IFNULL(k.nama_pakan, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_pakan AS kdw,
	temp_pakan
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_pakan = temp_pakan.row_key_pakan
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_pakan (
		id_pakan,
		nama_pakan,
		kualitas_pakan,
		harga_pakan,
		nama_jenis_pakan,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_pakan,
	k.nama_pakan,
	k.kualitas_pakan,
	k.harga_pakan,
	k.nama_jenis_pakan,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	JOIN stg_pakan AS k ON kdw.id_pakan = k.id_pakan
WHERE
	k.id_pakan IN (
		SELECT
			DISTINCT id_pakan
		FROM
			temp_pakan
	)
GROUP BY
	k.id_pakan
ORDER BY
	k.id_pakan ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pakan;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pakan
SELECT
	kdw.row_key_pakan,
	kdw.id_pakan
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pakan AS kdw
	LEFT JOIN stg_pakan AS k ON kdw.id_pakan = k.id_pakan
WHERE
	k.id_pakan IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_pakan AS kdw,
	temp_pakan
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_pakan = temp_pakan.row_key_pakan
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pakan;

DROP TABLE IF EXISTS temp_pakan;

END $ $ DELIMITER;