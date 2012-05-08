param($count)
add-pssnapin wasp
& "C:\Documents and Settings\qi.zheng\Application Data\Microsoft\Internet Explorer\Quick Launch\SofToken-II.lnk"
#& 'C:\Program Files\Secure Computing\SofToken-II\SofToken-II.exe'

sleep 2
#sleep -milliseconds 500
$w = @(Select-Window -title softoken*)[0]
#$w.minimize()
"activate window" | out-host
Set-WindowActive $w | out-null
sleep 1
$e = @(Select-Control -Window $w -Class edit)
"enter password" | out-host
$e[0] | Send-Keys "iqgnehz"
sleep 1
1..$count | % {
	Select-Control -Window $w -Class button -Title get* | Send-Click
	sleep -Milliseconds 500
	Select-Control -Window $w -Class edit | sv e
	$e[1].title
}

Select-Control -Window $w -Title close -Class button | Send-Click
