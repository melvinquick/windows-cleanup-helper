Write-Host("`n--------------------------") -ForegroundColor Green
Write-Host("| WINDOWS CLEANUP HELPER |") -ForegroundColor Green
Write-Host("--------------------------") -ForegroundColor Green

Write-Host("`nPlease choose (y/n) to the following cleanup options!")
$downloads_folder_cleanup_enabled = Read-Host("Downloads Folder Cleanup")
$screenshot_folder_cleanup_enabled = Read-Host("Screenshot Folder Cleanup")
$software_distribution_folder_reset_enabled = Read-Host("SoftwareDistribution Folder Reset")
$temp_folder_cleanup_enabled = Read-Host("Temp Folder Cleanup")
$c_drive_cleanup_enabled = Read-Host("C Drive Cleanup")

if ($downloads_folder_cleanup_enabled.ToLower() -eq "y") {
    # $HOME\Pictures\Screenshot folder cleanup
    Invoke-WebRequest dfc.melvinquick.com | Invoke-Expression
}

if ($screenshot_folder_cleanup_enabled.ToLower() -eq "y") {
    # $HOME\Pictures\Screenshot folder cleanup
    Invoke-WebRequest sfc.melvinquick.com | Invoke-Expression
}

if ($software_distribution_folder_reset_enabled.ToLower() -eq "y") {
    # C:\Windows\SoftwareDistribution folder reset
    Invoke-WebRequest sdr.melvinquick.com | Invoke-Expression
}

if ($temp_folder_cleanup_enabled.ToLower() -eq "y") {
    # C:\Windows\Temp folder cleanup
    Invoke-WebRequest tfc.melvinquick.com | Invoke-Expression
}

if ($c_drive_cleanup_enabled.ToLower() -eq "y") {
    # C Drive Cleanup via CleanMgr.exe
    Invoke-WebRequest cdc.melvinquick.com | Invoke-Expression
}

Write-Host("`nScript has finished cleaning. View the above output to see how much space you saved in each section!")