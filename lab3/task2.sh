#!/bin/bash

# Direktorij za pretragu
DIR="./task2dir"

# Prebrojavanje datoteka većih od 1 MB
FILE_COUNT=$(find "$DIR" -type f -size +1M | wc -l)
echo "Broj datoteka većih od 1 MB: $FILE_COUNT"

# Provjera broja datoteka
if [ "$FILE_COUNT" -gt 10 ]; then
    echo "Puno velikih datoteka!"
fi

# Ispis broja linija u svim .txt datotekama
for FILE in "$DIR"/*.txt; do
    [ -f "$FILE" ] || continue
    LINE_COUNT=$(wc -l < "$FILE")
    echo "Datoteka $FILE ima $LINE_COUNT linija."
done
