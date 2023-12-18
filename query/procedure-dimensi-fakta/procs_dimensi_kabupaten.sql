DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_kabupaten() BEGIN DROP TABLE IF EXISTS stg_kabupaten;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_kabupaten
SELECT
	k.id_kabupaten AS id_kabupaten,
	COALESCE(
		CASE
			WHEN k.nama_kabupaten LIKE 'd%p%s%r' THEN 'Denpasar'
			WHEN k.nama_kabupaten LIKE 'b%d%g' THEN 'Badung'
			WHEN k.nama_kabupaten LIKE 't%b%n' THEN 'Tabanan'
			WHEN k.nama_kabupaten LIKE 'b%l%l%g' THEN 'Buleleng'
			WHEN k.nama_kabupaten LIKE 'b%ng%i' THEN 'Bangli'
			WHEN k.nama_kabupaten LIKE 'g%ny%r' THEN 'Gianyar'
			WHEN k.nama_kabupaten LIKE 'k%l%k%g' THEN 'Klungkung'
			WHEN k.nama_kabupaten LIKE 'd%p%s' THEN 'Denpasar'
			ELSE k.nama_kabupaten
		END,
		k.nama_kabupaten
	) AS nama_kabupaten,
	COALESCE(
		CASE
			WHEN p.nama_provinsi LIKE 'b%l%i' THEN 'Bali'
			WHEN p.nama_provinsi LIKE 'j%w%t%r' THEN 'Jawa Timur'
			WHEN p.nama_provinsi LIKE 'j%w%t%n%h' THEN 'Jawa Tengah'
			WHEN p.nama_provinsi LIKE 'y%g%a' THEN 'Yogyakarta'
			WHEN p.nama_provinsi LIKE 'j%w%b%r%t' THEN 'Jawa Barat'
			WHEN p.nama_provinsi LIKE 'a%c%h' THEN 'Aceh'
			WHEN p.nama_provinsi LIKE 'k%l%t%r' THEN 'Kalimantan Timur'
			WHEN p.nama_provinsi LIKE 'k%l%b%r%t' THEN 'Kalimantan Barat'
			ELSE p.nama_provinsi
		END,
		p.nama_provinsi
	) AS nama_provinsi
FROM
	dbt_peternakan_sapi_wagyu.tb_kabupaten AS k
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_kabupaten (
		id_kabupaten,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_kabupaten,
	k.nama_kabupaten,
	k.nama_provinsi,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	RIGHT JOIN stg_kabupaten AS k ON IFNULL(kdw.id_kabupaten, '-1') = IFNULL(k.id_kabupaten, '-1')
	AND kdw.current_flag = 'Y'
WHERE
	kdw.id_kabupaten IS NULL
GROUP BY
	k.id_kabupaten
ORDER BY
	k.id_kabupaten ASC;

DROP TABLE IF EXISTS temp_kabupaten;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_kabupaten
SELECT
	kdw.row_key_kabupaten,
	kdw.id_kabupaten
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	JOIN stg_kabupaten AS k ON kdw.id_kabupaten = k.id_kabupaten
	AND kdw.current_flag = 'Y'
WHERE
	IFNULL(kdw.nama_kabupaten, '') <> IFNULL(k.nama_kabupaten, '')
	OR IFNULL(kdw.nama_provinsi, '') <> IFNULL(k.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_kabupaten AS kdw,
	temp_kabupaten
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_kabupaten = temp_kabupaten.row_key_kabupaten
	AND kdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_kabupaten (
		id_kabupaten,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	k.id_kabupaten,
	k.nama_kabupaten,
	k.nama_provinsi,
	kdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	JOIN stg_kabupaten AS k ON kdw.id_kabupaten = k.id_kabupaten
WHERE
	k.id_kabupaten IN (
		SELECT
			DISTINCT id_kabupaten
		FROM
			temp_kabupaten
	)
GROUP BY
	k.id_kabupaten
ORDER BY
	k.id_kabupaten ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_kabupaten;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_kabupaten
SELECT
	kdw.row_key_kabupaten,
	kdw.id_kabupaten
FROM
	dwh_peternakan_sapi_wagyu.dimensi_kabupaten AS kdw
	LEFT JOIN stg_kabupaten AS k ON kdw.id_kabupaten = k.id_kabupaten
WHERE
	k.id_kabupaten IS NULL
	AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_kabupaten AS kdw,
	temp_kabupaten
SET
	kdw.current_flag = 'N',
	kdw.valid_akhir = CURDATE()
WHERE
	kdw.row_key_kabupaten = temp_kabupaten.row_key_kabupaten
	AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_kabupaten;

DROP TABLE IF EXISTS temp_kabupaten;

END $ $ DELIMITER;