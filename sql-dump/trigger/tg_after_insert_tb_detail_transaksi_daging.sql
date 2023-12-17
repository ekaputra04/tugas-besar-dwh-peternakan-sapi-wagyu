-- trigger pada database transaksional
-- after insert tb_transaksi_daging
DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_insert_tb_detail_transaksi_daging
AFTER
INSERT
  ON dbt_peternakan_sapi_wagyu.tb_detail_transaksi_daging FOR EACH ROW BEGIN -- Mengurangkan jumlah stok daging
UPDATE
  tb_produk_daging
SET
  stok_daging = stok_daging - NEW.jumlah_produk_terjual
WHERE
  id_produk_daging = NEW.id_produk_daging;

-- Memperbarui total harga produk yang terjual
UPDATE
  tb_transaksi_daging
SET
  total_harga = total_harga + NEW.total_harga_pesan
WHERE
  id_transaksi_daging = NEW.id_transaksi_daging;

END / / DELIMITER;