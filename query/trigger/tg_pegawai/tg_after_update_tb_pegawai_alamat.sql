DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pegawai_alamat
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pegawai FOR EACH ROW BEGIN IF OLD.alamat_pegawai != NEW.alamat_pegawai THEN
INSERT INTO
  tb_log_alamat_pegawai (
    id_pegawai,
    alamat_lama,
    alamat_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pegawai,
    OLD.alamat_pegawai,
    NEW.alamat_pegawai,
    NOW()
  );

END IF;

END / / DELIMITER;