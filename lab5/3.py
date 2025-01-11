# Otvaranje datoteke students.txt i ispisivanje studenata s ocjenom većom od 90
try:
    with open("students.txt", "r") as file:
        high_scores = []
        for line in file:
            name, surname, grade = line.strip().split()
            if int(grade) > 90:
                print(f"{name} {surname} {grade}")
                high_scores.append(f"{name} {surname} {grade}")

    # Spremanje rezultata u novu datoteku high_scores.txt
    with open("high_scores.txt", "w") as outfile:
        for entry in high_scores:
            outfile.write(entry + "\n")
except FileNotFoundError as e:
    print(f"Greška: {e}")