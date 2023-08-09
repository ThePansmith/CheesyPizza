// init
objects = cyop_objectlist();
_room = noone;
room_name = "";
room_ind = -1;


// load in
var load = get_open_filename_ext("CYOP Tower (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", "", environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\", "Select a custom level");
if load == ""
{
	instance_destroy();
	exit;
}

var result = cyop_load(load);
if is_string(result)
{
	show_message(result);
	instance_destroy();
}

with obj_player
	targetDoor = "A";
scr_room_goto("main");
