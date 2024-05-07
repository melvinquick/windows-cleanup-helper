Write-Host("WINDOWS CLEANUP HELPER")
Write-Host("----------------------")

# C:\WIndows\SoftwareDistribution folder reset
Invoke-WebRequest sdr.melvinquick.com | Invoke-Expression

# C:\WIndows\Temp folder cleanout
Invoke-WebRequest tfc.melvinquick.com | Invoke-Expression
