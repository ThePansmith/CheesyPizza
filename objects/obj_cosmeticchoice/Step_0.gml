live_auto_call;
event_inherited();

if move_ver != 0
{
	switch sel.side
	{
		// hat
		case 0:
			var sel_prev = sel.hat;
			sel.hat = clamp(sel.hat + move_ver, 0, array_length(hats) - 1);
			
			if sel_prev != sel.hat
			{
				sound_play(sfx_step);
				charshift[0] = move_ver * 50;
				charshift[2] = 0;
			}
			break;
		
		// pet
		case 1:
			var sel_prev = sel.pet;
			sel.pet = clamp(sel.pet + move_ver, 0, array_length(pets) - 1);
			
			if sel_prev != sel.pet
			{
				sound_play(sfx_step);
				charshift[1] = move_ver * 50;
				charshift[3] = 0;
			}
			break;
	}
}
if (sel.side == 0 && move_hor == 1)
or (sel.side == 1 && move_hor == -1)
{
	sel.side = !sel.side;
	sound_play(sfx_angelmove);
}

charshift[0] = lerp(charshift[0], 0, 0.25); // hat
charshift[1] = lerp(charshift[1], 0, 0.25); // pet
charshift[2] = lerp(charshift[2], 1, 0.25); // alpha
charshift[3] = lerp(charshift[3], 1, 0.25); // alpha
