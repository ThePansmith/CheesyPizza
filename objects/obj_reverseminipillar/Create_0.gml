image_speed = 0.35;
depth = 4;
player = 0;

wokespr = spr_minipillarwoke;
sleepspr = spr_minipillarsleep;

if check_sugary()
{
	wokespr = spr_minipillarwoke_ss;
	sleepspr = spr_minipillarsleep_ss;
}
if check_midway()
{
	wokespr = spr_minipillarwoke_bo;
	sleepspr = spr_minipillarsleep_bo;
}

sprite_index = wokespr;
