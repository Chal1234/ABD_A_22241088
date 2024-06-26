-- Nama : Rahmad Afrizal Kurniawan
-- NIM : 22241088
-- Modul : 5

-- Menggunakan database
USE mart_undikma;

-- JOIN
-- Menampilkan nama pelanggan dan qty belanjanya
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan  = mp.kode_pelanggan;

-- Join tanpa filtering On
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp JOIN ms_pelanggan_dqlab AS mp
ON true;

-- INNER JOIN
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp INNER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan  = mp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp LEFT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan  = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab AS tp RIGHT JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan  = mp.kode_pelanggan;

-- JOIN 3 Tabel
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- ORDER BY pada JOIN
-- urutkan berdasarkan qty
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;
ORDER BY qty DESC;

-- GROUPING dan FUNGSI AGREGASI pada JOIN
-- Menampilkan summary total produk terjual
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jml_produk_terjual
FROM ms_produk_dqlab AS mpd LEFT JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk 
GROUP BY mpd.kategori_produk, mpd.nama_produk 
HAVING sum(tp.qty) IS NOT NULL
ORDER BY sum(tp.qty) DESC;

-- UNION
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab
UNION SELECT kode_pelanggan, nama_pelanggan
FROM ms_pelanggan_dqlab;

-- UNION DENGAN NILAI KONSTAN
SELECT 'produkam' AS kategori, nama_produk AS nama
FROM ms_produk_dqlab
UNION SELECT 'pelanggan', nama_pelanggan
FROM ms_pelanggan_dqlab;

-- UNION DENGAN TABEL YG SAMA
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab
UNION SELECT kode_produk, nama_produk 
FROM ms_produk_dqlab;

-- UNION DENGAN TABEL BERBEDA HASIL UNIK
SELECT nama_produk
FROM ms_produk_dqlab
UNION SELECT nama_produk 
FROM tr_penjualan_dqlab;

-- UNION ALL DENGAN TABEL YG SAMA
SELECT kode_produk, nama_produk
FROM ms_produk_dqlab
UNION ALL SELECT kode_produk, nama_produk
FROM ms_produk_dqlab;

-- UNION DENGAN TABEL YG BERBEDA
SELECT nama_produk
FROM ms_produk_dqlab
UNION ALL SELECT nama_produk
FROM tr_penjualan_dqlab;

-- LIMIT Exampel
SELECT nama_produk
FROM ms_produk_dqlab 
UNION ALL SELECT nama_produk 
FROM tr_penjualan_dqlab LIMIT 1

-- LATIHAN MANDIRI 
-- 1
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- 2
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab AS mp 
LEFT JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
WHERE tp.qty IS NOT NULL;

-- 3
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk , mpd.nama_produk , sum(tp.qty) AS total_qty
FROM ms_pelanggan_dqlab AS mp 
INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk , mpd.nama_produk
ORDER BY sum(qty) DESC;

-- 4
SELECT 
mp.kategori_produk, 
mpd.nama_produk
FROM 
ms_produk_dqlab AS mp 
INNER JOIN ms_produk_dqlab AS mpd
ON mp.kode_produk = mpd.kode_produk
ORDER BY 
mp.kategori_produk DESC;
 








