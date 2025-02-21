$DownloadUrl = "https://www.silabs.com/documents/public/software/CP210x_Universal_Windows_Driver.zip"
$DestinationPath = "$env:USERPROFILE\Downloads\CP210x_Driver.zip"
$ExtractPath = "$env:USERPROFILE\Downloads\CP210x_Driver"

# Download the driver
Invoke-WebRequest -Uri $DownloadUrl -OutFile $DestinationPath
Write-Host "Driver downloaded to $DestinationPath" -ForegroundColor Green

# Extract the ZIP file
Expand-Archive -Path $DestinationPath -DestinationPath $ExtractPath -Force
Write-Host "Driver extracted to $ExtractPath" -ForegroundColor Green

# Find and install the driver
$DriverINF = Get-ChildItem -Path "$ExtractPath" -Filter "*.inf" -Recurse | Select-Object -ExpandProperty FullName
if ($DriverINF) {
    pnputil.exe /add-driver "$DriverINF" /install
    Write-Host "Driver installed successfully!" -ForegroundColor Green

    # Verify installation
    $InstalledDriver = Get-WmiObject Win32_PnPSignedDriver | Where-Object { $_.DeviceName -like "*CP210*" }
    
    if ($InstalledDriver) {
        Write-Host "Driver verification successful! Cleaning up files..." -ForegroundColor Green
        
        # Remove ZIP and extracted files
        Remove-Item -Path $DestinationPath -Force
        Remove-Item -Path $ExtractPath -Recurse -Force
        Write-Host "Cleanup complete. ZIP and extracted files removed." -ForegroundColor Green
    } else {
        Write-Host "Driver installed, but verification failed. Keeping extracted files for troubleshooting." -ForegroundColor Yellow
    }
} else {
    Write-Host "No INF file found. Check the extracted folder manually." -ForegroundColor Red
}
