if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1)
{
	if (sprite_exists(particlespr))
	{
		repeat (6)
			create_debris(x + 16, y + 16, particlespr);
	}
	with (instance_create(x + 16, y + 16, obj_parryeffect))
		sprite_index = other.spr_dead;
	
	scr_sleep(5);
	create_baddiegibsticks(x + 16, y + 16);
	scr_sound_multiple("event:/sfx/misc/collect", x, y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	var val = heat_calculate(10);
	global.collect += val;
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(val);
	notification_push(notifs.block_break, [room]);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
}
