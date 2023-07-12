draw_set_color(c_white);
draw_self();
if sprite_index != spr_snickchallengecomputer
{
	draw_sprite(sprite_index, 1, x, y);
	scr_hub_bg_draw(x, y, sprite_index, 1);
}
