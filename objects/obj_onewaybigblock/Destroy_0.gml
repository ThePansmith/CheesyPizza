if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1)
{
	if sprite_index == spr_onewaybigblock
	{
		if REMIX
		{
			with instance_create(x + 32 * image_xscale, y + 32, obj_sausageman_dead)
			{
				sprite_index = spr_bigdoughblockdead;
				image_xscale = other.image_xscale;
			}
		}
		else
		{
			with instance_create(x + 32, y + 32, obj_sausageman_dead)
				sprite_index = spr_bigdoughblockdead;
		}
		sound_play_oneshot_3d("event:/sfx/enemies/killingblow", x, y);
	}
	else
	{
		repeat (7)
			create_debris(x + image_xscale * 32, y + 32, spr_bigdebris_ss)

		create_debris(x + image_xscale * 64, y + 32, spr_bigdebrisBandage)
		scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	}
	scr_sleep(5);
	ds_list_add(global.saveroom, id);
}
instance_destroy(solid_inst);
