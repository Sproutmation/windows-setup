# Set Background to Solid Black
Set-ItemProperty -Path "HKCU:\Control Panel\Colors" -Name "Background" -Value "0 0 0"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value ""
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

# Enable Dark Theme
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -PropertyType DWord -Force

# Disable "Get fun facts, tips, tricks on lock screen"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "RotatingLockScreenOverlayEnabled" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Value 0 -PropertyType DWord -Force

# Set Lock Screen Status to None
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Lock Screen" -Name "LockScreenStatus" -Value "" -PropertyType String -Force

# Set Touch Keyboard size to Largest & Key Text size to Medium
New-ItemProperty -Path "HKCU:\Software\Microsoft\TabletTip\1.7" -Name "KeyboardScaleFactor" -Value 150 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\TabletTip\1.7" -Name "TextSize" -Value 1 -PropertyType DWord -Force

# Uncheck All Options in Start Menu
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_PromotedItemsEnabled" -Value 0 -PropertyType DWord -Force

# Set Taskbar - Search Icon Only, Disable Task View & Widgets, Enable Touch Keyboard Always
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\TabletTip\1.7" -Name "EnableDesktopModeAutoInvoke" -Value 1 -PropertyType DWord -Force

# Set Display Scaling to 125%
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "LogPixels" -Value 120 -PropertyType DWord -Force

# Turn Off Notifications
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Value 0 -PropertyType DWord -Force

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

# Restart Explorer to Apply Changes
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "All Windows settings have been applied successfully!" -ForegroundColor Green