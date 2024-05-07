Write-Host("`nSOFTWARE DISTRIBUTION RESET") -ForegroundColor Green
Write-Host("---------------------------")

$service1 = 'wuauserv'
$service2 = 'bits'
$path = 'C:\Windows\SoftwareDistribution'
$path_size_b_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1), 2) } } | Select-Object -ExpandProperty Size
$path_size_kb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1024), 2) } } | Select-Object -ExpandProperty Size
$path_size_mb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1048576), 2) } } | Select-Object -ExpandProperty Size
$path_size_gb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1073741824), 2) } } | Select-Object -ExpandProperty Size
$path_size_tb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1099511627776), 2) } } | Select-Object -ExpandProperty Size
$path_size_pb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1125899906842624), 2) } } | Select-Object -ExpandProperty Size

Write-Host("Stopping $service1...")
Stop-Service $service1 -WarningAction SilentlyContinue -ErrorAction SilentlyContinue

Write-Host("Stopping $service2...")
Stop-Service $service2 -WarningAction SilentlyContinue -ErrorAction SilentlyContinue

Write-Host("Clearing files/folders found in $path...")
Get-ChildItem -Path $path | Remove-Item -Recurse -Force

Write-Host("Starting $service1...")
Start-Service $service1 -WarningAction SilentlyContinue -ErrorAction SilentlyContinue

Write-Host("Starting $service2...")
Start-Service $service2 -WarningAction SilentlyContinue -ErrorAction SilentlyContinue

Write-Host("Calculating space saved...")
if ($path_size_b_original -lt 1024) {
    $path_size_b_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1), 2) } } | Select-Object -ExpandProperty Size
    $path_size_b_difference = $path_size_b_original - $path_size_b_new
    Write-Host("You saved $path_size_b_difference B of space!")
}
elseif ($path_size_kb_original -lt 1024) {
    $path_size_kb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1024), 2) } } | Select-Object -ExpandProperty Size
    $path_size_kb_difference = $path_size_kb_original - $path_size_kb_new
    Write-Host("You saved $path_size_kb_difference KB of space!")
}
elseif ($path_size_mb_original -lt 1024){ 
    $path_size_mb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1048576), 2) } } | Select-Object -ExpandProperty Size
    $path_size_mb_difference = $path_size_mb_original - $path_size_mb_new
    Write-Host("You saved $path_size_mb_difference MB of space!")
}
elseif ($path_size_gb_original -lt 1024){ 
    $path_size_gb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1073741824), 2) } } | Select-Object -ExpandProperty Size
    $path_size_gb_difference = $path_size_gb_original - $path_size_gb_new
    Write-Host("You saved $path_size_gb_difference GB of space!")
}
elseif ($path_size_tb_original -lt 1024){ 
    $path_size_gb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1099511627776), 2) } } | Select-Object -ExpandProperty Size
    $path_size_tb_difference = $path_size_tb_original - $path_size_tb_new
    Write-Host("You saved $path_size_tb_difference TB of space!")
}
elseif ($path_size_pb_original -lt 1024){ 
    $path_size_pb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1125899906842624), 2) } } | Select-Object -ExpandProperty Size
    $path_size_pb_difference = $path_size_pb_original - $path_size_pb_new
    Write-Host("You saved $path_size_pb_difference PB of space!")
}
else {
    Write-Host("Unable to calculate path size.")
}
