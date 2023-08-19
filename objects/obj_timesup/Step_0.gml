if !grounded
	image_speed = 0;
else if floor(image_index) != 8
	image_speed = 0.35;
else
	image_speed = 0;
scr_collide();

buffer--;
if buffer <= 0 && global.leveltorestart != noone && global.leveltorestart != -1 && REMIX
{
	if !instance_exists(obj_transfotip)
		create_transformation_tip("{u}[T] Restart Level/");
	if obj_player1.key_taunt2
	{
		fmod_event_instance_stop(snd, true);
		with obj_pause
		{
			alarm[5] = 1;
			roomtorestart = global.leveltorestart;
		}
		with instance_create(0, 0, obj_genericfade)
			persistent = true;
	}
}
