shader_set(global.Pal_Shader);
pal_swap_set(spr_bs_globepalette, floor(paletteselect), false);
draw_self();
pal_swap_reset();

draw_sprite(spr_bs_sphere, round(spherestep / 7.5), x, y + spherestep)
