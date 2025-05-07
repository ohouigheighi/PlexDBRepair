using module Send-MailKitMessage;

#use secure connection if available ([bool], optional)
$UseSecureConnectionIfAvailable = $true;

#authentication ([System.Management.Automation.PSCredential], optional)
$Credential = [System.Management.Automation.PSCredential]::new("info@cowsteak.org", (ConvertTo-SecureString -String 'tijBI!3mDkZjS6*tJ2kn$Iz9JO*r$KuO' -AsPlainText -Force));

#SMTP server ([string], required)
$SMTPServer = "mail.privateemail.com";

#port ([int], required)
$Port = 587;

#sender ([MimeKit.MailboxAddress] http://www.mimekit.net/docs/html/T_MimeKit_MailboxAddress.htm, required)
$From = [MimeKit.MailboxAddress]"info@cowsteak.org";

#recipient list ([MimeKit.InternetAddressList] http://www.mimekit.net/docs/html/T_MimeKit_InternetAddressList.htm, required)
$RecipientList = [MimeKit.InternetAddressList]::new();
$RecipientList.Add([MimeKit.InternetAddress]"muelmi@live.com");

#cc list ([MimeKit.InternetAddressList] http://www.mimekit.net/docs/html/T_MimeKit_InternetAddressList.htm, optional)
$CCList = [MimeKit.InternetAddressList]::new();
$CCList.Add([MimeKit.InternetAddress]"info@cowsteak.org");

#bcc list ([MimeKit.InternetAddressList] http://www.mimekit.net/docs/html/T_MimeKit_InternetAddressList.htm, optional)
# $BCCList = [MimeKit.InternetAddressList]::new();
# $BCCList.Add([MimeKit.InternetAddress]"BCCRecipient1EmailAddress");

#subject ([string], optional)
$Subject = [string]"Subject";

#text body ([string], optional)
$TextBody = [string]"TextBody";

#HTML body ([string], optional)
$HTMLBody = [string]"HTMLBody";

#attachment list ([System.Collections.Generic.List[string]], optional)
# $AttachmentList = [System.Collections.Generic.List[string]]::new();
# $AttachmentList.Add("Attachment1FilePath");

#splat parameters
$Parameters = @{
    "UseSecureConnectionIfAvailable" = $UseSecureConnectionIfAvailable    
    "Credential" = $Credential
    "SMTPServer" = $SMTPServer
    "Port" = $Port
    "From" = $From
    "RecipientList" = $RecipientList
    "CCList" = $CCList
    "BCCList" = $BCCList
    "Subject" = $Subject
    "TextBody" = $TextBody
    "HTMLBody" = $HTMLBody
    "AttachmentList" = $AttachmentList
};

#send message
Send-MailKitMessage @Parameters;