playerindex = 0;
depth = 1;
particlespr = spr_metalblockdebris;

if global.blockstyle == 1
{
	// september
	sprite_index = spr_metalb;
	particlespr = spr_harddoughblockdead;
}

sugary = check_sugary();
if sugary
{
	sprite_index = spr_metalblock_ss;
	particlespr = spr_metaldebris_ss;
}
