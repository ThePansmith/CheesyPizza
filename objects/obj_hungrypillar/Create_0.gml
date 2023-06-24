hp = 0;
image_speed = 0.35;
depth = 2;
if (room == rm_editor)
{
	if (place_meeting(x, y + 32, obj_solid))
	{
		while (!place_meeting(x, y + 1, obj_solid))
			y += 1;
	}
}
deadspr = spr_hungrypillar_dead;
if check_sugary()
{
	sprite_index = spr_hungrypillar_ss
	deadspr = spr_hungrypillar_dead_ss
}