if in_baddieroom()
{
	instance_destroy();
	exit;
}
while instance_exists(obj_levelLoader) && place_meeting(x, y, obj_solid)
    y--;

if (safe_get(id, "escape"))
{
	if (escapespawnID == noone)
	{
		with (instance_create(x, y, obj_escapespawn))
		{
			baddieID = other.id;
			other.escapespawnID = id;
		}
		instance_deactivate_object(id);
	}
}
if (safe_get(id, "elite") && object_index != obj_robot)
{
	hp += 1;
	elitehp = hp;
}
if (object_index == obj_cheeseslime && snotty)
{
	if (global.panic == true)
	{
		add_baddieroom();
		instance_destroy();
	}
	important = true;
	ini_open_from_string(obj_savesystem.ini_str);
	if (ini_read_real("Game", "snotty", false))
	{
		add_baddieroom();
		instance_destroy();
		instance_create(x, y, obj_snotty);
	}
	ini_close();
}
if check_heat() && (safe_get(id, "elite") or global.stylethreshold >= 3)
	paletteselect = elitepal;

// snap to ground if sugary
if SUGARY
{
	for(var i = 1; i < 32; i++)
	{
		if scr_solid(x, y + i)
		{
			y += i - 1;
			break;
		}
	}
}
