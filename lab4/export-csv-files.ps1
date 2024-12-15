# Lab4 | Zadatak 5
# This script will list all files in the C:\SomeDirectory directory that are larger than 10MB and output the results to a CSV file.

Get-ChildItem -Path C:\users\Josip\desktop -Recurse | 
Where-Object { $_.Length -gt 10MB } | 
Export-Csv -Path C:\users\josip\desktop\LargeFiles.csv -NoTypeInformation