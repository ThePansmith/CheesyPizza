if !grounded
	image_speed = 0;
else if floor(image_index) != 8
	image_speed = 0.35;
else
	image_speed = 0;
scr_collide();

var checkpoint = is_struct(global.checkpoint_data);
if instance_exists(obj_genericfade)
{
	if obj_genericfade.fade >= 1
	{
		if checkpoint
			load_checkpoint();
		else with obj_pause
		{
			roomtorestart = global.leveltorestart;
			event_perform(ev_alarm, 5);
		}
	}
}
else
{
	buffer--;
	if buffer <= 0 && global.leveltorestart != noone && global.leveltorestart != -1 && (REMIX or checkpoint)
	{
		if !instance_exists(obj_transfotip)
			create_transformation_tip(checkpoint ? "{u}[T] Load Checkpoint" : "{u}[T] Restart Level/", noone, true);
		if obj_player1.key_taunt2
		{
			fmod_event_instance_stop(snd, true);
			with instance_create(0, 0, obj_genericfade)
			{
				persistent = true;
				depth = -1000;
				fade = 0;
			}
		}
	}
}
