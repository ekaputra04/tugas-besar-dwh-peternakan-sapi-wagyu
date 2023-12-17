DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pegawai_nomor_telepon
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pegawai FOR EACH ROW BEGIN IF OLD.nomor_telepon_pegawai != NEW.nomor_telepon_pegawai THEN
INSERT INTO
  tb_log_nomor_telepon_pegawai (
    id_pegawai,
    nomor_telepon_lama,
    nomor_telepon_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pegawai,
    OLD.nomor_telepon_pegawai,
    NEW.nomor_telepon_pegawai,
    NOW()
  );

END IF;

END / / DELIMITER;