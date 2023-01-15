# PowerShell Script for Sending Marketing Emails

This script is designed to send marketing emails using the SMTP2GO service. It uses the `System.Web` and `System.Net.Mail` assemblies to create the message and client objects and send the message. 

## Usage

1. Replace the `YOUR_SMTP2GO_USERNAME` and `YOUR_SMTP2GO_PASSWORD` with your SMTP2GO account credentials
2. Replace the `from`, `to`, `subject`, and `body` variables with the appropriate values for your email message.
3. Run the script using PowerShell

## Note
- The script sends an email to multiple customers
- You can run the script on schedule using Task Scheduler in windows or Cron in Linux
- The script confirms the success of the script by showing the message "Marketing emails sent successfully!"

## Contact

If you have any questions or feedback, please feel free to reach out to me via email or on LinkedIn.
