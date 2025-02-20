# How To Run:

1. Open Powershell as Administrator
2. Execute the script below:

```powershell
git clone https://github.com/sproutmation/windows-setup.git "$env:USERPROFILE\windows-setup"
Set-Location "$env:USERPROFILE\windows-setup"
Set-ExecutionPolicy Bypass -Scope Process -Force
powershell.exe -File .\setup-windows-settings.ps1
```
