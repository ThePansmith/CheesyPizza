function scr_draw_lap_display(x, y, lapflag_index)
{
	var posx = x - 65, posy = y - 18;
	draw_sprite(spr_lapflag, lapflag_index, posx, posy);
	draw_set_colour(c_white);
	draw_set_align(fa_center, fa_middle);
	draw_set_font(global.lapfont);
	draw_text(posx + 36, posy + 30, string(global.laps + 1));
	draw_set_align(); // reset alignment
}
