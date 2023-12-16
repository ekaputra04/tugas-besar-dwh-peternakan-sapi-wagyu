-- procedur untuk dimensi_pemasok_pakan
USE dwh_peternakan_sapi_wagyu;

-- procedure pada dimensi jenis pakan
DELIMITER / / CREATE PROCEDURE procs_dimensi_pemasok_pakan() BEGIN -- Memasukkan data baru (kode baru) ke dalam tabel dimensional
INSERT INTO
    dimensi_pemasok_pakan (
        id_pemasok_pakan,
        nama_pemasok_pakan,
        alamat_pemasok_pakan,
        no_telepon_pemasok_pakan,
        email_pemasok_pakan,
        valid_awal,
        valid_akhir,
        current_flag
    )
SELECT
    src.id_pemasok_pakan,
    src.nama_pemasok_pakan,
    src.alamat_pemasok_pakan,
    src.no_telepon_pemasok_pakan,
    src.email_pemasok_pakan,
    CURDATE(),
    '9999-12-31',
    'Y'
FROM
    dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS src
    LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS dim ON src.id_pemasok_pakan = dim.id_pemasok_pakan
    AND dim.current_flag = 'Y'
WHERE
    dim.id_pemasok_pakan IS NULL;

-- Membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_pemasok_pakan
SELECT
    dim.row_key_pemasok_pakan,
    dim.id_pemasok_pakan
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS dim
    JOIN dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS src ON dim.id_pemasok_pakan = src.id_pemasok_pakan
WHERE
    IFNULL(dim.id_pemasok_pakan, 0) <> IFNULL(src.id_pemasok_pakan, 0)
    OR IFNULL(dim.nama_pemasok_pakan, '') <> IFNULL(src.nama_pemasok_pakan, '')
    OR IFNULL(dim.alamat_pemasok_pakan, '') <> IFNULL(src.alamat_pemasok_pakan, '')
    OR IFNULL(dim.no_telepon_pemasok_pakan, '') <> IFNULL(src.no_telepon_pemasok_pakan, '')
    OR IFNULL(dim.email_pemasok_pakan, '') <> IFNULL(src.email_pemasok_pakan, '');

-- Memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS dim,
    temp_pemasok_pakan
SET
    dim.current_flag = 'N',
    dim.valid_akhir = CURDATE()
WHERE
    dim.row_key_pemasok_pakan = temp_pemasok_pakan.row_key_pemasok_pakan
    AND dim.current_flag = 'Y';

-- Insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
    dimensi_pemasok_pakan (
        id_pemasok_pakan,
        nama_pemasok_pakan,
        alamat_pemasok_pakan,
        no_telepon_pemasok_pakan,
        email_pemasok_pakan,
        valid_awal,
        valid_akhir,
        current_flag
    )
SELECT
    src.id_pemasok_pakan,
    src.nama_pemasok_pakan,
    src.alamat_pemasok_pakan,
    src.no_telepon_pemasok_pakan,
    src.email_pemasok_pakan,
    CURDATE(),
    '9999-12-31',
    'Y'
FROM
    dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS dim
    JOIN dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS src ON dim.id_pemasok_pakan = src.id_pemasok_pakan
WHERE
    src.id_pemasok_pakan IN (
        SELECT
            DISTINCT id_pemasok_pakan
        FROM
            temp_pemasok_pakan
    );

-- Drop tabel temp
DROP TABLE IF EXISTS temp_pemasok_pakan;

END / / DELIMITER;