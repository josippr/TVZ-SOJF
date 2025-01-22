#!/bin/bash

# Direktorij za pretragu
DIR="./task2dir"

# Pretraga riječi "ERROR"
grep -r "ERROR" "$DIR"

# Izdvajanje prve kolone iz CSV datoteke
CSV_FILE="./task2dir/acsvfile.csv"
OUTPUT_FILE="./column1output.txt"
cut -d',' -f1 "$CSV_FILE" > "$OUTPUT_FILE"

# Prebrojavanje pojavljivanja IP adrese
LOG_FILES="$DIR/logfile.log"
IP_ADDRESS="192.168.1.1"
grep -o "$IP_ADDRESS" $LOG_FILES | wc -l
