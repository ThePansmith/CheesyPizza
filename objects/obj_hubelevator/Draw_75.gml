live_auto_call;
if state == 1 or state == 3
{
	var len = array_length(hub_array);
	var curve = animcurve_channel_evaluate(state == 1 ? outback : incubic, anim_t);
	
	var xx = x + 50 - camera_get_view_x(view_camera[0]), yy = y - 90 - camera_get_view_y(view_camera[0]);
	var arrowx = xx, arrowy = yy + 40 * curve;
	
	draw_sprite_ext(spr_elevatorpanel_back, 0, xx, yy, 1, curve, 0, c_white, curve);
	for(var i = 0; i < len; i++)
	{
		var c = sel == i ? c_white : c_gray;
		var xbutt = xx + 38 * cos(lerp(0, pi, i / (len - 1))) - 1;
		var ybutt = yy - (40 * sin(lerp(0, pi, i / (len - 1))) * curve) + 20;
		
		if sel == i
			angle = lerp(angle, floor(360 + point_direction(arrowx, arrowy, xbutt, ybutt) - 90), 0.5);
		draw_sprite_ext(spr_elevatorpanel_button, hub_array[i][0], xbutt, ybutt, 1, 1, 0, c, curve);
	}
	draw_sprite_ext(spr_elevatorpanel_arrow, 0, arrowx, arrowy, 1, 1, angle, c_white, curve);
}
