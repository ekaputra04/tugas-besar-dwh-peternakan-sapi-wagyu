-- trigger pada database transaksional
-- after insert tb_pemasokan_pakan
DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_insert_tb_detail_pemasokan_pakan
AFTER
INSERT
  ON dbt_peternakan_sapi_wagyu.tb_detail_pemasokan_pakan FOR EACH ROW BEGIN -- menambah jumlah stok pakan
UPDATE
  tb_pakan
SET
  stok_pakan = stok_pakan - NEW.jumlah_pasokan_pakan
WHERE
  id_pakan = NEW.id_pakan;

-- Memperbarui total harga produk yang terjual
UPDATE
  tb_pemasokan_pakan
SET
  total_biaya_pasok = total_biaya_pasok + NEW.total_harga_pakan
WHERE
  id_pasokan_pakan = NEW.id_pasokan_pakan;

END / / DELIMITER;