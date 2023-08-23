if draw && global.leveltosave != "exit"
{
	y += 4;
	
	var blend = get_dark(c_white, obj_drawcontroller.use_dark);
	draw_sprite_tiled_ext(bg_fallingbricksforefront, 0, x, y, 1, 1, blend, 1);
}
if global.laps >= 2
{
	repeat min(floor(global.laps / 3), 10)
		create_debris(camera_get_view_x(view_camera[0]) + random_range(-50, SCREEN_WIDTH + 50), camera_get_view_y(view_camera[0]) - 50, spr_towerblockdebris, true);
}
