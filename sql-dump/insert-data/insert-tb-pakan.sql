-- Query untuk menghasilkan 50 entri dengan id_jenis_pakan acak dan harga pakan di antara 500,000 dan 2,000,000
INSERT INTO
  tb_pakan (
    id_jenis_pakan,
    nama_pakan,
    kualitas_pakan,
    harga_pakan
  )
SELECT
  ROUND(RAND() * 9) + 1,
  -- Angka acak dari 1 sampai 10
  CONCAT('Pakan ', id_pakan),
  ROUND(RAND() * 5) + 5,
  -- Angka acak dari 5 sampai 10 untuk kualitas_pakan
  ROUND(RAND() * (2000000 - 500000) + 500000, 2) -- Harga acak di antara 500,000 dan 2,000,000 untuk harga_pakan
FROM
  (
    SELECT
      @id_pakan := IFNULL(MAX(id_pakan), 0)
    FROM
      tb_pakan
  ) r,
  (
    SELECT
      @id_pakan := @id_pakan + 1 AS id_pakan
  ) n
LIMIT
  50;