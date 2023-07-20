particlespr = spr_pizzadebris;
spr_dead = spr_pizzablockdead;
if obj_player1.character == "SP"
{
	sprite_index = spr_candydestroyable2;
	particlespr = -1;
	spr_dead = spr_candyblockdead;
}
else if obj_player1.character == "BN"
{
	sprite_index = spr_destroyable2_bo;
	particlespr = -1;
	spr_dead = spr_pizzablockdead_bo;
}
else if obj_player1.character == "PN"
{
	sprite_index = spr_destroyable2PN;
	particlespr = -1;
	spr_dead = spr_pizzablockdeadPN;
}
image_index = random_range(0, image_number - 1);
depth = 1;
