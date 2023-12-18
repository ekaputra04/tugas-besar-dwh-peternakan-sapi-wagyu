DELIMITER / / CREATE PROCEDURE procs_dimensi_transaksi() BEGIN -- Memasukkan data baru (kode baru) ke dalam tabel dimensional
INSERT INTO
  dimensi_transaksi (
    id_transaksi_daging,
    -- tb_transaksi_transaksi_daging
    tanggal_transaksi,
    -- tb_transaksi
    jumlah_daging_terjual,
    -- tb_detail_transaksi_daging
    grade_produk,
    -- tb_produk_daging
    nama_ras_sapi,
    -- tb_ras_sapi_wagyu
    total_harga,
    -- tb_transaksi_daging
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  src.id_transaksi_daging,
  -- tb_transaksi_daging
  src.tanggal_transaksi,
  -- tb_transaksi
  src2.jumlah_produk_terjual,
  -- tb_detail_transaksi_daging
  src3.grade_produk,
  -- tb_produk_daging
  src4.nama_ras_sapi,
  -- tb_ras_sapi_wagyu
  src.total_harga,
  -- tb_transaksi_daging
  CURDATE(),
  '9999-12-31',
  'Y'
FROM
  dbt_peternakan_sapi_wagyu.tb_transaksi_daging AS src
  LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_transaksi AS dim ON src.id_transaksi_daging = dim.id_transaksi_daging
  AND dim.current_flag = 'Y'
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_detail_transaksi_daging AS src2 ON src2.id_transaksi_daging = dim.id_transaksi_daging
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging AS src3 ON src3.grade_produk = dim.grade_produk
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_ras_sapi_wagyu AS src4 ON src4.nama_ras_sapi = dim.nama_ras_sapi
WHERE
  dim.id_transaksi_daging IS NULL;

-- Membuat tabel temp untuk mencatat data yang mengalami perubahan
CREATE TEMPORARY TABLE temp_transaksi
SELECT
  dim.row_key_transaksi,
  dim.id_transaksi_daging
FROM
  dbt_peternakan_sapi_wagyu.tb_transaksi_daging AS src
  LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_transaksi AS dim ON src.id_transaksi_daging = dim.id_transaksi_daging
  AND dim.current_flag = 'Y'
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_detail_transaksi_daging AS src2 ON src2.id_transaksi_daging = dim.id_transaksi_daging
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging AS src3 ON src3.grade_produk = dim.grade_produk
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_ras_sapi_wagyu AS src4 ON src4.nama_ras_sapi = dim.nama_ras_sapi
WHERE
  IFNULL(dim.id_transaksi_daging, 0) <> IFNULL(src.id_transaksi_daging, 0)
  OR IFNULL(dim.tanggal_transaksi, '') <> IFNULL(src.tanggal_transaksi, '')
  OR IFNULL(dim.jumlah_daging_terjual, 0.00) <> IFNULL(src2.jumlah_produk_terjual, 0.00)
  OR IFNULL(dim.grade_produk, 0) <> IFNULL(src3.grade_produk, 0)
  OR IFNULL(dim.nama_ras_sapi, '') <> IFNULL(src4.nama_ras_sapi, '')
  OR IFNULL(dim.total_harga, 0.00) <> IFNULL(src.total_harga, 0.00);

-- Memperbaharui tabel dimensi yang berubah (di-update pada db)
UPDATE
  dwh_peternakan_sapi_wagyu.dimensi_transaksi AS dim,
  temp_transaksi
SET
  dim.current_flag = 'N',
  dim.valid_akhir = CURDATE()
WHERE
  dim.row_key_transaksi = temp_transaksi.row_key_transaksi
  AND dim.current_flag = 'Y';

-- Insert data yang berubah ke dalam tabel_dimensi (buat baris baru)
INSERT INTO
  dimensi_transaksi (
    id_transaksi_daging,
    -- tb_transaksi_transaksi_daging
    tanggal_transaksi,
    -- tb_transaksi
    jumlah_daging_terjual,
    -- tb_detail_transaksi_daging
    grade_produk,
    -- tb_produk_daging
    nama_ras_sapi,
    -- tb_ras_sapi_wagyu
    total_harga,
    -- tb_transaksi_daging
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  src.id_transaksi_daging,
  -- tb_transaksi_daging
  src.tanggal_transaksi,
  -- tb_transaksi
  src2.jumlah_produk_terjual,
  -- tb_detail_transaksi_daging
  src3.grade_produk,
  -- tb_produk_daging
  src4.nama_ras_sapi,
  -- tb_ras_sapi_wagyu
  src.total_harga,
  -- tb_transaksi_daging
  CURDATE(),
  '9999-12-31',
  'Y'
FROM
  dbt_peternakan_sapi_wagyu.tb_transaksi_daging AS src
  LEFT JOIN dwh_peternakan_sapi_wagyu.dimensi_transaksi AS dim ON src.id_transaksi_daging = dim.id_transaksi_daging
  AND dim.current_flag = 'Y'
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_detail_transaksi_daging AS src2 ON src2.id_transaksi_daging = dim.id_transaksi_daging
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_produk_daging AS src3 ON src3.grade_produk = dim.grade_produk
  LEFT JOIN dbt_peternakan_sapi_wagyu.tb_ras_sapi_wagyu AS src4 ON src4.nama_ras_sapi = dim.nama_ras_sapi
WHERE
  src.id_transaksi_daging IN (
    SELECT
      DISTINCT id_transaksi_daging
    FROM
      temp_transaksi
  );

-- Drop tabel temp
DROP TABLE IF EXISTS temp_transaksi;

END / / DELIMITER;