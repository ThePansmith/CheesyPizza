if (state == states.duel && duelphase == 0 && !instance_exists(obj_vigilante_duelintro))
{
	draw_set_font(global.bigfont);
	draw_set_halign(1);
	draw_set_valign(1);
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, "GET READY\nTO PRESS GRAB");
	draw_set_halign(0);
	draw_set_valign(0);
}
