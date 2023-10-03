#!/bin/bash

# Funkcija sugeneruoti atsitiktinį eilutės ilgio simbolių eilutę
generate_random_string() {
    LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c "$1"
}

# Funkcija sukurti poras ir įrašyti į failą
create_pairs() {
    local length="$1"
    local count="$2"
    for ((i=1; i<=$count; i++)); do
        string1=$(generate_random_string "$length")
        string2=$(generate_random_string "$length")
        echo "$string1" >> output.txt
        echo "$string2" >> output.txt
    done
}

# Kurti poras skirtingiems ilgiams
create_pairs 10 25000
create_pairs 100 25000
create_pairs 500 25000
create_pairs 1000 25000

echo "Failas sėkmingai sukurtas: output.txt"
