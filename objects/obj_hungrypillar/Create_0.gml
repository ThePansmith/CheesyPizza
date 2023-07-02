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

idlespr = spr_hungrypillar;
angryspr = spr_hungrypillar_angry;
deadspr = spr_hungrypillar_dead;

if check_sugary()
{
	idlespr = spr_hungrypillar_ss;
	angryspr = idlespr;
	deadspr = spr_hungrypillar_dead_ss;
}
if check_midway()
{
	idlespr = spr_hungrypillar_bo;
	angryspr = idlespr;
	deadspr = spr_hungrypillar_angry_bo;
}
sprite_index = idlespr;
