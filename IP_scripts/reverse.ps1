add-pssnapin wasp

Select-Window -Title Case-Dev5 | sv putty
Select-Window -Title *Vimperator | sv vimperator

$putty.GetPosition() | sv pp
$vimperator.GetPosition() | sv pv

if ($pp.Left -gt 1680) {
	$putty.SetPosition(241, 280, $pp.width, $pp.height)
	set-windowactive -window $putty
	$vimperator.SetPosition(1863, 280, $pp.width, $pp.height)
} else {
	$putty.SetPosition(1863, 280, $pp.width, $pp.height)
	$vimperator.SetPosition(241, 280, $pp.width, $pp.height)
	set-windowactive -window $vimperator
}