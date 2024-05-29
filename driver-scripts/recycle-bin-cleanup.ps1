Write-Host("`nRECYCLE BIN CLEANUP") -ForegroundColor Green
Write-Host("-------------------")

$path = 'C'
$path_size_b_original = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1), 2) } } | Select-Object -ExpandProperty SizeRemaining
$path_size_kb_original = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1024), 2) } } | Select-Object -ExpandProperty SizeRemaining
$path_size_mb_original = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1048576), 2) } } | Select-Object -ExpandProperty SizeRemaining
$path_size_gb_original = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1073741824), 2) } } | Select-Object -ExpandProperty SizeRemaining
$path_size_tb_original = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1099511627776), 2) } } | Select-Object -ExpandProperty SizeRemaining
$path_size_pb_original = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1125899906842624), 2) } } | Select-Object -ExpandProperty SizeRemaining

Write-Host("Emptying the Recycle Bin on $path Drive...")
Clear-RecycleBin -DriveLetter C -Force

Write-Host("Calculating space saved...")
if ($path_size_b_original -lt 1024) {
    $path_size_b_new = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1), 2) } } | Select-Object -ExpandProperty SizeRemaining
    $path_size_b_difference = [math]::Round(($path_size_b_new - $path_size_b_original), 2)
    Write-Host("You saved $path_size_b_difference B of space!")
}
elseif ($path_size_kb_original -lt 1024) {
    $path_size_kb_new = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1024), 2) } } | Select-Object -ExpandProperty SizeRemaining
    $path_size_kb_difference = [math]::Round(($path_size_kb_new - $path_size_kb_original), 2)
    Write-Host("You saved $path_size_kb_difference KB of space!")
}
elseif ($path_size_mb_original -lt 1024) { 
    $path_size_mb_new = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1048576), 2) } } | Select-Object -ExpandProperty SizeRemaining
    $path_size_mb_difference = [math]::Round(($path_size_mb_new - $path_size_mb_original), 2)
    Write-Host("You saved $path_size_mb_difference MB of space!")
}
elseif ($path_size_gb_original -lt 1024) { 
    $path_size_gb_new = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1073741824), 2) } } | Select-Object -ExpandProperty SizeRemaining
    $path_size_gb_difference = [math]::Round(($path_size_gb_new - $path_size_gb_original), 2)
    Write-Host("You saved $path_size_gb_difference GB of space!")
}
elseif ($path_size_tb_original -lt 1024) { 
    $path_size_tb_new = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1099511627776), 2) } } | Select-Object -ExpandProperty SizeRemaining
    $path_size_tb_difference = [math]::Round(($path_size_tb_new - $path_size_tb_original), 2)
    Write-Host("You saved $path_size_tb_difference TB of space!")
}
elseif ($path_size_pb_original -lt 1024) { 
    $path_size_pb_new = Get-Volume -DriveLetter $path | Select-Object @{n = "SizeRemaining"; e = { [math]::Round(($_.SizeRemaining / 1125899906842624), 2) } } | Select-Object -ExpandProperty SizeRemaining
    $path_size_pb_difference = [math]::Round(($path_size_pb_new - $path_size_pb_original), 2)
    Write-Host("You saved $path_size_pb_difference PB of space!")
}
else {
    Write-Host("Unable to calculate path size.")
}
