DELIMITER $ $;

CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_insert_tb_transaksi_daging
AFTER
INSERT
  ON tb_transaksi_daging FOR EACH ROW BEGIN -- Mengurangkan jumlah stok daging
UPDATE
  tb_produk_daging
SET
  stok_daging = stok_daging - NEW.jumlah_daging_terjual
WHERE
  id_produk_daging = NEW.id_produk_daging;

-- Memperbarui total harga produk yang terjual
UPDATE
  tb_produk_daging
SET
  total_harga_terjual = total_harga_terjual + NEW.total_harga
WHERE
  id_produk_daging = NEW.id_produk_daging;

END;

$ $ DELIMITER;