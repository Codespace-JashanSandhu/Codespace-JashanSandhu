<#
Author: Jashandeep Sandhu
Date: June 09, 2024
Github: https://github.com/Codespace-JashanSandhu
#>

# Prompt user for the OneDrive public shareable link
$onedriveLink = Read-Host -Prompt "Enter the OneDrive public shareable link"

# Remove anything after the last "?" in the URL
$onedriveLink = $onedriveLink -replace "\?.*$"

# Replace the removed portion with "download=1"
$directDownloadLink = $onedriveLink + "?download=1"

# Output the direct download link to the user
Write-Output "Direct download link: $directDownloadLink"
