DELIMITER $ $ CREATE PROCEDURE dwh_peternakan_sapi_wagyu.procs_dimensi_produk() BEGIN -- Membuat tabel staging untuk data produk daging
DROP TABLE IF EXISTS stg_produk;

CREATE TEMPORARY TABLE stg_produk
SELECT
  produk.id_produk_daging AS id_produk_daging,
  produk.id_sapi_wagyu AS id_sapi_wagyu,
  produk.nama_produk AS nama_produk,
  produk.grade_produk AS grade_produk,
  produk.marbling_daging AS marbling_daging,
  produk.warna_daging AS warna_daging,
  produk.tekstur_daging AS tekstur_daging,
  produk.harga_per_kg AS harga,
  ras.nama_ras_sapi AS nama_ras_sapi,
  'Y' AS current_flag
FROM
  dbt_peternakan_sapi_wagyu.tb_produk_daging AS produk
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_sapi_wagyu AS sapi ON sapi.id_sapi_wagyu = produk.id_sapi_wagyu
  INNER JOIN dbt_peternakan_sapi_wagyu.tb_ras_sapi_wagyu AS ras ON ras.id_ras_sapi = sapi.id_ras_sapi;

-- Memasukkan data baru ke dalam dimensi produk daging
INSERT INTO
  dimensi_produk (
    id_produk_daging,
    id_sapi,
    nama_produk,
    grade_produk,
    harga_produk,
    nama_ras_sapi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  k.id_produk_daging,
  k.id_sapi_wagyu,
  k.nama_produk,
  k.grade_produk,
  k.harga,
  k.nama_ras_sapi,
  CURDATE(),
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS kdw
  RIGHT JOIN stg_produk AS k ON IFNULL(kdw.id_produk_daging, '-1') = IFNULL(k.id_produk_daging, '-1')
  AND kdw.current_flag = 'Y'
WHERE
  kdw.id_produk_daging IS NULL
GROUP BY
  k.id_produk_daging
ORDER BY
  k.id_produk_daging ASC;

DROP TABLE IF EXISTS temp_produk;

-- membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_produk
SELECT
  dp.row_key_produk,
  dp.id_produk_daging
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS dp
  JOIN stg_produk AS k ON dp.id_produk_daging = k.id_produk_daging
  AND dp.current_flag = 'Y'
WHERE
  IFNULL(dp.nama_produk, '') <> IFNULL(k.nama_produk, '');

-- memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
  dimensi_produk AS dp,
  temp_produk
SET
  dp.current_flag = 'N',
  dp.valid_akhir = CURDATE()
WHERE
  dp.row_key_produk = temp_produk.row_key_produk
  AND dp.current_flag = 'Y';

-- insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
  dimensi_produk (
    id_produk_daging,
    id_sapi,
    nama_produk,
    grade_produk,
    harga_produk,
    nama_ras_sapi,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  k.id_produk_daging,
  k.id_sapi_wagyu,
  k.nama_produk,
  k.grade_produk,
  k.harga,
  k.nama_ras_sapi,
  kdw.valid_akhir,
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS kdw
  JOIN stg_produk AS k ON kdw.id_produk_daging = k.id_produk_daging
WHERE
  k.id_produk_daging IN (
    SELECT
      DISTINCT id_produk_daging
    FROM
      temp_produk
  )
GROUP BY
  k.id_produk_daging
ORDER BY
  k.id_produk_daging ASC;

DROP TABLE IF EXISTS temp_produk;

-- membuat tabel temp untuk mencatat data yang dihapus pada db
CREATE TEMPORARY TABLE temp_produk
SELECT
  kdw.row_key_produk,
  kdw.id_produk_daging
FROM
  dwh_peternakan_sapi_wagyu.dimensi_produk AS kdw
  LEFT JOIN stg_produk AS k ON kdw.id_produk_daging = k.id_produk_daging
WHERE
  k.id_produk_daging IS NULL
  AND kdw.current_flag = 'Y';

-- memperbaharui tabel dimensi yang berubah (dihapus pada db)
UPDATE
  dimensi_produk AS kdw,
  temp_produk
SET
  kdw.current_flag = 'N',
  kdw.valid_akhir = CURDATE()
WHERE
  kdw.row_key_produk = temp_produk.row_key_produk
  AND kdw.current_flag = 'Y';

-- drop tabel temp
DROP TABLE IF EXISTS stg_produk;

DROP TABLE IF EXISTS temp_produk;

END $ $ DELIMITER;