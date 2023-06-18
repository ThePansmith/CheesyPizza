function gustavo_palette(pal)
{
	var pal_new = pal % sprite_get_width(spr_ratmountpalette);
	if pal != 12 && (pal_new == 2 or pal_new == 12 or pal_new == 13 or pal_new == 14)
		pal_new = 1;
	return pal_new;
}
