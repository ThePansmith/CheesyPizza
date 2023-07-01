if app_scale <= 0
	exit;

// panic bg
#macro MAX_BLUR 2 / 4

var appa = 1;
if instance_exists(obj_player) && (global.panic or global.snickchallenge)
&& global.panicbg >= 2 && !instance_exists(obj_ghostcollectibles)
	appa = clamp(lerp(1, 1 - MAX_BLUR, global.wave / global.maxwave), 0.01, 1);

// black background
if appa == 1
{
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_white);
	gpu_set_texfilter(frac(app_scale) > 0 && global.option_texfilter);
	draw_rectangle_color(-100, -100, savedwidth + 100, savedheight + 100, c_black, c_black, c_black, c_black, false);
}

// draw the game
gpu_set_blendenable(appa != 1);
scr_draw_screen(savedwidth / 2 - (surface_get_width(application_surface) * app_scale) / 2, savedheight / 2 - (surface_get_height(application_surface) * app_scale) / 2, app_scale, app_scale, appa);
gpu_set_blendenable(true);
gpu_set_texfilter(false);
