function scr_pausedraw_ss()
{
	if live_call() return live_result;
	
	if fade > 0
	{
		draw_set_color(c_white);
		if pause
		{
			draw_set_alpha(1);
			scr_draw_pause_image();
		}
		
		var xscale = SCREEN_WIDTH / 960, yscale = SCREEN_HEIGHT / 540;
		var xx = floor(SCREEN_WIDTH / 2 - 960 / 2), yy = floor(SCREEN_HEIGHT / 2 - 540 / 2);
		
		draw_set_alpha(pause ? fade * 2 : fade);
		draw_sprite_tiled_ext(spr_pausebg_ss, 0, (current_time / 60) % 250 * xscale, (current_time / 60) % 100 * yscale, xscale, yscale, c_white, draw_get_alpha());
		
		toggle_alphafix(false);
		var bordercolor = #05002A;
		
		draw_reset_clip();
		draw_set_bounds(xx + 1, yy + 1, xx + 960 - 1, yy + 540 - 1, false, false, true);
		draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, bordercolor, bordercolor, bordercolor, bordercolor, false);
		draw_reset_clip();
		
		draw_sprite(spr_pause_ss, 0, xx, yy);
		
		// confecti
		if global.leveltosave != noone
		{
			draw_sprite(spr_pauseconfecti1, global.shroomfollow, xx, yy);
			draw_sprite(spr_pauseconfecti2, global.cheesefollow, xx, yy);
			draw_sprite(spr_pauseconfecti3, global.tomatofollow, xx, yy);
			draw_sprite(spr_pauseconfecti4, global.sausagefollow, xx, yy);
			draw_sprite(spr_pauseconfecti5, global.pineapplefollow, xx, yy);
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
		draw_sprite(spr_pause_char, char * 2 + global.panic, xx + 686, yy + 285);
		pal_swap_reset();
		
		// timer
		draw_set_font(global.bigfont_ss);
		draw_set_align(fa_center);
		draw_set_color(c_white);
		
		var _x = xx + 86, _y = yy + 40;
		if global.level_seconds > 10 
			draw_text(_x, _y, string(global.level_minutes) + ":" + string(floor(global.level_seconds)));
		if global.level_seconds < 10
			draw_text(_x, _y, string(global.level_minutes) + ":0" + string(floor(global.level_seconds)));
		
		// options
		var unselected_color = #9494AF;
		
		var len = array_length(pause_menu);
		for(var i = 0; i < len; i++)
		{
			var _x = xx + lerp(191, 68, i / (len - 1)), _y = yy + lerp(20, 393, i / (len - 1));
			draw_sprite(spr_pausebutton_ss, selected != i, _x, _y);
			draw_set_align(fa_left, fa_middle);
			
			var str = pause_menu[i];
			switch str
			{
				case "pause_resume": str = "RESUME"; break;
				case "pause_options": str = "OPTIONS"; break;
				case "pause_restart": str = "RETRY"; break;
				case "pause_exit": str = "EXIT\n  STAGE"; break;
				case "pause_exit_title": str = "EXIT\n  STAGE"; break;
				case "pause_jukebox": str = "CLEAR\n JUKEBOX"; break;
				case "pause_achievements": str = "CHEF\n TASKS"; break;
				default: str = string_upper(str); break;
			}
			
			draw_set_colour(selected == i ? c_white : unselected_color);
			draw_text_ext(floor(_x + 155 - string_width(str) / 2), floor(_y) + 70, str, 38, 960);
		}
	}
	draw_set_align();
	draw_set_alpha(1);
}
