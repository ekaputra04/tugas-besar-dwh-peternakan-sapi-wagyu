DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_dimensi_pemasok_pakan() BEGIN -- Membuat tabel staging untuk data pemasok pakan
CREATE TEMPORARY TABLE stg_pemasok_pakan
SELECT
  id_pemasok_pakan,
  id_jenis_pakan,
  nama_pemasok_pakan,
  alamat_pemasok_pakan,
  no_telepon_pemasok_pakan,
  email_pemasok_pakan,
  'Y' AS current_flag
FROM
  tb_pemasok_pakan;

-- Memasukkan data baru ke dalam dimensi pemasok pakan
INSERT INTO
  dimensi_pemasok_pakan (
    row_key_pemasok_pakan,
    id_pemasok_pakan,
    id_jenis_pakan,
    nama_pemasok_pakan,
    alamat_pemasok_pakan,
    no_telepon_pemasok_pakan,
    email_pemasok_pakan,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  MD5(
    CONCAT(id_pemasok_pakan, '-', nama_pemasok_pakan)
  ) AS row_key_pemasok_pakan,
  id_pemasok_pakan,
  id_jenis_pakan,
  nama_pemasok_pakan,
  alamat_pemasok_pakan,
  no_telepon_pemasok_pakan,
  email_pemasok_pakan,
  CURDATE() AS valid_awal,
  '9999-12-31' AS valid_akhir,
  current_flag
FROM
  stg_pemasok_pakan;

-- Mengupdate data yang sudah ada di dimensi pemasok pakan
UPDATE
  dimensi_pemasok_pakan AS dpp
  JOIN stg_pemasok_pakan AS stg ON dpp.id_pemasok_pakan = stg.id_pemasok_pakan
  AND dpp.current_flag = 'Y'
SET
  dpp.current_flag = 'N',
  dpp.valid_akhir = CURDATE();

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_pemasok_pakan;

END $ $;

DELIMITER;