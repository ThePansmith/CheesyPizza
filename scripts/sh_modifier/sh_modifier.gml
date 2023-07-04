function sh_modifier(args)
{
	if !WC_debug && !string_starts_with(room_get_name(room), "tower")
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "Argument missing: modifier";
	
	var modifier = args[1];
	switch modifier
	{
		case "Encore": modifier = MOD.Encore; break;
		case "Pacifist": modifier = MOD.Pacifist; break;
		case "NoToppings": modifier = MOD.NoToppings; break;
		case "HardMode": modifier = MOD.HardMode; break;
		case "Mirror": modifier = MOD.Mirror; break;
		case "Lap3": modifier = MOD.Lap3; break;
		
		default: return "Modifier not found";
	}
	
	global.modifier ^= modifier;
	return $"{args[1]} modifier {check_modifier(modifier) ? "ON" : "OFF"}";
}
function meta_modifier()
{
	return
	{
		description: "toggle a modifier",
		arguments: ["modifier"],
		suggestions: [
			["Encore", "Pacifist", "NoToppings", "HardMode", "Mirror", "Lap3"]
		],
	}
}
