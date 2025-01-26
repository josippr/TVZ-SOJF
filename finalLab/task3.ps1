param (
    [string]$Directory = "/files",
    [string]$Regex = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}",
    [string]$OutputFile = "search_results.txt"
)

# Očisti izlaznu datoteku
Set-Content -Path $OutputFile -Value ""

# Procesiranje PDF-ova
Get-ChildItem -Path $Directory -Recurse -Include *.pdf | ForEach-Object {
    $pdfText = (Get-Content -Path $_.FullName -Raw) -join " "
    if ($pdfText -match $Regex) {
        Add-Content -Path $OutputFile -Value "File: $($_.FullName)"
        [regex]::matches($pdfText, $Regex) | ForEach-Object {
            Add-Content -Path $OutputFile -Value $_.Value
        }
    }
}

# Pretraživanje običnih tekstualnih datoteka
Get-ChildItem -Path $Directory -Recurse -File | ForEach-Object {
    $content = Get-Content -Path $_.FullName -ErrorAction SilentlyContinue
    if ($content -match $Regex) {
        Add-Content -Path $OutputFile -Value "File: $($_.FullName)"
        [regex]::matches($content, $Regex) | ForEach-Object {
            Add-Content -Path $OutputFile -Value $_.Value
        }
    }
}

Write-Host "Rezultati su spremljeni u $OutputFile."
