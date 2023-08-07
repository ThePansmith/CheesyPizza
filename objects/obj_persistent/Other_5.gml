room_tiles = [];
room_bgs = [];
global.showcollisions = false;

if instance_exists(obj_player)
{
	SUGARY = global.leveltosave == "entryway" or global.leveltosave == "steamy" or global.leveltosave == "molasses" or global.leveltosave == "sucrose" or room == tower_sugary;
	MIDWAY = global.leveltosave == "midway";
}
