# Set Background to Solid Black
Set-ItemProperty -Path "HKCU:\Control Panel\Colors" -Name "Background" -Value "0 0 0"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value ""
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

# Set Power Options - Disable Sleep, Hibernate, and Screen Timeout
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0
powercfg -change -hibernate-timeout-ac 0
powercfg -change -hibernate-timeout-dc 0

# Set Power Button to Shutdown
powercfg -change -button-lid-action 3
powercfg -change -button-power-action 3

# Disable Search History and Permissions
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsDeviceHistoryEnabled" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "SafeSearchMode" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "HistoryViewEnabled" -Value 0 -PropertyType DWord -Force

# Disable OneDrive Auto-Start
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "OneDrive" -Value "" -Force

# Disable Microsoft Teams Auto-Start
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "com.squirrel.Teams.Teams" -ErrorAction SilentlyContinue

# Modify Teams JSON settings to prevent auto-start
$TeamsSettings = "$env:APPDATA\Microsoft\Teams\desktop-config.json"
if (Test-Path $TeamsSettings) {
    (Get-Content $TeamsSettings) -replace '"openAtLogin":true', '"openAtLogin":false' | Set-Content $TeamsSettings
}

# Disable OneDrive Scheduled Tasks (Optional)
Get-ScheduledTask -TaskName "OneDrive Standalone Update Task-S-1-5-21*" | Disable-ScheduledTask

# Restart Explorer to Apply Changes
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "All Windows settings have been applied successfully!" -ForegroundColor Green
