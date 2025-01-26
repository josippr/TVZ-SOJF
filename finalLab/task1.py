import hashlib
import os

def calculate_hashes(directory, output_file="hashes.txt"):
    with open(output_file, "w") as f:
        for file_name in os.listdir(directory):
            file_path = os.path.join(directory, file_name)
            if os.path.isfile(file_path):
                with open(file_path, "rb") as file:
                    content = file.read()
                    md5_hash = hashlib.md5(content).hexdigest()
                    sha256_hash = hashlib.sha256(content).hexdigest()
                f.write(f"{file_name}, {md5_hash}, {sha256_hash}\n")
    print(f"Hashovi spremljeni u {output_file}")

# Upotreba
directory = input("Unesite putanju do direktorija: ")
calculate_hashes(directory)
