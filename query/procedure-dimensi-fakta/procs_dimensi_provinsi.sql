DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_provinsi() BEGIN DROP TABLE IF EXISTS stg_provinsi;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_provinsi
SELECT
	p.id_provinsi AS id_provinsi,
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
		END,
		p.nama_provinsi
	) AS nama_provinsi
FROM
	dbt_peternakan_sapi_wagyu.tb_provinsi AS p;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_provinsi (
		id_provinsi,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	p.id_provinsi,
	p.nama_provinsi,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	RIGHT JOIN stg_provinsi AS p ON IFNULL(pdw.id_provinsi, '-1') = IFNULL(p.id_provinsi, '-1')
	AND pdw.current_flag = 'Y'
WHERE
	pdw.id_provinsi IS NULL
GROUP BY
	p.id_provinsi
ORDER BY
	p.id_provinsi ASC;

DROP TABLE IF EXISTS temp_provinsi;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_provinsi
SELECT
	pdw.row_key_provinsi,
	pdw.id_provinsi
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	JOIN stg_provinsi AS p ON pdw.id_provinsi = p.id_provinsi
	AND pdw.current_flag = 'Y'
WHERE
	IFNULL(pdw.nama_provinsi, '') <> IFNULL(p.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_provinsi AS pdw,
	temp_provinsi
SET
	pdw.current_flag = 'N',
	pdw.valid_akhir = CURDATE()
WHERE
	pdw.row_key_provinsi = temp_provinsi.row_key_provinsi
	AND pdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_provinsi (
		id_provinsi,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	p.id_provinsi,
	p.nama_provinsi,
	pdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	JOIN stg_provinsi AS p ON pdw.id_provinsi = p.id_provinsi
WHERE
	p.id_provinsi IN (
		SELECT
			DISTINCT id_provinsi
		FROM
			temp_provinsi
	)
GROUP BY
	p.id_provinsi
ORDER BY
	p.id_provinsi ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_provinsi;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_provinsi
SELECT
	pdw.row_key_provinsi,
	pdw.id_provinsi
FROM
	dwh_peternakan_sapi_wagyu.dimensi_provinsi AS pdw
	LEFT JOIN stg_provinsi AS p ON pdw.id_provinsi = p.id_provinsi
WHERE
	p.id_provinsi IS NULL
	AND pdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_provinsi AS pdw,
	temp_provinsi
SET
	pdw.current_flag = 'N',
	pdw.valid_akhir = CURDATE()
WHERE
	pdw.row_key_provinsi = temp_provinsi.row_key_provinsi
	AND pdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_provinsi;

DROP TABLE IF EXISTS temp_provinsi;

END $ $ DELIMITER;