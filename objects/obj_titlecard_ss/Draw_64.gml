if start
{
	draw_clear(0);
	draw_sprite(info.bginfo[0], 0, bgX, bgY);
	draw_sprite(info.titleinfo[0], 0, titleX, titleY);
}

draw_set_color(c_black);
draw_set_alpha(instance_exists(obj_fadeout) ? obj_fadeout.fadealpha : fadealpha);
draw_rectangle(0, 0, 960, 540, false);
draw_set_alpha(1);
draw_set_color(c_white);
