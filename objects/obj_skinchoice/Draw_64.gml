if live_call() return live_result;

if !init
	exit;

reset_blendmode();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
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
if !surface_exists(bg_surf)
	bg_surf = surface_create(64, 64);

surface_set_target(bg_surf);

mixingfade = Approach(mixingfade, mixing, 0.3);
draw_clear(merge_colour(make_color_rgb(121, 103, 151), merge_colour(c_green, c_white, 0.25), mixingfade));

// jesus christ
draw_sprite_ext(spr_skinmenupizza, bg_image, bg_pos, bg_pos, curve, curve, 0, c_white, 0.35 * curve);
draw_sprite_ext(spr_skinmenupizza, bg_image, bg_pos - 64, bg_pos, curve, curve, 0, c_white, 0.35 * curve);
draw_sprite_ext(spr_skinmenupizza, bg_image, bg_pos - 64, bg_pos - 64, curve, curve, 0, c_white, 0.35 * curve);
draw_sprite_ext(spr_skinmenupizza, bg_image, bg_pos, bg_pos - 64, curve, curve, 0, c_white, 0.35 * curve);
draw_sprite_ext(spr_skinmenupizza, bg_image, bg_pos + 64, bg_pos, curve, curve, 0, c_white, 0.35 * curve);
draw_sprite_ext(spr_skinmenupizza, bg_image, bg_pos, bg_pos + 64, curve, curve, 0, c_white, 0.35 * curve);
draw_sprite_ext(spr_skinmenupizza, bg_image, bg_pos + 64, bg_pos + 64, curve, curve, 0, c_white, 0.35 * curve);

bg_pos = (bg_pos + 0.5) % 64;
surface_reset_target();

// overall surface
if !surface_exists(surface)
	surface = surface_create(960, 540);

surface_set_target(surface);
draw_clear_alpha(c_black, 0);
draw_surface_tiled_ext(bg_surf, 0, 0, 1, 1, c_white, 0.75);

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
