using module Send-MailKitMessage;

#SMTP server ([string], required)
$SMTPServer = "mail.privateemail.com";

#port ([int], required)
$Port = 587 ;

#sender ([MimeKit.MailboxAddress] http://www.mimekit.net/docs/html/T_MimeKit_MailboxAddress.htm, required)
$From = [MimeKit.MailboxAddress]"info@cowsteak.org";

#recipient list ([MimeKit.InternetAddressList] http://www.mimekit.net/docs/html/T_MimeKit_InternetAddressList.htm, required)
$RecipientList = [MimeKit.InternetAddressList]::new();
$RecipientList.Add([MimeKit.InternetAddress]"muelmi@live.com");

#subject ([string], optional)
$Subject = [string]"Subject";

#text body ([string], optional)
$TextBody = [string]"TextBody";

#send message
Send-MailKitMessage -SMTPServer $SMTPServer -Port $Port -From $From -RecipientList $RecipientList -Subject $Subject -TextBody $TextBody;
