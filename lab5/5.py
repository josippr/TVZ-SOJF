# Skripta za ispis broja u binarnom i heksadecimalnom obliku
if len(sys.argv) == 2:
    try:
        number = int(sys.argv[1])
        print(f"Binarni oblik: {bin(number)}")
        print(f"Heksadecimalni oblik: {hex(number)}")
    except ValueError:
        print("Unos mora biti cijeli broj.")
else:
    print("Koristite: python script.py broj")

# Analiza datoteke s ocjenama učenika
try:
    with open("students.txt", "r") as file:
        grades = [int(line.strip().split()[2]) for line in file]
        print(f"Najveća ocjena: {max(grades)}")
        print(f"Najmanja ocjena: {min(grades)}")
        print(f"Prosječna ocjena: {sum(grades) / len(grades):.2f}")
except FileNotFoundError as e:
    print(f"Greška: {e}")
