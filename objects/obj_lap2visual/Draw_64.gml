if global.laps < 2
	draw_sprite(sprite_index, image_index, x + irandom_range(-1, 1), y + irandom_range(-1, 1));
else
{
	var xx = x// + irandom_range(-1, 1);
	var yy = y// + irandom_range(-1, 1);
	
	draw_sprite(sprite_index, 1, xx, yy);
	
	if sugary
	{
		draw_set_font(global.lapfont2_ss);
		
		var w = 37 - string_width(global.laps + 1);
		draw_set_align(fa_center);
		draw_set_colour(c_white);
		draw_text(xx + 38 - ceil(w / 10), yy + 52, global.laps + 1);
		draw_set_align();
		
		draw_sprite(sprite_index, 2, xx + w / 3, yy);
	}
	else
	{
		var lap_text = string(global.laps + 1);
		var wd = sprite_get_width(spr_lapfontbig) * string_length(lap_text);
		
		// numbers!
		var state = draw_save_state();
		gpu_set_zwriteenable(true);
		gpu_set_ztestenable(true);
		gpu_set_alphatestenable(true);
		
		for(var i = 1; i <= string_length(lap_text); i++)
		{
			var lx = xx - 8 + 39 * i - ((wd - 64) / 3);
			var ly = yy + 8;
			var letter = ord(string_char_at(lap_text, i)) - ord("0");
			
			gpu_set_depth(-1);
			gpu_set_blendmode(bm_normal);
			draw_sprite(spr_lapfontbig, letter, lx, ly);
			
			gpu_set_depth(0);
			gpu_set_blendmode_ext(bm_dest_color, bm_zero);
			draw_sprite(spr_lapfontbig, letter + 10, lx, ly);
		}
		gpu_set_blendmode(bm_normal);
		
		// the thingy
		draw_sprite(sprite_index, 2, xx - ((wd - 64) / 3), yy);
		gpu_set_blendmode_ext(bm_dest_color, bm_zero);
		draw_sprite(sprite_index, 3, xx - ((wd - 64) / 3), yy);
		
		draw_restore_state(state);
	}
}
