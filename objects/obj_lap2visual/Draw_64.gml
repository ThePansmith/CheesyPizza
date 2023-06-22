if global.laps < 2
	draw_sprite(sprite_index, image_index, x + irandom_range(-1, 1), y + irandom_range(-1, 1));
else
{
	var xx = x + irandom_range(-1, 1);
	var yy = y + irandom_range(-1, 1);
	
	draw_sprite(sprite_index, 1, xx, yy);
	
	draw_set_font(global.lapfont2);
	var w = 48 - string_width(global.laps + 1);
	draw_set_align(fa_center);
	draw_set_colour(c_white);
	draw_text(xx + 63 + w / 10, yy + 11, global.laps + 1);
	draw_set_align();
	
	draw_sprite(sprite_index, 2, xx + w / 2, yy);
}
