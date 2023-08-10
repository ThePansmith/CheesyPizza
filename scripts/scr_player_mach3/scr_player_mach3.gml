function scr_player_mach3()
{
	#region PEPPINO / VIGI
	
	if !jetpackcancel
	{
		if (windingAnim < 2000)
			windingAnim++;
		if (place_meeting(x, y + 1, obj_railparent))
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			railmovespeed = _railinst.movespeed;
			raildir = _railinst.dir;
		}
		hsp = (xscale * movespeed) + (railmovespeed * raildir);
		if (grounded)
		{
			if ((scr_slope() && hsp != 0) && movespeed > 10 && movespeed < 18)
				scr_player_addslopemomentum(0.1, 0.2);
		}
		if (move == xscale && grounded)
		{
			if (movespeed < 20)
			{
				if (mach4mode == 0)
					movespeed += 0.025;
				else
					movespeed += 0.1;
				
				if character == "N"
					movespeed += 0.05;
			}
		}
		mach2 = 100;
		momemtum = true;
		move = key_right + key_left;
		move2 = key_right2 + key_left2;
		if (fightball == 1 && global.coop == 1)
		{
			if (object_index == obj_player1)
			{
				x = obj_player2.x;
				y = obj_player2.y;
			}
			if (object_index == obj_player2)
			{
				x = obj_player1.x;
				y = obj_player1.y;
			}
		}
		if (sprite_index == spr_crazyrun)
		{
			if (flamecloud_buffer > 0)
				flamecloud_buffer--;
			else
			{
				flamecloud_buffer = 10;
				with (instance_create(x, y, obj_dashcloud))
				{
					image_xscale = other.xscale;
					sprite_index = spr_flamecloud;
				}
			}
		}
		crouchslideAnim = true;
		if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
		{
			vsp /= 20;
			jumpstop = true;
		}
		if (grounded && vsp > 0)
			jumpstop = false;
		if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
		{
			input_buffer_jump = 0;
			scr_fmod_soundeffect(jumpsnd, x, y);
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
			if (sprite_index != spr_fightball)
			{
				image_index = 0;
				sprite_index = spr_mach3jump;
			}
			vsp = character != "N" ? -11 : -13;
			
			if character == "SN"
			{
				state = states.twirl;
				sprite_index = spr_pizzano_machtwirl;
				vsp = -12;
			}
		}
		if (fightball == 0)
		{
			if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
				sprite_index = spr_mach4;
			if (sprite_index == spr_Sjumpcancel && grounded)
				sprite_index = spr_mach4;
			if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach || sprite_index == spr_player_pistolshot))
				sprite_index = spr_mach4;
			if (sprite_index == spr_mach2jump && grounded && vsp > 0)
				sprite_index = spr_mach4;
			if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_Sjumpcancelstart && sprite_index != spr_taunt)
			{
				mach4mode = true;
				flash = true;
				sprite_index = spr_crazyrun;
			}
			else if (movespeed <= 16 && sprite_index == spr_crazyrun)
				sprite_index = spr_mach4;
		}
		if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
		{
			with (instance_create(x, y, obj_crazyrunothereffect))
			{
				playerid = other.object_index;
				other.crazyruneffectid = id;
			}
		}
		if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
			image_speed = 0.4;
		else if (sprite_index == spr_crazyrun)
			image_speed = 0.75;
		else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
			image_speed = 0.4;
		if (!key_attack && fightball == 0 && !launched) && sprite_index != spr_dashpadmach && grounded && vsp > 0
		{
			sprite_index = spr_machslidestart;
			sound_play_oneshot_3d("event:/sfx/pep/break", x, y);
			state = states.machslide;
			image_index = 0;
			launched = false;
		}
		if (move == -xscale && grounded && vsp > 0 && !launched && fightball == 0 && sprite_index != spr_dashpadmach)
		{
			sound_play_oneshot_3d("event:/sfx/pep/machslideboost", x, y);
			sprite_index = spr_mach3boost;
			state = states.machslide;
			image_index = 0;
		}
		if (key_down && fightball == 0 && sprite_index != spr_dashpadmach)
		{
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
			flash = false;
			state = states.tumble;
			image_index = 0;
			vsp = 10;
			if (!grounded)
				sprite_index = spr_mach2jump;
			else if character == "P"
				sprite_index = spr_player_machroll;
			else
				sprite_index = spr_machroll;
			//if (character == "V")
			//	sprite_index = spr_playerV_divekickstart;
		}
		if ((!grounded && (check_solid(x + hsp, y) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && (!place_meeting(x + hsp, y, obj_metalblock) or character == "V")) || (grounded && (check_solid(x + sign(hsp), y - 16) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && check_slope(x, y + 1)))
		{
			wallspeed = movespeed;
			grabclimbbuffer = 0;
			if (movespeed < 1)
				wallspeed = 1;
			else
				movespeed = wallspeed;
			state = states.climbwall;
			if REMIX
				vsp = -wallspeed;
		}
		if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_metalblock) or character == "V"))
		{
			wallspeed = movespeed;
			grabclimbbuffer = 0;
			state = states.climbwall;
		}
			
		if character != "V" && character != "S"
		{
			// shoot
			if sprite_index != spr_dashpadmach
			{
				if (input_buffer_shoot > 0 && shotgunAnim)
					scr_shotgunshoot();
				else if (input_buffer_pistol > 0 && global.pistol)
				or (global.shootstyle == 1 && key_shoot2)
					scr_pistolshoot(states.mach3);
				else if key_shoot2
					scr_perform_move(moves.shootattack, states.mach3);
			}
			
			// grab
			if (input_buffer_grab > 0 && !key_up && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol)) && sprite_index != spr_dashpadmach && (!suplexmove or character != "SP"))
			{
				input_buffer_grab = 0;
				input_buffer_slap = 0;
					
				sprite_index = shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash;
				suplexmove = true;
				fmod_event_instance_play(suplexdashsnd);
				particle_set_scale(part.jumpdust, xscale, 1);
				create_particle(x, y, part.jumpdust, 0);
				state = states.handstandjump;
				if (movespeed < 5)
					movespeed = 5;
				image_index = 0;
			}
			
			// uppercut
			else if ((input_buffer_slap > 0 or input_buffer_grab > 0) && key_up && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol)) && sprite_index != spr_dashpadmach)
			{
				input_buffer_slap = 0;
				input_buffer_grab = 0;
				state = states.punch;
				image_index = 0;
				sprite_index = spr_breakdanceuppercut;
				fmod_event_instance_play(snd_uppercut);
				vsp = -10;
				movespeed = hsp;
				
				particle_set_scale(part.highjumpcloud2, xscale, 1);
				create_particle(x, y, part.highjumpcloud2, 0);
			}
			
			// kungfu
			else if input_buffer_slap > 0 && !key_up && !suplexmove && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol))
			{
				input_buffer_slap = 0;
				scr_perform_move(moves.grabattack, states.mach3);
			}
		}
			
		if ((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y)) && (!place_meeting(x + sign(hsp), y, obj_metalblock) or character == "V") && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
		{
			var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if (_bump)
			{
				with (obj_camera)
				{
					shake_mag = 20;
					shake_mag_acc = 40 / room_speed;
				}
				with (obj_baddie)
				{
					if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
					{
						stun = true;
						alarm[0] = 200;
						ministun = false;
						vsp = -5;
						hsp = 0;
					}
				}
				if (!fightball)
				{
					sprite_index = spr_hitwall;
					sound_play_oneshot_3d("event:/sfx/pep/groundpound", x, y);
					sound_play_oneshot_3d("event:/sfx/pep/bumpwall", x, y);
					hsp = 0;
					flash = false;
					state = states.bump;
					hsp = -6 * xscale;
					vsp = -6;
					mach2 = 0;
					image_index = 0;
					instance_create(x + (xscale * 15), y + 10, obj_bumpeffect);
				}
				else
				{
					fightball = false;
					with (obj_player)
					{
						sprite_index = spr_hitwall;
						sound_play_oneshot_3d("event:/sfx/pep/groundpound", x, y);
						sound_play_oneshot_3d("event:/sfx/pep/bumpwall", x, y);
						hsp = 0;
						flash = false;
						state = states.bump;
						hsp = -6 * xscale;
						vsp = -6;
						mach2 = 0;
						image_index = 0;
						instance_create(x + 10, y + 10, obj_bumpeffect);
					}
				}
			}
		}
		if (key_slap2 && character == "V")
		{
			vsp = -5;
			state = states.revolver;
			image_index = 0;
			sprite_index = spr_playerV_airrevolver;
			image_index = 0;
			with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
			{
				is_solid = false;
				image_xscale = other.xscale;
			}
			sound_play_oneshot_3d("event:/sfx/pep/pistolshot", x + (xscale * 20), y);
		}
		if (key_chainsaw2 && character == "V" && !instance_exists(dynamite_inst))
		{
			vsp = -5;
			state = states.dynamite;
			image_index = 0;
			sprite_index = spr_playerV_dynamitethrow;
			with (instance_create(x, y, obj_dynamite))
			{
				image_xscale = other.xscale;
				playerid = other.id;
				other.dynamite_inst = id;
				movespeed = other.movespeed + 4;
				vsp = -6;
			}
		}
		if (scr_check_superjump() && fightball == 0 && state == states.mach3 && character != "V" && grounded && vsp > 0 && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
		{
			sprite_index = spr_superjumpprep;
			state = states.Sjumpprep;
			hsp = 0;
			image_index = 0;
		}
	}
	
	#endregion
	#region NOISE JETPACK
	
	else
	{
		hsp = xscale * movespeed;
		move = key_right + key_left;
		if (fightball == 0)
			vsp = 0;
		if (key_up && fightball == 0)
			vsp = -3;
		if (key_down && fightball == 0)
			vsp = 3;
		if (abs(hsp) < 20 && move == xscale)
		{
			movespeed += 0.075;
			if (!instance_exists(crazyruneffectid) && grounded)
			{
				with (instance_create(x, y, obj_crazyruneffect))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
				if (sprite_index == spr_crazyrun)
				{
					if (flamecloud_buffer > 0)
						flamecloud_buffer--;
					else
					{
						flamecloud_buffer = 220 + irandom_range(1, 180);
						with (instance_create(x, y, obj_dashcloud))
						{
							image_xscale = other.xscale;
							sprite_index = spr_flamecloud;
						}
					}
				}
			}
		}
		else if movespeed > 12 && move != xscale
			movespeed -= 0.1;
		
		if character == "SN"
			sprite_index = grounded ? spr_pizzano_mach3 : spr_pizzano_sjumpside;
		else if movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_Sjumpcancelstart && sprite_index != spr_taunt
		{
			mach4mode = true;
			flash = true;
			sprite_index = spr_crazyrun;
		}
		else if movespeed <= 16
			sprite_index = spr_playerN_jetpackboost;
		
		if (key_jump2 && fightball == 0)
		{
			input_buffer_jump = 0;
			
			sound_play_3d(sfx_jump, x, y);
			sound_play_3d("event:/modded/sfx/kungfu", x, y);
			
			dir = xscale;
			momemtum = false;
			jumpstop = false;
			vsp = -15;
			
			if character == "SN"
			{
				// boring ass sugary way
				/*
				state = states.mach2;
				sprite_index = spr_secondjump1;
				image_index = 0;
				*/
				
				// good cheesed up way
				state = states.twirl;
				sprite_index = movespeed >= 12 ? spr_pizzano_machtwirl : spr_pizzano_twirl;
			}
			else
			{
				state = states.jump;
				sprite_index = spr_playerN_noisebombspinjump;
				image_index = 0;
			}
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
		}
		if (key_down && fightball == 0 && !place_meeting(x, y, obj_dashpad) && grounded)
		{
			flash = false;
			sprite_index = spr_playerN_jetpackslide;
			if character == "SN"
				sprite_index = spr_pizzano_crouchslide;
		}
		if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && (!check_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y)) && (!place_meeting(x + sign(hsp), y, obj_metalblock) && character != "V") && (!place_meeting(x + sign(hsp), y, obj_destructibles) && character != "V") && !place_meeting(x + sign(hsp), y, obj_hungrypillar)
		{
			var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if _bump
			{
				with (obj_camera)
				{
					shake_mag = 20;
					shake_mag_acc = 40 / room_speed;
				}
				with (obj_baddie)
				{
					if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
					{
						stun = true;
						alarm[0] = 200;
						ministun = false;
						vsp = -5;
						hsp = 0;
					}
				}
				sprite_index = spr_hitwall;
				sound_play_oneshot_3d("event:/sfx/pep/groundpound", x, y);
				sound_play_oneshot_3d("event:/sfx/pep/bumpwall", x, y);
				hsp = 0;
				flash = false;
				state = states.bump;
				hsp = -6 * xscale;
				vsp = -6;
				mach2 = 0;
				image_index = 0;
				instance_create(x + (xscale * 15), y + 10, obj_bumpeffect);
			}
		}
		if character == "SN" && key_slap
		{
			sprite_index = spr_bodyslamstart;
			image_index = 0;
			state = states.freefall;
			pistolanim = -4;
			vsp = -6;
		}
	}
	
	#endregion
	
	var b = false;
	with (obj_hamkuff)
	{
		if (state == states.blockstance && playerid == other.id)
			b = true;
	}
	if (!instance_exists(dashcloudid) && grounded && !b)
	{
		var p = instance_create(x, y, obj_superdashcloud);
		with p
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar);
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
		if place_meeting(x, y + 1, obj_water)
			p.sprite_index = spr_watereffect;
	}
	scr_dotaunt();
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index;
			other.chargeeffectid = id;
		}
	}
	if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
		image_speed = 0.4;
	else if (sprite_index == spr_crazyrun)
		image_speed = 0.75;
	else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
		image_speed = 0.4;
	else
		image_speed = 0.4;
	
	/*
	if (global.attackstyle == 2 && key_slap2)
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
		image_index = 0;
		state = states.lungeattack;
	}
	*/
}
