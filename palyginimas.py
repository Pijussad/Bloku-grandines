def check_duplicate_hashes(file_path):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()
            a=0

            # Ensure the number of lines is even (forming pairs)
            if len(lines) % 2 != 0:
                print("Error: The number of lines in the file should be even.")
                return

            found_matches = False

            for i in range(0, len(lines), 2):
                hash1 = lines[i].strip()
                hash2 = lines[i + 1].strip()

                if hash1 == hash2:
                    print(f"Duplicate hashes found in pair {i//2 + 1}: {hash1}")
                    a=a+1
                    found_matches = True
            if not found_matches:
                print("No duplicate hashes found.")
            if found_matches: print(a)

    except FileNotFoundError:
        print(f"Error: File not found at {file_path}")

# Replace 'hashes.txt' with the actual path to your file
check_duplicate_hashes('hashes2.txt')
