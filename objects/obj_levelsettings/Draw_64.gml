live_auto_call;

#region MODIFIERS

if menu == 1
{
	draw_sprite_tiled(spr_optionsBG, 5, --x, -x);
	event_inherited();
}

#endregion

draw_set_alpha(fadealpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
