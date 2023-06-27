/// @description background
live_auto_call;

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// setup bgs
if !surface_exists(bg_surface)
	bg_surface = surface_create(960, 540);

surface_set_target(bg_surface);
draw_clear_alpha(0, 0);
surface_reset_target();

// setup fags
if do_foreground
{
	if !surface_exists(fg_surface)
		fg_surface = surface_create(960, 540);

	surface_set_target(fg_surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}

// draw the backgrounds
gpu_set_blendmode(bm_normal);
for(var i = array_length(background_layers) - 1; i >= 0; i--)
{
	var lay = background_layers[i], bg = layer_background_get_id(lay);
	if !layer_get_visible(lay)
		continue;
	
	surface_set_target(do_foreground && layer_get_depth(lay) <= 0 ? fg_surface : bg_surface);
	
	var spr = layer_background_get_sprite(bg);
	var col = layer_background_get_blend(bg);
	var alpha = layer_background_get_alpha(bg);
	
	if sprite_exists(spr)
	{
		var img = layer_background_get_index(bg);
		var xx = round(layer_get_x(lay)), yy = round(layer_get_y(lay));
		var sprw = sprite_get_width(spr), sprh = sprite_get_height(spr);
		
		var htiled = layer_background_get_htiled(bg);
		var vtiled = layer_background_get_vtiled(bg);
		
		if htiled
		{
			if vtiled
				draw_sprite_tiled_ext(spr, img, xx - cam_x, yy - cam_y, 1, 1, col, alpha);
			else
			{
				for(var j = ((xx % sprw) - (xx > 0 ? sprw : 0)); j < room_width; j += sprw)
					draw_sprite_ext(spr, img, j - cam_x, yy - cam_y, 1, 1, 0, col, alpha);
			}
		}
		else if vtiled
		{
			for(var j = ((yy % sprh) - (yy > 0 ? sprh : 0)); j < room_height; j += sprh)
				draw_sprite_ext(spr, img, xx - cam_x, j - cam_y, 1, 1, 0, col, alpha);
		}
		else
			draw_sprite_ext(spr, img, xx - cam_x, yy - cam_y, 1, 1, 0, col, alpha);
	}
	else
	{
		draw_set_colour(col);
		draw_set_alpha(col);
		draw_rectangle(0, 0, 960, 540, false);
		draw_set_alpha(1);
	}
	
	surface_reset_target();
}
draw_set_colour(c_white);

if (global.panic or global.snickchallenge)
&& global.panicbg && !instance_exists(obj_ghostcollectibles)
{
	shader_set(shd_panicbg);
	var panic_id = shader_get_uniform(shd_panicbg, "panic");
	shader_set_uniform_f(panic_id, global.wave / global.maxwave);
	var time_id = shader_get_uniform(shd_panicbg, "time");
	shader_set_uniform_f(time_id, current_time / 1000);
}

draw_surface(bg_surface, cam_x, cam_y);
shader_reset();
