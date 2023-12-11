DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_fakta_kualitas() BEGIN -- Membuat tabel staging untuk data kualitas
CREATE TEMPORARY TABLE stg_kualitas
SELECT
  id_sapi,
  id_tubuh_sapi,
  marbling_daging,
  warna_daging,
  tekstur_daging,
  data_genetik_sapi,
  riwayat_kesehatan_sapi,
  0 AS total_sapi,
  -- Gantilah dengan nilai yang sesuai
  0 AS total_bagian_tubuh,
  -- Gantilah dengan nilai yang sesuai
  'Y' AS current_flag
FROM
  tb_sapi_wagyu;

-- Memasukkan data baru ke dalam fakta kualitas
INSERT INTO
  fakta_kualitas (
    id_kualitas,
    id_sapi,
    id_tubuh_sapi,
    marbling_daging,
    warna_daging,
    tekstur_daging,
    data_genetik,
    data_kesehatan,
    total_sapi,
    total_bagian_tubuh
  )
SELECT
  MD5(
    CONCAT(
      id_sapi,
      '-',
      id_tubuh_sapi,
      '-',
      DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s')
    )
  ) AS id_kualitas,
  id_sapi,
  id_tubuh_sapi,
  marbling_daging,
  warna_daging,
  tekstur_daging,
  data_genetik_sapi,
  riwayat_kesehatan_sapi,
  total_sapi,
  total_bagian_tubuh
FROM
  stg_kualitas;

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_kualitas;

END;

$ $ DELIMITER;