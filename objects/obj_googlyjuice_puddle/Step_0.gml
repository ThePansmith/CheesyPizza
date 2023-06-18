mask_index = spr_juicepuddledone;
scr_collide();

if grounded
{
	hsp = Approach(hsp, 0, 0.1);
	
	var slope = instance_place(x, y + 1, obj_slope_parent);
	if slope && global.sloperot
		draw_angle = scr_slope_angle(slope);
	else
		draw_angle = 0;
	
	if sprite_index != spr_juicepuddledone
		sprite_index = spr_juicepuddlesplash;
}
else
	draw_angle = Approach(draw_angle, 0, 45 / 16);

if sprite_index == spr_juicepuddlesplash && image_index >= image_number - 1
	sprite_index = spr_juicepuddledone;

if place_meeting(x, y, obj_solid)
	instance_destroy();
