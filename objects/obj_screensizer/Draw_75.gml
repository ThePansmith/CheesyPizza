global.Pattern_Texture_Indexed = -4;

surface_reset_target();
shader_reset();
draw_set_alpha(1);
draw_set_colour(c_white);

if !surface_exists(gui_surf)
{
	gpu_set_blendmode(bm_normal);
	exit;
}

gpu_set_texfilter(frac(app_scale) > 0 && global.option_texfilter);

// colorblind shader
if global.colorblind_type >= 0
{
	shader_set(shd_colorblind);
	var colorblindmode = shader_get_uniform(shd_colorblind, "v_vMode");
	var colorblindintensity = shader_get_uniform(shd_colorblind, "v_vIntensity");
	var greyscalefade = shader_get_uniform(shd_colorblind, "v_vGreyscaleFade");
		
	shader_set_uniform_f(colorblindmode, global.colorblind_type);
	shader_set_uniform_f(colorblindintensity, global.colorblind_intensity);
}

// draw it
if global.option_scale_mode == 0
	draw_surface(gui_surf, 0, 0);
else
{
	var _w = display_get_gui_width() * app_scale;
	var _h = display_get_gui_height() * app_scale;
	draw_surface_ext(gui_surf, window_to_gui_x((window_get_width() / 2) - (_w / 2)), window_to_gui_y((window_get_height() / 2) - (_h / 2)), window_to_gui_xscale(app_scale), window_to_gui_yscale(app_scale), 0, c_white, 1);
}

gpu_set_blendmode(bm_normal);
gpu_set_texfilter(false);

shader_reset();
if window_has_focus() && global.gameframe_enabled
	gameframe_draw();
