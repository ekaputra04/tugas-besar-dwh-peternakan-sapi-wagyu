DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pelanggan_alamat
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pelanggan FOR EACH ROW BEGIN IF OLD.alamat_pelanggan != NEW.alamat_pelanggan THEN
INSERT INTO
  tb_log_alamat_pelanggan (
    id_pelanggan,
    alamat_lama,
    alamat_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pelanggan,
    OLD.alamat_pelanggan,
    NEW.alamat_pelanggan,
    NOW()
  );

END IF;

END / / DELIMITER;