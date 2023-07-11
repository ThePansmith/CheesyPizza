if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (7)
		create_debris(x + 32, y + 32, spr_bigdebris);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
}
