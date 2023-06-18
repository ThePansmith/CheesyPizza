hp = 2;
depth = 1;
particlespr = spr_towerblockdebris;
particlespd = 0.35;

if check_sugary()
{
	sprite_index = spr_destroyable3_ss;
	particlespr = spr_bigdebris_ss;
	particlespd = 0;
}
