DELIMITER $ $;

CREATE TRIGGER dbt_peternakan_sapi_wagyu.after_update_tb_sapi_wagyu
AFTER
UPDATE
  ON tb_sapi_wagyu FOR EACH ROW BEGIN
INSERT INTO
  tb_log_perubahan_umur (
    id_sapi_wagyu,
    umur_sebelum,
    umur_sesudah,
    tanggal_perubahan
  )
VALUES
  (
    NEW.id_sapi_wagyu,
    OLD.umur_sapi,
    NEW.umur_sapi,
    NOW()
  );

END;

$ $ DELIMITER;