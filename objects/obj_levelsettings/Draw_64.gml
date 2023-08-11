live_auto_call;

anim_t = Approach(anim_t, 1, 0.035);
var curve = animcurve_channel_evaluate(outback, anim_t);

if !surface_exists(surface)
	surface = surface_create(960, 540);
surface_set_target(surface);

#region MODIFIERS

if menu == 1
{
	draw_sprite_tiled(spr_optionsBG, 5, ++x, x);
	event_inherited();
}

#endregion

// clip surface (circle)
surface_reset_target();
if !surface_exists(clip_surface)
	clip_surface = surface_create(960, 540);

surface_set_target(clip_surface);
draw_clear(c_white);
gpu_set_blendmode(bm_subtract);
draw_circle(960 / 2, 540 / 2, 560 * curve, false);
surface_reset_target();
surface_set_target(surface);
draw_surface(clip_surface, 0, 0);
surface_reset_target();

reset_blendmode();
reset_shader_fix();

draw_surface(surface, 0, 0);

gpu_set_blendmode(bm_normal);
shader_reset();

// fader
draw_set_alpha(fadealpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
