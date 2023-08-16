ini_open_from_string(obj_savesystem.ini_str);
if !ini_key_exists("Ranks", "exit") && !global.sandbox // checks if you beat the game on this savefile
{
	var tr = room;
	if variable_instance_exists(id, "targetRoom")
		tr = targetRoom;
	
	instance_change(obj_door, true);
	targetRoom = tr;
	
	event_perform_object(obj_door, ev_other, ev_room_start);
	ini_close();
	exit;
}
ini_close();

// elevator here
scr_create_uparrowhitbox();
depth = 99;
sprite_index = spr_elevatoropen;

state = 0;
hub_array = [
	[5, tower_5, "E"],
	[4, tower_4, "B"],
	[3, tower_3, "C"],
	[2, tower_2, "E"],
	[1, tower_1, "E"],
	[0, tower_extra, "G"],
	[6, tower_sugary, "A"],
]
targetDoor = "A";
sel = 0;

if (global.panic)
{
	instance_create(x + 50, y + 96, obj_rubble);
	instance_destroy();
}

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");
anim_t = 0;
angle = 360;
scr_init_input();
