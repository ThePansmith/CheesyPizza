if (is_bossroom() || instance_exists(obj_achievementviewer))
	exit;
draw_set_font(global.moneyfont);
draw_set_halign(1);
draw_set_valign(0);
draw_set_color(c_white);
if (state == states.titlescreen || state == states.fall)
	draw_text_color(x, y + add_y, concat("$", global.pigtotal_add), c_lime, c_lime, c_lime, c_lime, 1);
draw_sprite(spr_pigtotal, -1, x, y);
draw_text(x, y, concat("$", string(global.pigtotal - global.pigreduction - global.pigtotal_add)));
