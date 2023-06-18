/// @description slope rotation
if global.sloperot && state != states.knightpepslopes && state != states.Sjumpprep && sprite_index != spr_playerN_jetpackboost
{
	var angle_target = 0, angle_spd = 0.6;
	if state != states.backbreaker
	{
		var slope = instance_place(x, y + 1, obj_slope_parent);
		if slope
			angle_target = scr_slope_angle(slope);
	}
	
	if collision_rectangle(bbox_left - 20, bbox_top, bbox_right + 20, bbox_bottom + 8, obj_solid, false, true)
	{
		angle_target /= 2;
		angle_spd = 0.3;
	}
	if place_meeting(x, y + 1, obj_solid)
	{
		angle_target = 0;
		angle_spd = 0.5;
	}

	angle = lerp(angle, angle_target, angle_spd);
}
else
	angle = 0;
