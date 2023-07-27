function scr_player_punch()
{
	#region uppercut
	
	if (sprite_index == spr_breakdanceuppercut or sprite_index == spr_breakdanceuppercutend)
	{
		move = key_left + key_right;
		landAnim = true;
		jumpstop = false;
		image_speed = 0.4;
		hsp = movespeed;
		if (move != 0)
		{
			dir = move;
			if REMIX && movespeed != 0
			{
				if move > 0
					movespeed = Approach(movespeed, max(move * 4, movespeed), 0.6);
				else
					movespeed = Approach(movespeed, min(move * 4, movespeed), 0.6);
			}
			else
				movespeed = Approach(movespeed, move * 4, 0.5);
		}
		else
			movespeed = Approach(movespeed, 0, 0.5);
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_breakdanceuppercut)
			sprite_index = spr_breakdanceuppercutend;
		if (grounded && vsp > 0 && (sprite_index == spr_breakdanceuppercut or sprite_index == spr_breakdanceuppercutend))
		{
			if (hsp != 0)
			{
				dir = sign(hsp);
				xscale = dir;
			}
			movespeed = abs(movespeed);
			state = states.normal;
		}
		if (punch_afterimage > 0)
			punch_afterimage--;
		else if (vsp < 0)
		{
			punch_afterimage = 5;
			with create_blue_afterimage(x, y, sprite_index, image_index, true)
			{
				image_xscale = other.xscale;
				playerid = other.id;
				vertical = true;
			}
		}
		
		// quick fall
		if REMIX && key_down && vsp < 10
			vsp = 10;
	}
	
	#endregion
	#region breakdance
	
	else if string_pos("breakdance", sprite_get_name(sprite_index))
	or string_pos("buttattack", sprite_get_name(sprite_index))
	{
		hsp = xscale * movespeed;
		
		if sprite_index == spr_breakdancesuper && key_shoot2
			movespeed = 14;
		if movespeed > 0 && sprite_index == spr_breakdancemove && grounded
			movespeed -= 0.25;
		if movespeed > 0 && sprite_index == spr_breakdancesuper
			movespeed -= 0.25;
		
		if sprite_index == spr_breakdancemove && floor(image_index) >= 14
			image_index = 4 + frac(image_index);
		
		if key_shoot2 && move == xscale && sprite_index == spr_breakdancemove
		{
			image_index = 0;
			sprite_index = spr_buttattackstart;
			movespeed = max(movespeed, 16);
			vsp = -5;
				
			if !instance_exists(crazyruneffectid)
			{
				with instance_create(x, y, obj_crazyrunothereffect)
				{
					playerid = other.object_index
					other.crazyruneffectid = id
				}
			}
		}
		if floor(image_index) == image_number - 1 && sprite_index == spr_buttattackstart
			sprite_index = spr_buttattack;
		
		if sprite_index == spr_buttattack or sprite_index == spr_buttattackstart
		{
			if grounded && vsp > 0
			{
				if key_attack
				{
					state = states.mach2;
					movespeed = max(movespeed, 6);
				}
				else
					sprite_index = spr_buttattackend;
			}
			else if key_down
			{
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				state = states.tumble;
				image_index = 0;
				
				if !grounded
				{
					sprite_index = spr_mach2jump;
					flash = false;
					vsp = 10;
				}
			}
		}
			
		if sprite_index == spr_buttattackend
		{
			movespeed -= 0.25;
			if key_attack
			{
				state = states.mach2;
				sprite_index = spr_rollgetup;
				image_index = 0;
			}
		}
			
		if key_shoot2 && sprite_index == spr_breakdancemove && move == 0
		{
			sprite_index = spr_breakdancesuper;
			movespeed = max(movespeed, 12);
		}
		
		if breakdance > 0
			breakdance--;
		
		landAnim = false;
		if movespeed <= 0 && (sprite_index == spr_breakdancesuper or sprite_index == spr_buttattackend)
			state = states.normal;
		if breakdance <= 0 && sprite_index == spr_breakdancemove
		{
			if key_attack
			{
				state = states.mach2;
				movespeed = max(movespeed, 6);
			}
			else
				state = states.normal;
		}
		if check_solid(x + xscale, y) && sprite_index == spr_breakdancesuper
			xscale *= -1;
		
		if sprite_index == spr_breakdancesuper
			image_speed = movespeed / 24;
		else
			image_speed = 0.4;
		
		if scr_solid(x + xscale, y) && !check_slope(x + sign(hsp), y) && !place_meeting(x + xscale, y, obj_destructibles)
		&& (!place_meeting(x + xscale, y, obj_destructibles) or (sprite_index != spr_buttattack && sprite_index != spr_buttattackstart))
		{
			if ledge_bump(32)
			{
				if sprite_index == spr_buttattack or sprite_index == spr_buttattackstart or sprite_index == spr_buttattackend
				{
					sound_play_3d(sfx_bumpwall, x, y);
					vsp = -4;
					sprite_index = spr_kungfujump;
					image_index = 0;
					state = states.punch;
					movespeed = -6;
				}
				else if sprite_index != spr_breakdancesuper
				{
					sound_play_oneshot_3d("event:/sfx/pep/splat", x, y);
					state = states.bump;
					image_index = 0;
					sprite_index = spr_wallsplat;
				}
			}
		}
		
		if movespeed > 5
		{
			if punch_afterimage > 0
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				with create_blue_afterimage(x, y, sprite_index, image_index, true)
				{
					image_xscale = other.xscale;
					playerid = other.id;
				}
			}
		
			if !instance_exists(obj_dashcloud2) && grounded
			{
				with instance_create(x, y, obj_dashcloud2)
					image_xscale = other.xscale
			}
		}
	}
	
	#endregion
	#region kungfu
	
	else
	{
		move = key_left + key_right;
		landAnim = true;
		image_speed = 0.4;
		if breakdance > 0
			breakdance--;
		if move != 0
		{
			if move != xscale && movespeed > -6
			{
				if (sprite_index != spr_kungfujump)
					movespeed -= 1;
				else
					movespeed -= 0.1;
			}
			else if move == xscale && movespeed < 6 && sprite_index != spr_kungfujump
				movespeed += 0.2;
		}
		hsp = xscale * movespeed;
		
		var _kungfuground = sprite_index == spr_kungfu1 or sprite_index == spr_kungfu2 or sprite_index == spr_kungfu3 or sprite_index == spr_shotgunsuplexdash;
		var _kungfuair = sprite_index == spr_kungfuair1 or sprite_index == spr_kungfuair2 or sprite_index == spr_kungfuair3 or sprite_index == spr_kungfuair1transition or sprite_index == spr_kungfuair2transition or sprite_index == spr_kungfuair3transition;
		var _Sjumpcancel = sprite_index == spr_player_Sjumpcancel or sprite_index == spr_player_Sjumpcancelland or sprite_index == spr_player_Sjumpcancelslide;
		
		if _kungfuground && image_index > 7 && !key_attack && movespeed > 0
			movespeed -= 0.5;
		else if _kungfuground && movespeed <= 12
		{
			movespeed += 0.2;
			if movespeed > 12
				movespeed = 12;
		}
		else if key_attack && move != 0 && REMIX
			movespeed += 0.02;
		
		// double tap move
		if (_kungfuground or _kungfuair) && input_buffer_slap > 0
		{
			input_buffer_slap = 0;
			scr_perform_move(moves.doublegrab, states.punch);
			exit;
		}
		
		if _kungfuground && input_buffer_jump > 0 && can_jump
		{
			scr_fmod_soundeffect(jumpsnd, x, y);
			input_buffer_jump = 0;
			particle_set_scale(particle.jumpdust, xscale, 1);
			create_particle(x, y, particle.jumpdust, 0);
			jumpstop = false;
			image_index = 0;
			vsp = -11;
			if character == "N" && noisetype == 1
				state = states.jump;
			else
				state = states.mach2;
			movespeed = max(movespeed, 6);
			
			if character == "P" or character == "PN" or character == "BN"
				sprite_index = spr_longjump;
			else
				sprite_index = spr_mach2jump;
		}
		else if _kungfuground && vsp < 0
			sprite_index = choose(spr_kungfuair1, spr_kungfuair2, spr_kungfuair3);
		
		if key_down && (_kungfuair or _kungfuground)
		{
			particle_set_scale(particle.jumpdust, xscale, 1);
			create_particle(x, y, particle.jumpdust, 0);
			state = states.tumble;
			image_index = 0;
			
			if !grounded
			{
				sprite_index = spr_mach2jump;
				flash = false;
				vsp = 10;
			}
			else
			{
				sprite_index = spr_crouchslip;
				movespeed = max(movespeed, 12);
				crouchslipbuffer = 25;
				fmod_event_instance_play(snd_crouchslide);
			}
		}
		if !key_jump2 && jumpstop == 0 && vsp < 0 && _kungfuair
		{
			vsp /= 20;
			jumpstop = true;
		}
		
		if floor(image_index) == image_number - 1
		{
			switch (sprite_index)
			{
				case spr_kungfu1:
				case spr_kungfu2:
				case spr_kungfu3:
				case spr_shotgunsuplexdash:
					/*
					state = states.normal;
					if (move != xscale && move != 0)
						movespeed = 2;
					*/
					if key_attack && !(character == "N" && noisetype == 1)
					{
						if move != 0
							xscale = move;
						state = states.mach2;
						movespeed = max(movespeed, 6);
					}
					else
					{
						state = states.normal;
						movespeed = max(movespeed, 0);
					}
					break;
						
				case spr_kungfuair1transition:
					sprite_index = spr_kungfuair1;
					break;
				case spr_kungfuair2transition:
					sprite_index = spr_kungfuair2;
					break;
				case spr_kungfuair3transition:
					sprite_index = spr_kungfuair3;
					break;
				case spr_player_Sjumpcancelland:
					sprite_index = spr_player_Sjumpcancelslide;
					break;
			}
		}
		if !_kungfuground && !_Sjumpcancel
		{
			if grounded && vsp >= 0
			{
				if key_attack && movespeed > 0 && !(character == "N" && noisetype == 1)
				{
					if move != 0
						xscale = move;
					state = states.mach2;
					movespeed = max(movespeed, 6);
				}
				else
					state = states.normal;
			}
		}
		if _Sjumpcancel
		{
			if grounded && vsp > 0
			{
				if sprite_index == spr_player_Sjumpcancel
				{
					sprite_index = spr_player_Sjumpcancelland;
					image_index = 0;
				}
				if key_attack
				{
					if movespeed >= 12
						state = states.mach3;
					else
						state = states.mach2;
					movespeed = abs(movespeed);
					sprite_index = spr_rollgetup;
					image_index = 0;
				}
				else if movespeed > 6
				{
					state = states.machslide;
					sprite_index = spr_machslidestart;
					image_index = 0;
				}
				else
					state = states.normal;
			}
			if sprite_index == spr_player_Sjumpcancelslide
				image_speed = abs(movespeed) / 15;
		}
		
		if sprite_index != spr_kungfujump && check_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles) && !check_slope(x + xscale, y)
		{
			if ledge_bump(32)
			{
				if (!grounded or scr_slope()) && !(character == "N" && noisetype == 1)
				{
					if !place_meeting(x + hsp, y, obj_unclimbablewall)
						wallspeed = movespeed;
					else
						wallspeed = -vsp;
					grabclimbbuffer = 10;
					state = states.climbwall;
					if REMIX
						vsp = -wallspeed;
				}
				else
				{
					sound_play_3d(sfx_bumpwall, x, y);
					vsp = -4;
					sprite_index = spr_kungfujump;
					image_index = 0;
					state = states.punch;
					movespeed = -6;
				}
			}
		}
		
		if punch_afterimage > 0
			punch_afterimage--;
		else
		{
			punch_afterimage = 5;
			with create_blue_afterimage(x, y, sprite_index, image_index, true)
			{
				image_xscale = other.xscale;
				playerid = other.id;
			}
		}
		
		if !instance_exists(obj_dashcloud2) && grounded && movespeed > 5
		{
			with instance_create(x, y, obj_dashcloud2)
				image_xscale = other.xscale;
		}
	}
	
	#endregion
}
