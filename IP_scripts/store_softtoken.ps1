"Generate Token" | out-host
[string]$sftn = c:/scripts/get_softtoken.ps1
"Send by Gmail" | out-host
c:/scripts/send_gmail.ps1 "prieztdb@gmail.com" "VPN SoftToken" $sftn
"Done" | out-host
