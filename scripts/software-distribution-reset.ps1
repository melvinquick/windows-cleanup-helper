$service1 = 'wuauserv'
$service2 = 'bits'
$path = 'C:\Windows\SoftwareDistribution'
$path_size_mb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1048576), 2) } } | Select-Object -ExpandProperty Size
$path_size_gb_original = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1073741824), 2) } } | Select-Object -ExpandProperty Size

Write-Host("Stopping $service1...")
Stop-Service $service1

Write-Host("Stopping $service2...")
Stop-Service $service2

Write-Host("Clearing files/folders found in $path...")
Get-ChildItem -Path $path | Remove-Item -Recurse -Force

Write-Host("Starting $service1...")
Start-Service $service1

Write-Host("Starting $service2...")
Start-Service $service2

Write-Host("Calculating space saved...")
if ($path_size_mb_original -lt 1000) {
    $path_size_mb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1048576), 2) } } | Select-Object -ExpandProperty Size
    $path_size_mb_difference = $path_size_mb_original - $path_size_mb_new
    Write-Host("You saved $path_size_mb_difference MB of space!")
}
else { 
    $path_size_gb_new = Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum | Select-Object @{n = "Size"; e = { [math]::Round(($_.Sum / 1073741824), 2) } } | Select-Object -ExpandProperty Size
    $path_size_gb_difference = $path_size_gb_original - $path_size_gb_new
    Write-Host("You saved $path_size_gb_difference GB of space!")
}
