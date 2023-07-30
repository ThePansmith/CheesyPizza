function scr_cameradraw_old()
{
	if live_call() return live_result;
	
	var player = obj_player1;
	if instance_exists(player)
	{
		var _state = player.state;
		if _state == states.backbreaker
		{
			with obj_teleporter
			{
				if alarm[0] > -1 or alarm[1] > -1
					_state = storedstate;
			}
			with obj_warplaser
			{
				if alarm[0] > -1 or alarm[1] > -1
					_state = storedstate;
			}
		}
		if _state == states.chainsaw
			_state = player.tauntstoredstate;
		
		var hudface = -1;
		if player.character == "V"
		{
			if (healthshaketime > 0 && playerhealthup) or player.sprite_index == spr_playerV_keydoor or _state == states.keyget or _state == states.gottreasure 
				hudface = spr_playerV_happyHUD
			else if _state == states.mach1 or _state == states.mach2 or _state == states.mach3 or _state == states.machslide or _state == states.machroll
				hudface = spr_playerV_machHUD
			else if (healthshaketime > 0 && !playerhealthup) or _state = states.hurt
				hudface = spr_playerV_hurtHUD
			else if global.panic = true
				hudface = spr_playerV_panicHUD
			else if player.angry
				hudface = spr_playerV_angryHUD
			else
				hudface = spr_playerV_normalHUD
		}

		if player.character == "P"
		{
			if player.sprite_index == spr_knightpep_thunder
				hudface = spr_pepinoHUDthunder
			else if player.sprite_index != spr_knightpep_start && (_state == states.knightpep or _state == states.knightpepslopes)
				hudface = spr_pepinoHUDknight
			else if player.sprite_index == spr_bombpep_end
				hudface = spr_pepinoHUDbombend
			else if instance_exists(obj_itspizzatime)  or player.sprite_index = spr_bombpep_intro or player.sprite_index = spr_bombpep_runabouttoexplode or player.sprite_index = spr_bombpep_run or player.sprite_index = spr_player_fireass
				hudface = spr_pepinoHUDscream
			else if _state = states.Sjumpland or (_state = states.freefallland && shake_mag > 0)  
				hudface = spr_pepinoHUDstun
			else if player.sprite_index = spr_player_victory or _state = states.keyget or _state = states.smirk or _state = states.gottreasure or (_state = states.bossintro &&  player.sprite_index = spr_player_levelcomplete)
				hudface = spr_pepinoHUDhappy
			else if player.sprite_index = spr_player_machroll or player.sprite_index = spr_player_tumble
				hudface = spr_pepinoHUDrolling
			else if player.supercharged
				hudface = spr_pepinoHUDmenacing
			else if _state = states.mach1  or _state = states.chainsaw or _state = states.freefallprep or _state = states.freefall or  _state = states.tackle or _state = states.Sjump or _state = states.slam or  _state = states.Sjumpprep or _state = states.grab or _state = states.punch or _state = states.backbreaker or _state = states.backkick or _state = states.uppunch or _state = states.shoulder
				hudface = spr_pepinoHUDmach1
			else if _state = states.mach2 or player.sprite_index = spr_player_dive or player.sprite_index = spr_player_machslideboost or _state = states.climbwall or _state = states.handstandjump or _state = states.superslam 
				hudface = spr_pepinoHUDmach2
			else if _state = states.mach3 && player.sprite_index = spr_player_crazyrun 
				hudface = spr_pepinoHUDmach4
			else if _state = states.mach3 or player.sprite_index = spr_player_machslideboost3
				hudface = spr_pepinoHUDmach3
			else if _state = states.hurt or player.sprite_index = spr_bombpep_end or player.sprite_index = spr_player_fireassend or _state = states.timesup or _state = states.bombpep or (_state = states.bossintro &&  player.sprite_index = spr_player_bossintro) or (_state = states.bossintro &&  player.sprite_index = spr_player_idle)
				hudface = spr_pepinoHUDhurt
			else if player.angry
				hudface = spr_pepinoHUD3hp
			else if player.sprite_index = spr_player_hurtidle or player.sprite_index = spr_player_hurtwalk
				hudface = spr_pepinoHUD1hp
			else if global.panic or global.snickchallenge or global.miniboss
				hudface = spr_pepinoHUDpanic
			else if player.sprite_index = spr_shotgun_pullout
				hudface = spr_pepinoHUDmenacing
			else
				hudface = spr_pepinoHUD
		}

		if player.character == "S"
			hudface = spr_snickHUD

		if player.character == "N"
		{
			if player.sprite_index = player.spr_knightpepthunder
				hudface = spr_noiseHUD_thunder
			else if player.sprite_index != player.spr_knightpepstart && (_state = states.knightpep or _state = states.knightpepslopes)
				hudface = spr_noiseHUD_knight
			else if player.sprite_index = player.spr_bombpepend
				hudface = spr_noiseHUD_bomb
			else if instance_exists(obj_itspizzatime)  or player.sprite_index = player.spr_bombpepintro or player.sprite_index = player.spr_bombpeprunabouttoexplode or player.sprite_index = player.spr_bombpeprun or player.sprite_index = player.spr_fireass
				hudface = spr_noiseHUD_panic
			else if _state = states.Sjumpland or (_state = states.freefallland && shake_mag > 0)  
				hudface = spr_noiseHUD_groundpound
			//else if player.sprite_index = player.spr_victory or _state = states.keyget or _state = states.smirk or _state = states.gottreasure or (_state = states.bossintro &&  player.sprite_index = player.spr_player_levelcomplete)
			//	hudface = spr_noiseHUD_happy
			else if player.supercharged
				hudface = spr_noiseHUD_menacing
			else if _state = states.mach1  or _state = states.chainsaw or _state = states.freefallprep or _state = states.freefall or  _state = states.tackle or _state = states.Sjump or _state = states.slam or  _state = states.Sjumpprep or _state = states.grab or _state = states.punch or _state = states.backbreaker or _state = states.backkick or _state = states.uppunch or _state = states.shoulder
				hudface = spr_noiseHUD_mach1
			else if _state = states.pogo or _state = states.mach2 or player.sprite_index == player.spr_dive or player.sprite_index = player.spr_machslideboost or _state = states.climbwall or _state = states.handstandjump or _state = states.superslam 
				hudface = spr_noiseHUD_mach2
			else if _state = states.mach3 && player.sprite_index == player.spr_crazyrun 
				hudface = spr_noiseHUD_crazyrun
			else if _state = states.mach3 or player.sprite_index == player.spr_mach3boost
				hudface = spr_noiseHUD_mach3
			//else if _state = states.hurt or player.sprite_index = player.spr_bombpepend or player.sprite_index = player.spr_fireassend or _state = states.timesup or _state = states.bombpep or (_state = states.bossintro &&  player.sprite_index = player.spr_player_bossintro) or (_state = states.bossintro &&  player.sprite_index = player.spr_idle)
			//	hudface = spr_noiseHUD_hurt
			else if player.angry
				hudface = spr_noiseHUD_angry
			else if player.sprite_index == player.spr_hurtidle or player.sprite_index == player.spr_hurtwalk
				hudface = spr_noiseHUD_lowhealth
			else if global.panic or global.snickchallenge or global.miniboss
				hudface = spr_noiseHUD_panic
			else if player.sprite_index == player.spr_shotgunpullout
				hudface = spr_noiseHUD_menacing
			else
				hudface = spr_noiseHUD_idle
		}
		
		if sprite_exists(hudface)
		{
			gpu_set_blendmode(bm_normal);
			
			shader_set(global.Pal_Shader);
			if _state != states.cotton
				pal_swap_set(player.spr_palette, player.paletteselect, false)
			draw_sprite_ext(hudface, -1, 125, global.heatmeter ? 125 : 100, 1, 1, 0, c_white, alpha)
			pal_swap_reset();
			
			reset_blendmode();
			reset_shader_fix();
			
			// image speed
			/*
			var sprspd = sprite_get_speed(hudface);
			if sprspd != 1
				hudframe += sprspd;
			else
				hudframe += 0.35;
			if hudframe >= sprite_get_number(hudface)
				hudframe -= sprite_get_number(hudface);
			*/
		}
		
		// bwah
		scr_rankbubbledraw(40, 40);
		
		// heat meter
		if global.heatmeter
		{
			with obj_stylebar
			{
				depth = other.depth - 1;
				draw_sprite(sprite, index, 230, 75);
			}
		}
		
		// speed meter
		if !(player.character == "N" && player.noisetype == 1)
		{
			var yy = 140;
			if player.character == "SP" or player.character == "S"
				yy = 164;
			
			if global.heatmeter
				yy += 25;
			
			var speedbaractive = _state == states.mach1 or _state == states.mach2 or _state == states.mach3 or _state == states.climbwall or _state == states.machslide or _state == states.machroll or _state == states.handstandjump or player.character == "S";
			var frame = 0, movespeed = abs(player.movespeed);
			
			if movespeed < 2.4 or !speedbaractive
				frame = 0;
			else if speedbaractive
			{
				if movespeed >= 2.4 && movespeed < 4.8
					frame = 1;
				else if movespeed >= 4.8 && movespeed < 7.2
					frame = 2;
				else if movespeed >= 7.2 && movespeed < 9.6
					frame = 3;
				else if movespeed >= 9.6 && movespeed < 12
					frame = 4;
				else if movespeed >= 12
				{
					frame = -1;
					draw_sprite_ext(spr_speedbarmax, -1, 125, yy, 1, 1, 0, c_white, alpha);
				}
			}
			if frame >= 0
				draw_sprite_ext(spr_speedbar, frame, 125, yy, 1, 1, 0, c_white, alpha);
		}
		
		// pogo noise bullshit
		if player.character == "N" && player.noisetype == 1
		{
			with other
			{
				if player.pogospeed < 10
					draw_sprite_ext(spr_speedbar, 0, 125, 140, 1, 1, 0, c_white, alpha)
				else if player.pogospeed >= 10 && player.pogospeed < 14 
					draw_sprite_ext(spr_speedbar, 3, 125, 140, 1, 1, 0, c_white, alpha)
				else if player.pogospeed >= 14
					draw_sprite_ext(spr_speedbarmax, -1, 125, 140, 1, 1, 0, c_white, alpha)
			}

		}
		
		// fade
		if (player.y < camera_get_view_y(view_camera[0]) + 200 && player.x < camera_get_view_x(view_camera[0]) + 200)
			alpha = 0.5
		else
			alpha = 1
	}
}
