-- Nama : Rahmad Afrizal Kurniawan
-- NIM : 22241088
-- MODUL 3

-- Menggunakan database
use mart_undikma;

-- ORDER BY

--- Mengambil nama produk dan qty urutkan berdasarkan qty

SELECT nama_produk,qty FROM tr_penjualan_dqlab ORDER BY qty;

--Menambil nama produk dan qty urutkan berdasarkan qty diikuti dengan nama produk

SELECT nama_produk,qty FROM tr_penjualan_dqlab  ORDER BY qty, nama_produk;

-- Latihan mandiri
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;

SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;

SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- Mengambil nama produk dan qty urutkan berdasarkan qty besar ke  kecil
SELECT nama_produk,qty FROM tr_penjualan_dqlab ORDER BY qty DESC;

-- Mengambil nama produk dan qty urutkan berdasarkan qty besar ke kecil,nama produk kecil ke besar
SELECT nama_produk,qty FROM tr_penjualan_dqlab ORDER BY qty DESC, nama_produk ASC;

-- Latihan mandiri
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;

SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;

SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- Menggunakan hasil perhitungan pada ORDER BY 
-- Mengambil nama produk qty, harga dan total bayar urutkan berdasarkan total bayar besar ke kecil

SELECT nama_produk, qty, harga, qty*harga AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

-- Latihan mandiri
SELECT nama_produk, qty, harga,
diskon_persen, (diskon_persen/100)*harga AS diskon,
qty*(harga - (diskon_persen/100)*harga) AS total_bayar 
FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

-- WHERE dan ORDER BY
-- Mnegambil nama produk, qty dari produk berawalan F urut berdasarkan qty besar kekecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Latihan mandiri
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen ORDER BY harga DESC;

SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 ORDER BY harga DESC;

SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >=100000 OR nama_produk LIKE 'T%' ORDER BY diskon_persen DESC;

-- Fungsi agregrasi
-- hitung jumlah qty dari seluruh row di tabel penjualan
SELECT SUM(qty) AS total_qty FROM tr_penjualan_dqlab;

-- hitung jumlah seluruh row pada tabel penjualan
SELECT COUNT(*)AS jumlah_row FROM tr_penjualan_dqlab; 

-- hitung penjumlahan nilai qty dan jumlah seluruh row pada tabel penjualan
SELECT SUM(qty), COUNT(*) FROM tr_penjualan_dqlab;

-- hitung rata rata nilai  maksimum  dan minimum dari qty pada tabel penjualan
SELECT AVG(qty), MAX(qty), MIN(qty) FROM tr_penjualan_dqlab;

-- htung jumlah nilai unik dari  nama produk di tabel penjualan
SELECT COUNT(DISTINCT nama_produk) FROM tr_penjualan_dqlab;

SELECT COUNT(nama_produk) FROM tr_penjualan_dqlab;

-- hitung jumlah nilai unik dan seluruh row dari tabelpenjualan
SELECT COUNT(*), COUNT(DISTINCT nama_produk) FROM tr_penjualan_dqlab;

-- menampilkan field nama produk dan fungsi maksimum qty dari tabel penjualan
SELECT nama_produk, MAX(qty) FROM tr_penjualan_dqlab;

-- GROUP BY
-- ambil hasil pengelompokkan nilai kolom nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab
GROUP BY nama_produk;

SELECT nama_produk FROM tr_penjualan_dqlab;

-- ambil hasil pengelompokkan nama produk dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab 
GROUP BY nama_produk, qty;

-- ambil jumlah hasil penjumlahan qty dari pengelompokka nama produk terhadap semua row di tabel penjualan
SELECT nama_produk, SUM(qty)  FROM tr_penjualan_dqlab
GROUP BY nama_produk ORDER BY SUM(qty) DESC;

-- ambil jumlah qty > 2 dari hasil pengelompokkan namaproduk di tabel pejualan
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING SUM(qty) > 2;  

-- Latihan mandiri
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING SUM(qty) > 4;

SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING SUM(qty) = 9;

SELECT nama_produk, (qty * harga - (diskon_persen/100) * harga) AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

