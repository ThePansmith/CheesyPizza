if (!in_saveroom())
{
	repeat (6)
	{
		with (instance_create(x + 32, y + 32, obj_metaldebris))
			sprite_index = spr_supermetalblock_debris;
	}
	with (obj_camera)
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
	sound_play_oneshot("event:/sfx/misc/breakmetal");
	ds_list_add(global.saveroom, id);
}
depth = 1;
