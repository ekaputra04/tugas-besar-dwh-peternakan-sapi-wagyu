DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_wilayah() BEGIN DROP TABLE IF EXISTS stg_wilayah;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_wilayah
SELECT
	k.id_wilayah_penjualan AS id_wilayah,
	k.nama_wilayah AS nama_wilayah,
	COALESCE(
		CASE
			WHEN p.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
			WHEN p.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
			WHEN p.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
			WHEN p.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
			WHEN p.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
			WHEN p.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
			WHEN p.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
			WHEN p.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
			ELSE p.nama_kabupaten
		END,
		p.nama_kabupaten
	) AS nama_kabupaten,
	k.kode_pos AS kode_pos
FROM
	dbt_peternakan_sapi_wagyu.tb_wilayah_penjualan AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS p ON p.id_kabupaten = k.id_kabupaten;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_wilayah (
		id_wilayah,
		nama_wilayah,
		nama_kabupaten,
		kode_pos,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_wilayah,
	k.nama_wilayah,
	k.nama_kabupaten,
	k.kode_pos,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	RIGHT JOIN stg_wilayah AS k ON IFNULL(kdw.id_wilayah, '-1') = IFNULL(k.id_wilayah, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_wilayah IS NULL
GROUP BY
	k.id_wilayah
ORDER BY
	k.id_wilayah ASC;

DROP TABLE IF EXISTS temp_wilayah;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_wilayah
SELECT
	kdw.row_key_wilayah,
	kdw.id_wilayah
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	JOIN stg_wilayah AS k ON kdw.id_wilayah = k.id_wilayah
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_wilayah, '') <> IFNULL(k.nama_wilayah, '')
	OR IFNULL(kdw.nama_kabupaten, '') <> IFNULL(k.nama_kabupaten, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_wilayah AS kdw,
	temp_wilayah
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_wilayah = temp_wilayah.row_key_wilayah
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_wilayah (
		id_wilayah,
		nama_wilayah,
		nama_kabupaten,
		kode_pos,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_wilayah,
	k.nama_wilayah,
	k.nama_kabupaten,
	k.kode_pos,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	JOIN stg_wilayah AS k ON kdw.id_wilayah = k.id_wilayah
WHERE
	k.id_wilayah IN (
		SELECT
			DISTINCT id_wilayah
		FROM
			temp_wilayah
	)
GROUP BY
	k.id_wilayah
ORDER BY
	k.id_wilayah ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_wilayah;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_wilayah
SELECT
	kdw.row_key_wilayah,
	kdw.id_wilayah
FROM
	dwh_peternakan_sapi_wagyu.dimensi_wilayah AS kdw
	LEFT JOIN stg_wilayah AS k ON kdw.id_wilayah = k.id_wilayah
WHERE
	k.id_wilayah IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_wilayah AS kdw,
	temp_wilayah
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_wilayah = temp_wilayah.row_key_wilayah
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_wilayah;

DROP TABLE IF EXISTS temp_wilayah;

END $ $ DELIMITER;