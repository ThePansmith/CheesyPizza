function scr_player_Sjump()
{
	move = key_right + key_left;
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	if (sprite_index == spr_superjump)
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), particle.cloudeffect, 0);
			steppybuffer = 8;
		}
		if (piledrivereffect > 0)
			piledrivereffect--;
		else
		{
			with (instance_create(x, y, obj_parryeffect))
			{
				sprite_index = spr_piledrivereffect;
				image_yscale = -1;
			}
			piledrivereffect = 15;
		}
	}
	if ((sprite_index == spr_superjump && character != "V") || sprite_index == spr_superspringplayer)
		vsp = sjumpvsp;
	sjumpvsp -= 0.1;
	if (character == "V" && image_index > 3)
		vsp = -11;
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++;
		hsp = xscale * a;
		vsp = 0;
	}
	if (scr_solid_player(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
		pizzapepper = 0;
		a = 0;
		if (sprite_index == spr_player_supersidejump)
			sprite_index = spr_player_supersidejumpland;
		if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
			sprite_index = spr_superjumpland;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				image_index = 0;
				if (grounded)
					vsp = -7;
			}
		}
		sound_play_oneshot_3d("event:/sfx/pep/groundpound", x, y);
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = false;
	}
	else if ((key_attack2 or input_buffer_slap > 0 or input_buffer_grab > 0) && character != "V" && character != "S" && sprite_index != spr_superspringplayer && sprite_index != spr_Sjumpcancelstart)
	{
		image_index = 0;
		sprite_index = spr_Sjumpcancelstart;
		
		sound_instance_move(sjumpcancelsnd, x, y);
		if character == "N"
		{
			sound_play_oneshot_3d(sfx_woag, x, y);
			
			/*
			if input_buffer_slap > 0 or noisetype == 1
			{
				jetpackcancel = true;
				if REMIX
					sound_play_oneshot_3d(sfx_jetpackstart, x, y);
			}
			else
			*/
				fmod_event_instance_play(sjumpcancelsnd);
		}
		else
			fmod_event_instance_play(sjumpcancelsnd);
		input_buffer_slap = 0;
	}
	if character == "S" && sprite_index == spr_superjump && key_attack2
	{
		if move != 0
			xscale = sign(move);
		state = states.jump;
		movespeed = 12 * xscale;
		if !key_jump2
			vsp = 0;
		jumpstop = false;
		sprite_index = spr_walljumpstart;
		sound_play_3d("event:/modded/sfx/kungfu", x, y);
	}
	if (sprite_index == spr_Sjumpcancelstart)
	{
		vsp = 0;
		if (move != 0)
			xscale = move;
		if (floor(image_index) == (image_number - 1))
		{
			jumpstop = true;
			if !jetpackcancel
				vsp = -4;
			flash = true;
			movespeed = 13;
			image_index = 0;
			sprite_index = spr_Sjumpcancel;
			state = states.mach3;
			with (instance_create(x, y, obj_crazyrunothereffect))
				image_xscale = other.xscale;
		}
	}
	/*
	if (character == "N" && key_jump2)
	{
		jumpstop = false;
		vsp = -15;
		state = states.jump;
		sprite_index = spr_playerN_noisebombspinjump;
		image_index = 0;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
	}
	if (character == "N")
	{
		if (move == 1)
			hsp = 3;
		if (move == -1)
			hsp = -3;
	}
	*/
	if (character == "V" && floor(image_index) == (image_number - 1) && sprite_index != spr_superspringplayer)
	{
		state = states.jump;
		sprite_index = spr_playerV_fall;
	}
	image_speed = 0.5;
	scr_collide_player();
}
