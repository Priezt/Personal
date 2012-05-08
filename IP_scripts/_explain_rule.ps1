param($needsync=$true)

function Get-ClipboardText{
	add-type -an system.windows.forms
	[system.windows.forms.clipboard]::gettext()
}

if ($needsync){
	"fetch rule package" | out-host
	c:\cygwin\bin\bash.exe --login -c "/cygdrive/c/scripts/get_rule_package.sh"
}

add-pssnapin wasp
Select-Window -Title *windowspowershell* | sv w
$w.GetPosition() | sv p
$w.SetPosition(1006,14,$p.Width,$p.Height)

$ws = $host.ui.rawui.windowsize
$ws.height = 12
$host.ui.rawui.windowsize = $ws


$rule = @{}
$freq = @{}
$score = @{}

"parse rules" | out-host

cat c:\scripts\rule_pack | % {
	[string]$line = $_
	$p = $line.split(",", 2)
	$rule[$p[0]] = $p[1]
}

"parse freq" | out-host

cat c:\scripts\freq_pack | % {
	[string]$line = $_
	$p = $line.split(",", 2)
	$freq[$p[0]] = $p[1]
}

"parse score" | out-host

cat c:\scripts\score_pack | % {
	[string]$line = $_
	$p = $line.split(",", 2)
	$score[$p[0]] = $p[1]
}

$host.ui.RawUI.WindowTitle="Rules Inspector"

$oldstr = "21ogfnv3089tg32hg980123tu2"
while($true) {
	$str = Get-ClipboardText
	$str = ($str -replace "^ *","")
	$str = ($str -replace " *$","")
	if ($str -ne $oldstr) {
		clear
		$oldstr = $str
		if ($rule.contains($str)){
			$rule[$str] | out-host
			"" | out-host
			if ($freq.contains($str)){
				write-host ("freqs: " + $freq[$str]) -foregroundcolor yellow
			}
			"" | out-host
			if ($score.contains($str)){
				write-host ("score: " + $score[$str]) -foregroundcolor red
			}
		}
	}
	sleep -Milliseconds 500
}