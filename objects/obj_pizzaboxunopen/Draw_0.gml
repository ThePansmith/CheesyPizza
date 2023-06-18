if (false)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_cagepalette, 1, false);
}

draw_self();
draw_sprite(spr_toppinhelp, subimg, x, y - 70);

if (false)
	pal_swap_reset();
