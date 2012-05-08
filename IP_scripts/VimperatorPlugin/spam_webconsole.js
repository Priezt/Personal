commands.addUserCommand(["zz"],
    "eval string in webconsole",
    function (args)
    {
		content.document.getElementById("cmd_listener").value = args.string;
    }, {
    }
);