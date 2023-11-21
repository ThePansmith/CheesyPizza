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
			var xx = 100 - cam.x + random_range(-shake, shake), yy = i * 36 - cam.y + random_range(-shake, shake);
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
				draw_sprite_ext(spr_towericon, 0, xx - 42, yy, 1, 1, 0, sel.y == i ? c_white : c_gray, draw_get_alpha());
			
			draw_set_bounds(xx, yy, xx + wd, yy + 32);
			draw_text(drawx, yy, str);
			draw_reset_clip();
			draw_set_alpha(1);
			
			if (this.corrupt or this.fresh) && state == 0
			{
				draw_set_colour(this.corrupt ? c_red : c_yellow);
				draw_set_align(fa_center, fa_middle);
				draw_text((xx - 72 + 8) + (this.type == 1 ? 40 : 0), yy + min(sin(current_time / 200) * 15 + 5, 0) + 20, "!");
			}
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
			draw_set_font(global.creditsfont);
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
			draw_set_font(global.creditsfont);
			draw_set_align(fa_right);
			draw_set_color(c_white);
			
			if text_button(SCREEN_WIDTH - 16, 16, $"Browse towers") == 2
			{
				page = 1;
				fetch_remote_towers(page);
				
				sel.x = 0;
				sel.y = 0;
			}
			yy += 1.5;
			draw_set_font(global.font_small);
			
			// open levels folder
			if has_pizzatower && directory_exists(towers_folder)
			{
				draw_set_font(global.font_small);
				draw_set_align(fa_right);
				draw_set_color(c_white);
		
				if text_button(SCREEN_WIDTH - 16, 16 + (yy++ * 26), $"Open folder") == 2
					launch_external("explorer.exe " + towers_folder);
			}
			
			draw_set_font(global.font_small);
			draw_set_align(fa_right);
			draw_set_color(c_white);
		
			if text_button(SCREEN_WIDTH - 16, 16 + (yy++ * 26), $"Pick file...") == 2
			{
				var load = get_open_filename_ext("CYOP Tower (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", "", environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\", "Select a custom level");
				if load != ""
				{
					state = 2;
					with instance_create(0, 0, obj_levelLoader)
					{
						var result = cyop_load(load);
						if is_string(result)
						{
							show_message(result);
							instance_destroy();
							other.state = 0;
						}
						else
							loaded = true;
					}
				}
			}
			
			// level filename
			if array_length(towers) > 0
			{
				var level = towers[sel.y];
				draw_set_font(global.font_small);
				draw_set_align(fa_right);
				draw_set_color(c_gray);
				draw_text(SCREEN_WIDTH - 16, 16 + (yy++ * 26), $"{filename_name(level.file)}");
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
			
			var boundleft = 16 + 1, boundtop = 16 + 1, boundright = SCREEN_WIDTH - 16, boundbottom = SCREEN_HEIGHT - 16;
			draw_set_bounds(boundleft, boundtop, boundright, boundbottom);
			
			/*
			var temp_sel = sel.y;
			if mouse_check_button_pressed(mb_left)
				temp_sel = -1;
			*/
			
			var col1 = merge_color(#5000b8, c_white, 0.5);
			var col2 = merge_color(#1070d0, c_white, 0.5);
			for(var i = 0; i < array_length(remote_towers); i++)
			{
				var this = remote_towers[i];
				var scale = 0.3;
				var sprw = 530 * scale, sprh = 298 * scale;
				
				if !(yy - scroll + 200 < boundtop or yy - scroll >= boundbottom)
				{
					var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, xx, yy - scroll, xx + sprw, yy + 180 - scroll);
					if hovering
					{
						draw_set_bounds(boundleft, boundtop, boundright, boundbottom);
						draw_rectangle_color(xx - 4, yy - 4 - scroll, xx + sprw + 4, yy + 180 + 4 - scroll, c_aqua, c_aqua, c_aqua, c_aqua, true);
						if mouse_check_button_pressed(mb_left)
						{
							if sel.y == i
								sel.y = -1;
							else
								sel.y = i;
						}
						//temp_sel = sel.y;
					}
				
					draw_set_bounds(xx, max(yy - scroll, boundtop), xx + 160, min(yy + 200 - scroll, boundbottom));
					draw_set_colour(c_white);
					if sel.y > -1 && sel.y != i
						draw_set_colour(#555555);
				
					draw_rectangle_color(xx, yy - scroll, xx + sprw - 1, yy + sprh - 1 - scroll, 0, 0, 0, 0, false);
					draw_sprite_ext(spr_loading, 0, xx + sprw / 2, yy + sprh / 2 - scroll, 0.5, 0.5, current_time, c_white, 1);
				
					gpu_set_tex_filter(true);
					if sprite_exists(this.image)
						draw_sprite_stretched_ext(this.image, 0, xx, yy - scroll, sprw, sprh, draw_get_colour(), 1);
					gpu_set_tex_filter(false);
				
					// stats
					draw_set_font(global.smallfont);
					draw_sprite_ext(spr_browsericons, 1, xx, yy + 96 - scroll + 64, 1, 1, 0, draw_get_colour(), 1);
				
					var viewsstr = this.views;
					if this.views > 1000
						viewsstr = string_replace(string_format(this.views / 1000, 1, 1), ".0", "") + "K";
				
					draw_text(xx + 16, yy + 96 - scroll + 64, viewsstr);
				
					// text
					draw_set_font(global.font_small);
				
					var str = this.name;
					if string_length(str) > 50
						str = string_copy(str, 1, 50) + "...";
				
					if this.downloaded
						draw_text_ext_color(xx, yy + 96 - scroll, str, 16, 170, col1, col2, col2, col1, sel.y != -1 && sel.y != i ? 0.25 : 1);
					else
						draw_text_ext(xx, yy + 96 - scroll, str, 16, 170);
				}
				
				xx += 180;
				if i % 3 == 2 && i != array_length(remote_towers) - 1
				{
					xx = xxstart;
					yy += 200;
				}
			}
			draw_reset_clip();
			
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
				var scale = 0.65;
				var sprw = 530 * scale, sprh = 298 * scale;
				
				draw_set_colour(c_white);
				draw_set_align(fa_center);
				
				// image
				gpu_set_tex_filter(true);
				if sprite_exists(this.image)
					draw_sprite_stretched_ext(this.image, 0, xx, yy, sprw, sprh, c_white, 1);
				gpu_set_tex_filter(false);
				
				yy += sprh;
				yy += 16;
				
				// name
				draw_text_ext(center, yy, this.name, 16, xx * scale);
				yy += string_height_ext(this.name, 16, xx * scale);
				yy += 16;
				
				// download
				var hovering = point_in_rectangle(mouse_x_gui, mouse_y_gui, center - 100, yy, center + 100, yy + 42);
				var col1 = hovering * #222222 + #5000b8;
				var col2 = hovering * #222222 + #1070d0;
				
				var download = downloads[sel.y];
				if hovering
				{
					//temp_sel = 0;
					if mouse_check_button_pressed(mb_left) && download == noone
					{
						if this.downloaded
						{
							// find index
							for(var i = 0; i < array_length(towers); i++)
							{
								var curr = towers[i];
								if filename_name(filename_dir(curr.file)) == this.modid
								{
									if !file_exists(curr.file)
										curr.corrupt = true;
									
									if curr.corrupt
									{
										
									}
									else
									{
										sel.y = i;
										
										stop_music();
										sound_play(sfx_collectpizza);
										
										menu = 0;
										state = 1;
									}
									break;
								}
							}
						}
						else
							fetch_tower_download(sel.y);
					}
				}
				
				if download != noone && download.progress > 0
					draw_rectangle_color(center - 100, yy, center - 100 + download.progress * 200, yy + 42, c_green, c_lime, c_lime, c_green, false);
				draw_rectangle_color(center - 100, yy, center + 100, yy + 42, col1, col2, col2, col1, download != noone);
				
				if state != 1
					draw_sprite_ext(spr_loading, 0, center, yy + 21, 1, 1, current_time / 2, c_white, 1);
				
				var str = "Download";
				if this.downloaded
					str = "Play";
				if download != noone
				{
					if download.state == 0
						str = "Finding...";
					if download.state == 1
						str = "Downloading...";
					if download.state == 2
						str = "Extracting...";
				}
				draw_text(center, floor(yy) + 14, str);
				
				yy += 64;
				
				// counts
				draw_set_colour(c_gray);
				draw_text(xx + (530 * 0.65 / 2), yy, $"Views: {this.views}\nLikes: {this.likes} - Posts: {this.posts}");
			}
			
			draw_reset_clip();
			
			// close button
			draw_set_align(fa_center);
			if state == 1 && download_count == 0
			{
				if text_button(center, SCREEN_HEIGHT - 20 - 30, "Close") == 2
				{
					sel.y = 0;
					image_cleanup();
					remote_towers = [];
					menu = 0;
					state = 0;
					filter = 0;
					
					exit;
				}
			}
			
			// sort
			draw_set_colour(c_white);
			
			var yy = SCREEN_HEIGHT - 20 - 50;
			if text_button(center, yy, $"Page: {page}") == 2
			{
				if state == 1 && download_count == 0
				{
					var pag = get_integer("Go to page:", page);
					if pag != undefined && pag != page && pag >= 1
					{
						page = pag;
						fetch_remote_towers(page);
					}
				}
			}
			
			if array_length(remote_towers) > 0 && download_count == 0
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
			//if temp_sel == -1 && state == 1
			//	sel.y = -1;
			
			if sel.y == -1
			{
				if download_count == 0
				{
					yy = 70;
					
					var selected = filter == gb_filter.MostViewed;
					if text_button(center - 80, yy, "Views", selected ? col1 : c_white, selected ? c_red : c_aqua) == 2
					{
						if filter == gb_filter.MostViewed
							filter = 0;
						else
							filter = gb_filter.MostViewed;
					
						page = 1;
						fetch_remote_towers(page);
					}
					
					var selected = filter == gb_filter.MostDownloaded;
					if text_button(center, yy, "Downloads", selected ? col1 : c_white, selected ? c_red : c_aqua) == 2
					{
						if filter == gb_filter.MostDownloaded
							filter = 0;
						else
							filter = gb_filter.MostDownloaded;
					
						page = 1;
						fetch_remote_towers(page);
					}
					
					var selected = filter == gb_filter.MostLiked;
					if text_button(center + 80, yy, "Likes", selected ? col1 : c_white, selected ? c_red : c_aqua) == 2
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
				}
				
				draw_set_color(c_white);
				draw_text(center, SCREEN_HEIGHT / 2 - 16, download_count > 0 ? ($"Downloading {download_count} level" + (download_count == 1 ? "" : "s")) : "Select a level with your mouse!");
			}
		}
		break;
}
draw_set_align();
