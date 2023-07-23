global.Pattern_Texture_Indexed = -4;

var secrettile = 0;
with obj_secrettile
{
	if (player && player.state != states.chainsaw) or active
		secrettile = 1;
}
global.secrettile_clip_distance = lerp(global.secrettile_clip_distance, secrettile * 150, 0.15);
