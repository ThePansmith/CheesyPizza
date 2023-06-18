if !bbox_in_camera(view_camera[0], 32)
	exit;

if !surface_exists(surf)
{
	surf = surface_create(sprite_width, sprite_height);
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	array_foreach(tiles, function(i) {
		draw_tile(i[3], i[2], 0, i[0] - x, i[1] - y);
	});
	
	surface_reset_target();
}
draw_surface_ext(surf, x, y, 1, 1, 0, c_white, image_alpha);
