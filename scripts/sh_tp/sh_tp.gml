function sh_tp(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player1)
		return "The player is not in the room";
		
	if array_length(args) != 3
		return "Invalid amount of arguments; proper syntax is: tp <x> <y>";
	with obj_player1
	{
		var xx = 0;
		var yy = 0;
		
		try 
			xx = real(args[1]);	
		catch (_exception)
			return "Error parsing parameter 'x'";
			
		try 
			yy = real(args[2]);	
		catch (_exception)
			return "Error parsing parameter 'y'";
			
		x = xx;
		y = yy;
	}
}
function meta_tp()
{
	return {
		description: "Teleports the player to a given position",
		arguments: ["x", "y"],
	}
}
