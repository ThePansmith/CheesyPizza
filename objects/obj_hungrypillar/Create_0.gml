event_inherited();

hp = 0;
image_speed = 0.35;
depth = 2;
if (room == rm_editor)
{
	if (check_solid(x, y + 32))
	{
		while (!check_solid(x, y + 1))
			y += 1;
	}
}

idlespr = spr_hungrypillar;
angryspr = spr_hungrypillar_angry;
deadspr = spr_hungrypillar_dead;

if SUGARY
{
	idlespr = spr_hungrypillar_ss;
	angryspr = idlespr;
	deadspr = spr_hungrypillar_dead_ss;
}
if MIDWAY
{
	idlespr = spr_hungrypillar_bo;
	angryspr = idlespr;
	deadspr = spr_hungrypillar_angry_bo;
}
sprite_index = idlespr;
