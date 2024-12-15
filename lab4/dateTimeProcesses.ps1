# Lab4 | Zadatak 3
# This script will output the current date and time, and then list all processes running on the system.

# Ispis trenutnog datuma i vremena
Write-Output "Trenutni datum i vrijeme:"
Write-Output (Get-Date)

# Ispis popisa svih aktivnih procesa
Write-Output "`nPopis aktivnih procesa:"
Get-Process

# Ispis brojeva od 1 do 10
Write-Output "`nBrojevi od 1 do 10:"
for ($i = 1; $i -le 10; $i++) { Write-Output $i }

# Napomena: Postavite politiku izvršavanja na RemoteSigned ručno prije pokretanja skripte
# Komanda (izvršiti ručno u PowerShell-u): Set-ExecutionPolicy RemoteSigned