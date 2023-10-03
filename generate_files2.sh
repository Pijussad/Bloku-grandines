#!/bin/bash

# Funkcija, kuri sugeneruoja atsitiktinį eilutės ilgio simbolių seką
generate_random_string() {
    LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c "$1"
}

# Funkcija, kuri sukuria poras ir įrašo į failą
create_pairs() {
    local length="$1"
    local count="$2"
    local diff_position

    for ((i=1; i<=$count; i++)); do
        # Pritaikyta eilutės ilgio
        string1=$(generate_random_string "$length")
        
        # Užtikrina, kad antroji eilutė skirtųsi tik vienu simboliu
        diff_position=$((RANDOM % length))
        string2=$(echo "$string1" | sed "s|.|$(generate_random_string 1)|$(($diff_position + 1))")

        echo "$string1" >> output2.txt
        echo "$string2" >> output2.txt
    done
}

# Sukurti poras su skirtingais ilgiais
create_pairs 10 25000   # 25,000 poros su 10 simboliais
create_pairs 100 25000  # 25,000 poros su 100 simboliais
create_pairs 500 25000  # 25,000 poros su 500 simboliais
create_pairs 1000 25000 # 25,000 poros su 1000 simboliais

echo "Failas sėkmingai sukurtas: output.txt"
