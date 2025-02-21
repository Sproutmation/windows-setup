# How To Run:

1. Open Powershell as Administrator
2. Execute the script below:

```powershell
git clone https://github.com/sproutmation/windows-setup.git "$env:USERPROFILE\windows-setup"
Set-Location "$env:USERPROFILE\windows-setup"
Set-ExecutionPolicy Bypass -Scope Process -Force
powershell.exe -File .\setup-windows-settings.ps1

regedit.exe /s .\start_settings_registry.reg
```


## For Windows without git installed

```powershell
winget install --id Git.Git -e --source winget
# Dynamically add Git to PATH without restarting
$gitPath = "C:\Program Files\Git\bin"
$env:Path += ";$gitPath"
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";$gitPath", [System.EnvironmentVariableTarget]::Machine)

git clone https://github.com/sproutmation/windows-setup.git "$env:USERPROFILE\windows-setup"
Set-Location "$env:USERPROFILE\windows-setup" 
Set-ExecutionPolicy Bypass -Scope Process -Force
powershell.exe -File .\setup-windows-settings.ps1

regedit.exe /s .\start_settings_registry.reg
```

## List of Windows Settings to be configured
[Windows Setup](windows_setup.md)
