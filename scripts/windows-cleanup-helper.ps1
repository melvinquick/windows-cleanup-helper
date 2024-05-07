Write-Host("`n--------------------------") -ForegroundColor Green
Write-Host("| WINDOWS CLEANUP HELPER |") -ForegroundColor Green
Write-Host("--------------------------") -ForegroundColor Green

# $HOME\Pictures\Screenshot folder cleanup
Invoke-WebRequest sfc.melvinquick.com | Invoke-Expression

# C:\Windows\SoftwareDistribution folder reset
Invoke-WebRequest sdr.melvinquick.com | Invoke-Expression

# C:\Windows\Temp folder cleanup
Invoke-WebRequest tfc.melvinquick.com | Invoke-Expression

# C Drive Cleanup via CleanMgr.exe
Invoke-WebRequest cdc.melvinquick.com | Invoke-Expression
