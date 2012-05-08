Add-PSSnapin wasp

while($true){
	$msns = @(Select-Window -ProcessName msnmsgr)
	if($msns.count -gt 0){
		break;
	}
	"Waiting for first MSN window..." | out-host
	sleep 5;
}

$count_down = 24
while($count_down -gt 0){
	$msns = @(Select-Window -ProcessName msnmsgr)
	if($msns.count -gt 1){
		break;
	}
	"Waiting for second MSN window...(" + ($count_down) + ")" | out-host
	sleep 5;
	$count_down--
}

"Connect to VPN" | out-host


#c:/scripts/connect_cisco_vpn.ps1
c:/scripts/connect_ironport_vpn.ps1
