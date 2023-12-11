DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_fakta_pemasok_pakan() BEGIN -- Membuat tabel staging untuk data pemasok pakan
CREATE TEMPORARY TABLE stg_pemasok_pakan
SELECT
  tp.id_transaksi,
  td.id_produk_daging,
  td.id_pemasok_pakan,
  tp.jumlah_daging_terjual,
  tp.total_harga_pesan,
  'Y' AS current_flag
FROM
  tb_transaksi_daging td
  JOIN tb_detail_transaksi_daging tp ON td.id_transaksi_daging = tp.id_transaksi_daging;

-- Gantilah dengan nama tabel yang sesuai
-- Memasukkan data baru ke dalam fakta pemasok pakan
INSERT INTO
  fakta_pemasok_pakan (
    id_pemasok,
    id_jenis_pakan,
    id_pemasok_pakan,
    jumlah_pemasok_makan,
    kualitas_pakan,
    kinerja_pemasok
  )
SELECT
  MD5(
    CONCAT(
      id_transaksi,
      '-',
      id_pemasok_pakan,
      '-',
      DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s')
    )
  ) AS id_pemasok,
  tp.id_produk_daging,
  tp.id_pemasok_pakan,
  tp.jumlah_daging_terjual,
  tj.kualitas_pakan,
  CASE
    WHEN tp.total_harga_pesan > 0 THEN 'Baik'
    ELSE 'Kurang Baik'
  END AS kinerja_pemasok
FROM
  stg_pemasok_pakan
  JOIN tb_jenis_pakan tj ON tp.id_produk_daging = tj.id_produk_daging;

-- Gantilah dengan nama tabel yang sesuai
-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_pemasok_pakan;

END;

$ $ DELIMITER;