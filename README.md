# Useful PowerShell Scripts

## Purpose

 A place for me to store PowerShell Scripts I find useful as I create them.

## Script Running

Software Distribution Reset

```
$script = Invoke-WebRequest -Uri https://raw.githubusercontent.com/cquick00/useful-powershell-scripts/main/scripts/software-distribution-reset.ps1
Invoke-Expression $($script.Content)
```