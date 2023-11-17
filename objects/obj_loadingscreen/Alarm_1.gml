var len = array_length(tex_arr);
if len > 0
{
	var tex = array_pop(tex_arr);
	if !texture_is_ready(tex)
	{
		texture_prefetch(tex);
		trace("Loading texture: ", tex);
		alarm[1] = 1;
	}
	else
		event_perform(ev_alarm, 1);
}
else if cyop_tower != ""
{
	cyop_load_internal(cyop_tower);
	cyop_tower = "";
	alarm[1] = 1;
}
else if cyop_level != ""
{
	cyop_load_level_internal(cyop_level);
	cyop_level = "";
	alarm[1] = 1;
}
else
	instance_destroy();
