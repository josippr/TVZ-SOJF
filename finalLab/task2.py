import os

# Poznati file signature-i
SIGNATURES = {
  b'\x25\x50\x44\x46': "PDF",
  b'\xFF\xD8\xFF': "JPEG",
  b'\x4D\x5A': "EXE",
}

output_file = "file_signatures.txt"
files_dir = "files"

def get_file_signature(file_path):
  with open(file_path, "rb") as f:
    file_header = f.read(4)
    for signature, file_type in SIGNATURES.items():
      if file_header.startswith(signature):
        return file_type
  return "Unknown"

# Spremanje rezultata u datoteku
with open(output_file, "w") as out:
  for file_name in os.listdir(files_dir):
    file_path = os.path.join(files_dir, file_name)
    if os.path.isfile(file_path):
      file_type = get_file_signature(file_path)
      out.write(f"{file_name}: {file_type}\n")

print(f"Rezultati su spremljeni u {output_file}")
