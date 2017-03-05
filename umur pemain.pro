domains %merupakan suatu kata kunci dalam program ini yang menyatakan suatu jenis variabel
nama = symbol %ini merupakan type yang digunakan pada predikat yang argumennya berupa kumpulan karakter yang hanya terdiri dari huruf atau kata tanpa dipisahkan dengan spasisss 
umur = integer %ini merupakan type domains yang dipakai pada predikat yang argumennya memiliki nilai berupa bilangan bulat

Predicates %kata kunci ini digunakan untuk mendeklarasikan predikat
nondeterm % menjeneralkan ketentuan input output yang kita inginkan dari anggota predikat yang ada
pemain(nama,umur)%merupakan kata kunci yang mirip seperti method dalam pemrograman netbeans

Clauses %aturan atau fakta
pemain(bejo,15). %pemaian berumur 15 tahun "bejo" 
pemain(telo,14). % . untuk mengakhiri perintah
pemain(cokri,15). % , menunjukan (dan)
pemain(glempong,15). %; menunjukkan (atau)
pemain(kabul,14).

Goal
pemain(A,15),%A = merupakan variabel yang khusus untuk meunjukkan pemain yang berusia 15 tahun, dan 
pemaiin(B,14)%B = merupakan variabel yang khusus untuk menunjukkan pemain yang berusia 14 tahun