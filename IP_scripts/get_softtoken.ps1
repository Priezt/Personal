add-pssnapin wasp
. C:\scripts\load_green_arrow.ps1

& "C:\Documents and Settings\qi.zheng\Application Data\Microsoft\Internet Explorer\Quick Launch\SofToken-II.lnk"
#& 'C:\Program Files\Secure Computing\SofToken-II\SofToken-II.exe'

sleep 1
#sleep -milliseconds 500
$w = Select-Window -title softoken*
#$w.minimize()
Set-WindowActive $w | out-null

$e = @(Select-Control -Window $w -Class edit)

$e[0] | Send-Keys iqgnehz
sleep 1

while( -not (exists-mark softoken_exist_pass)){
	"password not entered, retry" | out-host
	$e = @(Select-Control -Window $w -Class edit)
	$e[0] | Send-Keys iqgnehz
	sleep 1
}

1..50 | % {
	Select-Control -Window $w -Class button -Title get* | Send-Click
	sleep -Milliseconds 500
	$e = @(Select-Control -Window $w -Class edit)
	$e[1].title
}

Select-Control -Window $w -Title close -Class button | Send-Click
