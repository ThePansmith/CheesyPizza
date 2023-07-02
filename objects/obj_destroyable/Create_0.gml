event_inherited();

global.breaksound = 0;
depth = 1;
image_index = random_range(0, image_number - 1);
particlespr = spr_towerblockdebris;
particlespd = 0.35;

if check_sugary()
{
	sprite_index = spr_destroyable_ss;
	particlespr = spr_debris_ss;
	particlespd = 0;
}
if check_midway()
{
	sprite_index = spr_towerblocksmall_bo;
	image_speed = 0;
	image_index = irandom(image_number);
	particlespr = spr_towerblockdebris_bo;
}
