
if (paletteselect > 0)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_palette, paletteselect, false);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();

draw_sprite(spr_chigaco, index, x, y + 46);
if (sparkleactive)
	draw_sprite(spr_shinysparkle, sparkleindex, x, y + 23);

if (showtext)
	draw_sprite(spr_pizzasona_thankyou, index, x, y - 40);
