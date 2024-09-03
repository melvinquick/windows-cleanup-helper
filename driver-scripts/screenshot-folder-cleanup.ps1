Write-Host("`nSCREENSHOT FOLDER CLEANUP") -ForegroundColor Green
Write-Host("-------------------------")

$path = $HOME + '\Pictures\Screenshots'
$path_size_b_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1), 2) } } | Select-Object -ExpandProperty Size
$path_size_kb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1024), 2) } } | Select-Object -ExpandProperty Size
$path_size_mb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1048576), 2) } } | Select-Object -ExpandProperty Size
$path_size_gb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1073741824), 2) } } | Select-Object -ExpandProperty Size
$path_size_tb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1099511627776), 2) } } | Select-Object -ExpandProperty Size
$path_size_pb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1125899906842624), 2) } } | Select-Object -ExpandProperty Size

Write-Host("Clearing files/folders found in $path...")
Get-ChildItem -Path $path | Remove-Item -Recurse -Force -WarningAction SilentlyContinue -ErrorAction SilentlyContinue

Write-Host("Calculating space saved...")
if ($path_size_b_original -lt 1024) {
    $path_size_b_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1), 2) } } | Select-Object -ExpandProperty Size
    $path_size_b_difference = [math]::Round(($path_size_b_original - $path_size_b_new), 2)
    Write-Host("You saved $path_size_b_difference B of space!")
}
elseif ($path_size_kb_original -lt 1024) {
    $path_size_kb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1024), 2) } } | Select-Object -ExpandProperty Size
    $path_size_kb_difference = [math]::Round(($path_size_kb_original - $path_size_kb_new), 2)
    Write-Host("You saved $path_size_kb_difference KB of space!")
}
elseif ($path_size_mb_original -lt 1024) { 
    $path_size_mb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1048576), 2) } } | Select-Object -ExpandProperty Size
    $path_size_mb_difference = [math]::Round(($path_size_mb_original - $path_size_mb_new), 2)
    Write-Host("You saved $path_size_mb_difference MB of space!")
}
elseif ($path_size_gb_original -lt 1024) { 
    $path_size_gb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1073741824), 2) } } | Select-Object -ExpandProperty Size
    $path_size_gb_difference = [math]::Round(($path_size_gb_original - $path_size_gb_new), 2)
    Write-Host("You saved $path_size_gb_difference GB of space!")
}
elseif ($path_size_tb_original -lt 1024) { 
    $path_size_gb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1099511627776), 2) } } | Select-Object -ExpandProperty Size
    $path_size_tb_difference = [math]::Round(($path_size_tb_original - $path_size_tb_new), 2)
    Write-Host("You saved $path_size_tb_difference TB of space!")
}
elseif ($path_size_pb_original -lt 1024) { 
    $path_size_pb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1125899906842624), 2) } } | Select-Object -ExpandProperty Size
    $path_size_pb_difference = [math]::Round(($path_size_pb_original - $path_size_pb_new), 2)
    Write-Host("You saved $path_size_pb_difference PB of space!")
}
else {
    Write-Host("Unable to calculate path size.")
}
