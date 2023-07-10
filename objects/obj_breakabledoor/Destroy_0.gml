if (ds_list_find_index(global.saveroom, id) == -1)
{
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	repeat (4)
	{
		with (create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_wooddebris))
		{
			vsp = random_range(-8, -6);
			hsp = random_range(-4, 4);
		}
	}
	ds_list_add(global.saveroom, id);
}
