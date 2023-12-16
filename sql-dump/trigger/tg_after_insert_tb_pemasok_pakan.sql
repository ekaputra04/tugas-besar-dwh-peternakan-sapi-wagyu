-- after insert pemasok_pakan
DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_insert_tb_pemasok_pakan
AFTER
INSERT
  ON dbt_peternakan_sapi_wagyu.tb_pemasok_pakan FOR EACH ROW BEGIN
INSERT INTO
  tb_log_pemasok_pakan (
    id_pemasok_pakan,
    nama_pemasok_pakan,
    tanggal_penambahan
  )
VALUES
  (
    NEW.id_pemasok_pakan,
    NEW.nama_pemasok_pakan,
    NOW()
  );

END / / DELIMITER;