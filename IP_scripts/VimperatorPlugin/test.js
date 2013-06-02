commands.addUserCommand(["test"],
    "a vimperator test plugin command",
    function (args)
    {
		if (!args['-verbose'] || args["-verbose"].length == 0)
		{
			info = "xxxx";
		} else {
			info = args["-verbose"];
		}
		alert(content.document.location + info);
    }, {
        options: [[["-verbose", "-v"], commands.OPTION_STRING]]
    }
);
