with (other)
{
	if (!other.hurtplayer)
	{
		if (key_jump2)
		{
			vsp = -20;
			if hsp == 0
			{
				sprite_index = spr_playerV_superjump;
				state = states.Sjump;
				substate = states.Sjump;
			}
			else if (state == states.normal || state == states.jump)
			{
				sprite_index = spr_playerV_superjump;
				state = states.jump;
			}
			image_index = 0;
			jumpAnim = true;
			jumpstop = true;
			other.hurtplayer = true;
		}
	}
}
