if (!in_saveroom())
{
	with (instance_create(x + 32, y + 32, obj_sausageman_dead))
		sprite_index = spr_bigdoughblockdead;
	scr_sleep(5);
	ds_list_add(global.saveroom, id);
}
