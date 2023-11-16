live_auto_call;

if start
{
	var xscale = SCREEN_WIDTH / 960, yscale = SCREEN_HEIGHT / 540;
	
	draw_clear(c_black);
	draw_sprite_ext(info.bginfo[0], 0, bgX * xscale, bgY * yscale, xscale, yscale, 0, c_white, 1);
	draw_sprite_ext(info.titleinfo[0], 0, titleX * xscale, titleY * yscale, xscale, yscale, 0, c_white, 1);
}

toggle_alphafix(true);

draw_set_color(c_black);
draw_set_alpha(instance_exists(obj_fadeout) ? obj_fadeout.fadealpha : fadealpha);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
draw_set_color(c_white);

toggle_alphafix(false);
