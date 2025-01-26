#!/bin/bash

DIRECTORY="/files"
REGEX="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
OUTPUT_FILE="search_results.txt"

# Očisti izlaznu datoteku
> "$OUTPUT_FILE"

# Proces PDF-ova i ekstrakcija teksta
for pdf in "$DIRECTORY"/*.pdf; do
    if [ -f "$pdf" ]; then
        pdftotext "$pdf" "${pdf%.pdf}.txt"
    fi
done

# Pretraživanje datoteka
grep -rE "$REGEX" "$DIRECTORY" >> "$OUTPUT_FILE"

echo "Rezultati su spremljeni u $OUTPUT_FILE."
