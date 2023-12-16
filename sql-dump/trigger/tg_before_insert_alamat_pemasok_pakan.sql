-- cleansing pada alamat tb_pemasok_pakan
DELIMITER //

CREATE TRIGGER dbt_peternakan_sapi_wagyu.before_insert_alamat_pemasok_pakan
BEFORE INSERT ON dbt_peternakan_sapi_wagyu.tb_pemasok_pakan
FOR EACH ROW
BEGIN
    DECLARE new_alamat VARCHAR(255);
    SET new_alamat = UPPER(NEW.alamat_pemasok_pakan); -- Mengubah alamat menjadi huruf kapital
    
    IF new_alamat LIKE '%D%P%S%' THEN
        SET new_alamat = REPLACE(new_alamat, 'DPS', 'DENPASAR');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%G%Y%R%' THEN
        SET new_alamat = REPLACE(new_alamat, 'GYR', 'GIANYAR');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%B%D%G%' THEN
        SET new_alamat = REPLACE(new_alamat, 'BDG', 'BADUNG');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%B%G%L%' THEN
        SET new_alamat = REPLACE(new_alamat, 'BGL', 'BANGLI');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%B%L%L%' THEN
        SET new_alamat = REPLACE(new_alamat, 'BLL', 'BULELENG');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%J%B%N%' THEN
        SET new_alamat = REPLACE(new_alamat, 'JBN', 'JEMBRANA');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%K%R%G%' THEN
        SET new_alamat = REPLACE(new_alamat, 'KRG', 'KARANGASEM');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%K%L%K%' THEN
        SET new_alamat = REPLACE(new_alamat, 'KLK', 'KLUNGKUNG');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    ELSEIF new_alamat LIKE '%T%B%N%' THEN
        SET new_alamat = REPLACE(new_alamat, 'TBN', 'TABANAN');
        SET NEW.alamat_pemasok_pakan = new_alamat;
    END IF;
END //

DELIMITER;