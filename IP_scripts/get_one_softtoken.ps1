add-pssnapin wasp
& "C:\Documents and Settings\qi.zheng\Application Data\Microsoft\Internet Explorer\Quick Launch\SofToken-II.lnk"
#& 'C:\Program Files\Secure Computing\SofToken-II\SofToken-II.exe'

sleep 1
#sleep -milliseconds 500
Select-Window softoken* | sv w
#$w.minimize()
Set-WindowActive $w | out-null
Select-Control -Window $w -Class edit | sv e
$e[0] | Send-Keys iqgnehz
sleep 1
Select-Control -Window $w -Class button -Title get* | Send-Click
sleep -Milliseconds 500
Select-Control -Window $w -Class edit | sv e
$e[1].title

Select-Control -Window $w -Title close -Class button | Send-Click
