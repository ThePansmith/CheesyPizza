function sh_giveshotgun()
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player)
		return "The player is not in the room";
	
	with obj_player
	{
		if shotgunAnim
		{
			shotgunAnim = false;
			return "Removed shotgun";
		}
		else
		{
			image_index = 0;
			sprite_index = spr_shotgunpullout;
			sound_play_3d("event:/sfx/pep/shotgunload", x, y);
			shotgunAnim = true;
			state = states.shotgun;
		}
	}
}
function meta_giveshotgun()
{
	return {
		description: "gives or takes a shotgun from the player",
	}
}
function sh_impulse(args)
{
	if args[1] == "101"
		sh_giveshotgun();
}
function meta_impulse()
{
	return {
		suggestions: [
			["101"]
		],
		hidden: true
	}
}
