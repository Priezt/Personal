net use | ? {$_ -like "*:*"} | % {$_.split(" ")} | ? {$_ -like "*:"} | % { "net use "+$_+" /delete"} | % { Invoke-Expression $_}

net use o: /delete
net use p: /delete
net use v: /delete

net stop "Automatic Updates"

c:/scripts/get_some_softtoken.ps1 5 | sv passwd

$passwd | % {"Get password:" + $_} | out-host

if (@($passwd).count -eq 0) {
	exit;
}
sleep 1

. c:/scripts/load_green_arrow.ps1

& "C:\Documents and Settings\qi.zheng\Application Data\Microsoft\Internet Explorer\Quick Launch\VPN Client.lnk"

sleep 5

Select-Window -ProcessName vpngui | sv vw

sleep 1

Set-WindowActive -Window $vw | out-null
sleep -milliseconds 500;

#"s" | out-host

#Send-Keys -Window $vw -Keys "s";

#Set-WindowActive -Window $vw | out-null
#"ENTER" | out-host

#Send-Keys -Window $vw -Keys "{ENTER}"

#sleep 5

# Set-WindowActive -Window $vw | out-null
# sleep 1
# "input password" | out-host
# Send-Keys -Window $vw -Keys "{DOWN}"
# Send-Keys -Window $vw -Keys $passwd
# sleep 1
# Set-WindowActive -Window $vw | out-null
# sleep 1
# Send-Keys -Window $vw -Keys "{TAB}"
# sleep 1
# Set-WindowActive -Window $vw | out-null
# sleep 1
# Send-Keys -Window $vw -Keys "{ENTER}"
# sleep 10
# Send-Keys -Window $vw -Keys "{ENTER}"

# use wshell

new-object -comobject wscript.shell | sv ws

$ws.sendkeys("s")

sleep 1

$ws.sendkeys("{ENTER}")

wait-mark "ciscomark"

$passwd[0]| out-host
$ws.sendkeys($passwd[0])

sleep 1

$ws.sendkeys("{ENTER}")

sleep 2



$idx = 1

while (exists-mark "ciscomark") {
	"cisco mark exists, try to enter password again" | out-host
	click-mark "ciscomark"
	$passwd[$idx] | out-host
	$ws.sendkeys($passwd[$idx])
	$idx = $idx + 1
	sleep 1
	$ws.sendkeys("{ENTER}")
	sleep 3
}

sleep 1
wait-mark "vpn_banner"
$ws.sendkeys("{ENTER}")

sleep 3

c:/scripts/store_softtoken.ps1

c:/scripts/login_msn.ps1

c:/scripts/start_commonly_used_program.ps1

