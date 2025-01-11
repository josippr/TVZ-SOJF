# Kontrola toka i petlje

# Unos broja između 1 i 100
while True:
    try:
        number = int(input("Unesite broj između 1 i 100: "))
        if 1 <= number <= 100:
            break
        else:
            print("Molimo unesite ispravan broj.")
    except ValueError:
        print("Molimo unesite cijeli broj.")

# Provjera broja
if number < 50:
    print("Broj je manji od 50")
else:
    print("Broj je veći ili jednak 50")

# Ispis parnih brojeva između 1 i 20
for i in range(2, 21, 2):
    print(i)