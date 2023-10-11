// checks if you beat the game on this savefile
ini_open_from_string(obj_savesystem.ini_str);
if ini_key_exists("Ranks", "exit") or global.sandbox
{
	instance_change(obj_hubelevator, true);
	ini_close();
	exit;
}
ini_close();

event_inherited();
targetDoor = noone;
key = false;
save = "w1stick";
unlocked = false;
state = states.normal;
depth = 50;
