USE dwh_peternakan_sapi_wagyu;

DELETE FROM
  dimensi_waktu;

DELETE FROM
  dimensi_provinsi;

DELETE FROM
  dimensi_kabupaten;

DELETE FROM
  dimensi_wilayah;

DELETE FROM
  dimensi_sapi;

DELETE FROM
  dimensi_pegawai;

DELETE FROM
  dimensi_pelanggan;

DELETE FROM
  dimensi_pemasok_pakan;

DELETE FROM
  dimensi_produk;

DELETE FROM
  dimensi_pakan;

DELETE FROM
  fakta_pemasokan_pakan;

DELETE FROM
  fakta_penjualan_produk_daging;

CALL procs_dimensi_waktu_pertgl('2022-01-01', '2025-12-31');

CALL procs_dimensi_provinsi();

CALL procs_dimensi_kabupaten();

CALL procs_dimensi_wilayah();

CALL procs_dimensi_sapi();

CALL procs_dimensi_pegawai();

CALL procs_dimensi_pelanggan();

CALL procs_dimensi_pemasok_pakan();

CALL procs_dimensi_produk();

CALL procs_dimensi_pakan();

CALL procs_fakta_pemasokan_pakan();

CALL procs_fakta_penjualan_produk_daging();