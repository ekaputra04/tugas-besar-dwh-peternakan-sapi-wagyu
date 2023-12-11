DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_dimensi_pelanggan() BEGIN -- Membuat tabel staging untuk data pelanggan
CREATE TEMPORARY TABLE stg_pelanggan
SELECT
  id_pelanggan,
  nama_pelanggan,
  alamat_pelanggan,
  nomor_telepon_pelanggan,
  email_pelanggan,
  'Y' AS current_flag
FROM
  tb_pelanggan;

-- Memasukkan data baru ke dalam dimensi pelanggan
INSERT INTO
  dimensi_pelanggan (
    row_key_pelanggan,
    id_pelanggan,
    nama_pelanggan,
    alamat_pelanggan,
    nomor_telepon_pelanggan,
    email_pelanggan,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  MD5(CONCAT(id_pelanggan, '-', email_pelanggan)) AS row_key_pelanggan,
  id_pelanggan,
  nama_pelanggan,
  alamat_pelanggan,
  nomor_telepon_pelanggan,
  email_pelanggan,
  CURDATE() AS valid_awal,
  '9999-12-31' AS valid_akhir,
  current_flag
FROM
  stg_pelanggan;

-- Mengupdate data yang sudah ada di dimensi pelanggan
UPDATE
  dimensi_pelanggan AS dp
  JOIN stg_pelanggan AS stg ON dp.id_pelanggan = stg.id_pelanggan
  AND dp.current_flag = 'Y'
SET
  dp.current_flag = 'N',
  dp.valid_akhir = CURDATE();

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_pelanggan;

END $ $ DELIMITER;