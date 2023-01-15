# Import the required assemblies
Add-Type -AssemblyName System.Web
Add-Type -AssemblyName System.Net.Mail

# Define the SMTP server and login credentials
$smtpServer = "smtp.smtp2go.com"
$smtpUsername = "YOUR_SMTP2GO_USERNAME"
$smtpPassword = "YOUR_SMTP2GO_PASSWORD"

# Define the message details
$from = "marketing@yourcompany.com"
$to = "customer1@example.com, customer2@example.com, customer3@example.com"
$subject = "New Product Launch"
$body = "We're excited to announce the launch of our new product! Get a 10% discount with the code LAUNCH10 at checkout. Don't miss out!"

# Create the message object
$message = New-Object System.Net.Mail.MailMessage $from, $to, $subject, $body

# Create the SMTP client object
$smtp = New-Object System.Net.Mail.SmtpClient $smtpServer

# Set the SMTP server credentials
$smtp.Credentials = New-Object System.Net.NetworkCredential $smtpUsername, $smtpPassword

# Send the message
$smtp.Send($message)

# Output a confirmation message
Write-Host "Marketing emails sent successfully!"
