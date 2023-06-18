event_inherited();
spr_dead = spr_ratblock6_dead;
depth = 2;
anim = false;
animy = 0;

// despawn if youre vigilante
with obj_player1
{
	if character == "V"
		instance_destroy(other, false);
}
