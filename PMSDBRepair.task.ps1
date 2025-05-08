$exec_time = Get-Date -Format yyyyMMdd_HHmm
$start_date = Get-Date -Format yyyy/MM/dd
$start_time = Get-Date -Format HH:mm
$host_name = Get-Content Env:COMPUTERNAME
$log_file = "PMSDBRepair_" + $($host_name) + "_" + $($exec_time) + ".log"

# Write-Host $exec_time
# Write-Host $host_name
# Write-Host $log_file

pwsh.exe -executionpolicy bypass -C "$env:USERPROFILE\.scripts\PlexDBRepair\Windows\DBRepair-Windows.ps1 STOP ; $env:USERPROFILE\.scripts\PlexDBRepair\Windows\DBRepair-Windows.ps1 PRUN ; $env:USERPROFILE\.scripts\PlexDBRepair\Windows\DBRepair-Windows.ps1 AUTO ; $env:USERPROFILE\.scripts\PlexDBRepair\Windows\DBRepair-Windows.ps1 STAR" | Out-File $env:USERPROFILE\.scripts\PlexDBRepair\Logs\$log_file
$end_time = Get-Date -Format HH:mm

$user = "info@cowsteak.org"
$securePassword = Get-Content "$env:USERPROFILE\.scripts\PlexDBRepair\Windows\DBRepair-Windows.ps1.xml" | ConvertTo-SecureString
$credential = New-Object System.Management.Automation.PSCredential($user, $securePassword)
$subject = "PMS DB Repair results for $host_name on $start_date"
$body = @"
PMS Database Repair Script results:

DBRepair tasks started at $start_time and ended at $end_time.

DBRepair log file for $host_name is attached.
"@
$recipient = "muelmi@live.com"
$server = "mail.privateemail.com"
$port = 587
$attach = ".\PlexDBRepair\Logs\$log_file"

# Write-Host $subject
# Write-Host $body
# Write-Host $attach

Send-MailMessage -To $recipient -From $user -Subject $subject -Body $body -SmtpServer $server -Port $port -UseSsl -Credential $credential -Attachments $attach
# Send-MailMessage -To $recipient -From $user -Subject $subject -Body $body -SmtpServer $server -Port $port -UseSsl -Credential $credential

# $sendMailMessageSplat = @{
#     # From = 'User01 <user01@fabrikam.com>'
#     From = $user
#     # To = 'mm <muelmi@live.com>', 'mm <muelmi@yahoo.com>'
#     To = "muelmi@live.com"
#     Subject = $subject
#     Body = $body
#     # Attachments = ".\PlexDBRepair\Logs\$log_file"
#     Attachments = $attach
#     Priority = 'High'
#     DeliveryNotificationOption = 'OnSuccess', 'OnFailure'
#     SmtpServer = 'mail.privateemail.com'
#     Port = 587
#     # Credential = $credential  
# }
# Send-MailMessage -Credential $credential @sendMailMessageSplat

# https://github.com/austineric/Send-MailKitMessage