-- Nama : Rahmad Afrizal Kurniawan
-- NIM : 22241088
-- Modul : 4

-- Case 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;
-- Case 2
SELECT nama_produk, harga FROM tr_penjualan_dqlab;
-- Case 3
SELECT * FROM ms_produk_dqlab WHERE nama_produk = 'Flashdisk DQLab 32 GB';
-- Case 4
SELECT *
FROM ms_produk_dqlab
WHERE nama_produk 
IN ('Flashdisk DQLab 84 GB', 'Tas Travel Organizer DigiSkills.id', 'Gantungan Kunci DQLab');

-- Case 5
SELECT *
FROM ms_produk_dqlab
WHERE harga < 50000;

-- Case 6
SELECT kode_pelanggan, nama_produk, qty, harga,
(qty*harga) AS total
FROM tr_penjualan_dqlab
WHERE (qty*harga) >= 200000
ORDER BY total DESC;

-- Case 7
SELECT kode_pelanggan, 
SUM(qty) AS total_qty, 
SUM(qty * harga) AS total_harga, 
SUM(qty) % 3 AS sisa_qty
FROM tr_penjualan_dqlab
GROUP BY kode_pelanggan;

-- Case 8
SELECT kode_transaksi, tgl_transaksi, no_urut, kode_produk,nama_produk,
CONCAT(kode_produk, ' - ', nama_produk) AS kode_produk_namaproduk
FROM tr_penjualan_dqlab
WHERE qty = 5;
