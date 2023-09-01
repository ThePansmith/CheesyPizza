if in_saveroom()
	exit;

ini_open_from_string(obj_savesystem.ini_str_options);
var con = ini_read_real("Modded", "con", 0);
ini_close();

if (con < 1 or irandom(5) != 0 or ((get_timer() / 1000000) < 60 * 5))
&& !(DEBUG && keyboard_check(ord("E")))
{
	with instance_place(x, y - 32, obj_solid)
		image_yscale += 2;
	
	instance_destroy(id, false);
	with obj_secretbigblock
		if x > other.x instance_destroy(id, false);
	with obj_hallway
		if x > other.x instance_destroy(id, false);
	with obj_doorX // door parent. do not replace
		if x > other.x instance_destroy(id, false);
	instance_destroy(obj_eventtrigger);
}
