DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pelanggan_email
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pelanggan FOR EACH ROW BEGIN IF OLD.email_pelanggan != NEW.email_pelanggan THEN
INSERT INTO
  tb_log_email_pelanggan (
    id_pelanggan,
    email_lama,
    email_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pelanggan,
    OLD.email_pelanggan,
    NEW.email_pelanggan,
    NOW()
  );

END IF;

END / / DELIMITER;