#!/bin/bash

# Direktorij za arhiviranje
ARCHIVE_DIR="./archive"
LOG_FILE="./backup.log"

# Kreiranje arhive ako ne postoji
mkdir -p "$ARCHIVE_DIR"

# Kopiranje .log datoteka starijih od 7 dana
find ./ -name "*.log" -type f -mtime +7 -exec cp {} "$ARCHIVE_DIR" \;

# Logiranje uspješne kopije
echo "$(date): Datoteke kopirane u $ARCHIVE_DIR" >> "$LOG_FILE"
