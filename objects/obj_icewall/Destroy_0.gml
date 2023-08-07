if ds_list_find_index(global.saveroom, id) == -1
{
    repeat 7
        create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_metaldebrishard_ss)
    sound_play_3d("event:/modded/sfx/glassbreak", x + sprite_width / 2, y + sprite_height / 2);
    ds_list_add(global.saveroom, id);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
}
