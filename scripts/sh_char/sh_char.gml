function sh_char(args)
{
	if !WC_debug && !string_starts_with(room_get_name(room), "tower")
		return "You cannot use this command inside of a level";
	if !instance_exists(obj_player1)
		return "The player is not in the room";
	if array_length(args) < 2
		return "Missing argument: character";
	
	with obj_player1
	{
		character = args[1];
		scr_characterspr();
	}
	
	if args[1] == "M"
		return "Yeah, good luck with that.";
}
function meta_char()
{
	return {
		description: "change characters",
		arguments: ["character"],
		suggestions: [
			["P", "N", "V", "S", "SP", "SN", "BN", "PN"],
		],
	}
}
