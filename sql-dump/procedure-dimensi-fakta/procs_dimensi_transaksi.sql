DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_dimensi_transaksi() BEGIN -- Membuat tabel staging untuk data transaksi daging
CREATE TEMPORARY TABLE stg_transaksi_daging
SELECT
  id_transaksi_daging,
  id_pelanggan,
  id_pegawai,
  id_wilayah_penjualan,
  tanggal_transaksi,
  total_harga,
  'Y' AS current_flag
FROM
  tb_transaksi_daging;

-- Memasukkan data baru ke dalam dimensi transaksi
INSERT INTO
  dimensi_transaksi (
    row_key_transaksi,
    id_transaksi_daging,
    tanggal_transaksi,
    jumlah_daging_terjual,
    grade_produk,
    nama_ras_sapi,
    total_harga,
    valid_awal,
    valid_akhir,
    current_flag
  )
SELECT
  MD5(
    CONCAT(
      id_transaksi_daging,
      '-',
      DATE_FORMAT(tanggal_transaksi, '%Y-%m-%d')
    )
  ) AS row_key_transaksi,
  id_transaksi_daging,
  tanggal_transaksi,
  0 AS jumlah_daging_terjual,
  -- Gantilah dengan nilai yang sesuai
  0 AS grade_produk,
  -- Gantilah dengan nilai yang sesuai
  '' AS nama_ras_sapi,
  -- Gantilah dengan nilai yang sesuai
  total_harga,
  CURDATE() AS valid_awal,
  '9999-12-31' AS valid_akhir,
  current_flag
FROM
  stg_transaksi_daging;

-- Mengupdate data yang sudah ada di dimensi transaksi
UPDATE
  dimensi_transaksi AS dt
  JOIN stg_transaksi_daging AS stg ON dt.id_transaksi_daging = stg.id_transaksi_daging
  AND dt.current_flag = 'Y'
SET
  dt.current_flag = 'N',
  dt.valid_akhir = CURDATE();

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_transaksi_daging;

END;

$ $ DELIMITER;