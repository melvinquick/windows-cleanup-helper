$service1 = 'wuauserv'
$service2 = 'bits'
$path = 'C:\Windows\SoftwareDistribution'

Stop-Service $service1
Stop-Service $service2
Get-ChildItem -Path $path | Remove-Item -Recurse -Force
Start-Service $service1
Start-Service $service2