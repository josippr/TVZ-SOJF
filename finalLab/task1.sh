#!/bin/bash

# Provjera je li korisnik naveo direktorij
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"
output_file="hashes.txt"

# Brisanje postojeće datoteke s rezultatima ako postoji
> "$output_file"

# Iteracija kroz sve datoteke u direktoriju
for file in "$directory"/*; do
    if [ -f "$file" ]; then
        md5_hash=$(md5sum "$file" | awk '{print $1}')
        sha256_hash=$(sha256sum "$file" | awk '{print $1}')
        echo "$(basename "$file"), $md5_hash, $sha256_hash" >> "$output_file"
    fi
done

echo "Hashovi spremljeni u $output_file"
