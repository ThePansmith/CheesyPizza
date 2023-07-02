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
if check_midway()
{
	sprite_index = spr_towerblock_bo;
	image_speed = 0;
	image_index = irandom(image_number);
	particlespr = spr_towerblockdebris_bo;
}
