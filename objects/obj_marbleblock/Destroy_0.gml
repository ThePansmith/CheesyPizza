if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x + 32, y + 32, obj_sausageman_dead))
		sprite_index = spr_harddoughblockdead;
	scr_sleep(5);
	instance_create(x + 32, y + 32, obj_bangeffect);
	with (obj_camera)
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
	GamepadSetVibration(playerindex, 1, 1, 0.8);
	sound_play_oneshot_3d("event:/sfx/misc/breakmetal", x, y);
	ds_list_add(global.saveroom, id);
}
depth = 1;
