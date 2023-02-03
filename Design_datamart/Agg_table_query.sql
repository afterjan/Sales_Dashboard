CREATE TABLE agg_table AS(
	SELECT *,
		jumlah_barang*harga as total_amount
	FROM base_table
	);