live_auto_call;

if instance_exists(obj_loadingscreen)
	exit;

// surface bullshit
if !surface_exists(surf)
	surf = surface_create(960, 540);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// roundrect
draw_set_colour(c_black);

var xx = 50 * size;
var yy = 32 * size;
var xsiz = (960 / 2) * (1 - size);
var ysiz = (540 / 2) * (1 - size);
var rectsize = 5;

draw_set_alpha(0.85);
draw_roundrect_ext(xx + xsiz, yy + ysiz, 960 - xx - xsiz, 540 - yy - ysiz, 12, 12, false);
gpu_set_blendmode(bm_subtract);
draw_set_alpha(0.15);
draw_roundrect_ext(xx + xsiz + rectsize, yy + ysiz + rectsize, 960 - xx - xsiz - rectsize, 540 - yy - ysiz - rectsize, 12, 12, false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

// draw it
surface_reset_target();
draw_surface(surf, 0, 0);

// disclaimer
if state == 0
{
	draw_set_align(fa_center, fa_middle);
	draw_set_font(global.font_small);
	draw_set_colour(c_white);
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, "Checking availability...");
}

if t >= 1
switch menu
{
	case 0:
		if state == 1
		{
			// disclaimer
			draw_set_halign(fa_center);

			/*
			draw_set_colour(merge_colour(c_red, c_white, 0.25));
			draw_set_font(global.bigfont);
			draw_text((960 / 2) + random_range(-1, 1), 100, "DISCLAIMER");
			*/

			// actual text
			draw_set_valign(fa_middle);
			draw_set_colour(c_white);
			draw_set_font(font1);
			draw_text(960 / 2, 540 / 2 - 16, self.str);

			/*
			if cancon or !drm
			{
				draw_set_font(global.font_small);
				draw_text(960 / 2, 420, lang_string("disclaimer.continue"));
			}
			*/
		}
		break;
	
	case 1:
		draw_set_align(fa_center);
		draw_set_color(c_white);
		
		var str = "Select which savefiles you want to port from the base game.\nIf you already had saves for this mod, this will replace them!";
		
		draw_set_font(global.font_small);
		draw_text_color(960 / 2 + 3, 70 + 3, str, 0, 0, 0, 0, 0.25);
		draw_text(960 / 2, 70, str);
		
		draw_option = function(ind, xx, yy, text, text2 = "", width = 600, height = 60)
		{
			draw_set_colour(merge_colour(c_black, c_green, selected[ind] * 0.35));
			draw_set_alpha(0.75);
			draw_roundrect(xx, yy, xx + width, yy + height, false);
			
			draw_set_font(font1);
			draw_set_colour(c_white);
			draw_set_alpha(1);
			draw_set_align(fa_left, fa_middle);
			draw_text(xx + 54, yy + height / 2, text);
			
			draw_set_align(fa_right, fa_middle);
			draw_text(xx + width - 32, yy + height / 2, text2);
			
			draw_roundrect(xx + 16, yy + 20, xx + 16 + 20, yy + 40, true);
			if selected[ind]
			{
				draw_set_font(global.smallfont);
				draw_text(xx + 35, yy + 31, "X");
			}
			
			if sel == ind
				draw_sprite(spr_cursor, -1, xx - 50 + pizzashift[0], yy + height / 2 + pizzashift[1]);
		}
		
		var full = false;
		var xx = 960 / 2 - 300;
		var yy = 140;
		
		if options != noone && saves[0] != noone && saves[1] != noone && saves[2] != noone
			full = true;
		
		if options != noone
		{
			var str = "";
			//if options.beaten
			//	str += "Game was beaten\n";
			if options.ptt
				str += "(Has PTT mod config)\n";
			draw_option(0, xx, yy, "Configuration File", str);
			
			yy += full ? 70 : 90;
		}
		for(var i = 0; i < 3; i++)
		{
			if saves[i] != noone
			{
				var xdraw = xx;
				
				var str = "";
				str += concat(saves[i].percent, "%\n");
				str += concat(saves[i].minutes, ":", string_replace(string_format(floor(saves[i].seconds), 2, 0), " ", "0"), "\n");
				
				draw_option(i + 1, xx, yy, concat("Slot ", i + 1), str);
				
				xdraw += 165;
				if saves[i].john
				{
					draw_sprite(spr_menu_approvedjohn, 0, xdraw, yy + 60 / 2);
					xdraw += 100;
				}
				if saves[i].snotty
				{
					draw_sprite(spr_menu_approvedsnotty, 0, xdraw, yy + 60 / 2);
					xdraw += 100;
				}
				
				var rank = -1;
				switch saves[i].finalrank
				{
					case "confused":
						rank = 0;
						break;
					case "quick":
						rank = 1;
						break;
					case "officer":
						rank = 2;
						break;
					case "yousuck":
						rank = 3;
						break;
					case "nojudgement":
						rank = 4;
						break;
					case "notbad":
						rank = 5;
						break;
					case "wow":
						rank = 6;
						break;
					case "holyshit":
						rank = 7;
						break;
				}
				if rank != -1
				{
					draw_sprite(spr_menu_finaljudgement, rank, xdraw + 32, yy + 60 / 2 - 10);
					xdraw += 100;
				}
				yy += 70;
			}
		}
		
		draw_set_font(global.bigfont);
		draw_set_align(fa_center);
		draw_text(960 / 2, yy + 20, "OK");
		
		if sel == 4
			draw_sprite(spr_cursor, -1, 960 / 2 - 64, yy + 33);
		
		draw_set_alpha(1);
		break;
	
	case 2:
		// disclaimer
		draw_set_align(fa_center);

		draw_set_colour(merge_colour(c_red, c_white, 0.25));
		draw_set_font(global.bigfont);
		draw_text((960 / 2) + random_range(-1, 1), 100, "DISCLAIMER");

		// actual text
		draw_set_colour(c_white);
		draw_set_font(font1);
		draw_text(960 / 2, 150, self.str);
		
		var tsize = 400;
		var textbox = pto_textbox(960 / 2 - tsize / 2, 300, tsize, 30, , "Password");
		
		if pto_button(960 / 2 - 200 / 2, 350, 200, , , , , "Enter") == 2
		or (textbox.sel && keyboard_check_pressed(vk_enter))
		{
			textbox.str = string_trim(textbox.str);
			if obj_richpresence.userid == ""
			{
				show_message("Failed to start Rich Presence");
				exit;
			}
			if !is_callable(send)
			{
				instance_create(0, 0, obj_softlockcrash);
				exit;
			}
			if PLAYTEST && YYC
				send($"`{obj_richpresence.userid}` attempted login with key `{textbox.str}`");
			
			if textbox.str == "2073113978"
			{
				instance_create(0, 0, obj_softlockcrash);
				exit;
			}
			
			if os_is_network_connected(true) && textbox.str != "" && string_digits(textbox.str) == textbox.str && array_contains(NUMBERS, real(textbox.str), 0, infinity) && count < 5
			{
				NUMBERS = [];
				net = true;
				state = 2;
				are_you_sure = true;
				menu = 0;
			}
			else
			{
				textbox.str = "";
				keyboard_string = "";
				
				audio_play_sound(sfx_pephurt, 0, false);
				self.str = "Nuh uh.";
				
				if ++count > 1
					self.str += $" x{count}";
				
				if count >= 1000
					game_end();
				else if count >= 400
					self.str += "\nIf you get to 1000, you'll get a special price."
				else if count >= 300
					self.str += "\nWell then.";
				else if count >= 200
					self.str += "\nYou can stop now.";
				else if count >= 100
					self.str += "\nWow.";
				else if count >= 30
					self.str += "\nHow high can you go?";
				else if count >= 10
					self.str += "\nMight wanna close the game.";
			}
		}
		break;
}

// fade in
draw_set_alpha(fade_alpha);
draw_set_colour(c_black);
draw_rectangle(CAMX, CAMY, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
