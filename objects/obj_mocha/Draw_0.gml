if (shiny)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_mochapalette, 1, false);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();

if (sparkleactive && sprite_get_number(spr_shinysparkle) >= sparkleindex)
	draw_sprite(spr_shinysparkle, sparkleindex, x + sprite_get_width(spr_mocha) / 2, y + sprite_get_height(spr_mocha) / 2);
