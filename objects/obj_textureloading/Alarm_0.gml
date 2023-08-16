var tex = array_pop(tex_list);
if tex != undefined
{
	trace("Loading texture: ", tex);
	//if !texture_is_ready(tex)
		texture_prefetch(tex);
	
	alarm[0] = 1;
}
else
{
	image_alpha -= 0.1;
	if image_alpha <= -0.1
	{
		//room_goto(Realtitlescreen);
		room_goto(Initroom);
		screen_apply_vsync();
	}
	
	alarm[0] = 1;
}
