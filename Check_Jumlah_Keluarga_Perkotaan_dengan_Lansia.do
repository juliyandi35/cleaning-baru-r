*import data yang ada
use "D:\Kerjaan\Project Cleaning Baru\Susenas PNA\Susenas PNA\Susenas KOR 2023 Complete.dta", clear

drop if R105 == 2

*menampilkan jumlah keluarga yang ada
duplicates drop URUT, force
count

*akses kembali dataset awalnya
use "D:\Kerjaan\Project Cleaning Baru\Susenas PNA\Susenas PNA\Susenas KOR 2023 Complete.dta", clear
drop if R105 == 2

*save data khusus pedesaan
save "D:\Kerjaan\Project Cleaning Baru\Susenas PNA\Susenas PNA\Susenas KOR 2023 Perkotaan.dta", replace

*mengkategorikan setiap responden berdasarkan umurnya
gen kategori_umur = ""
replace kategori_umur = "Lansia" if R407 >= 60
replace kategori_umur = "Produktif" if R407 >= 15 & R407<=59
replace kategori_umur = "Anak-anak" if R407 < 15

*menghitung jumlah lansia di setiap keluarga
bysort URUT (kategori_umur): gen jumlah_lansia = sum(kategori_umur == "Lansia") 

*merombak seluruh data agar hanya tersisa kolom URUT yang berisi nilai unik setiap ID keluarga dan jumlah lansian yang ada di dalamnya
collapse (max) jumlah_lansia, by(URUT)

*menghitung ID keluarga yang terdapat lansia di dalamnya
count if jumlah_lansia ~= 0

save "D:\Kerjaan\Project Cleaning Baru\Susenas PNA\Susenas PNA\Jumlah_Lansia_Keluarga_Perkotaan.dta", replace

*menghapus dataset yang sedang diakses
clear