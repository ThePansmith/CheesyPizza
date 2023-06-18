if (noshake == 0)
{
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	instance_create(x, y, obj_bangeffect);
	with (create_debris(x, y, sprite_index, false))
	{
		image_index = 1;
		image_yscale = -1;
	}
}
fmod_event_instance_stop(snd, true);
fmod_event_instance_release(snd);
