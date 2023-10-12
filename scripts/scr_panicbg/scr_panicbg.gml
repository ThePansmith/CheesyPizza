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
	if room != rank_room && room != timesuproom
		scr_panicbg_generic(scr_panicbg_start, scr_panicbg_end);
}

// draw
global.panicbg_surface = noone;
function scr_panicbg_start()
{
	if event_type == ev_draw && event_number == ev_draw_normal
	{
		// set up surface
		if global.panic && global.panicbg && !safe_get(obj_pause, "pause")
		{
			if !surface_exists(global.panicbg_surface)
				global.panicbg_surface = surface_create(CAMW, CAMH);
			else if surface_get_width(global.panicbg_surface) != CAMW or surface_get_height(global.panicbg_surface) != CAMH
				surface_resize(global.panicbg_surface, CAMW, CAMH);
			
			// shift layers to account for camera position
			var backs = room_get_bg_layers();
			for(var i = 0; i < array_length(backs); i++)
			{
				var lay = backs[i].layer_id;
				if layer_get_depth(lay) > 0
				{
					layer_x(lay, layer_get_x(lay) - CAMX);
					layer_y(lay, layer_get_y(lay) - CAMY);
				}
			}
			
			// target
			surface_set_target(global.panicbg_surface);
		}
		else if surface_exists(global.panicbg_surface)
			surface_free(global.panicbg_surface);
	}
}
function scr_panicbg_end()
{
	if event_type == ev_draw && event_number == ev_draw_normal && !safe_get(obj_pause, "pause")
	{
		// chunk bg
		with obj_backgroundreplace
			event_user(0);
		
		// grinch bg
		if string_starts_with(room_get_name(room), "grinch_") && room != grinch_10
		{
			shader_set(shd_wind);
			var uTime = shader_get_uniform(shd_wind, "Time");
			shader_set_uniform_f(uTime, scr_current_time() / 1000);
			
			var xx = CAMX * 0.25, yy = CAMY * 0.25;
			if global.panic && global.panicbg
			{
				xx -= CAMX;
				yy -= CAMY;
			}
			
			draw_sprite_tiled(bg_grinch_santa, 0, xx, yy);
		}
		
		// panicbg shader
		if global.panic && global.panicbg
		{
			surface_reset_target();
			
			shader_set(shd_panicbg);
			var panic_id = shader_get_uniform(shd_panicbg, "panic");
			shader_set_uniform_f(panic_id, clamp(global.wave / global.maxwave, -0.5, 1));
			var time_id = shader_get_uniform(shd_panicbg, "time");
			shader_set_uniform_f(time_id, scr_current_time() / 1000);
			
			draw_surface(global.panicbg_surface, CAMX, CAMY);
			
			if !global.goodmode
				shader_reset();
		}
	}
}
