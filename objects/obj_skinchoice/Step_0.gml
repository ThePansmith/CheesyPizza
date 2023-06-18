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
if arrowbuffer == 0
	move_hor += key_left + key_right;

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
	
	if arrowbuffer == -1
		arrowbuffer = 20;
	else
		arrowbuffer = 4;
}
if key_left == 0 && key_right == 0
	arrowbuffer = -1;
if arrowbuffer > 0
	arrowbuffer--;

#endregion
#region change character

var move_ver = key_down2 - key_up2;
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

#endregion
#region palette mixing

mixing = (palettes[sel.pal].texture != noone && key_attack);

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
