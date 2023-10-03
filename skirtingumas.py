def hamming_atstumas(str1, str2):
    # Apskaičiuoja Hamming atstumą tarp dviejų eilučių
    return sum(bit1 != bit2 for bit1, bit2 in zip(str1, str2))

def procentinis_skirtingumas(str1, str2):
    # Apskaičiuoja procentų skirtumą tarp dviejų eilučių
    len_str = len(str1)
    if len_str != len(str2):
        raise ValueError("Įvesties eilutės turi būti to paties ilgio.")
    atstumas = hamming_atstumas(str1, str2)
    return (atstumas / len_str) * 100

def main (file_path):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

            # Įsitikina, kad eilučių skaičius yra lyginis (susideda iš porų)
            if len(lines) % 2 != 0:
                print("Klaida: Failo eilučių skaičius turi būti lyginis.")
                return

            skirtumai = []

            for i in range(0, len(lines), 2):
                hash1 = lines[i].strip()
                hash2 = lines[i + 1].strip()

                # Apskaičiuoja procentų skirtumą bitų lygmenyje
                bitu_skirtumas = procentinis_skirtingumas(hash1, hash2)
                skirtumai.append(bitu_skirtumas)

                # Traktuoja šešioliktainius skaičiavimus kaip baitus, o ne UTF-8 tekstą
                baitai_hash1 = bytes.fromhex(hash1)
                baitai_hash2 = bytes.fromhex(hash2)

                # Apskaičiuoja procentų skirtumą šešioliktai lygmenyje
                hex_skirtumas = procentinis_skirtingumas(baitai_hash1, baitai_hash2)
                skirtumai.append(hex_skirtumas)

            # Spausdina mažiausią, didžiausią ir vidutinį skirtumą
            min_skirtumas = min(skirtumai)
            max_skirtumas = max(skirtumai)
            vid_skirtumas = sum(skirtumai) / len(skirtumai)

            print(f"Mažiausias skirtumas: {min_skirtumas}%")
            print(f"Didžiausias skirtumas: {max_skirtumas}%")
            print(f"Vidutinis skirtumas: {vid_skirtumas}%")

    except FileNotFoundError:
        print(f"Klaida: Failas nerastas {file_path}")

# Pakeiskite 'hashes2.txt' į tikrąjį failo kelią
main('hashes2.txt')
