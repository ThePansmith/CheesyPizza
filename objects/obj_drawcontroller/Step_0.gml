flash = Approach(flash, 0, 0.05);

var secrettile = 0;
with obj_secrettile
{
	if active
		secrettile = 1;
}
global.secrettile_clip_distance = lerp(global.secrettile_clip_distance, secrettile * 150, 0.15);
