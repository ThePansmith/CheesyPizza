if global.laps < 2
	draw_sprite(sprite_index, image_index, x + irandom_range(-1, 1), y + irandom_range(-1, 1));
else
{
	var xx = x + irandom_range(-1, 1);
	var yy = y + irandom_range(-1, 1);
	
	draw_sprite(sprite_index, 1, xx, yy);
	
	if sugary
	{
		alarm[0] = -1;
		down = true;
		
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
		draw_set_font(global.lapfont2);
		var w = 48 - string_width(global.laps + 1);
		draw_set_align(fa_center);
		draw_set_colour(c_white);
		draw_text(xx + 63 + ceil(w / 10), yy + 11, global.laps + 1);
		draw_set_align();
	
		draw_sprite(sprite_index, 2, xx + w / 2, yy);
	}
}
