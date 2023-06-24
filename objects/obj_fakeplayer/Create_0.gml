move = false;
movespeed = 0;
xscale = -1;
steppybuffer = 12;
active = false;

ini_open_from_string(obj_savesystem.ini_str_options);
if ini_read_real("Modded", "sighting", false) && (!keyboard_check(ord("E")) or !DEBUG)
	instance_destroy();
obj_savesystem.ini_str_options = ini_close();
