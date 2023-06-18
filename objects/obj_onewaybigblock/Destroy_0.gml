if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1)
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
	scr_sleep(5);
	fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
	ds_list_add(global.saveroom, id);
}
instance_destroy(solid_inst);
