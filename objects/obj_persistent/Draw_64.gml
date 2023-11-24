gpu_set_blendmode(bm_normal);
shader_reset();

// fps count
if global.showfps && global.option_hud
{
	draw_set_font(SUGARY ? global.smallfont_ss : global.font_small);
	draw_set_colour(c_white);
	draw_set_align(fa_right, fa_bottom);
	
	var xx = SCREEN_WIDTH - 20;
	var yy = SCREEN_HEIGHT - 12;
	
	if global.option_timer && !(room == Realtitlescreen || room == Longintro || room == Finalintro || room == Mainmenu || room == hub_loadingscreen || room == Creditsroom || room == Johnresurrectionroom || room == rank_room || instance_exists(obj_titlecard) || !global.option_hud || room == characterselect)
	{
		xx -= 4;
		yy -= 18;
	}
	
	draw_text_transformed(xx, yy, string(fps), 1, 1, 0);
}
draw_set_align();

// the good meter
if global.goodmode
{
	draw_set_colour(c_white);
	draw_set_align(fa_center);
	draw_set_font(global.font_small);
	draw_text(SCREEN_WIDTH / 2 + random_range(-multiplier, multiplier), 32 + random_range(-multiplier, multiplier), concat("Good Mode ", multiplier, "x"));
}

// gif
if keyboard_check_pressed(vk_f11) && DEBUG
{
	gif_record = !gif_record;
	if gif_record
		gif_image = gif_open(SCREEN_WIDTH, SCREEN_HEIGHT);
	else
	{
		gif_save(gif_image, $"screenshots/{DATE_TIME_NOW}.gif");
		if !window_get_fullscreen() && os_type == os_windows
			launch_external($"\"{game_save_id}screenshots\\\"");
	}
}
if gif_record
{
	gif_add_surface(gif_image, application_surface, 2);
	
	draw_set_colour(c_red);
	draw_set_align(fa_center);
	draw_set_font(global.font_small);
	draw_text(SCREEN_WIDTH / 2, 32, "Recording GIF");
}

// global message
if gotmessage.time != -1
{
	// black overlay
	draw_set_colour(c_black);
	draw_set_alpha(0.25);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	
	// prepare text
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_set_font(global.font_small);
	
	// person says...
	draw_set_align(fa_center, fa_middle);
	if is_string(gotmessage.author)
		draw_text(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 20, $"{gotmessage.author} says...\n");
	else
		draw_text(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 20, "Global Message\n");
	
	// message
	var msgstr = gotmessage.message;
	if !is_string(msgstr)
		msgstr = "(error)";
	draw_text_ext_transformed((SCREEN_WIDTH / 2) + random_range(-1, 1), SCREEN_HEIGHT / 2, "\n" + msgstr, 16, SCREEN_WIDTH / 2, 2, 2, 0);
	
	// reset align
	draw_set_align();
	gotmessage.time--;
}
