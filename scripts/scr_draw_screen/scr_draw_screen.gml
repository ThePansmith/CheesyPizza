function scr_draw_screen(x, y, xscale, yscale, alpha = 1, gui = false)
{
	if global.colorblind_type <= -1 or gui
	{
		// sugary spire greyscale
		with obj_camera
		{
			if greyscale > 0
			{
				shader_set(shd_greyscale);
				var fader = shader_get_uniform(shd_greyscale, "fade");
				shader_set_uniform_f(fader, greyscale);
			}
		}
	}
	else
	{
		shader_set(shd_colorblind);
		var colorblindmode = shader_get_uniform(shd_colorblind, "v_vMode");
		var colorblindintensity = shader_get_uniform(shd_colorblind, "v_vIntensity");
		var greyscalefade = shader_get_uniform(shd_colorblind, "v_vGreyscaleFade");
		
		shader_set_uniform_f(colorblindmode, global.colorblind_type);
		shader_set_uniform_f(colorblindintensity, global.colorblind_intensity);
		
		var gray = 0;
		with obj_camera
			gray = greyscale;
		shader_set_uniform_f(greyscalefade, gray);
	}
	
	if (global.temp)
	{
		shader_set(shd_emboss);
		var emboss_offset = shader_get_uniform(shd_emboss, "u_emboss_offset");
		var emboss_contrast = shader_get_uniform(shd_emboss, "u_emboss_contrast");
		var emboss_mix = shader_get_uniform(shd_emboss, "u_emboss_mix");
		shader_set_uniform_f(emboss_offset, global.emboss_offset_x, global.emboss_offset_y);
		shader_set_uniform_f(emboss_contrast, global.emboss_contrast);
		shader_set_uniform_f(emboss_mix, global.emboss_mix);
	}
	
	// draw the game
	var mirror = check_modifier(MOD.Mirror) && !instance_exists(obj_rank);
	draw_surface_ext(application_surface, x + (mirror ? surface_get_width(application_surface) * xscale : 0), y, xscale * (mirror ? -1 : 1), yscale, 0, c_white, alpha);
	shader_reset();
}
