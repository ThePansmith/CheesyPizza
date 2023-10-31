live_auto_call;

if !init
	exit;
event_inherited();

#region MOVE

if anim_con != 2 switch sel.side
{
	// CHARACTER
	case 0:
		handx = lerp(handx, SCREEN_WIDTH / 2 - 50, 0.25);
		handy = lerp(handy, -200, 0.1);
	
		if move_hor != 0
		{
			if move_hor == -1
			{
				sideoffset = 10;
				fmod_event_instance_set_parameter(global.snd_golfjingle, "state", 0, true);
				fmod_event_instance_play(global.snd_golfjingle);
				exit;
			}
			
			sel.side = move_hor == 1 ? 1 : 2;
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
				skin_tip = 0;
			
				charshift[1] = move_ver;
				charshift[2] = 0; // alpha
			
				mixing = false;
				sel.mix = 0;
			
				sound_play(sfx_angelmove);
				event_user(0);
			}
		}
		break;
	
	// PALETTE
	case 1:
		if move_hor == -1 && sel.pal % 13 == 0 && !mixing
		{
			sel.side = 0;
			event_user(0);
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
		break;
	
	// CUSTOM
	case 2:
		if move_hor == 1
		{
			sel.side = 0;
			event_user(0);
			sound_play(sfx_angelmove);
		}
		break;
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
	mixing = tdp_input_get("player_attack").held or tdp_input_get("player_attackC").held;
}
mixingfade = Approach(mixingfade, mixing, 0.3);

#endregion

// charshifts
charshift[0] = lerp(charshift[0], 0, 0.25); // horizontal
charshift[1] = lerp(charshift[1], 0, 0.25); // vertical
charshift[2] = lerp(charshift[2], 1, 0.25); // alpha

// toggle noise pogo
if characters[sel.char][0] == "N" && check_char("N") && global.experimental
{
	create_transformation_tip("{u}[x] Toggle Pogo/", "noisetype");
	if key_delete2
	{
		sound_play(sfx_step);
		noisetype = !noisetype;
	}
}
