DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pemasok_pakan_email
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pemasok_pakan FOR EACH ROW BEGIN IF OLD.email_pemasok_pakan != NEW.email_pemasok_pakan THEN
INSERT INTO
  tb_log_email_pemasok_pakan (
    id_pemasok_pakan,
    email_lama,
    email_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pemasok_pakan,
    OLD.email_pemasok_pakan,
    NEW.email_pemasok_pakan,
    NOW()
  );

END IF;

END / / DELIMITER;