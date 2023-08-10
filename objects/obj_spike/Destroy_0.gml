if (room == custom_lvl_room)
	tile_layer_delete_at(1, x, y);
if !in_saveroom()
{
	var i = 0;
	repeat (2)
	{
		with (create_debris(x + 16, y + 16, spr_plugdebris))
			image_index = i;
		i++;
	}
	scr_sound_multiple(global.snd_collect, x, y);
	add_saveroom();
}
