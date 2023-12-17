DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_pelanggan() BEGIN DROP TABLE IF EXISTS stg_pelanggan;

-- membuat tabel staging
CREATE TEMPORARY TABLE stg_pelanggan
SELECT
  pg.id_pelanggan AS id_pelanggan,
  func_capitalisasi(pg.nama_pelanggan) AS nama_pelanggan,
  pg.alamat_pelanggan AS alamat_pelanggan,
  pg.nomor_telepon_pelanggan AS nomor_telepon_pelanggan,
  pg.email_pelanggan AS email_pelanggan,
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
  dbt_peternakan_sapi_wagyu.tb_pelanggan AS pg
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS k ON k.id_kabupaten = pg.id_kabupaten
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
  dimensi_pelanggan (
    id_pelanggan,
    nama_pelanggan,
    nomor_telepon_pelanggan,
    email_pelanggan,
    alamat_pelanggan,
    nama_kabupaten,
    nama_provinsi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  pg.id_pelanggan,
  pg.nama_pelanggan,
  pg.nomor_telepon_pelanggan,
  pg.email_pelanggan,
  pg.alamat_pelanggan,
  pg.nama_kabupaten,
  pg.nama_provinsi,
  CURDATE(),
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  RIGHT JOIN stg_pelanggan AS pg ON IFNULL(pgdw.id_pelanggan, '-1') = IFNULL(pg.id_pelanggan, '-1')
  AND pgdw.current_flag = 'Y'
WHERE
  pgdw.id_pelanggan IS NULL
GROUP BY
  pg.id_pelanggan
ORDER BY
  pg.id_pelanggan ASC;

DROP TABLE IF EXISTS temp_pelanggan;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pelanggan
SELECT
  pgdw.row_key_pelanggan,
  pgdw.id_pelanggan
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  JOIN stg_pelanggan AS pg ON pgdw.id_pelanggan = pg.id_pelanggan
  AND pgdw.current_flag = 'Y'
WHERE
  IFNULL(pgdw.nama_pelanggan, '') <> IFNULL(pg.nama_pelanggan, '')
  OR IFNULL(pgdw.nomor_telepon_pelanggan, '') <> IFNULL(pg.nomor_telepon_pelanggan, '')
  OR IFNULL(pgdw.alamat_pelanggan, '') <> IFNULL(pg.alamat_pelanggan, '')
  OR IFNULL(pgdw.nama_kabupaten, '') <> IFNULL(pg.nama_kabupaten, '')
  OR IFNULL(pgdw.nama_provinsi, '') <> IFNULL(pg.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
  dimensi_pelanggan AS pgdw,
  temp_pelanggan
SET
  pgdw.current_flag = 'N',
  pgdw.valid_akhir = CURDATE()
WHERE
  pgdw.row_key_pelanggan = temp_pelanggan.row_key_pelanggan
  AND pgdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
  dimensi_pelanggan (
    id_pelanggan,
    nama_pelanggan,
    nomor_telepon_pelanggan,
    alamat_pelanggan,
    nama_kabupaten,
    nama_provinsi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  pg.id_pelanggan,
  pg.nama_pelanggan,
  pg.nomor_telepon_pelanggan,
  pg.alamat_pelanggan,
  pg.nama_kabupaten,
  pg.nama_provinsi,
  pgdw.valid_akhir,
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  JOIN stg_pelanggan AS pg ON pgdw.id_pelanggan = pg.id_pelanggan
WHERE
  pg.id_pelanggan IN (
    SELECT
      DISTINCT id_pelanggan
    FROM
      temp_pelanggan
  )
GROUP BY
  pg.id_pelanggan
ORDER BY
  pg.id_pelanggan ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pelanggan;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pelanggan
SELECT
  pgdw.row_key_pelanggan,
  pgdw.id_pelanggan
FROM
  dwh_peternakan_sapi_wagyu.dimensi_pelanggan AS pgdw
  LEFT JOIN stg_pelanggan AS pg ON pgdw.id_pelanggan = pg.id_pelanggan
WHERE
  pg.id_pelanggan IS NULL
  AND pgdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
  dimensi_pelanggan AS pgdw,
  temp_pelanggan
SET
  pgdw.current_flag = 'N',
  pgdw.valid_akhir = CURDATE()
WHERE
  pgdw.row_key_pelanggan = temp_pelanggan.row_key_pelanggan
  AND pgdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pelanggan;

DROP TABLE IF EXISTS temp_pelanggan;

END $ $ DELIMITER;