live_auto_call;

draw_set_font(global.bigfont);
draw_set_align(fa_left);
draw_reset_clip();

switch menu
{
	case 0:
		// levels
		var array = towers;
		for(var i = 0; i < array_length(array); i++)
		{
			var xx = 100 - cam.x, yy = i * 32 - cam.y;
			if fader <= 0 && sel.y != i
				continue;
			if yy < -32
				continue;
			if yy > SCREEN_HEIGHT
				break;
	
			draw_set_font(global.creditsfont);
			draw_set_align(fa_left);
	
			var this = array[i], str = this.name, wd = 32 * 17;
			var drawx = xx;
	
			if sel.y == i
			{
				draw_set_colour(c_white);
				if string_width(str) > wd
				{
					textscroll += 1.5;
			
					drawx -= clamp(textscroll - 50, 0, string_width(str) - wd);
					if textscroll >= string_width(str) - wd + 200
						textscroll = -50;
				}
			}
			else
			{
				draw_set_colour(c_gray);
				draw_set_alpha(fader);
			}
			if this.type == 0
				draw_sprite_ext(spr_towericon, 0, xx - 42, yy, 1, 1, 0, sel.y == i ? c_white : c_dkgray, draw_get_alpha());
	
			draw_set_bounds(xx, yy, xx + wd, yy + 32);
			draw_text(drawx, yy, str);
			draw_reset_clip();
			draw_set_alpha(1);
		}

		// control help
		if controls.text == ""
			controls.compiled = noone;
		else if controls.text != controls.text_prev
		{
			controls.text_prev = controls.text;
			controls.compiled = scr_compile_icon_text(controls.text);
		}
		if controls.compiled != noone
			scr_draw_text_arr(16, SCREEN_HEIGHT - 32 - 16, controls.compiled);

		// top right
		if state == 0
		{
			var yy = 0;
	
			// browse
			/*
			draw_set_font(global.font_small);
			draw_set_align(fa_right);
			draw_set_color(c_white);
		
			if text_button(SCREEN_WIDTH - 16, 16 + (yy++ * 32), $"Browse towers") == 2
			{
				page = 1;
				fetch_remote_towers(page);
				
				sel.x = 0;
				sel.y = 0;
			}
			*/
			
			// open levels folder
			if has_pizzatower && directory_exists(towers_folder + "\\towers")
			{
				draw_set_font(global.font_small);
				draw_set_align(fa_right);
				draw_set_color(c_white);
		
				if text_button(SCREEN_WIDTH - 16, 16 + (yy++ * 32), $"Open towers folder") == 2
					launch_external("explorer.exe " + towers_folder + "\\towers");
			}
	
			// level filename
			if array_length(towers) > 0
			{
				var level = towers[sel.y];
				draw_set_font(global.font_small);
				draw_set_align(fa_right);
				draw_set_color(c_gray);
				draw_text(SCREEN_WIDTH - 16, 16 + (yy++ * 32), $"{filename_name(level.file)}");
				draw_set_align();
			}
			else
			{
				draw_set_font(global.creditsfont);
				draw_set_align(fa_center, fa_middle);
				draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, "No levels found!");
			}
		}
		break;
	
	case 1:
		// 0 - loading listing
		// 1 - loaded
		// 2 - downloading level
		
		if state == 0
		{
			image_angle += 5;
			draw_sprite_ext(spr_loading, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 1, 1, image_angle, c_white, 1);
			exit;
		}
		else
		{
			if keyboard_check_pressed(ord("T"))
			{
				fetch_tower_image(0);
				trace(remote_towers[i].image);
			}
			for(var i = 0; i < array_length(remote_towers); i++)
			{
				var spr = remote_towers[i].image;
				if sprite_exists(spr)
					draw_sprite_ext(spr, 0, 0, 100 * i, 0.25, 0.25, 0, c_white, 1);
			}
		}
		break;
}
draw_set_align();
