# Lab4 | Zadatak 3
# This script will output the current date and time, and then list all processes running on the system.

Write-Output (Get-Date)
Get-Process

# List numbers from 1 to 10
for ($i = 1; $i -le 10; $i++) { Write-Output $i }