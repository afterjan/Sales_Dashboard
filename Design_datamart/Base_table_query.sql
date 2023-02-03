CREATE TABLE base_table AS (
	WITH data_sales AS (
	SELECT CONCAT(id_invoice, '_', id_barang) AS id_penjualan,
		id_invoice,
		tanggal,
		date_part('month',tanggal) AS month,
		id_customer,
		id_barang,
		jumlah_barang
	FROM data_penjualan
	UNION
	SELECT CONCAT(id_invoice, '_', id_barang) AS id_penjualan,
		id_invoice,
		tanggal,
		date_part('month',tanggal) AS month,
		id_customer,
		id_barang,
		jumlah_barang
	FROM data_penjualan_ds
		)

	SELECT ds.id_penjualan, ds.id_invoice, ds.id_customer, ds.id_barang, 
		dps.id_distributor, ds.tanggal, ds.month,  
		dps.nama as customer, dps.cabang_sales, dps.grup,
		db.nama_barang, db.lini as brand, db.harga, ds.jumlah_barang
	FROM data_sales as ds
	LEFT JOIN data_pelanggan_ds as dps
		ON ds.id_customer = dps.id_customer
	LEFT JOIN data_barang as db
		ON ds.id_barang = db.kode_barang
	ORDER BY ds.id_invoice
);