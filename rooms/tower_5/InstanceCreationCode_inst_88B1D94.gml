condition = function()
{
	return (!place_meeting(x + 1, y, obj_solid) && obj_player1.x < x && obj_player1.targetDoor == "X") or obj_player1.targetDoor == "PB";
}
output = function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Modded", "con", 1);
	obj_savesystem.ini_str_options = ini_close();
	gamesave_async_save_options();
	
	ds_list_clear(global.saveroom);
	with obj_player
	{
		if targetDoor == "PB"
		{
			state = states.comingoutdoor;
			image_index = 0;
		}
		else
			targetDoor = "NONE";
	}
	room_restart();
}
