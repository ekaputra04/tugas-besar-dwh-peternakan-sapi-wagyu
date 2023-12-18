DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pemasok_pakan_alamat
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pemasok_pakan FOR EACH ROW BEGIN IF OLD.alamat_pemasok_pakan != NEW.alamat_pemasok_pakan THEN
INSERT INTO
  tb_log_alamat_pemasok_pakan (
    id_pemasok_pakan,
    alamat_lama,
    alamat_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pemasok_pakan,
    OLD.alamat_pemasok_pakan,
    NEW.alamat_pemasok_pakan,
    NOW()
  );

END IF;

END / / DELIMITER;