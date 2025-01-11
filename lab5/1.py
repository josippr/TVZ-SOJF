# Osnovne Python naredbe i varijable

# Kreiranje varijable greeting i ispisivanje
greeting = "Hello, Python!"
print(greeting)

# Kreiranje liste s danima u tjednu i ispisivanje slicing-om
days = ["Ponedjeljak", "Utorak", "Srijeda", "Cetvrtak", "Petak", "Subota", "Nedjelja"]
print(days[2:4])  # Ispis treceg i cetvrtog dana

# Kreiranje tuple-a s imenima gradova i pokušaj promjene jednog elementa
cities = ("Zagreb", "Split", "Rijeka", "Osijek")
try:
    cities[1] = "Dubrovnik"
except TypeError as e:
    print(f"Greška: {e}")