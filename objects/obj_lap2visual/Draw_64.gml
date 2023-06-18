if (global.laps > 1)
	image_index = 1
else
	image_index = 0
draw_sprite(sprite_index, image_index, x + irandom_range(-1, 1), y + irandom_range(-1, 1));
