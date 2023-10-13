function sh_create(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "Missing argument: object";
	
	var object = args[1];
	if string_is_number(object)
	{
		object = real(object);
		if !object_exists(object)
			return $"Object with index {object} doesn't exist";
	}
	else
	{
		if asset_get_type(object) == asset_object
			object = asset_get_index(object);
		else
			return $"Object with name {object} doesn't exist";
	}
	if array_contains(asset_get_tags(object, asset_object), "hidden")
		return $"Object with index {object} doesn't exist";
	if array_contains(asset_get_tags(object, asset_object), "protected")
		return "Can't create protected object";
	
	var xx = undefined, yy = undefined;
	if array_length(args) >= 3 && args[2] != ""
	{
		if array_length(args) < 4 or args[3] == ""
			return "Missing argument: y";
		
		xx = args[2];
		yy = args[3];
		
		if string_is_number(xx)
			xx = real(xx);
		else
			return "\"x\" parameter must be a number";
		
		if string_is_number(yy)
			yy = real(yy);
		else
			return "\"y\" parameter must be a number";
		
		// spawn object
		instance_create(xx, yy, object);
		return "Created " + args[1] + " at x" + args[2] + " y" + args[3];
	}
	else
	{
		isOpen = false;
		WC_select_mode = WC_select_modes.create;
		WC_select_inst = object;
	}
}
function meta_create()
{
	return {
		description: "creates an object",
		arguments: ["object", "<x>", "<y>"],
		suggestions: [
			function()
			{
				var obj_array = [];
				
				var tags = tag_get_asset_ids("hidden", asset_object);
				for(var i = 0; object_exists(i); i++)
				{
					if !array_contains(tags, i)
						array_push(obj_array, object_get_name(i));
				}
				
				array_sort(obj_array, true);
				return obj_array;
			},
			[mouseArgumentType.worldX],
			[mouseArgumentType.worldY]
		],
		argumentDescriptions: [
			"name of the object to spawn",
			"optional x position to place the object in",
			"optional y position to place the object in",
		],
	}
}
