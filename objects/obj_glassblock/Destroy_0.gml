if (ds_list_find_index(global.saveroom, id) == -1)
{
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	repeat 6
		create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_glasspiece, false);
	ds_list_add(global.saveroom, id);
}
