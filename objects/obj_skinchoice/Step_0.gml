//live_auto_call;

if !init
	exit;
event_inherited();

#region change palette

if sel.side == 0 && anim_con != 2
{
	handx = lerp(handx, 160, 0.25);
	handy = lerp(handy, 220, 0.25);
	
	if move_hor != 0
	{
		sel.side = 1;
		sound_play(sfx_angelmove);
		
		flashpal[0] = sel.pal;
		flashpal[1] = 4;
	}
	if move_ver != 0
	{
		var prevpal = sel.char;
		sel.char = clamp(sel.char + move_ver, 0, array_length(characters) - 1);
	
		if sel.char != prevpal
		{
			charshift[1] = move_ver;
			charshift[2] = 0; // alpha
			sound_play(sfx_angelmove);
			event_user(0);
		
			mixing = false;
			sel.mix = 0;
		}
	}
}
else
{
	if move_hor == -1 && sel.pal % 13 == 0 && !mixing
	{
		sel.side = 0;
		sound_play(sfx_angelmove);
	}
	else
	{
		if !mixing
		{
			var prevpal = sel.pal;
			if (sel.pal % 13 != 12 or move_hor == -1) && sel.pal + move_hor < array_length(palettes)
				sel.pal += move_hor;
		
			if sel.pal + move_ver * 13 >= 0 && sel.pal + move_ver * 13 < array_length(palettes)
				sel.pal += move_ver * 13;
		
			if sel.pal != prevpal
			{
				charshift[0] = -0.75;
				charshift[2] = 0; // alpha
				sound_play(sfx_angelmove);
		
				flashpal[0] = sel.pal;
				flashpal[1] = 4;
			}
			
			if palettes[sel.pal].texture == noone or palettes[sel.pal].palette != 12
			{
				sel.mix = 0;
				mixing = false;
			}
		}
		else
		{
			var prevpal = sel.mix;
			if (sel.mix % 13 != 12 or move_hor == -1) && sel.mix + move_hor < array_length(mixables) && sel.mix + move_hor >= 0
				sel.mix += move_hor;
		
			if sel.mix + move_ver * 13 >= 0 && sel.mix + move_ver * 13 < array_length(mixables)
				sel.mix += move_ver * 13;
		
			if sel.mix != prevpal
			{
				charshift[0] = -0.75;
				charshift[2] = 0; // alpha
				sound_play(sfx_angelmove);
				
				flashpal[0] = sel.mix;
				flashpal[1] = 4;
			}
		}
	}
}

if flashpal[1] > 0
	flashpal[1]--;
else
	flashpal[0] = -1;

#endregion
#region palette mixing

mixing = false;
if array_length(mixables) > 1 && sel.side == 1 && palettes[sel.pal].texture != noone
{
	create_transformation_tip("{u}[M] Mix Palettes/", "palettemixing");
	mixing = key_attack;
}
mixingfade = Approach(mixingfade, mixing, 0.3);

#endregion

// charshifts
charshift[0] = lerp(charshift[0], 0, 0.25); // horizontal
charshift[1] = lerp(charshift[1], 0, 0.25); // vertical
charshift[2] = lerp(charshift[2], 1, 0.25); // alpha

// toggle noise pogo
if characters[sel.char][0] == "N" && global.experimental
{
	create_transformation_tip("{u}[T] Toggle Pogo/", "noisetype");
	if key_taunt2
	{
		sound_play(sfx_step);
		noisetype = !noisetype;
	}
}
