DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_pegawai() BEGIN DROP TABLE IF EXISTS stg_pegawai;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_pegawai
SELECT
	pg.id_pegawai AS id_pegawai,
	func_capitalisasi(pg.nama_pegawai) AS nama_pegawai,
	pg.nomor_telepon_pegawai AS nomor_telepon_pegawai,
	pg.alamat_pegawai AS alamat_pegawai,
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
			WHEN k.nama_kabupaten LIKE 's%b%y%' THEN 'Surabaya'
			WHEN k.nama_kabupaten LIKE 'k%t%n' THEN 'Klaten'
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
		END,
		p.nama_provinsi
	) AS nama_provinsi
FROM
	dbt_peternakan_sapi_wagyu.tb_pegawai AS pg
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS k ON k.id_kabupaten = pg.id_kabupaten
	INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
	dimensi_pegawai (
		id_pegawai,
		nama_pegawai,
		nomor_telepon_pegawai,
		email_pegawai,
		alamat_pegawai,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	pg.id_pegawai,
	pg.nama_pegawai,
	pg.nomor_telepon_pegawai,
	pg.email_pegawai,
	pg.alamat_pegawai,
	pg.nama_kabupaten,
	pg.nama_provinsi,
	CURDATE(),
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	RIGHT JOIN stg_pegawai AS pg ON IFNULL(pgdw.id_pegawai, '-1') = IFNULL(pg.id_pegawai, '-1')
	AND pgdw.current_flag = 'Y'
WHERE
	pgdw.id_pegawai IS NULL
GROUP BY
	pg.id_pegawai
ORDER BY
	pg.id_pegawai ASC;

DROP TABLE IF EXISTS temp_pegawai;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pegawai
SELECT
	pgdw.row_key_pegawai,
	pgdw.id_pegawai
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	JOIN stg_pegawai AS pg ON pgdw.id_pegawai = pg.id_pegawai
	AND pgdw.current_flag = 'Y'
WHERE
	IFNULL(pgdw.nama_pegawai, '') <> IFNULL(pg.nama_pegawai, '')
	OR IFNULL(pgdw.nomor_telepon_pegawai, '') <> IFNULL(pg.nomor_telepon_pegawai, '')
	OR IFNULL(pgdw.alamat_pegawai, '') <> IFNULL(pg.alamat_pegawai, '')
	OR IFNULL(pgdw.nama_kabupaten, '') <> IFNULL(pg.nama_kabupaten, '')
	OR IFNULL(pgdw.nama_provinsi, '') <> IFNULL(pg.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
	dimensi_pegawai AS pgdw,
	temp_pegawai
SET
	pgdw.current_flag = 'N',
	pgdw.valid_akhir = CURDATE()
WHERE
	pgdw.row_key_pegawai = temp_pegawai.row_key_pegawai
	AND pgdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
	dimensi_pegawai (
		id_pegawai,
		nama_pegawai,
		nomor_telepon_pegawai,
		alamat_pegawai,
		nama_kabupaten,
		nama_provinsi,
		valid_awal,
		valid_akhir,
		current_flag
	)
SELECT
	pg.id_pegawai,
	pg.nama_pegawai,
	pg.nomor_telepon_pegawai,
	pg.alamat_pegawai,
	pg.nama_kabupaten,
	pg.nama_provinsi,
	pgdw.valid_akhir,
	'9999-12-31',
	'Y'
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	JOIN stg_pegawai AS pg ON pgdw.id_pegawai = pg.id_pegawai
WHERE
	pg.id_pegawai IN (
		SELECT
			DISTINCT id_pegawai
		FROM
			temp_pegawai
	)
GROUP BY
	pg.id_pegawai
ORDER BY
	pg.id_pegawai ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pegawai;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pegawai
SELECT
	pgdw.row_key_pegawai,
	pgdw.id_pegawai
FROM
	dwh_peternakan_sapi_wagyu.dimensi_pegawai AS pgdw
	LEFT JOIN stg_pegawai AS pg ON pgdw.id_pegawai = pg.id_pegawai
WHERE
	pg.id_pegawai IS NULL
	AND pgdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
	dimensi_pegawai AS pgdw,
	temp_pegawai
SET
	pgdw.current_flag = 'N',
	pgdw.valid_akhir = CURDATE()
WHERE
	pgdw.row_key_pegawai = temp_pegawai.row_key_pegawai
	AND pgdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pegawai;

DROP TABLE IF EXISTS temp_pegawai;

END $ $ DELIMITER;