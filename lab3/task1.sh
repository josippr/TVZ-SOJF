#!/bin/bash

# 1. Kreiranje varijable i ispis vrijednosti
GREETING="Hello, Bash!"
echo "$GREETING"

# 2. Skripta za rad s argumentima
echo "Ukupan broj argumenata: $#"
echo "Vrijednost svih argumenata: $@"
echo "Prvi argument: $1"
echo "Drugi argument: $2"

# 3. Prikaz vrijednosti varijabli okruženja
echo "HOME: $HOME"
echo "USER: $USER"
echo "SHELL: $SHELL"
