if instance_exists(obj_parallax)
{
	// panic backgrounds
	if global.panic && room != custom_lvl_room
	    event_user(1);
}

// ctop lapping
if MOD.Lappable
{
	with obj_baddie
	{
		if object_index != obj_pepbat && object_index != obj_pizzaball && object_index != obj_kentukybomber
		{
			escape = true;
			event_perform(ev_other, ev_room_start);
		}
	}
	with obj_collect
	{
		instance_change(obj_escapecollect, false);
		event_perform_object(obj_escapecollect, ev_create, 0);
	}
	with obj_bigcollect
	{
		instance_change(obj_escapecollectbig, false);
		event_perform_object(obj_escapecollectbig, ev_create, 0);
		
		x -= 32;
		y -= 32;
		if global.panic
			image_alpha = 1;
	}
}
