# Lab4 | Zadatak 3
# This script will ping all IP addresses in the range 192.168.1.* and output the results.

1..10 | ForEach-Object { Test-Connection -ComputerName "192.168.1.$_" -Count 1 }