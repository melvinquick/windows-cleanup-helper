# --- VARIABLES --- #
$best_day = 'Friday'
$today = Get-Date | ForEach-Object { $_.DayOfWeek }

# --- Main --- #
if ($today -eq $best_day) {
    Write-Host "YES! No changes should be made today!"
}

else {
    Write-Host "NO... You're free to make changes today!"
}