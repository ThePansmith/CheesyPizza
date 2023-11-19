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
			var xx = 100 - cam.x + random_range(-shake, shake), yy = i * 32 - cam.y + random_range(-shake, shake);
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
			controls.compiled = scr_compile_icon_text(controls.text, 1, true);
		}
		if controls.compiled != noone
		{
			draw_set_colour(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(0, SCREEN_HEIGHT - 32 - 8 - 8, SCREEN_WIDTH, SCREEN_HEIGHT, false);
			draw_set_alpha(1);
			scr_draw_text_arr(SCREEN_WIDTH - 8 - controls.compiled[2], SCREEN_HEIGHT - 32 - 8, controls.compiled[0]);
		}

		// top right
		if state == 0
		{
			var yy = 0;
	
			// browse
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
			
			// open levels folder
			if has_pizzatower && directory_exists(towers_folder)
			{
				draw_set_font(global.font_small);
				draw_set_align(fa_right);
				draw_set_color(c_white);
		
				if text_button(SCREEN_WIDTH - 16, 16 + (yy++ * 32), $"Open towers folder") == 2
					launch_external("explorer.exe " + towers_folder);
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
		
		draw_set_colour(c_black);
		draw_set_alpha(0.9);
		draw_roundrect(16 - 1, 16 - 1, SCREEN_WIDTH - 16 - 1, SCREEN_HEIGHT - 16 - 1, false);
		draw_set_alpha(1);
		draw_set_colour(c_white);
		
		draw_set_font(global.font_small);
		var center = 582 + (530 * 0.65 / 2);
		
		if state == 0
		{
			image_angle += 5;
			draw_sprite_ext(spr_loading, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 1, 1, image_angle, c_white, 1);
			
			draw_set_align(fa_center);
			draw_text(center, SCREEN_HEIGHT - 20 - 50, $"Page: {page}");
			exit;
		}
		else
		{
			var xxstart = 36, yystart = 32;
			var xx = xxstart, yy = yystart;
			
			draw_set_bounds(16 + 1, 16 + 1, SCREEN_WIDTH - 16, SCREEN_HEIGHT - 16);
			
			var temp_sel = sel.y;
			if mouse_check_button_pressed(mb_left)
				temp_sel = -1;
			
			var col1 = merge_color(#5000b8, c_white, 0.5);
			var col2 = merge_color(#1070d0, c_white, 0.5);
			for(var i = 0; i < array_length(remote_towers); i++)
			{
				var this = remote_towers[i];
				var scale = 0.3;
				var sprw = 530 * scale, sprh = 298 * scale;
				
				var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, xx, yy - scroll, xx + sprw, yy + 180 - scroll);
				if hovering && state == 1
				{
					draw_rectangle_color(xx - 4, yy - 4 - scroll, xx + sprw + 4, yy + 180 + 4 - scroll, c_aqua, c_aqua, c_aqua, c_aqua, true);
					if mouse_check_button_pressed(mb_left)
					{
						if sel.y == i
							sel.y = -1;
						else
							sel.y = i;
						temp_sel = sel.y;
					}
				}
				
				draw_set_colour(c_white);
				if sel.y > -1 && sel.y != i
					draw_set_colour(#555555);
				
				draw_rectangle_color(xx, yy - scroll, xx + sprw - 1, yy + sprh - 1 - scroll, 0, 0, 0, 0, false);
				draw_sprite_ext(spr_loading, 0, xx + sprw / 2, yy + sprh / 2 - scroll, 0.5, 0.5, current_time, c_white, 1);
				
				if sprite_exists(this.image)
					draw_sprite_stretched_ext(this.image, 0, xx, yy - scroll, sprw, sprh, draw_get_colour(), 1);
				
				// text
				draw_set_font(global.font_small);
				
				var str = this.name;
				if string_length(str) > 40
					str = string_copy(str, 1, 40) + "...";
				
				if this.downloaded
					draw_text_ext_color(xx, yy + 96 - scroll, str, 16, 170, col1, col2, col2, col1, sel.y != -1 && sel.y != i ? 0.25 : 1);
				else
					draw_text_ext(xx, yy + 96 - scroll, str, 16, 170);
				
				xx += 180;
				if i % 3 == 2 && i != array_length(remote_towers) - 1
				{
					xx = xxstart;
					yy += 200;
				}
			}
			
			// scroll
			if yy > SCREEN_HEIGHT
			{
				var maxscroll = yy + 200 - SCREEN_HEIGHT + 16;
				
				if mouse_wheel_up()
					scroll -= 42;
				if mouse_wheel_down()
					scroll += 42;
				scroll = clamp(scroll, 0, maxscroll);
				
				/*
				draw_set_colour(#222222);
				var x1 = 600 - 28, x2 = 600 - 20;
				var y1 = 28, y2 = SCREEN_HEIGHT - 28;
				x1--;
				y1--;
				x2--;
				y2--;
				
				draw_rectangle(x1, y1, x2, y2, false);
				
				draw_set_color(c_white);
				shader_reset();
				draw_circle(lerp(x1, x2, 0.5), lerp(y1, y2, scroll / maxscroll), 10, false);
				*/
			}
			else
				scroll = 0;
			draw_set_alpha(1);
			
			// level info
			var xx = 582;
			var yy = 32;
			
			if sel.y > -1
			{
				var this = remote_towers[sel.y];
				
				draw_set_colour(c_white);
				draw_set_align(fa_center);
				
				// image
				if sprite_exists(this.image)
					draw_sprite_ext(this.image, 0, xx, yy, 0.65, 0.65, 0, c_white, 1);
				
				yy += sprite_get_height(this.image) * 0.65;
				yy += 16;
				
				// name
				draw_text_ext(center, yy, this.name, 16, xx * 0.65);
				yy += string_height_ext(this.name, 16, xx * 0.65);
				yy += 16;
				
				// download
				var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, center - 100, yy, center + 100, yy + 42);
				var col1 = hovering * #111122 + #5000b8;
				var col2 = hovering * #111122 + #1070d0;
				
				if hovering && state == 1
				{
					temp_sel = 0;
					if mouse_check_button_pressed(mb_left) && !this.downloaded
						fetch_tower_download(sel.y);
				}
				
				draw_rectangle_color(center - 100, yy, center + 100, yy + 42, col1, col2, col2, col1, state != 1 or this.downloaded);
				if state != 1
					draw_sprite_ext(spr_loading, 0, center, yy + 21, 1, 1, current_time / 2, c_white, 1);
				draw_text(center, floor(yy) + 14, this.downloaded ? "Downloaded!" : (state == 3 ? "Downloading..." : "Download"));
				
				yy += 64;
				
				// counts
				draw_set_colour(c_gray);
				draw_text(xx + (530 * 0.65 / 2), yy, $"Views: {this.views}\nLikes: {this.likes} - Posts: {this.posts}");
			}
			
			draw_reset_clip();
			
			// close button
			draw_set_align(fa_center);
			if state == 1
			{
				if text_button(center, SCREEN_HEIGHT - 20 - 30, "Close") == 2
				{
					if download_file != noone
					{
						download_file = noone;
						refresh_list();
					}
					
					sel.y = 0;
					image_cleanup();
					remote_towers = [];
					menu = 0;
					state = 0;
					exit;
				}
			}
			
			// sort
			draw_set_colour(c_white);
			
			var yy = SCREEN_HEIGHT - 20 - 50;
			if text_button(center, yy, $"Page: {page}") == 2
			{
				if state == 1
				{
					var pag = get_integer("Go to page:", page);
					if pag != undefined && pag != page && pag >= 1
					{
						page = pag;
						fetch_remote_towers(page);
					}
				}
			}
			
			if array_length(remote_towers) > 0 && state == 1
			{
				if page != 1
				{
					if text_button(center - 60, yy, "<") == 2
					{
						sel.y = -1;
						page--;
						fetch_remote_towers(page);
					}
				}
				if !last_page
				{
					if text_button(center + 60, yy, ">") == 2
					{
						sel.y = -1;
						page++;
						fetch_remote_towers(page);
					}
				}
			}
			if temp_sel == -1 && state == 1
				sel.y = -1;
			
			if sel.y == -1
			{
				yy = 70;
				if text_button(center - 80, yy, "Views") == 2
				{
					if filter == gb_filter.MostViewed
						filter = 0;
					else
						filter = gb_filter.MostViewed;
					
					page = 1;
					fetch_remote_towers(page);
				}
				if text_button(center, yy, "Downloads") == 2
				{
					if filter == gb_filter.MostDownloaded
						filter = 0;
					else
						filter = gb_filter.MostDownloaded;
					
					page = 1;
					fetch_remote_towers(page);
				}
				if text_button(center + 80, yy, "Likes") == 2
				{
					if filter == gb_filter.MostLiked
						filter = 0;
					else
						filter = gb_filter.MostLiked;
					
					page = 1;
					fetch_remote_towers(page);
				}
				
				draw_set_color(c_gray);
				draw_text(center, yy - 20, "Sort by");
				
				draw_text(center, SCREEN_HEIGHT / 2 - 32, "Select a level with your mouse!");
			}
		}
		break;
}
draw_set_align();
