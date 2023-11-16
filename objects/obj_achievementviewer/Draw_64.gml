if (alpha > 0)
{
	toggle_alphafix(true);
	
	var text = concat(texttitle, "\n", textdesc);
	draw_set_font(textfont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 16, text, c_white, c_white, c_white, c_white, alpha);
	
	toggle_alphafix(false);
}
