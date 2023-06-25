/// @description foreground
live_auto_call;

if surface_exists(fg_surface) && do_foreground
{
	if (global.panic or global.snickchallenge)
	&& global.panicbg && !instance_exists(obj_ghostcollectibles)
	{
		shader_set(shd_panicbg);
		var panic_id = shader_get_uniform(shd_panicbg, "panic");
		shader_set_uniform_f(panic_id, global.wave / global.maxwave);
		var time_id = shader_get_uniform(shd_panicbg, "time");
		shader_set_uniform_f(time_id, current_time / 1000);
	}
	
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	draw_surface(fg_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
	gpu_set_blendmode(bm_normal);
	shader_reset();
}
