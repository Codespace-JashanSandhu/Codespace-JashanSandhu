<#
Author: Jashandeep Sandhu
Date: June 09, 2024
Github: https://github.com/Codespace-JashanSandhu
#>

# Define threshold for FSLogix profile size (in GB)
$Threshold = 10

# Define path to monitor (FSLogix VHD location)
$FSLogixProfileVHDLocation = '\\your-server-address\FSLProfiles$'

# Email settings
$SMTPServer = "smtp.smtp2go.com"
$SMTPPort = 587
$SMTPUsername = ""
$SMTPPassword = ""
$From = ""  # Updated sender address
$To = ""  # Updated recipient address
$Subject = "FSLogix Profile Size Report"

# Define function to get profile size
function Get-ProfileSize {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $ProfileSize = Get-ChildItem -Path $Path -Directory |
                   ForEach-Object {
                       [PSCustomObject]@{
                           ProfileName = $_.Name
                           ProfileSize = [math]::Round((Get-ChildItem -Path $_.FullName -Recurse |
                                          Measure-Object -Property Length -Sum).Sum / 1GB, 2)
                       }
                   }

    return $ProfileSize
}

# Get profile sizes
$Profiles = Get-ProfileSize -Path $FSLogixProfileVHDLocation

# Check profile sizes against threshold
$ExceedingProfiles = $Profiles | Where-Object { $_.ProfileSize -gt $Threshold }

if ($ExceedingProfiles.Count -gt 0) {
    # Build email content
    $Body = @"
The following FSLogix profiles have exceeded the threshold of $($Threshold)GB:

$(foreach ($Profile in $ExceedingProfiles) {
    "$($Profile.ProfileName): $($Profile.ProfileSize)GB"
})
"@

    # Send email
    Send-MailMessage -To $To -From $From -Subject $Subject -Body $Body -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $SMTPUsername, (ConvertTo-SecureString -String $SMTPPassword -AsPlainText -Force))
} else {
    Write-Host "No FSLogix profiles have exceeded the threshold."
}
