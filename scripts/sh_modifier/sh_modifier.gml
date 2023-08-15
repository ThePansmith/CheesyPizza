function sh_modifier(args)
{
	if !WC_debug && !string_starts_with(room_get_name(room), "tower")
		return "You cannot use this command inside of a level";
	if array_length(args) < 2
		return "Argument missing: modifier";
	
	var modifier = args[1];
	if !variable_struct_exists(MOD, modifier)
		return $"Modifier {modifier} not found";
	
	var value = !variable_struct_get(MOD, modifier);
	variable_struct_set(MOD, modifier, value);
	
	return $"{modifier} modifier {value ? "ON" : "OFF"}";
}
function meta_modifier()
{
	return
	{
		description: "toggle a modifier",
		arguments: ["modifier"],
		suggestions: [
			function()
			{
				var state_array = variable_struct_get_names(MOD);
				array_sort(state_array, true);
				return state_array;
			},
		],
	}
}
