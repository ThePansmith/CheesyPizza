function scr_draw_screen(x, y, xscale, yscale, alpha = 1)
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
	
	// draw the game
	draw_surface_ext(application_surface, x + (check_modifier(MOD.Mirror) ? surface_get_width(application_surface) : 0), y, xscale * (check_modifier(MOD.Mirror) ? -1 : 1), yscale, 0, c_white, alpha);
	shader_reset();
}
