add-pssnapin wasp

. c:/scripts/load_green_arrow.ps1

$msns = @(select-window -ProcessName msnmsgr)
$count = 1

$msns | % {
	$msn = $_
	Set-WindowActive $msn
	sleep 1
	click-mark msn_choose_account
	sleep 1
	if ($count -eq 1){
		click-mark msn_first_account
	} else {
		click-mark msn_second_account
	}
	sleep 1
	click-mark msn_sign_in
	sleep 1
	click-mark msn_close
	sleep 3
	$count++
}

sleep 3

click-mark webex_focus
sleep 1
click-mark webex_unfocus
sleep 1
