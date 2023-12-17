DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pegawai_email
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pegawai FOR EACH ROW BEGIN IF OLD.email_pegawai != NEW.email_pegawai THEN
INSERT INTO
  tb_log_email_pegawai (
    id_pegawai,
    email_lama,
    email_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pegawai,
    OLD.email_pegawai,
    NEW.email_pegawai,
    NOW()
  );

END IF;

END / / DELIMITER;