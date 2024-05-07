Write-Host("`n--------------------------") -ForegroundColor Green
Write-Host("| WINDOWS CLEANUP HELPER |") -ForegroundColor Green
Write-Host("--------------------------") -ForegroundColor Green

# C:\WIndows\SoftwareDistribution folder reset
Invoke-WebRequest sdr.melvinquick.com | Invoke-Expression

# C:\WIndows\Temp folder cleanout
Invoke-WebRequest tfc.melvinquick.com | Invoke-Expression
