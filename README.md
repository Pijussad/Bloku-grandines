# Bloku-grandines
Antras variantas, jame yra main.cpp failas, taip pat pridėti testavimo įrankiai, sutaisytas generate_files2.sh failas bei pridėtas skirtingumą palyginantis failas

Programos paleidimas:
Sukompiliuokite programą, į terminalą įveskite:
g++ -std=c++11 -o program main.cpp
Paleiskite programą, šalia nurodykite failo, kurį reikia suhašuoti pavadinimą, jeigu nenurodysite duomenis bus galima suvesti ranka:
./main input.txt

Programa parašys kiek laiko užtruko darbas mikrosekundžių tikslumu.


Generate_files.sh paleidimas:
Į terminalą įveskite:
chmod +x generate_files2.sh
./generate_files2.sh


palyginimas.py paleidimas:
Į terminalą įveskite:
python3 palyginimas.py

skirtingumas.py paleidimas:
Į terminalą įveskite:
python3 skirtingumas.py


hashavimo funkcijos pseudokodas:
1.   Nustatyti HASH_SIZE_BYTES = rezultato vektoriaus dydį
2.   Sukurti vektorių hash dydžio HASH_SIZE_BYTES, inicializuotą nuliais
3.   Kiekvienam simboliui simbolis įvesties eilutėje:
4.      For i from 0 to HASH_SIZE_BYTES - 1:
5.       Atnaujinti hash[i] pagal šiuos žingsnius:
6.         hash[i] = (hash[i] + simbolis + (i % 13)) ^ ((hash[i] << (i % 8)) | (hash[i] >> (8 - (i % 8))))
7.         hash[i] = (hash[i] + i) * 37
8.        hash[i] = (hash[i] >> 4) | (hash[i] << 3)
9.        hash[i] = hash[i] & ((i + 1) * 77)
10.        hash[i] = hash[i] | ((i + 2) * 23)
11.        hash[i] = (hash[i] + simbolis + (i % 7)) ^ ((hash[i] << 5) | (hash[i] >> 3))
12.        hash[i] = hash[HASH_SIZE_BYTES-1-i]*15 + hash[i]
13.        hash[i] = hash[HASH_SIZE_BYTES-i]*10 + hash[i]
14. Grąžinti rezultatų vektorių
