<#
Author: Jashandeep Sandhu
Date: June 09, 2024
Github: https://github.com/Codespace-JashanSandhu
#>

$url = "https://dl.google.com/chrome/install/375.126/chrome_installer.exe"
$output = "$env:TEMP\chrome_installer.exe"

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $output

# Run the installer silently
Start-Process -FilePath $output -Args "/silent /install" -Verb RunAs -Wait

# Remove the installer
Remove-Item -Path $output
