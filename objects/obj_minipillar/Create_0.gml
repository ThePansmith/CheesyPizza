image_speed = 0.35;
depth = 4;
player = 0;
wokespr = spr_minipillarwoke
sleepspr = spr_minipillarsleep
if check_sugary()
{
	wokespr = spr_minipillarwoke_ss
	sleepspr = spr_minipillarsleep_ss
}

sprite_index = sleepspr