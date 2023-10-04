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
4.   Keičiamas i nuo 0 iki HASH_SIZE_BYTES - 1:
5.   Atnaujinti hash[i] pagal šiuos žingsnius:
6.    hash[i] = (hash[i] + simbolis + (i % 13)) ^ ((hash[i] << (i % 8)) | (hash[i] >> (8 - (i % 8))))
7.    hash[i] = (hash[i] + i) * 37
8.    hash[i] = (hash[i] >> 4) | (hash[i] << 3)
9.    hash[i] = hash[i] & ((i + 1) * 77)
10.   hash[i] = hash[i] | ((i + 2) * 23)
11.   hash[i] = (hash[i] + simbolis + (i % 7)) ^ ((hash[i] << 5) | (hash[i] >> 3))
12.   hash[i] = hash[HASH_SIZE_BYTES-1-i]*15 + hash[i]
13.   hash[i] = hash[HASH_SIZE_BYTES-i]*10 + hash[i]
14. Grąžinti rezultatų vektorių


Eksperimentinis tyrimas ir rezultatų analizė
1.
Hashuojant tokią pat raidę vieną didžiąją, kitą mažają rezultatai žymiai skiriasi:

e - 39be2a3102aed3a9a2992cdfcc21abc7ca6335efa33ba9b9ff8e6483db286f64  dar kartą įvedant e rezultatas gaunamas toks pat.

E - 5908bc5122c4f1c9d0bb0ee3ec67f9e7caa88bab3fea85df3bb200971b249748

Hashuojant 2 skirtingus 1000 simbolių failus rezultatai taip pat skirasi

Pirmas failas - 8ea4c7741dee21412f1a2a896aa29e5b0a765e47d021e8421dac4aece80b1267

Antras failas - 0e2f99c39a5ee9f765c676e62be3dac8c7257409b8e4dbef78db8f42505a5a3e

Pirmas failas su viena raide pakeista - 0460969e69532621773e358cd258958188699f7b0e2575e25e27622659d42ca9

Tuščio failo hashuoti negalima, gaunamas pranešimas - Klaida: Tuščia įvestis.

Išvada - nepriklausomai nuo Input'o, Output'ai visada yra vienodo dydžio, o to paties failo hash'as yra tas pats.

2. Hashavimo funkcijos efektyvumo tyrimas:
Tyrimas buvo atliktas nadojant 10 simbolių ilgio eilutes.
![Picture 1](https://github.com/Pijussad/Bloku-grandines/assets/64306577/7af2ce54-01bc-46ff-9d6f-f348596bc1cf)

Išvada - panašu, kad funkcijos efektyvumas yra linijinis, O(n), nors hashuojant labai mažai eilučių skirtumas yra minimalus

3. Atsparumas kolizijai
   
Tam, kad išmatuoti atsparumą kolizijai buvo sukurtas failas su 100000 skirtingo ilgio eilučių poromis. Tada paleistas palyginimas.py failas, kuris nerado nei vienos poros kur hashas sutaptų.

4. Hashų gautų iš dviejų to paties ilgio įvesčių, kurios skiriasi vienu simboliu skirtingumo palyginimas

Tam, kad palyginti skirtingumą buvo naudojamas Hamming algoritmas
   Rezultatai tokie:
Mažiausias skirtumas: 78.125%
Didžiausias skirtumas: 100.0%
Vidutinis skirtumas: 96.68284375%
Vidutinis skirtingumas siekia beveik 97 procentus, todėl manau, kad darbas pavyko

