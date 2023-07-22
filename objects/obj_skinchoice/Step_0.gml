if live_call() return live_result;

if !init
	exit;

// get input
if anim_con == 0
	scr_getinput(true);
else
	scr_init_input();

#region change palette

var move_hor = key_left2 + key_right2;
if arrowbufferH == 0
	move_hor = key_left + key_right;

var move_ver = key_down2 - key_up2;
if arrowbufferV == 0
	move_ver = key_down - key_up;

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
			
			if palettes[sel.pal].texture == noone
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

/*
if move_hor != 0
{
	if mixing
	{
		var prevpal = sel.mix;
		sel.mix = clamp(sel.mix + move_hor, 0, array_length(mixables) - 1);
		
		if sel.mix != prevpal
		{
			charshift[0] = move_hor;
			charshift[2] = 0; // alpha
			sound_play(sfx_angelmove);	
		}
	}
	else
	{
		var prevpal = sel.pal;
		sel.pal = clamp(sel.pal + move_hor, 0, array_length(palettes) - 1);
	
		if sel.pal != prevpal
		{
			charshift[0] = move_hor;
			charshift[2] = 0; // alpha
			sound_play(sfx_angelmove);
		}
		
		if palettes[sel.pal].texture == noone
		{
			sel.mix = 0;
			mixing = false;
		}
	}
	
	
	
	flashpal[0] = sel.pal;
	flashpal[1] = 4;
}
*/

if key_left != 0 or key_right != 0
{
	if arrowbufferH == -1
		arrowbufferH = 20;
	else if arrowbufferH == 0
		arrowbufferH = 4;
}
else
	arrowbufferH = -1;

if key_up != 0 or key_down != 0
{
	if arrowbufferV == -1
		arrowbufferV = 20;
	else if arrowbufferV == 0
		arrowbufferV = 4;
}
else
	arrowbufferV = -1;

if arrowbufferH > 0
	arrowbufferH--;
if arrowbufferV > 0
	arrowbufferV--;

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

// cancel
if (key_slap or keyboard_check_pressed(vk_escape)) && anim_con == 0
{
	close_menu();
	sound_play(sfx_back);
	anim_con = 1;
}
if anim_con != 0 && anim_t <= 0
	instance_destroy();

// select
if key_jump && is_method(select) && anim_t >= 1
	select();

if characters[sel.char][0] == "N"
{
	create_transformation_tip("{u}[T] Toggle Pogo/", "noisetype");
	if key_taunt2
	{
		sound_play(sfx_step);
		noisetype = !noisetype;
	}
}
