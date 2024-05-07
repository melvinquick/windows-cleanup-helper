Write-Host("`n--------------------------") -ForegroundColor Green
Write-Host("| WINDOWS CLEANUP HELPER |") -ForegroundColor Green
Write-Host("--------------------------") -ForegroundColor Green

# $HOME\Pictures\Screenshot folder cleanup
Invoke-WebRequest sfc.melvinquick.com | Invoke-Expression

# C:\WIndows\SoftwareDistribution folder reset
Invoke-WebRequest sdr.melvinquick.com | Invoke-Expression

# C:\WIndows\Temp folder cleanup
Invoke-WebRequest tfc.melvinquick.com | Invoke-Expression
