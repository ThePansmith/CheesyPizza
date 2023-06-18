if (alpha > 0)
{
	var text = concat(texttitle, "\n", textdesc);
	draw_set_font(textfont);
	draw_set_halign(1);
	draw_set_valign(2);
	draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 16, text, c_white, c_white, c_white, c_white, alpha);
}
