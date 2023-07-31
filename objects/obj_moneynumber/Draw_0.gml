draw_set_font(global.moneyfont);
draw_set_halign(1);
var c = 65280;
draw_set_color(c);
if (flash)
	draw_set_flash();
draw_text(x, y, number);
if (flash)
	draw_reset_flash();
