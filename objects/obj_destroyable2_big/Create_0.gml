hp = 2;
depth = 1;
content = obj_null;
particlespr = -1;
spr_dead = spr_bigpizzablockdead;

if global.blockstyle == 2
{
	// old
	sprite_index = spr_bigbreakable_old;
	particlespr = spr_bigpizzadebris;
	spr_dead = -1;
}

if check_char("SP")
{
	sprite_index = spr_candybigbreakable;
	spr_dead = spr_bigcandyblockdead;
}
else if check_char("BN")
{
	sprite_index = spr_bigbreakable_bo;
	spr_dead = spr_bigpizzablockdead_bo;
}
else if check_char("PN")
{
	sprite_index = spr_bigbreakablePN;
	spr_dead = spr_bigpizzablockdeadPN;
}
