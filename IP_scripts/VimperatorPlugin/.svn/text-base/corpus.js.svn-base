commands.addUserCommand(["cor[pus]"],
    "search messages in corpus",
    function (args)
    {
		var midstr = readFromClipboard();
		//var textmid = midstr.replace(/[^0-9]+/g, ' ');
		var textmid = midstr.match(/[0-9]{9,10}/g).join(" ");
		var url = "http://corpus.ironport.com/search/classify?action=Search&text_mids=" + textmid;
		window.openNewTabWith(url);
    }, {
    }
);