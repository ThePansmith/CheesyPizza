/*
	actually just a generic background effect handler.
	runs all the time, regardless of panic.
*/

// setup
function scr_panicbg_generic(begin_script, end_script)
{
	var begin_id = -1, end_id = -1;
	
	// finds start and end layers
	var backs = room_get_bg_layers();
	for(var i = 0; i < array_length(backs); i++)
	{
		var lay = backs[i].layer_id;
		if layer_get_depth(lay) > 0
		{
			if begin_id == -1
				begin_id = lay;
			end_id = lay;
		}
	}
	
	// first layer starts the script, last layer ends it
	if begin_id != -1
	{
		layer_script_begin(begin_id, begin_script);
		layer_script_end(end_id, end_script);
	}
}
function scr_panicbg_init()
{
	if room != rank_room
		scr_panicbg_generic(scr_panicbg_start, scr_panicbg_end);
}

// draw
function scr_panicbg_start()
{
	// before the layers draw! do nothing.
}
function scr_panicbg_end()
{
	if event_type == ev_draw && event_number == ev_draw_normal
	{
		// panicbg shader
		if global.panic
		{
			shader_set(shd_panicbg);
			var panic_id = shader_get_uniform(shd_panicbg, "panic");
			shader_set_uniform_f(panic_id, clamp(global.wave / global.maxwave, -0.5, 1));
			var time_id = shader_get_uniform(shd_panicbg, "time");
			shader_set_uniform_f(time_id, scr_current_time() / 1000);
		}
		
		// DRAW APPLICATION SURFACE HERE.
		// DRAW APPLICATION SURFACE HERE.
		// DRAW APPLICATION SURFACE HERE.
		
		// chunk bg
		with obj_backgroundreplace
			event_user(0);
		
		// grinch bg
		if string_starts_with(room_get_name(room), "grinch_") && room != grinch_10
		{
			shader_set(shd_wind);
			var uTime = shader_get_uniform(shd_wind, "Time");
			shader_set_uniform_f(uTime, scr_current_time() / 1000);
			draw_sprite_tiled(bg_grinch_santa, 0, -CAMX * 0.25, -CAMY * 0.25);
		}
		
		// clean up
		if !global.goodmode
			shader_reset();
	}
}
