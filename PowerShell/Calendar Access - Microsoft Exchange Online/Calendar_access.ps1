<#

Date: December 19, 2023
Author: Jasahndeep Sandhu

 #>


# Connect to Exchange Online
Connect-ExchangeOnline

# Prompt for user inputs
$identity = Read-Host "Enter the user's identity (e.g., JMcGlashan):\Calendar"
$action = Read-Host "Do you want to add or remove permissions? Type 'add' or 'remove'"

if ($action -eq "add") {
    $userToAdd = Read-Host "Enter the user's email to add permissions (e.g., MWxyz@yourcompany.com)"
    # Add mailbox folder permissions
    Add-MailboxFolderPermission -Identity $identity -User $userToAdd -AccessRights Editor
    Write-Host "Permissions added successfully."
} elseif ($action -eq "remove") {
    $userToRemove = Read-Host "Enter the user's email to remove permissions (e.g., MWxyz@yourcompany.com)"
    # Remove mailbox folder permissions
    Remove-MailboxFolderPermission -Identity $identity -User $userToRemove
    Write-Host "Permissions removed successfully."
} else {
    Write-Host "Invalid action. Please type 'add' or 'remove'."
}

# Get updated mailbox folder permissions
Get-MailboxFolderPermission -Identity $identity
