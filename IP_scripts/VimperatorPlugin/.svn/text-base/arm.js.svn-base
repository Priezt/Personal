commands.addUserCommand(["arm[search]"],
    "search missed-spam with subject keyword",
    function (args)
    {
		var keyword = args.join(" ");
		var subRe = new RegExp(keyword, "i");
		liberator.echo("Fetching JSON data...");
		util.httpGet ("http://case-dev5.soma.ironport.com/~zhqi/ms_subject_json.html?" + Math.random(), 
			function (req)
			{
				if (req.status == 200)
				{
					var mids = new Array();
					var json = eval('('+ req.responseText +')');
					for(var c=0;c<json.length;c++){
						if(json[c].subject.match(subRe)){
							mids.push(json[c].mid);
						}
					}
					liberator.echo("Total missed-spam: " + json.length + ", matched " + mids.length + " found");
					url = "http://arm.ironport.com/search/find_messages?action=Search&msg_id=" + (mids.join(" ")) + "&view_columns%5B%5D=msg_id&view_columns%5B%5D=emaildate&view_columns%5B%5D=subject&view_columns%5B%5D=from_addr&pages=40";
					window.openNewTabWith(url);
				}
				else
				liberator.echoerr("Error fetching json file!\n");
			}
		);
    }, {
    }

);
