function scr_pausedraw_ss()
{
	if fade > 0
	{
		draw_set_color(c_white);
		if pause
		{
			draw_set_alpha(1);
			scr_draw_pause_image();
		}
		
		draw_set_alpha(pause ? fade * 2 : fade);
		draw_sprite_tiled(spr_pausebg_ss, 0, (current_time / 60) % 250, (current_time / 60) % 100);
		gpu_set_blendmode(bm_normal);
		draw_sprite(spr_pause_ss, 0, 0, 0);
		
		// confecti
		if global.leveltosave != noone
		{
			draw_sprite(spr_pauseconfecti1, global.shroomfollow, 0, 0);
			draw_sprite(spr_pauseconfecti2, global.cheesefollow, 0, 0);
			draw_sprite(spr_pauseconfecti3, global.tomatofollow, 0, 0);
			draw_sprite(spr_pauseconfecti4, global.sausagefollow, 0, 0);
			draw_sprite(spr_pauseconfecti5, global.pineapplefollow, 0, 0);
		}
		
		// character
		var char = 0;
		switch character
		{
			case "SN": char = 1; break;
			case "PN": char = 2; break;
			case "P": char = 3; break;
			case "N": char = 4; break;
		}
		
		shader_set(shd_pal_swapper);
		pattern_set(global.Base_Pattern_Color, spr_pause_char, char * 2 + global.panic, 1, 1, global.palettetexture);
		pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite(spr_pause_char, char * 2 + global.panic, 686, 285);
		pal_swap_reset();
		
		// timer
		draw_set_font(global.bigfont_ss);
		draw_set_align(fa_center);
		draw_set_color(c_white);
		
		var _x = 86, _y = 40;
		if global.level_seconds > 10 
			draw_text(_x, _y, string(global.level_minutes) + ":" + string(floor(global.level_seconds)));
		if global.level_seconds < 10
			draw_text(_x, _y, string(global.level_minutes) + ":0" + string(floor(global.level_seconds)));
		
		// options
		var unselected_color = #9494AF;
		
		var len = array_length(pause_menu);
		for(var i = 0; i < len; i++)
		{
			var xx = lerp(191, 68, i / (len - 1)), yy = lerp(20, 393, i / (len - 1));
			draw_sprite(spr_pausebutton_ss, selected != i, xx, yy);
			draw_set_align(fa_left, fa_middle);
			
			var str = pause_menu[i];
			switch str
			{
				case "pause_resume": str = "RESUME"; break;
				case "pause_options": str = "OPTIONS"; break;
				case "pause_restart": str = "RETRY"; break;
				case "pause_exit": str = "EXIT\n  STAGE"; break;
				case "CLEAR JUKEBOX": str = "CLEAR\n JUKEBOX"; break;
				default: str = string_upper(str); break;
			}
			
			draw_set_colour(selected == i ? c_white : unselected_color);
			draw_text_ext(xx + 155 - string_width(str) / 2, yy + 70, str, 38, 960);
		}
	}
	draw_set_align();
	draw_set_alpha(1);
}
