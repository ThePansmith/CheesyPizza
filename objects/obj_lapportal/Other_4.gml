var levels = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "minigolf", "space", "sewer", "industrial", "street", "freezer", "chateau", "war", "kidsparty", "exit"];
if array_contains(levels, global.leveltosave) && !global.sandbox
{
	ini_open_from_string(obj_savesystem.ini_str);
	if ini_read_real("Highscore", global.leveltosave, 0) == 0 && !ini_read_real("Tutorial", "lapunlocked", false)
		instance_destroy();
	ini_close();
}
if (MOD.Lap3) && global.laps >= 3
	instance_destroy();
if global.snickchallenge
	instance_destroy();
