#!/bin/bash

# Funkcija sugeneruoti atsitiktinį eilutės ilgio simbolių eilutę
generate_random_string() {
    LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c "$1"
}

# Funkcija sukurti poras ir įrašyti į failą
create_pairs() {
    local length="$1"
    local count="$2"
    local diff_position

    for ((i=1; i<=$count; i++)); do
        string1=$(generate_random_string "$length")
        
        # Užtikrinama, kad antra eilute skiriasi tik vienu simboliu
        diff_position=$((RANDOM % (length - 1)))

        # Sugeneruoti  simbolį, skirtingą nuo simbolio diff_position vietoje
        replacement="${string1:diff_position:1}"
        while [ "$replacement" == "${string1:diff_position:1}" ]; do
            replacement=$(generate_random_string 1)
        done

        # Pakeisti simbolį diff_position vietoje
        string2="${string1:0:diff_position}$replacement${string1:((diff_position + 1))}"

        echo "$string1" >> output2.txt
        echo "$string2" >> output2.txt
    done
}

create_pairs 10 25000
create_pairs 100 25000
create_pairs 500 25000
create_pairs 1000 25000
echo "Failas sėkmingai sukurtas: output2.txt"
