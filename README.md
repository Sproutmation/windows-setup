# How To Run:

1. Open Powershell as Administrator
2. Execute the script below:

```powershell
git clone https://github.com/sproutmation/windows-setup.git "$env:USERPROFILE\windows-setup"
Set-Location "$env:USERPROFILE\windows-setup"
Set-ExecutionPolicy Bypass -Scope Process -Force
powershell.exe -File .\setup-windows-settings.ps1
```


## For Windows without git installed

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install git -y

git clone https://github.com/sproutmation/windows-setup.git "$env:USERPROFILE\windows-setup"
Set-Location "$env:USERPROFILE\windows-setup"
Set-ExecutionPolicy Bypass -Scope Process -Force
powershell.exe -File .\setup-windows-settings.ps1
```