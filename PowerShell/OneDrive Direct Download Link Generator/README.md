# OneDrive Direct Download Link Generator

This PowerShell script converts a OneDrive public shareable link into a direct download link.

## Author

- **Name:** Jashandeep Sandhu
- **Date:** June 09, 2024
- **Github:** [Codespace-JashanSandhu](https://github.com/Codespace-JashanSandhu)

## Features

- Prompts the user to enter a OneDrive public shareable link.
- Converts the shareable link into a direct download link.
- Outputs the direct download link to the user.

## Requirements

- PowerShell 5.1 or later

## Usage

1. Copy the script to a `.ps1` file, for example, `Generate-DirectDownloadLink.ps1`.
2. Open PowerShell and navigate to the directory where the script is saved.
3. Run the script using the following command:
    ```powershell
    .\Generate-DirectDownloadLink.ps1
    ```
4. When prompted, enter the OneDrive public shareable link.
5. The script will output the direct download link.

## Script Details

```powershell
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
