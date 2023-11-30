draw_self_safe();
draw_sprite(check_sugary() ? spr_movingplatformSS : spr_chigaco, index, x, y + 46);
if (showtext)
	draw_sprite(spr_pizzasona_thankyou, index, x, y - 40);
