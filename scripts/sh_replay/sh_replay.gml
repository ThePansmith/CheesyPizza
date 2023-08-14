function sh_replay(args)
{
	if array_length(args) < 2
		return "yes, i'm aware 2 is a big number but you still need it to use this command.";
		
	var action = string_lower(args[1]);
	
	if action == "record"
	{
		if !instance_exists(obj_replay)
			instance_create(0, 0, obj_replay);
		
		obj_replay.record = true;
		
		return $"Replay will start recording on the next room you visit.";
	}
	else if action == "playback"
	{
		if array_length(args) < 3
			return "Playback requires 3 arguments";
			
		if !instance_exists(obj_replay)
			instance_create(0, 0, obj_replay);
		obj_replay.playback_start_room = noone;
		obj_replay.replay_file = $"{game_save_id}replays\\{args[2]}";
		obj_replay.playback = true;
	}
	else if action == "end"
	{
		return $"not implemented yet";
	}
	else
		return $"Invalid action type: \"{action}\"!";
}
function meta_replay()
{
	return {
		description: "control the replay system (can be dangerous)",
		arguments: [ "action", "filepath"],
		suggestions: [ 
		[ "record", "playback", "end" ],
		function()
		{
			var files = [ ];
			var i = 0;
			var prefix = $"{game_save_id}replays\\"
			var len = string_length(prefix);
			var fileName = file_find_first($"{prefix}\*.rf", fa_directory);
			while (string_length(fileName) != 0)
			{
				files[i++] = string_delete(fileName, 0, len);
				fileName = file_find_next();
			}
			
			file_find_close();
			return files;
		}
		],
		argumentDescriptions: [
			"I need to put somrthing here - Radix",
		],
	}
}