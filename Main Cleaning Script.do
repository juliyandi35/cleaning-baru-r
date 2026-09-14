use "D:\Kerjaan\Project Cleaning Baru\Susenas PNA\Susenas PNA\Susenas KOR 2023 Complete.dta"
gen asuransi_kesehatan = 1
replace asuransi_kesehatan = 0 if R1101_X == X



save "D:\Kerjaan\Project Cleaning Baru\Susenas PNA\Susenas PNA\Susenas KOR Cleaned.dta"
clear