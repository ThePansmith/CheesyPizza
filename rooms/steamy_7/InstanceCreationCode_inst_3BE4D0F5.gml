flags.do_save = false;
condition = function()
{
	var _check = false;
	with obj_player1
	{
		if targetDoor == "G"
			_check = true;
	}
	return _check;
}

output = function()
{
	with obj_player1
	{
		sound_play_oneshot_3d("event:/sfx/pep/slip", x, y);
		sprite_index = spr_slipbanan1;
		vsp = -11;
		movespeed = abs(movespeed);
		movespeed += 2;
		if movespeed > 14
			movespeed = 14;
		hsp = movespeed * xscale;
		image_index = 0;
		state = states.slipbanan;
	}
}
