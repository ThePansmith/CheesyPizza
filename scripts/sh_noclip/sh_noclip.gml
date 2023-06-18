function sh_noclip(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player1)
		return "The player is not in the room";
	
	with obj_player1
	{
		if state == states.debugstate
			state = states.normal;
		else
			state = states.debugstate;
	}
}
function meta_noclip()
{
	return {
		description: "puts the player in the debug state",
	}
}
