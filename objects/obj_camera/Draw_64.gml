draw_set_alpha(1);
if is_bossroom() || room == editor_room || instance_exists(obj_tutorialbook)
	exit;

if global.hud == 1
	scr_cameradraw_old();
else
	scr_cameradraw();
