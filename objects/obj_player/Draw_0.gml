if (global.showcollisions > 1) //LP: Kill yourself
{
	//RX: Get the boof
	var beforeColor = draw_get_color();
	var beforeAlpha = draw_get_alpha();
	var beforeGPUBlend = gpu_get_blendmode();
	
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_red);
	draw_set_alpha(0.75);
	
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	
	//RX: set the boof back
	draw_set_color(beforeColor);
	draw_set_alpha(beforeAlpha);
	gpu_set_blendmode(beforeGPUBlend);
}
