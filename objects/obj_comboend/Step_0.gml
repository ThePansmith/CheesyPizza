if (timer > 0)
	timer--;
else
{
	timer = timer_max;
	if (comboscore > 0)
	{
		if (combominus <= 1)
			combominus = 1;
		comboscore -= round(combominus);
		if (comboscore < 0)
			comboscore = 0;
		
		spr_palette = noone;
		paletteselect = 0;
		
		var spr = scr_collectspr(obj_collect,, false);
		create_collect(camera_get_view_x(view_camera[0]) + x, camera_get_view_y(view_camera[0]) + y, spr, round(combominus), spr_palette, paletteselect);
	}
	else if (alarm[1] == -1)
		alarm[1] = 50;
}
if (global.combotime > 0 && global.combo > 0 && obj_player1.character != "SP" && global.hud == 0)
	y = Approach(y, ystart + 100, 10);
title_index += 0.35;
if (title_index >= 2)
	title_index = frac(title_index);
if (room == rank_room || room == timesuproom)
	instance_destroy();
if instance_exists(obj_endlevelfade) && REMIX
	instance_destroy();
