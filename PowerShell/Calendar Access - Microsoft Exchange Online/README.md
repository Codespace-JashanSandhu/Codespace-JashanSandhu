# Exchange Online Mailbox Folder Permissions Script

## Overview

This PowerShell script allows administrators to add or remove mailbox folder permissions for a specific user in Exchange Online. The script connects to Exchange Online, prompts for user inputs, and then performs the requested action.

## Prerequisites

- Exchange Online PowerShell module installed.
- Appropriate permissions to connect to and manage Exchange Online mailbox folder permissions.

## Script Details

**Author:** Jasahndeep Sandhu  
**Date:** December 19, 2023

## Usage

1. **Connect to Exchange Online**
   
   The script starts by connecting to Exchange Online. Ensure you have the necessary credentials and permissions to perform this action.
   
   ```powershell
   Connect-ExchangeOnline
