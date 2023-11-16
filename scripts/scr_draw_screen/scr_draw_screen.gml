function scr_draw_screen(x, y, xscale, yscale, alpha = 1, gui = false)
{
	x = floor(x);
	y = floor(y);
	
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
	var mirror = MOD.Mirror && !instance_exists(obj_rank);
	draw_surface_ext(application_surface, x + (mirror ? surface_get_width(application_surface) * xscale : 0), y, xscale * (mirror ? -1 : 1), yscale, 0, c_white, alpha);
	shader_reset();
}
