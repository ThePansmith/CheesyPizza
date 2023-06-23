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
scr_init_input();
