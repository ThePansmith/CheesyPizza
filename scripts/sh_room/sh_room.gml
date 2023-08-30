function sh_room(args)
{
	if (instance_exists(obj_disclaimer) or room == Initroom) && !DEBUG
		return "No.";
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "The current room is " + room_get_name(room) + " (" + string(room) + ")";
	
	var roomgoto = args[1];
	if instance_exists(obj_levelLoader)
	{
		if !ds_map_exists(global.room_map, roomgoto)
			return "The room " + string(roomgoto) + " doesn't exist in the current custom level";
	}
	else
	{
		if string_is_number(roomgoto)
		{
			roomgoto = real(roomgoto);
			if !room_exists(roomgoto)
				return "The room " + string(roomgoto) + " doesn't exist";
		}
		else if asset_get_type(roomgoto) != asset_room
			return "The asset " + roomgoto + " is not a room";
		
		if roomgoto == "Initroom"
			return "Not a good idea";
		roomgoto = asset_get_index(roomgoto);
	}
	
	var door = "NONE";
	if array_length(args) >= 3
		door = args[2];
	
	with obj_player1
		targetDoor = string_upper(door);
	
	scr_room_goto(roomgoto);
	sound_play(sfx_door);
}
function meta_room()
{
	return {
		description: "travel to a room",
		arguments: ["targetRoom", "<targetDoor>"],
		suggestions: [
			function()
			{
				var room_array = [];
				if instance_exists(obj_levelLoader)
				{
					var map = ds_map_find_first(global.room_map);
					while !is_undefined(map)
					{
						array_push(room_array, map);
						map = ds_map_find_next(global.room_map, map);
					}
				}
				else
				{
					for(var i = 0; room_exists(i); i++)
					{
						var tags = asset_get_tags(room_get_name(i));
						if !array_contains(tags, "hidden")
							array_push(room_array, room_get_name(i));
					}
					array_sort(room_array, true);
				}
				return room_array;
			},
			["A", "B", "C", "D", "E", "F", "G"]
		],
		argumentDescriptions: [
			"room to travel to, input as name or index",
			"(optional) door index to place the player at"
		],
	}
}
