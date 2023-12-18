DELIMITER / / CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_pemasok_pakan_nomor_telepon
AFTER
UPDATE
  ON dbt_peternakan_sapi_wagyu.tb_pemasok_pakan FOR EACH ROW BEGIN IF OLD.no_telepon_pemasok_pakan != NEW.no_telepon_pemasok_pakan THEN
INSERT INTO
  tb_log_nomor_telepon_pemasok_pakan (
    id_pemasok_pakan,
    nomor_telepon_lama,
    nomor_telepon_baru,
    tanggal_perubahan
  )
VALUES
  (
    OLD.id_pemasok_pakan,
    OLD.no_telepon_pemasok_pakan,
    NEW.no_telepon_pemasok_pakan,
    NOW()
  );

END IF;

END / / DELIMITER;