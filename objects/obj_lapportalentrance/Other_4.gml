var p = false;
with (obj_player)
{
	if (targetDoor == "LAP")
	{
		p = true;
		state = states.actor;
		x = other.x;
		y = other.y;
		roomstartx = x;
		roomstarty = y;
		visible = false;
		with (obj_pizzaface)
		{
			x = other.x;
			y = other.y;
		}
		
		if MOD.Lap3 == 1 && global.laps == 2 && !(is_struct(global.checkpoint_data) && global.checkpoint_data.loaded)
			set_checkpoint();
		if MOD.Lap3 && global.laps >= 3
			instance_create_unique(0, 0, obj_snickexe);
	}
}
if (!p)
	instance_destroy();
else
	active = true;
