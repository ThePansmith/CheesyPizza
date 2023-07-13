if live_call() return live_result;

if !init
	exit;

reset_blendmode();
draw_set_align();
draw_set_colour(c_white);

// animation
if anim_con == 0
{
	var curve = animcurve_channel_evaluate(outback, anim_t);
	anim_t = Approach(anim_t, 1, 0.035);
}
if anim_con == 1 or anim_con == 2
{
	var curve = animcurve_channel_evaluate(incubic, anim_t);
	anim_t = Approach(anim_t, 0, 0.06);
}

// background
if !surface_exists(bg_surf) or curve != 1
{
	if !surface_exists(bg_surf)
		bg_surf = surface_create(64, 64);
	
	surface_set_target(bg_surf);
	draw_clear_alpha(0, 0);
	draw_sprite_ext(spr_skinmenupizza, bg_image, 32, 32, curve, curve, 0, c_white, curve);
	surface_reset_target();
}
bg_pos = (bg_pos + 0.5) % 64;

if !surface_exists(surface)
	surface = surface_create(960, 540);

surface_set_target(surface);
draw_clear_alpha(merge_colour(make_color_rgb(121, 103, 151), merge_colour(c_green, c_white, 0.25), mixingfade), 0.75);
draw_surface_tiled_ext(bg_surf, bg_pos, bg_pos, 1, 1, c_white, 0.25);

// draw content
if is_method(draw)
	draw(curve);

// clip surface (circle)
surface_reset_target();
if !surface_exists(clip_surface)
	clip_surface = surface_create(960, 540);

surface_set_target(clip_surface);
draw_clear(c_white);
gpu_set_blendmode(bm_subtract);
shader_reset();
draw_circle(960 / 2, 540 / 2, 560 * curve, false);
reset_shader_fix();
surface_reset_target();
surface_set_target(surface);
draw_surface(clip_surface, 0, 0);
reset_blendmode();
surface_reset_target();

draw_surface(surface, 0, 0);

// post draw content
if is_method(postdraw)
	postdraw(curve);
