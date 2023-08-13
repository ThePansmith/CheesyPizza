function sh_replay(args)
{
	if array_length(args) < 1
		return "yes, i'm aware 1 is a big number but you still need it to use this command.";
		
	var action = args[1];
}
function meta_replay()
{
	return {
		description: "control the replay system (can be dangerous)",
		arguments: ["actions", "<action>"],
		suggestions: ["begin", "end"
		],
		argumentDescriptions: [
			"begin/end a replay (waits for the next room transition to begin)",
		],
	}
}