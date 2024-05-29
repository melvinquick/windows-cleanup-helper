Write-Host("`n--------------------------") -ForegroundColor Green
Write-Host("| WINDOWS CLEANUP HELPER |") -ForegroundColor Green
Write-Host("--------------------------") -ForegroundColor Green

Write-Host("`nPlease choose (y/n) to the following cleanup options!") -ForegroundColor Cyan
$downloads_folder_cleanup_enabled = Read-Host("Downloads Folder Cleanup")
$screenshot_folder_cleanup_enabled = Read-Host("Screenshot Folder Cleanup")
$software_distribution_folder_reset_enabled = Read-Host("SoftwareDistribution Folder Reset")
$temp_folder_cleanup_enabled = Read-Host("Temp Folder Cleanup")
$user_temp_folder_cleanup_enabled = Read-Host("User Temp Folder Cleanup")
$c_drive_cleanup_enabled = Read-Host("C Drive Cleanup")
$recycle_bin_cleanup_enabled = Read-Host("Recycle Bin Cleanup")

if ($downloads_folder_cleanup_enabled.ToLower() -eq "y") {
    # $HOME\Pictures\Screenshot folder cleanup
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-cleanup-helper/main/driver-scripts/downloads-folder-cleanup.ps1" | Invoke-Expression
}

if ($screenshot_folder_cleanup_enabled.ToLower() -eq "y") {
    # $HOME\Pictures\Screenshot folder cleanup
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-cleanup-helper/main/driver-scripts/screenshot-folder-cleanup.ps1" | Invoke-Expression
}

if ($software_distribution_folder_reset_enabled.ToLower() -eq "y") {
    # C:\Windows\SoftwareDistribution folder reset
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-cleanup-helper/main/driver-scripts/software-distribution-reset.ps1" | Invoke-Expression
}

if ($temp_folder_cleanup_enabled.ToLower() -eq "y") {
    # C:\Windows\Temp folder cleanup
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-cleanup-helper/main/driver-scripts/temp-folder-cleanup.ps1" | Invoke-Expression
}

if ($user_temp_folder_cleanup_enabled.ToLower() -eq "y") {
    # $HOME\AppData\Local\Temp folder cleanup
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-cleanup-helper/main/driver-scripts/user-temp-folder-cleanup.ps1" | Invoke-Expression
}

if ($c_drive_cleanup_enabled.ToLower() -eq "y") {
    # C Drive Cleanup via CleanMgr.exe
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-cleanup-helper/main/driver-scripts/c-drive-cleanup.ps1" | Invoke-Expression
}

if ($recycle_bin_cleanup_enabled.ToLower() -eq "y") {
    # Recycle Bin Cleanup
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-cleanup-helper/main/driver-scripts/recycle-bin-cleanup.ps1" | Invoke-Expression
}

Write-Host("`nScript has finished cleaning. View the above output to see how much space you saved in each section!") -ForegroundColor Cyan