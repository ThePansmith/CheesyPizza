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
	superjumped = true;
	
	var vigilante = character == "V" && substate != states.Sjump;
	if (sprite_index == spr_superjump)
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), part.cloudeffect, 0);
			steppybuffer = 8;
		}
		if global.afterimage == 1
		{
			if (punch_afterimage > 0 && REMIX)
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				with (create_blue_afterimage(x, y, sprite_index, image_index, xscale))
		        {
		            playerid = other.id;
		            maxmovespeed = 6;
		        }
			}
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
	if ((sprite_index == spr_superjump && !vigilante) || sprite_index == spr_superspringplayer)
		vsp = sjumpvsp;
	sjumpvsp -= 0.1;
	if (vigilante && image_index > 3)
		vsp = -11;
	
	if !vigilante && image_index >= 11 && sprite_index == spr_playerV_superjump
		image_index = 5;
	
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++;
		hsp = xscale * a;
		vsp = 0;
	}
	if (scr_solid_player(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
		var mb = instance_place(x, y - 1, obj_metalblock);
		if !mb or !SUGARY
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
			sound_play_3d("event:/sfx/pep/groundpound", x, y);
			image_index = 0;
			state = states.Sjumpland;
			machhitAnim = false;
		}
	}
	else if ((key_attack2 or input_buffer_slap > 0 or input_buffer_grab > 0) && !vigilante && character != "S" && sprite_index != spr_superspringplayer && sprite_index != spr_Sjumpcancelstart)
	{
		image_index = 0;
		sprite_index = spr_Sjumpcancelstart;
		
		sound_instance_move(sjumpcancelsnd, x, y);
		if character == "N"
		{
			sound_play_3d(sfx_woag, x, y);
			
			/*
			if input_buffer_slap > 0 or noisetype == 1
			{
				jetpackcancel = true;
				if REMIX
					sound_play_3d(sfx_jetpackstart, x, y);
			}
			else
			*/
				fmod_event_instance_play(sjumpcancelsnd);
		}
		else
			fmod_event_instance_play(sjumpcancelsnd);
		
		if character == "SN"
			jetpackcancel = true;
		
		input_buffer_slap = 0;
	}
	if character == "S" && sprite_index == spr_superjump && (key_attack2 or input_buffer_slap > 0 or input_buffer_grab > 0)
	{
		if move != 0
			xscale = sign(move);
		state = states.jump;
		movespeed = 12 * xscale;
		if !key_jump2
			vsp = -4;
		jumpstop = false;
		sprite_index = spr_walljumpstart;
		sound_play_3d("event:/modded/sfx/kungfu", x, y);
	}
	if sprite_index == spr_Sjumpcancelstart
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
				copy_player_scale;
		}
	}
	
	if (character == "N" && noisetype == 1 && sprite_index == spr_superjump)
	{
		if key_jump2
		{
			jumpstop = false;
			vsp = -15;
			state = states.jump;
			sprite_index = spr_playerN_noisebombspinjump;
			image_index = 0;
			with (instance_create(x, y, obj_jumpdust))
				copy_player_scale;
		}
		else
		{
			if (move == 1)
				hsp = 3;
			if (move == -1)
				hsp = -3;
		}
	}
	
	if character == "SN"
	{
		if move != 0
			xscale = move;
		jetpackcancel = true;
	}
	
	if (vigilante && floor(image_index) == (image_number - 1) && sprite_index != spr_superspringplayer)
	{
		state = states.jump;
		sprite_index = spr_fall;
	}
	
	if state != states.Sjump
		substate = states.normal;
	
	image_speed = 0.5;
	scr_collide_player();
}
