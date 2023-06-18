if state == 1 or state == 3
{
	var len = array_length(hub_array);
	
	var curve = animcurve_channel_evaluate(state == 1 ? outback : incubic, anim_t);
	draw_sprite_ext(spr_elevatorpanel_back, 0, 360, 280, 1, ((len * 42) / 72) * curve, 0, c_white, curve);
	
	for(var i = 0; i < len; i++)
	{
		var c = sel == hub_array[i][0] ? c_white : c_gray;
		draw_sprite_ext(spr_elevatorpanel_button, i, 362, 360 - (32 * i), 1, 1, 0, c, curve);
	}
}
