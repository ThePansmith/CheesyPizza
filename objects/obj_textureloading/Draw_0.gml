draw_sprite_stretched_ext(spr_splashscreen, 0, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_white, image_alpha);
if image_alpha < 1
	exit;

var p = tex_max - array_length(tex_list);
var t = (p / tex_max) * 100;
draw_healthbar(0, SCREEN_HEIGHT - 6, SCREEN_WIDTH, SCREEN_HEIGHT, t, 0, c_white, c_white, 0, false, false);

draw_sprite_stretched_ext(spr_gradient, 0, 0, SCREEN_HEIGHT - 16, (p / tex_max) * SCREEN_WIDTH, 10, c_black, 0.15);
