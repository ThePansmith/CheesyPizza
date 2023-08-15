function scr_tvdraw_old()
{
	var panicy = 600 + (string_height(message) - 16);
	var tvx = 832 + irandom_range(-obj_camera.collect_shake, obj_camera.collect_shake);
	var tvy = 74 + irandom_range(-obj_camera.collect_shake, obj_camera.collect_shake);
	
	if tvreset != global.hud
	{
		alarm[0] = -1;
		tvreset = global.hud;
		imageindexstore = 0;
		once = false;
		yi = panicy;
		showtext = false;
		tvsprite = spr_tvdefault;
		image_speed = 0.1;
	}
	
	#region SPRITE
	
	alpha = 1;
	if instance_exists(obj_player1) && obj_player1.y < camera_get_view_y(view_camera[0]) + 200 && obj_player1.x > camera_get_view_x(view_camera[0]) + SCREEN_WIDTH - 200
		alpha = 0.5;
	
	if instance_exists(obj_itspizzatime)
	{
		message = "GET TO THE EXIT!!";
		alarm[0] = 200;
		showtext = true;
		tvsprite = spr_tvexit;
		image_speed = 0.25;
	}
	
	/*
	else if ((global.collect >= global.srank && !shownranks)
	or (global.collect >= global.arank && !shownranka)
	or (global.collect >= global.brank && !shownrankb)
	or (global.collect >= global.crank && !shownrankc))
	&& !global.snickchallenge
	{
		if !REMIX
			image_index = 0;
		
		image_speed = REMIX ? 0.1 : 0;
		showtext = true;
		alarm[0] = 200;
		
		if !shownrankc
		{
			message = "YOU GOT ENOUGH FOR RANK C!";
			tvsprite = spr_tvrankc;
			shownrankc = true;
		}
		else if !shownrankb
		{
			message = "YOU GOT ENOUGH FOR RANK B!";
			tvsprite = spr_tvrankb;
			shownrankb = true;
		}
		else if !shownranka
		{
			message = "YOU GOT ENOUGH FOR RANK A!";
			tvsprite = spr_tvranka;
			shownranka = true;
		}
		else if !shownranks && REMIX
		{
			message = "YOU GOT ENOUGH FOR RANK S!!!";
			tvsprite = spr_tvranks;
			shownranks = true;
		}
	}
	*/
	
	// good job you don't in fact suck
	else if instance_exists(obj_player1) && obj_player1.sprite_index == spr_player_levelcomplete
	{
		alarm[0] = 50
		tvsprite = spr_tvclap
		once = true
	}
	
	// owie moans in pain uwu
	else if instance_exists(obj_player1) && obj_player1.state == states.hurt 
	{
		if !once
			message = choose("OW!", "OUCH!", "OH!", "WOH!")
		
		showtext = true
		alarm[0] = 50
		tvsprite = spr_tvhurt
		once = true
	}
	
	// skull emoji face ass
	else if instance_exists(obj_player1)
	&& (obj_player1.state == states.timesup or obj_player1.state == states.ejected)
	{
		alarm[0] = 50
		tvsprite = spr_tvskull
	}
	
	// combo
	else if global.combo != 0 && global.combotime != 0
	&& (tvsprite == spr_tvdefault or tvsprite == spr_tvcombo or tvsprite == spr_tvescape)
	{
		tvsprite = spr_tvcombo
		imageindexstore = global.combo - 1;
	}
	
	// good job combo
	else if global.combotime <= 0 && tvsprite == spr_tvcombo
	{
		tvsprite = spr_tvcomboresult;
		image_speed = 0;
		image_index = min(imageindexstore, 3);
		alarm[0] = 50
	}
	
	if instance_exists(obj_player1) && obj_player1.state == states.keyget
	{
		showtext = true
		message = "GOT THE KEY!"
		alarm[0] = 50
	}
	
	#endregion
	#region DRAW
	
	var sugary = check_char("SP") or check_char("SN");
	var sprite = tvsprite;
	
	if sugary
	{
		sprite = global.combotime > 0 ? spr_tvcombo_ss : spr_tvdefault_ss;
		
		var asset = asset_get_index(sprite_get_name(tvsprite) + "_ss");
		if sprite_exists(asset)
			sprite = asset;
	}
	
	if global.combotime > 0 && (tvsprite == spr_tvcombo or sprite == spr_tvcombo_ss)
	{
		// combo tv
		if REMIX
		{
			draw_sprite_ext(sugary ? spr_tvcomboclear_ss : spr_tvcomboclear, 0, tvx, tvy, 1, 1, 0, c_white, alpha);
			draw_sprite_part_ext(sprite, imageindexstore % 5, 0, 0, 16 + (global.combotime / 60) * 148, 177, tvx - sprite_get_xoffset(sprite), tvy - sprite_get_yoffset(sprite), 1, 1, c_white, alpha);
		}
		else
			draw_sprite_ext(sprite, imageindexstore % 5, tvx, tvy, 1, 1, 0, c_white, alpha);
		
		if sugary // propeller
			draw_sprite_ext(spr_tvempty_ss, -1, tvx, tvy, 1, 1, 0, c_white, alpha);
		
		draw_set_align();
		draw_text(tvx + 20, tvy + 1, string(global.combo));
	}
	else if room != Realtitlescreen
	{
		// tv
		draw_sprite_ext(sprite, -1, tvx, tvy, 1, 1, 0, c_white, alpha);
		if tvsprite == spr_tvdefault
			draw_text(tvx - 4, tvy - 14, string(global.collect));
	}
	draw_set_alpha(1);
	
	// Text Event
	/*
	xi = (SCREEN_WIDTH / 2) + random_range(1, -1);
	if showtext
		yi = Approach(yi, SCREEN_HEIGHT - 8, 5);
	else
		yi = Approach(yi, panicy, 1);
	
	draw_set_font(global.bigfont);
	draw_set_align(fa_center, fa_bottom);
	draw_set_color(c_white);
	draw_text(xi, yi, string(message));
	draw_set_align();
	*/
	
	// timer
	if (global.panic or global.snickchallenge) && !instance_exists(obj_ghostcollectibles)
	{
		var minutes = 0;
		for (var seconds = ceil(global.fill / 12); seconds > 59; seconds -= 60)
			minutes++;
	
		draw_set_align(1, 1);
		draw_set_font(global.bigfont);
		draw_set_colour(minutes == 0 && seconds < 30 ? c_red : c_white);
		draw_text(timer_x + 153 + random_range(-1, 1), timer_y + 18 + random_range(-1, 1), concat(minutes, ":", (seconds < 10 ? "0" : "") + string(seconds)));
		
		// lap display
		if global.lap > 0
		{
			if !instance_exists(obj_ghostcollectibles)
				lap_y = Approach(lap_y, timer_ystart, 1);
			else
				lap_y = Approach(lap_y, timer_ystart + 212, 4);
			
			if instance_exists(obj_wartimer)
				lap_x = Approach(lap_x, SCREEN_WIDTH / 2 - 170, 1);
			else if !instance_exists(obj_pizzaface) or showtime_buffer > 0
				lap_x = timer_x + 85;
			else
				lap_x = Approach(lap_x, SCREEN_WIDTH / 2 + 32, 1);
			
			scr_draw_lap_display(lap_x, lap_y, lapflag_index, sugarylevel);
		}
	}
	
	// bullets
	if global.shootstyle == 1 && obj_player1.character != "V" && obj_player1.character != "S"
	{
		var bx = 780, by = 130, bpad = 10;
		var bspr = spr_bulletHUD;
		
		bx += bpad * max(ceil(global.bullet), 3);
		for (var i = 0; i < max(global.bullet, 3); i++)
		{
			var a = alpha, col = c_white;
			if i >= floor(global.bullet)
			{
				a = 0.25;
				col = c_black;
			}
			
		    bx -= bpad;
		    draw_sprite_ext(bspr, 0, bx, by, 1, 1, 0, col, a);
			if i == floor(global.bullet)
			{
				draw_set_flash();
				draw_sprite_part_ext(bspr, 0, 0, 0, 64, 37 * frac(global.bullet), bx - 10, by - 18, 1, 1, c_white, 0.75);
				draw_reset_flash();
			}
		}
	}
	
	// chainsaw
	if global.doublegrab == 3 && obj_player1.character != "V" && obj_player1.character != "S"
	{
		var bx = 860, by = 130, bpad = 15;
		var bspr = spr_fuelHUD;
		
		bx += bpad * max(ceil(global.fuel), 3);
		for (i = 0; i < max(global.fuel, 3); i++)
		{
			var a = alpha, col = c_white;
			if i >= floor(global.fuel)
			{
				a = 0.25;
				col = c_black;
			}
			
		    bx -= bpad;
		    draw_sprite_ext(bspr, 0, bx, by, 1, 1, 0, col, a);
			
			if i == floor(global.fuel)
			{
				draw_set_flash();
				draw_sprite_part_ext(bspr, 0, 0, 0, 40, 46 * frac(global.fuel), bx - 20, by - 23, 1, 1, c_white, 0.75);
				draw_reset_flash();
			}
		}
	}
	
	#endregion
}
