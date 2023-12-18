DELIMITER / / CREATE TRIGGER hitung_total_harga_pakan_detail_pemasokan BEFORE
INSERT
  ON tb_detail_pemasokan_pakan FOR EACH ROW BEGIN DECLARE harga DECIMAL(10, 2);

SELECT
  harga_pakan INTO harga
FROM
  tb_pakan
WHERE
  id_pakan = NEW.id_pakan;

-- Hitung total_harga_pakan
SET
  NEW.total_harga_pakan = harga * NEW.jumlah_pasokan_pakan;

END / / DELIMITER;