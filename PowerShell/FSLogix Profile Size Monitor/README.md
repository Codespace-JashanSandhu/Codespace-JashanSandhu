# FSLogix Profile Size Monitor

This PowerShell script monitors the size of FSLogix profiles and sends an email alert if any profile exceeds a specified size threshold.

## Author

- **Name:** Jashandeep Sandhu
- **Date:** June 09, 2024
- **Github:** [Codespace-JashanSandhu](https://github.com/Codespace-JashanSandhu)

## Features

- Monitors FSLogix profiles in a specified directory.
- Checks if any profile size exceeds the defined threshold.
- Sends an email alert with details of profiles that exceed the threshold.

## Requirements

- PowerShell 5.1 or later
- Access to the FSLogix profile VHD location
- SMTP server details for sending email alerts

## Configuration

1. **Threshold for FSLogix profile size (in GB):**
   Modify the `$Threshold` variable to set your desired size threshold. Default is `10 GB`.

2. **Path to monitor (FSLogix VHD location):**
   Update the `$FSLogixProfileVHDLocation` variable with the path to your FSLogix profile VHD location.

3. **Email settings:**
   Configure the following variables with your SMTP server details and email addresses:
   ```powershell
   $SMTPServer = "smtp.smtp2go.com"
   $SMTPPort = 587
   $SMTPUsername = "your-smtp-username"
   $SMTPPassword = "your-smtp-password"
   $From = "sender@example.com"
   $To = "recipient@example.com"
   $Subject = "FSLogix Profile Size Report"
