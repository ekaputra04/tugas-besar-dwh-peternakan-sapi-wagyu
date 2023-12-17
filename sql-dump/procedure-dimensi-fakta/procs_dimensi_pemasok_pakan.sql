DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_pemasok_pakan() BEGIN DROP TABLE IF EXISTS stg_pemasok_pakan;

DROP TABLE IF EXISTS stg_pemasok_pakan;

CREATE TEMPORARY TABLE stg_pemasok_pakan
SELECT
    pg.id_pemasok_pakan AS id_pemasok_pakan,
    func_capitalisasi(pg.nama_pemasok_pakan) AS nama_pemasok_pakan,
    pg.alamat_pemasok_pakan AS alamat_pemasok_pakan,
    pg.no_telepon_pemasok_pakan AS no_telepon_pemasok_pakan,
    pg.email_pemasok_pakan AS email_pemasok_pakan,
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
    dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS pg
    INNER JOIN dbt_peternakan_sapi_wagyu.tb_kabupaten AS k ON k.id_kabupaten = pg.id_kabupaten
    INNER JOIN dbt_peternakan_sapi_wagyu.tb_provinsi AS p ON p.id_provinsi = k.id_provinsi;

-- memasukkan data baru (id baru) ke dalam tabel dimensional
INSERT INTO
    dimensi_pemasok_pakan (
        id_pemasok_pakan,
        nama_pemasok_pakan,
        nomor_telepon_pemasok_pakan,
        email_pemasok_pakan,
        alamat_pemasok_pakan,
        nama_kabupaten,
        nama_provinsi,
        valid_awal,
        valid_akhir,
        current_flag
    )
SELECT
    pg.id_pemasok_pakan,
    pg.nama_pemasok_pakan,
    pg.no_telepon_pemasok_pakan,
    pg.email_pemasok_pakan,
    pg.alamat_pemasok_pakan,
    pg.nama_kabupaten,
    pg.nama_provinsi,
    CURDATE(),
    '9999-12-31',
    'Y'
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    RIGHT JOIN stg_pemasok_pakan AS pg ON IFNULL(pgdw.id_pemasok_pakan, '-1') = IFNULL(pg.id_pemasok_pakan, '-1')
    AND pgdw.current_flag = 'Y'
WHERE
    pgdw.id_pemasok_pakan IS NULL
GROUP BY
    pg.id_pemasok_pakan
ORDER BY
    pg.id_pemasok_pakan ASC;

DROP TABLE IF EXISTS temp_pemasok_pakan;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pemasok_pakan
SELECT
    pgdw.row_key_pemasok_pakan,
    pgdw.id_pemasok_pakan
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    JOIN stg_pemasok_pakan AS pg ON pgdw.id_pemasok_pakan = pg.id_pemasok_pakan
    AND pgdw.current_flag = 'Y'
WHERE
    IFNULL(pgdw.nama_pemasok_pakan, '') <> IFNULL(pg.nama_pemasok_pakan, '')
    OR IFNULL(pgdw.nomor_telepon_pemasok_pakan, '') <> IFNULL(pg.no_telepon_pemasok_pakan, '')
    OR IFNULL(pgdw.alamat_pemasok_pakan, '') <> IFNULL(pg.alamat_pemasok_pakan, '')
    OR IFNULL(pgdw.nama_kabupaten, '') <> IFNULL(pg.nama_kabupaten, '')
    OR IFNULL(pgdw.nama_provinsi, '') <> IFNULL(pg.nama_provinsi, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
    dimensi_pemasok_pakan AS pgdw,
    temp_pemasok_pakan
SET
    pgdw.current_flag = 'N',
    pgdw.valid_akhir = CURDATE()
WHERE
    pgdw.row_key_pemasok_pakan = temp_pemasok_pakan.row_key_pemasok_pakan
    AND pgdw.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
    dimensi_pemasok_pakan (
        id_pemasok_pakan,
        nama_pemasok_pakan,
        nomor_telepon_pemasok_pakan,
        alamat_pemasok_pakan,
        nama_kabupaten,
        nama_provinsi,
        valid_awal,
        valid_akhir,
        current_flag
    )
SELECT
    pg.id_pemasok_pakan,
    pg.nama_pemasok_pakan,
    pg.no_telepon_pemasok_pakan,
    pg.alamat_pemasok_pakan,
    pg.nama_kabupaten,
    pg.nama_provinsi,
    pgdw.valid_akhir,
    '9999-12-31',
    'Y'
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    JOIN stg_pemasok_pakan AS pg ON pgdw.id_pemasok_pakan = pg.id_pemasok_pakan
WHERE
    pg.id_pemasok_pakan IN (
        SELECT
            DISTINCT id_pemasok_pakan
        FROM
            temp_pemasok_pakan
    )
GROUP BY
    pg.id_pemasok_pakan
ORDER BY
    pg.id_pemasok_pakan ASC;

-- drop tabel temp
DROP TABLE IF EXISTS temp_pemasok_pakan;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_pemasok_pakan
SELECT
    pgdw.row_key_pemasok_pakan,
    pgdw.id_pemasok_pakan
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS pgdw
    LEFT JOIN stg_pemasok_pakan AS pg ON pgdw.id_pemasok_pakan = pg.id_pemasok_pakan
WHERE
    pg.id_pemasok_pakan IS NULL
    AND pgdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
    dimensi_pemasok_pakan AS pgdw,
    temp_pemasok_pakan
SET
    pgdw.current_flag = 'N',
    pgdw.valid_akhir = CURDATE()
WHERE
    pgdw.row_key_pemasok_pakan = temp_pemasok_pakan.row_key_pemasok_pakan
    AND pgdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_pemasok_pakan;

DROP TABLE IF EXISTS temp_pemasok_pakan;

END $ $ DELIMITER;