playerindex = 0;
depth = 1;
particlespr = spr_metalblockdebris;

sugary = check_sugary();
if sugary
{
	sprite_index = spr_metalblock_ss;
	particlespr = spr_metaldebris_ss;
}
