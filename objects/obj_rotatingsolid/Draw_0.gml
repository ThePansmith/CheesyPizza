


//RX: Get the boof
var beforeColor = draw_get_color();
var beforeAlpha = draw_get_alpha();
var beforeGPUBlend = gpu_get_blendmode();

gpu_set_blendmode(bm_normal);
draw_set_color(c_purple);
draw_set_alpha(0.75);



draw_line_width(TL_x, TL_y, TR_x, TR_y, 2);
draw_line_width(TR_x, TR_y, BR_x, BR_y, 2);
draw_line_width(BR_x, BR_y, BL_x, BL_y, 2);
draw_line_width(BL_x, BL_y, TL_x, TL_y, 2);


//RX: set the boof back
draw_set_color(beforeColor);
draw_set_alpha(beforeAlpha);
	gpu_set_blendmode(beforeGPUBlend);
