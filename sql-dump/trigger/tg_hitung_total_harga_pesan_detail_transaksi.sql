DELIMITER / / CREATE TRIGGER hitung_total_harga_pesan_detail_transaksi BEFORE
INSERT
  ON tb_detail_transaksi_daging FOR EACH ROW BEGIN DECLARE harga DECIMAL(10, 2);

-- Ambil harga_per_kg dari tb_produk_daging
SELECT
  harga_per_kg INTO harga
FROM
  tb_produk_daging
WHERE
  id_produk_daging = NEW.id_produk_daging;

-- Hitung total_harga_pesan
SET
  NEW.total_harga_pesan = harga * NEW.jumlah_produk_terjual;

END / / DELIMITER;