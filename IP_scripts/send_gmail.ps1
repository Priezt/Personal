param($to, $subject, $body)
$smtpClient = new-object system.net.mail.smtpclient
$smtpClient.host = 'smtp.gmail.com'
$smtpClient.port = 587
$smtpClient.enablessl = $true
$password = get-content C:\scripts\gmail_pass.txt | convertto-securestring
$cred = New-Object system.management.automation.pscredential "prieztdb",$password
$smtpClient.credentials = [net.networkcredential]($cred)
$result = $smtpClient.send("prieztdb@gmail.com", $to, $subject, $body);
$result

