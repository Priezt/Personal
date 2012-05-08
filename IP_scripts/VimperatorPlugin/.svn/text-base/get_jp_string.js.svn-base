commands.addUserCommand(["getcode"],
    "get UnicodeBig hex code",
    function (args)
    {
		var str = readFromClipboard();
		//alert(str.length);
		var chars = str.split("");
		var result = "";
		for(var c=0;c<chars.length;c++){
			var ch = chars[c].charCodeAt(0);
			if(ch > 255){
				var low = ch % 256;
				var high = (ch - low) / 256;
				result += "\\x"+high.toString(16)+"\\x"+low.toString(16);
			}else{
				result += "\\x"+ch.toString(16);
			}
		}
		//liberator.echo(result);
		//alert(result);
		prompt("UnicodeBig:", result);
    }, {
    }

);
