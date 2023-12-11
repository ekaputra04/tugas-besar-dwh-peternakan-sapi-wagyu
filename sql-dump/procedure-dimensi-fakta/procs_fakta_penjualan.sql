DELIMITER $ $;

CREATE PROCEDURE dwh_penyewaan_sapi_wagyu.procs_fakta_penjualan() BEGIN -- Membuat tabel staging untuk data penjualan
CREATE TEMPORARY TABLE stg_penjualan
SELECT
  td.id_transaksi_daging,
  tp.id_produk_daging,
  tp.id_pelanggan,
  tp.id_wilayah_penjualan,
  tp.id_waktu,
  tp.id_pemasok_pakan,
  td.id_sapi_wagyu,
  tp.jumlah_daging_terjual,
  tp.grade_produk,
  tp.ras_sapi_terjual,
  tp.total_penjualan_daging,
  'Y' AS current_flag
FROM
  tb_transaksi_daging td
  JOIN tb_detail_transaksi_daging tp ON td.id_transaksi_daging = tp.id_transaksi_daging;

-- Gantilah dengan nama tabel yang sesuai
-- Memasukkan data baru ke dalam fakta penjualan
INSERT INTO
  fakta_penjualan (
    id_penjualan,
    id_transaksi,
    id_produk,
    id_pelanggan,
    id_wilayah,
    id_waktu,
    id_pemasok_pakan,
    id_sapi_wagyu,
    jumlah_daging_terjual,
    grade_daging_terjual,
    ras_sapi_terjual,
    total_penjualan_daging
  )
SELECT
  MD5(
    CONCAT(
      id_transaksi_daging,
      '-',
      id_produk_daging,
      '-',
      DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s')
    )
  ) AS id_penjualan,
  id_transaksi_daging,
  id_produk_daging,
  id_pelanggan,
  id_wilayah_penjualan,
  id_waktu,
  id_pemasok_pakan,
  id_sapi_wagyu,
  jumlah_daging_terjual,
  grade_produk,
  ras_sapi_terjual,
  total_penjualan_daging
FROM
  stg_penjualan;

-- Membersihkan tabel staging
DROP TEMPORARY TABLE IF EXISTS stg_penjualan;

END;

$ $ DELIMITER;