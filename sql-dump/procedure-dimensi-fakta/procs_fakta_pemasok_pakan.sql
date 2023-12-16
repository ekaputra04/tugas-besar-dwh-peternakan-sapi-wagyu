-- procedure untuk pemasok_fact
DELIMITER / / CREATE PROCEDURE procs_fakta_pemasok_pakan() BEGIN
INSERT INTO
	pemasok_fact (
		row_key_pemasok_pakan,
		row_key_jenis_pakan,
		harga_pakan,
		kualitas_pakan,
		kinerja_pemasok
	)
SELECT
	dpph.row_key_pemasok_pakan,
	dpph2.id_jenis_pakan,
	dpph2.harga_pakan,
	dpph2.kualitas_pakan,
	CASE
		WHEN dpph2.kualitas_pakan > 7 THEN 'Baik'
		WHEN dpph2.kualitas_pakan >= 5 THEN 'Cukup'
		WHEN dpph2.kualitas_pakan < 5 THEN 'Kurang'
		ELSE 'Buruk'
	END AS kinerja_pemasok
FROM
	dbt_peternakan_sapi_wagyu.tb_pemasok_pakan AS dppt
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_pemasok_pakan AS dpph ON dppt.id_pemasok_pakan = dpph.id_pemasok_pakan
	INNER JOIN dwh_peternakan_sapi_wagyu.dimensi_jenis_pakan AS dpph2 ON dppt.id_jenis_pakan = dpph2.id_jenis_pakan;

END / / DELIMITER;