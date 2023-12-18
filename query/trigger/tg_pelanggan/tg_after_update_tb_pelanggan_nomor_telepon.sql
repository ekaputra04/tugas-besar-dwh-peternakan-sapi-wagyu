DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pelanggan_nomor_telepon
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pelanggan FOR EACH ROW BEGIN IF OLD.nomor_telepon_pelanggan != NEW.nomor_telepon_pelanggan THEN
INSERT INTO
  tb_log_nomor_telepon_pelanggan (
    id_pelanggan,
    nomor_telepon_lama,
    nomor_telepon_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pelanggan,
    OLD.nomor_telepon_pelanggan,
    NEW.nomor_telepon_pelanggan,
    NOW()
  );

END IF;

END / / DELIMITER;