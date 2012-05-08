add-type -path C:\scripts\GreenArrow\arrow.dll
$arr = (new-object greenarrow.arrow -argumentlist "c:\scripts\greenarrow\markerdata")

function exists-mark($markName){
	$arr.exists($markName)
}

function click-mark($markName){
	$arr.click($markName)
}

function wait-mark($markName){
	while($true){
		if($arr.exists($markName)){
			break
		}
		("wait for mark: " + $markName) | out-host
		sleep 2
	}
}