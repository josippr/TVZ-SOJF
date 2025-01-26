# Provjera je li direktorij naveden
param (
    [string]$Directory = "."
)

$outputFile = "hashes.txt"

# Brisanje postojeće datoteke s rezultatima ako postoji
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Iteracija kroz datoteke u direktoriju
Get-ChildItem -Path $Directory -File | ForEach-Object {
    $fileName = $_.Name
    $md5Hash = (Get-FileHash -Path $_.FullName -Algorithm MD5).Hash
    $sha256Hash = (Get-FileHash -Path $_.FullName -Algorithm SHA256).Hash
    "$fileName, $md5Hash, $sha256Hash" | Out-File -Append -FilePath $outputFile
}

Write-Host "Hashovi spremljeni u $outputFile"
