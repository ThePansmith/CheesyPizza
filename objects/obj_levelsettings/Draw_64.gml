live_auto_call;

anim_t = Approach(anim_t, 1, 0.035);
var curve = animcurve_channel_evaluate(outback, anim_t);

#region MODIFIERS

if keyboard_check_pressed(ord("R"))
	event_perform(ev_create, 0);

draw_set_alpha(1);
if menu == 1
{
	draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, (SCREEN_WIDTH / (960 / 560)) * curve);
	draw_sprite_tiled(SUGARY ? bg_options_ss : spr_optionsBG, 5, ++x, x);
	event_inherited();
	draw_reset_clip();
}

#endregion

shader_reset();
reset_blendmode();

// fader
draw_set_alpha(fadealpha);
draw_set_colour(c_black);

draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);