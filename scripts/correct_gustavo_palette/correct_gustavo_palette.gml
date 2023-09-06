function gustavo_palette(pal)
{
	var char = obj_player1.character;
	if obj_player1.isgustavo
		char = "G";
	
	var pal_new = pal % sprite_get_width(spr_peppalette);
	if pal == 0 && char != "P" && char != "SP" && char != "PN" && char != "G"
		pal_new = 1;
	if pal != 12 && (pal_new == 2 or pal_new == 12 or pal_new == 13 or pal_new == 14)
		pal_new = 1;
	if char != "P" && char != "G" && char != "PN"
		pal_new = 1;
		
	return pal_new;
}
