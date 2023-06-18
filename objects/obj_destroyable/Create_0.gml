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
