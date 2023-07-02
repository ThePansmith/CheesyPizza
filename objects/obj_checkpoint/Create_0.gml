active = false;
image_speed = 0.35;

activatingspr = spr_checkpoint_activating;
activatedspr = spr_checkpoint_activated;

if check_midway()
{
	sprite_index = spr_checkpoint_bo;
	activatingspr = spr_checkpoint_activating_bo;
	activatedspr = spr_checkpoint_activated_bo;
}
