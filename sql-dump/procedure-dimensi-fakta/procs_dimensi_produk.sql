DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_dimensi_produk() BEGIN -- Membuat tabel staging untuk data produk daging
CREATE TEMPORARY TABLE stg_produk_daging
SELECT
  id_produk_daging,
  id_sapi_wagyu,
  nama_produk,
  grade_produk,
  marbling_daging,
  warna_daging,
  tekstur_daging,
  harga_per_kg,
  'Y' AS current_flag
FROM
  tb_produk_daging;

-- Memasukkan data baru ke dalam dimensi produk daging
INSERT INTO
  dimensi_produk (
    row_key_produk,
    id_produk_daging,
    id_sapi_wagyu,
    nama_produk,
    grade_produk,
    marbling_daging,
    warna_daging,
    tekstur_daging,
    harga_per_kg,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  MD5(CONCAT(id_produk_daging, '-', nama_produk)) AS row_key_produk,
  id_produk_daging,
  id_sapi_wagyu,
  nama_produk,
  grade_produk,
  marbling_daging,
  warna_daging,
  tekstur_daging,
  harga_per_kg,
  CURDATE() AS valid_awal,
  '9999-12-31' AS valid_akhir,
  current_flag
FROM
  stg_produk_daging;

-- Mengupdate data yang sudah ada di dimensi produk daging
UPDATE
  dimensi_produk AS dp
  JOIN stg_produk_daging AS stg ON dp.id_produk_daging = stg.id_produk_daging
  AND dp.current_flag = 'Y'
SET
  dp.current_flag = 'N',
  dp.valid_akhir = CURDATE();

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_produk_daging;

END;

$ $ DELIMITER;