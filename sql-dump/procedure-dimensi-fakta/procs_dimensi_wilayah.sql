DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_dimensi_wilayah() BEGIN -- Membuat tabel staging untuk data wilayah penjualan
CREATE TEMPORARY TABLE stg_wilayah_penjualan
SELECT
  id_wilayah_penjualan,
  nama_wilayah,
  kode_pos,
  'Y' AS current_flag
FROM
  tb_wilayah_penjualan;

-- Memasukkan data baru ke dalam dimensi wilayah penjualan
INSERT INTO
  dimensi_wilayah (
    row_key_wilayah,
    id_wilayah_penjualan,
    nama_wilayah,
    kode_pos,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  MD5(CONCAT(id_wilayah_penjualan, '-', nama_wilayah)) AS row_key_wilayah,
  id_wilayah_penjualan,
  nama_wilayah,
  kode_pos,
  CURDATE() AS valid_awal,
  '9999-12-31' AS valid_akhir,
  current_flag
FROM
  stg_wilayah_penjualan;

-- Mengupdate data yang sudah ada di dimensi wilayah penjualan
UPDATE
  dimensi_wilayah AS dw
  JOIN stg_wilayah_penjualan AS stg ON dw.id_wilayah_penjualan = stg.id_wilayah_penjualan
  AND dw.current_flag = 'Y'
SET
  dw.current_flag = 'N',
  dw.valid_akhir = CURDATE();

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_wilayah_penjualan;

END;

$ $ DELIMITER;