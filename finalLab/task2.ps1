# Definicija poznatih file signature-a
$fileSignatures = @{
  "25504446" = "PDF"
  "FFD8FF"   = "JPEG"
  "4D5A"     = "EXE"
}

# Output datoteka
$outputFile = "file_signatures.txt"
Remove-Item -Path $outputFile -ErrorAction SilentlyContinue

# Funkcija za provjeru file signature-a
function Get-FileSignature {
  param([string]$filePath)

  $fileStream = [System.IO.File]::OpenRead($filePath)
  $buffer = New-Object byte[] 4
  $fileStream.Read($buffer, 0, 4) | Out-Null
  $fileStream.Close()

  $hexSignature = ($buffer | ForEach-Object { $_.ToString("X2") }) -join ""
  foreach ($sig in $fileSignatures.Keys) {
      if ($hexSignature.StartsWith($sig)) {
          return $fileSignatures[$sig]
      }
  }
  return "Unknown"
}

# Iteracija kroz datoteke u /files direktoriju
Get-ChildItem -Path "./files" -File | ForEach-Object {
  $fileType = Get-FileSignature -filePath $_.FullName
  "$($_.Name): $fileType" | Out-File -Append -FilePath $outputFile
}

Write-Host "Rezultati su spremljeni u $outputFile"
