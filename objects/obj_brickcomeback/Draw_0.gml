shader_set(shd_pal_swapper);
pal_swap_set(spr_peppalette, gustavo_palette(obj_player1.paletteselect), false);
draw_self();
shader_reset();
