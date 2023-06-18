function sh_char(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player1)
		return "The player is not in the room";
	if array_length(args) < 2
		return "Missing argument: char";
	
	with obj_player1
	{
		character = args[1];
		scr_characterspr();
	}
}
function meta_char()
{
	return {
		description: "change characters",
		arguments: ["char"],
		suggestions: [
			["P", "N", "V", "M", "S", "SP", "PN"],
		],
	}
}
