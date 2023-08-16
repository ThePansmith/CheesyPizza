if state == 1 or state == 3
{
	var len = array_length(hub_array);
	
	var curve = animcurve_channel_evaluate(state == 1 ? outback : incubic, anim_t);
	var please = len * 32;
	draw_sprite_ext(spr_elevatorpanel_back, 0, 360, 280, 1, 0.75 + (please / 72) * curve, 0, c_white, curve);
	
	for(var i = 0; i < len; i++)
	{
		var c = sel == i ? c_white : c_gray;
		draw_sprite_ext(spr_elevatorpanel_button, hub_array[i][0], 362, 16 + 280 - please / 2 + (32 * i), 1, 1, 0, c, curve);
	}
}
