# Exchange Online User Setup PowerShell Script

This PowerShell script can be used to automate the process of setting up new users in Exchange Online. The script performs the following tasks:

- Creates a new user mailbox
- Sets mailbox quota
- Enables litigation hold
- Disables OWA access
- Moves the mailbox to a different database
- Adds the user to a distribution group
- Creates a new email policy for the user

## Getting Started

These instructions will guide you through the process of using this script in your environment.

### Prerequisites

- The Exchange Online PowerShell module must be installed on your computer.
```powershell
# Install the Exchange Online PowerShell module
Install-Module -Name ExchangeOnlineManagement
```
- You must have the necessary permissions to create and manage users in Exchange Online.

### Using the Script

1. Open the script in a text editor and edit the following variables to match your environment:
```powershell
$Name = "John Doe"
$UserPrincipalName = "johndoe@contoso.com"
$Password = ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force
$DisplayName = "John Doe"
$FirstName = "John"
$LastName = "Doe"
$OrganizationalUnit = "OU=Users,DC=contoso,DC=com"
```
2. Run the script in PowerShell.
3. When prompted, enter the credentials of an admin account that has permissions to create and manage users in Exchange Online.
4. Use the below code as per your requiremnets.
```powershell
# Import the Exchange Online PowerShell module
Import-Module -Name ExchangeOnlineManagement

# Connect to Exchange Online
$Session = New-ExoPSSession
Import-PSSession $Session

# Create the new user mailbox
New-Mailbox -Name $Name -UserPrincipalName $UserPrincipalName -Password $Password -DisplayName $DisplayName -FirstName $FirstName -LastName $LastName -OrganizationalUnit $OrganizationalUnit

# Set mailbox quota
Set-Mailbox -Identity $UserPrincipalName -ProhibitSendReceiveQuota 10GB -ProhibitSendQuota 9.5GB

# Enable litigation hold
Set-Mailbox -Identity $UserPrincipalName -LitigationHoldEnabled $true -LitigationHoldDuration 180.00:00:00

# Disable OWA access
Set-CASMailbox -Identity $UserPrincipalName -OWAEnabled $false

# Move the mailbox to a different database
New-MoveRequest -Identity $UserPrincipalName -TargetDatabase "DB2"

# Add the user to a distribution group
Add-DistributionGroupMember -Identity "Marketing Team" -Member $UserPrincipalName

# Create a new email policy for the user
New-EmailAddressPolicy -Name "Contoso Email Policy" -EnabledEmailAddressTemplates "SMTP:%g.%s@contoso.com"
```

**Note:** It's always a good practice to test the script on a test environment before running it in a production environment.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

## Acknowledgments

- This script is based on the Exchange Online PowerShell module, which is provided by Microsoft.
- This script is for educational and reference purposes only. Use it at your own risk.

## Disclaimer

This script is not officially supported by Microsoft. Use it at your own risk.


-----------------------------------------------------------------------------------
**Contact Information**

*Get in touch with me via:*
   - Email: [jashan@jashansandhu.online](mailto:jashan@jashansandhu.online)
   - LinkedIn: [jashandeep-singh-sandhu](https://www.linkedin.com/in/jashandeep-singh-sandhu/)
   - Twitter: [@jashansandhu37](https://twitter.com/jashansandhu37)
