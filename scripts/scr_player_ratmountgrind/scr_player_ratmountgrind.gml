function scr_player_ratmountgrind()
{
	hsp = movespeed;
	vsp = 0;
	move = key_left + key_right;
	if (move != 0)
	{
		xscale = move;
		movespeed = Approach(movespeed, move * 6, 0.5);
		sprite_index = spr_lonegustavohangwalk;
	}
	else
	{
		movespeed = Approach(movespeed, 0, 0.5);
		sprite_index = spr_lonegustavohang;
	}
	image_speed = 0.35;
	if (!place_meeting(x, y, obj_grindrailslope))
	{
		with (instance_place(x, y, obj_grindrail))
			other.y = y;
	}
	if place_meeting(x, y, obj_grindrail) && place_meeting(x, y - 2, obj_grindrailslope)
		y -= 2;
	
	/* if (move != 0)
	{
		var inst = instance_place(x + hsp, y - 32, obj_grindrailslope);
		if (inst == noone)
			inst = instance_place(x + hsp, y + 32, obj_grindrailslope);
		with (inst)
		{
			if (other.xscale == sign(image_xscale))
				other.vsp = -5;
			else
				other.vsp = 5;
		}
	}*/
	ds_list_clear(global.instancelist);
	if (!place_meeting(x, y, obj_grindrail) && !place_meeting(x, y, obj_grindrailslope))
	{
		state = states.ratmountjump;
		sprite_index = spr_ratmount_groundpoundfall;
	}
	if (input_buffer_jump > 0)
	{
		input_buffer_jump = 0;
		state = states.ratmountjump;
		if (key_down)
		{
			sprite_index = spr_ratmount_groundpoundfall;
			vsp = 5;
		}
		else
		{
			image_index = 0;
			sprite_index = spr_ratmount_groundpound;
			vsp = -11;
		}
		jumpstop = false;
		jumpAnim = true;
	}
}
