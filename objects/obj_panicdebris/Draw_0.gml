live_auto_call;

if instance_exists(obj_ghostcollectibles) or !global.panic
	exit;

if draw && global.leveltosave != "exit"
{
	y += 3;
	
	var blend = get_dark(c_white, obj_drawcontroller.use_dark);
	draw_sprite_tiled_ext(bg_fallingbricksforefront, 0, x, y, 1, 1, blend, 1);
}
if global.laps >= 2
{
	if scr_current_time() % 100 == 0 repeat min(floor(global.laps / 4), 10) * (room_width / 960)
		create_debris(random_range(-50, room_width + 50), 50, spr_towerblockdebris, true);
}
