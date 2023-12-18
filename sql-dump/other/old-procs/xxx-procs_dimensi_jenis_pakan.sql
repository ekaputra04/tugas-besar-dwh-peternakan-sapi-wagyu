USE dwh_peternakan_sapi_wagyu;

-- procedure pada dimensi jenis pakan
DELIMITER / / CREATE PROCEDURE procs_dimensi_jenis_pakan() BEGIN -- Memasukkan data baru (kode baru) ke dalam tabel dimensional
INSERT INTO
  dimensi_jenis_pakan (
    id_jenis_pakan,
    nama_jenis_pakan,
    kualitas_pakan,
    harga_pakan,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  src.id_jenis_pakan,
  src.nama_jenis_pakan,
  src.kualitas_pakan,
  src.harga_pakan,
  CURDATE(),
  '9999-12-31',
  'Y'
FROM
  dbt_peternakan_sapi_wagyu.tb_jenis_pakan AS src
  LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_jenis_pakan AS dim ON src.id_jenis_pakan = dim.id_jenis_pakan
  AND dim.current_flag = 'Y'
WHERE
  dim.id_jenis_pakan IS NULL;

-- Membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_jenis_pakan
SELECT
  dim.row_key_jenis_pakan,
  dim.id_jenis_pakan
FROM
  dwh_peternakan_sapi_wagyu.dimensi_jenis_pakan AS dim
  JOIN dbt_peternakan_sapi_wagyu.tb_jenis_pakan AS src ON dim.id_jenis_pakan = src.id_jenis_pakan
WHERE
  IFNULL(dim.nama_jenis_pakan, '') <> IFNULL(src.nama_jenis_pakan, '')
  OR IFNULL(dim.kualitas_pakan, 0) <> IFNULL(src.kualitas_pakan, 0)
  OR IFNULL(dim.harga_pakan, 0.00) <> IFNULL(src.harga_pakan, 0.00);

-- Memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
  dwh_peternakan_sapi_wagyu.dimensi_jenis_pakan AS dim,
  temp_jenis_pakan
SET
  dim.current_flag = 'N',
  dim.valid_akhir = CURDATE()
WHERE
  dim.row_key_jenis_pakan = temp_jenis_pakan.row_key_jenis_pakan
  AND dim.current_flag = 'Y';

-- Insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
  dimensi_jenis_pakan (
    id_jenis_pakan,
    nama_jenis_pakan,
    kualitas_pakan,
    harga_pakan,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  src.id_jenis_pakan,
  src.nama_jenis_pakan,
  src.kualitas_pakan,
  src.harga_pakan,
  dim.valid_akhir,
  '9999-12-31',
  'Y'
FROM
  dwh_peternakan_sapi_wagyu.dimensi_jenis_pakan AS dim
  JOIN dbt_peternakan_sapi_wagyu.tb_jenis_pakan AS src ON dim.id_jenis_pakan = src.id_jenis_pakan
WHERE
  src.id_jenis_pakan IN (
    SELECT
      DISTINCT id_jenis_pakan
    FROM
      temp_jenis_pakan
  );

-- Drop tabel temp
DROP TABLE IF EXISTS temp_jenis_pakan;

END / / DELIMITER;