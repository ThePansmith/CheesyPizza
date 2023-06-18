function sh_showcollisions(args)
{
	var togglepanic = !WC_showcollisions;
	if array_length(args) > 1
	{
		if args[1] == "true" or args[1] == "1"
			togglepanic = true;
		else if args[1] == "false" or args[1] == "0"
			togglepanic = false;
		else
			return "Invalid argument: " + args[1];
	}
	WC_showinvisible = 0;
	WC_showcollisions = togglepanic;
	toggle_collisions(togglepanic);
}
function meta_showcollisions()
{
	return
	{
		description: "toggles viewable collisions",
		arguments: ["<enable>"],
		suggestions: [
			["true", "false"],
		],
	}
}

function toggle_collisions(enable)
{
	var i_love_cock = [obj_solid, obj_slope, obj_platform, obj_ladder, obj_secretblock, obj_secretbigblock, obj_secretmetalblock, obj_grindrail, obj_grindrailslope, obj_slope_platform];
	with all
	{
		if array_contains(i_love_cock, object_index)
		{
			visible = enable;
			depth = 1;
		}
	}
}
