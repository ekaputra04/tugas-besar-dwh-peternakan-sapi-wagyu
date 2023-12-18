-- procedure untuk dimensi sapi
DELIMITER / / CREATE PROCEDURE procs_dimensi_sapi() BEGIN -- Memasukkan data baru (kode baru) ke dalam tabel dimensional
INSERT INTO
    dimensi_sapi (
        id_sapi,
        nama_sapi,
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
    src.id_sapi_wagyu,
    src.nama_sapi_wagyu,
    src.umur_sapi,
    src.berat_sapi,
    src.riwayat_kesehatan_sapi,
    src.data_genetik_sapi,
    src2.marbling_daging,
    src2.warna_daging,
    src2.tekstur_daging,
    CURDATE(),
    '9999-12-31',
    'Y'
FROM
    dbt_peternakan_sapi_wagyu.tb_sapi_wagyu AS src
    LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_sapi AS dim ON src.id_sapi_wagyu = dim.id_sapi
    AND dim.current_flag = 'Y'
    LEFT JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging AS src2 ON src2.id_sapi_wagyu = dim.id_sapi
WHERE
    dim.id_sapi IS NULL;

-- Membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_sapi
SELECT
    dim.row_key_sapi,
    dim.id_sapi
FROM
    dbt_peternakan_sapi_wagyu.tb_sapi_wagyu AS src
    LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_sapi AS dim ON src.id_sapi_wagyu = dim.id_sapi
    AND dim.current_flag = 'Y'
    LEFT JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging AS src2 ON src2.id_sapi_wagyu = dim.id_sapi
WHERE
    IFNULL(dim.id_sapi, 0) <> IFNULL(src.id_sapi_wagyu, 0)
    OR IFNULL(dim.nama_sapi, '') <> IFNULL(src.nama_sapi_wagyu, '')
    OR IFNULL(dim.umur_sapi, 0.00) <> IFNULL(src.umur_sapi, 0.00)
    OR IFNULL(dim.berat_sapi, 0.00) <> IFNULL(src.berat_sapi, 0.00)
    OR IFNULL(dim.riwayat_kesehatan_sapi, '') <> IFNULL(src.riwayat_kesehatan_sapi, '')
    OR IFNULL(dim.data_genetik_sapi, '') <> IFNULL(src.data_genetik_sapi, '')
    OR IFNULL(dim.marbling_daging, '') <> IFNULL(src2.marbling_daging, '')
    OR IFNULL(dim.warna_daging, '') <> IFNULL(src2.warna_daging, '')
    OR IFNULL(dim.tekstur_daging, '') <> IFNULL(src2.tekstur_daging, '');

-- Memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
    dwh_peternakan_sapi_wagyu.dimensi_sapi AS dim,
    temp_sapi
SET
    dim.current_flag = 'N',
    dim.valid_akhir = CURDATE()
WHERE
    dim.row_key_sapi = temp_sapi.row_key_sapi
    AND dim.current_flag = 'Y';

-- Insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
    dimensi_sapi (
        id_sapi,
        nama_sapi,
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
    src.id_sapi_wagyu,
    src.nama_sapi_wagyu,
    src.umur_sapi,
    src.berat_sapi,
    src.riwayat_kesehatan_sapi,
    src.data_genetik_sapi,
    src2.marbling_daging,
    src2.warna_daging,
    src2.tekstur_daging,
    CURDATE(),
    '9999-12-31',
    'Y'
FROM
    dbt_peternakan_sapi_wagyu.tb_sapi_wagyu AS src
    LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_sapi AS dim ON src.id_sapi_wagyu = dim.id_sapi
    AND dim.current_flag = 'Y'
    LEFT JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging AS src2 ON src2.id_sapi_wagyu = dim.id_sapi
WHERE
    src.id_sapi_wagyu IN (
        SELECT
            DISTINCT id_sapi
        FROM
            temp_sapi
    );

-- Drop tabel temp
DROP TABLE IF EXISTS temp_sapi;

END / / DELIMITER;