// fps count
if global.showfps
{
	draw_set_font(global.font_small);
	draw_set_colour(c_white);
	draw_set_align(fa_right, fa_bottom);
	draw_text_transformed(960 - 10, 540 - 10, string(fps), 1, 1, 0);
}
draw_set_align();
