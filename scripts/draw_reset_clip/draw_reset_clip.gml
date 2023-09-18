function draw_reset_clip() 
{ 
	draw_remove_bounds();
	draw_remove_mask();
	draw_remove_spotlight();
	shader_reset(); 
}