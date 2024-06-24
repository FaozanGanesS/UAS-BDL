Projek ini dibuat guna memenuhi penilaian akademik mata kuliah Basis Data LanjutaN

# Entity Relationship Diagram
![RELASI](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/63b9bc85-2ed2-4dcb-9c41-8fe6b3a97bf4)

ERD (Entity-Relationship Diagram) di atas menggambarkan relasi antara tabel-tabel dalam basis data "db_toko." Tabel **pelanggan** menyimpan informasi tentang pelanggan yang terdaftar di toko online dengan kolom-kolom seperti IDPelanggan, Nama, Email, dan Alamat. Tabel **pesanan** menyimpan informasi mengenai pesanan yang dilakukan oleh pelanggan, mencakup kolom IDPesanan, IDPelanggan, TanggalPesanan, dan Total. Tabel ini terhubung dengan tabel pelanggan melalui kolom IDPelanggan, menunjukkan setiap pesanan dibuat oleh pelanggan tertentu. Tabel **produk** menyimpan data mengenai produk yang dijual di toko online, dengan kolom-kolom seperti IDProduk, NamaProduk, Deskripsi, dan Harga. Tabel **itempesanan** menyimpan detail dari setiap item yang dipesan dalam suatu pesanan, mencakup kolom IDItemPesanan, IDPesanan, IDProduk, Jumlah, dan HargaSatuan. Tabel ini terhubung dengan tabel pesanan melalui kolom IDPesanan, menunjukkan detail dari pesanan tertentu, dan terhubung dengan tabel produk melalui kolom IDProduk, menunjukkan produk yang dipesan. Selain itu, terdapat tabel **vw_topprodukterlaris**, sebuah tampilan (view) yang menunjukkan produk terlaris berdasarkan total penjualan, dengan kolom NamaProduk dan JumlahTotal. View ini tidak memiliki relasi langsung dengan tabel lain dalam diagram, tetapi dibangun berdasarkan query yang mengagregasikan data dari tabel itempesanan dan produk. Diagram ini memberikan gambaran yang jelas tentang bagaimana tabel-tabel di dalam basis data "db_toko" saling berhubungan dan berinteraksi untuk menyimpan dan mengelola informasi terkait toko online.

# Penjelasan Skema Basis Data
1. View dan Agregat
   
   ![VIEW](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/90124fde-08ac-4790-8396-db3097482abe)

    A. VIEW adalah tabel virtual yang terdiri dari hasil query pada database.
  
    B. Fungsi agregat digunakan untuk melakukan perhitungan pada sekumpulan nilai dimana dalam database yang saya buat adalah untuk menhitung pendapatan.
  
2. Index
   
   ![INDEX](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/f5c7a29c-ef42-46e6-90bc-d24e90de42b4)

    INDEX digunakan untuk meningkatkan kecepatan operasi retrieval data pada tabel dengan membuat struktur data khusus yang memungkinkan akses lebih cepat ke baris dalam tabel.

3. Trrigger
   
   ![TRIGGER](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/a769dab6-994b-4495-905e-864298f64be1)
   
   TRIGGER adalah perintah yang secara otomatis dieksekusi (triggered) oleh sistem basis data sebagai respons terhadap suatu peristiwa tertentu pada tabel (INSERT, UPDATE, DELETE). Triggers sering digunakan untuk menjaga integritas data dan melakukan audit otomatis.
   
4. Left join dan Inner join

   ![LEFT JOIN](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/f95a1390-911c-46da-a75a-8dd3f207588f)

   LEFT JOIN mengembalikan semua baris dari tabel kiri dan baris yang cocok dari tabel kanan. Jika tidak ada kecocokan, hasil dari tabel kanan akan berisi NULL.
   
5. Subquery

   ![SUBQUERY](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/0c228755-dd49-4502-b0bf-63462d011d4a)

   UBQUERY adalah query di dalam query lain. Mereka digunakan untuk melakukan operasi yang memerlukan hasil dari query lain. Subquery dapat digunakan dalam SELECT, INSERT, UPDATE, dan DELETE.

6. Having

   ![HAVING](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/16e767a6-ac18-43ee-b8d3-551151a62367)

   HAVING digunakan untuk menyaring hasil agregasi. Berbeda dengan WHERE yang menyaring baris sebelum pengelompokan, HAVING menyaring setelah pengelompokan.

7. Wildcard

   ![WILDCARD](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/983d18aa-7134-4383-84a4-b0ebd6887d63)

   WILDCARD digunakan dalam klausa LIKE untuk mencari pola dalam string. Tanda % mewakili nol atau lebih karakter, sedangkan _ mewakili tepat satu karakter.

8. Dumpingg data

   ![DUMPINGG DATA](https://github.com/FaozanGanesS/UAS-BDL/assets/173721092/5d619d9e-861f-4a4d-97f0-73886ddc3a7e)

   DUMPING DATA adalah proses mengekspor data dari basis data ke dalam format yang dapat disimpan, diarsipkan, atau diimpor ke sistem lain. Ini sering digunakan untuk backup dan transfer data.
