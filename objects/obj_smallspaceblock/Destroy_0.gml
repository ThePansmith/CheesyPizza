if (!in_saveroom())
{
	with (instance_create(x + 16, y + 16, obj_sausageman_dead))
		sprite_index = spr_doughblockdead;
	scr_sleep(5);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
}
