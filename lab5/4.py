# Korištenje modula

import random
import sys

# Simulacija bacanja kocke
def roll_dice(dice_input):
    try:
        rolls, sides = map(int, dice_input.lower().split('d'))
        return sum(random.randint(1, sides) for _ in range(rolls))
    except ValueError:
        print("Pogrešan format unosa. Ispravan format je npr. '3d6'.")
        return None

# Provjera broja argumenata
if len(sys.argv) != 2:
    print("Pogrešan broj argumenata. Koristite format: python script.py 3d6")
else:
    dice_result = roll_dice(sys.argv[1])
    if dice_result:
        print(f"Rezultat bacanja: {dice_result}")