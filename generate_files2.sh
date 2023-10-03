#!/bin/bash

# Function to generate random string of a given length
generate_random_string() {
    LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c "$1"
}

# Function to create pairs and write to the file
create_pairs() {
    local length="$1"
    local count="$2"
    local diff_position

    for ((i=1; i<=$count; i++)); do
        # Adjusted the length of the string
        string1=$(generate_random_string "$length")
        
        # Ensure that the second string differs by only one character
        diff_position=$((RANDOM % (length - 1)))

        # Generate a replacement character different from the character at diff_position
        replacement="${string1:diff_position:1}"
        while [ "$replacement" == "${string1:diff_position:1}" ]; do
            replacement=$(generate_random_string 1)
        done

        # Replace the character at diff_position
        string2="${string1:0:diff_position}$replacement${string1:((diff_position + 1))}"

        echo "$string1" >> output2.txt
        echo "$string2" >> output2.txt
    done
}

# Create pairs for different lengths
create_pairs 10 25000   # 25,000 pairs with 10 characters
create_pairs 100 25000  # 25,000 pairs with 100 characters
create_pairs 500 25000  # 25,000 pairs with 500 characters
create_pairs 1000 25000 # 25,000 pairs with 1000 characters

echo "File created successfully: output2.txt"
