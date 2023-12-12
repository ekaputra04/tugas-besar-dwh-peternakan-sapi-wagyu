DELIMITER $$;

CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_insert_tb_detail_transaksi_daging
AFTER INSERT
  ON tb_detail_transaksi_daging FOR EACH ROW BEGIN
UPDATE
  tb_produk_daging
SET
  jumlah_daging_terjual = jumlah_daging_terjual + NEW.jumlah_daging_terjual
WHERE
  id_produk_daging = NEW.id_produk_daging;

END;

$$ DELIMITER;