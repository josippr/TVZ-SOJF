import re
import os
import sys
from PyPDF2 import PdfReader

def extract_text_from_pdf(pdf_path):
    """Izvlači tekst iz PDF datoteke."""
    try:
        reader = PdfReader(pdf_path)
        text = ""
        for page in reader.pages:
            text += page.extract_text()
        return text
    except Exception as e:
        print(f"Greška pri čitanju PDF-a {pdf_path}: {e}")
        return ""

def search_regex_in_files(directory, regex, output_file="search_results.txt"):
    try:
        pattern = re.compile(regex)
    except re.error as e:
        print(f"Greška u regexu: {e}")
        return

    with open(output_file, "w") as output:
        for root, _, files in os.walk(directory):
            for file in files:
                file_path = os.path.join(root, file)
                try:
                    if file.lower().endswith(".pdf"):
                        content = extract_text_from_pdf(file_path)
                    elif file.lower().endswith((".txt", ".log")):
                        with open(file_path, "r", encoding="utf-8") as f:
                            content = f.read()
                    else:
                        continue
                    
                    matches = pattern.findall(content)
                    if matches:
                        output.write(f"File: {file_path}\n")
                        for match in matches:
                            output.write(f"Match: {match}\n")
                except Exception as e:
                    print(f"Greška pri obradi datoteke {file_path}: {e}")
                    continue

    print(f"Rezultati su spremljeni u {output_file}.")

if __name__ == "__main__":
    directory = "/files"
    regex = r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
    search_regex_in_files(directory, regex)
