DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_dimensi_jenis_pakan() BEGIN -- Membuat tabel staging untuk data jenis pakan
CREATE TEMPORARY TABLE stg_jenis_pakan
SELECT
  id_jenis_pakan,
  nama_jenis_pakan,
  kualitas_pakan,
  harga_pakan,
  'Y' AS current_flag
FROM
  tb_jenis_pakan;

-- Memasukkan data baru ke dalam dimensi jenis pakan
INSERT INTO
  dimensi_jenis_pakan (
    row_key_jenis_pakan,
    id_jenis_pakan,
    nama_jenis_pakan,
    kualitas_pakan,
    harga_pakan,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  MD5(CONCAT(id_jenis_pakan, '-', nama_jenis_pakan)) AS row_key_jenis_pakan,
  id_jenis_pakan,
  nama_jenis_pakan,
  kualitas_pakan,
  harga_pakan,
  CURDATE() AS valid_awal,
  '9999-12-31' AS valid_akhir,
  current_flag
FROM
  stg_jenis_pakan;

-- Mengupdate data yang sudah ada di dimensi jenis pakan
UPDATE
  dimensi_jenis_pakan AS djp
  JOIN stg_jenis_pakan AS stg ON djp.id_jenis_pakan = stg.id_jenis_pakan
  AND djp.current_flag = 'Y'
SET
  djp.current_flag = 'N',
  djp.valid_akhir = CURDATE();

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_jenis_pakan;

END;

$ $ DELIMITER;