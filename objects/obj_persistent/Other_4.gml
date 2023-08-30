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
		if global.lap && (object_index == obj_robot or object_index == obj_ninja or object_index == obj_bazookabaddie)
		{
			escape = true;
			event_perform(ev_other, ev_room_start);
		}
		else if object_index != obj_ghostknight && !in_saveroom(id, global.escaperoom)
			add_saveroom(id, global.escaperoom);
	}
}
if MOD.Lappable or (safe_get(global, "leveltosave") == "sucrose" && !room_is_secret(room))
{
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
