if collision_line(x, y, x, y + 32, obj_solid, false, false)
{
	while !place_meeting(x, y + 1, obj_solid)
		y++;
	
	sprite_index = spr_juicepuddledone;
	grounded = true;
}
