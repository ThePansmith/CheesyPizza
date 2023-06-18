with (obj_player1)
{
	if (character != "V")
	{
		if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other))
		&& (state == states.mach3 || (ghostdash == 1 && ghostpepper >= 3) || ratmount_movespeed >= 12
		|| state == states.rocket || state == states.knightpepslopes || state == states.shoulderbash
		or (character == "SP" && sprite_index == spr_machroll && abs(hsp) >= 12)
		or state == states.slipbanan))
		{
			playerindex = 0;
			instance_destroy(other);
		}
	}
}
if (place_meeting(x, y + 1, obj_player1) || place_meeting(x, y - 1, obj_player1) || place_meeting(x - 1, y, obj_player1) || place_meeting(x + 1, y, obj_player1))
{
	if (obj_player1.ghostdash == 1 && obj_player1.ghostpepper >= 3)
		instance_destroy();
	if (place_meeting(x, y - 1, obj_player1) && ((obj_player1.state == states.freefall || obj_player1.state == states.superslam) && obj_player1.freefallsmash >= 10))
	{
		with (instance_place(x, y - 1, obj_player1))
		{
			if (character == "M")
			{
				state = states.jump;
				vsp = -7;
				sprite_index = spr_jump;
			}
		}
		playerindex = 0;
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player1) && ((obj_player1.state == states.ratmountbounce && obj_player1.vsp > 0) || obj_player1.state == states.knightpep || obj_player1.state == states.hookshot))
	{
		playerindex = 0;
		instance_destroy();
	}
}
