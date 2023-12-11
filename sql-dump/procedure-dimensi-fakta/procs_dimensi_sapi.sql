DELIMITER $ $ CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_dimensi_sapi() BEGIN -- Membuat tabel staging untuk data sapi
CREATE TEMPORARY TABLE stg_sapi
SELECT
  id_sapi_wagyu,
  nama_sapi_wagyu,
  umur_sapi,
  berat_sapi,
  riwayat_kesehatan_sapi,
  data_genetik_sapi,
  jenis_kelamin,
  'Y' AS current_flag
FROM
  tb_sapi_wagyu;

-- Memasukkan data baru ke dalam dimensi sapi
INSERT INTO
  dimensi_sapi (
    row_key_sapi,
    id_sapi_wagyu,
    nama_sapi,
    umur_sapi,
    berat_sapi,
    riwayat_kesehatan_sapi,
    data_genetik_sapi,
    jenis_kelamin,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  MD5(CONCAT(id_sapi_wagyu, '-', jenis_kelamin)) AS row_key_sapi,
  id_sapi_wagyu,
  nama_sapi_wagyu,
  umur_sapi,
  berat_sapi,
  riwayat_kesehatan_sapi,
  data_genetik_sapi,
  jenis_kelamin,
  CURDATE() AS valid_awal,
  '9999-12-31' AS valid_akhir,
  current_flag
FROM
  stg_sapi;

-- Mengupdate data yang sudah ada di dimensi sapi
UPDATE
  dimensi_sapi AS ds
  JOIN stg_sapi AS stg ON ds.id_sapi_wagyu = stg.id_sapi_wagyu
  AND ds.current_flag = 'Y'
SET
  ds.current_flag = 'N',
  ds.valid_akhir = CURDATE();

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_sapi;

END;

$ $ DELIMITER;