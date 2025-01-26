#!/bin/bash

# Mapa poznatih file signature-a
declare -A signatures
signatures["25504446"]="PDF"
signatures["FFD8FF"]="JPEG"
signatures["4D5A"]="EXE"

# Output datoteka
output_file="file_signatures.txt"
> "$output_file"

# Funkcija za čitanje i prepoznavanje file signature-a
check_signature() {
  local file="$1"
  local magic=$(xxd -p -l 4 "$file" | tr '[:lower:]' '[:upper:]')
  for sig in "${!signatures[@]}"; do
    if [[ $magic == $sig* ]]; then
      echo "$file: ${signatures[$sig]}" >> "$output_file"
      return
    fi
  done
  echo "$file: Unknown" >> "$output_file"
}

# Iteracija kroz datoteke u /files direktoriju
for file in /files/*; do
  if [[ -f $file ]]; then
    check_signature "$file"
  fi
done

echo "Rezultati su spremljeni u $output_file"
