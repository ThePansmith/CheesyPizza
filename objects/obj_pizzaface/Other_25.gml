image_alpha = 0;
savedx = x;
savedy = y;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
if instance_exists(obj_player1)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
treasure = instance_exists(obj_treasure);
if (room == rank_room)
	instance_destroy();

// lap 3
if global.laps >= 2 && global.chasekind == 2
{
	// from "LAP HELL - Hotfix n' Ready" by TheCyVap
	maxspeed = 8;
	if room == graveyard_6
		maxspeed = 5;
	if room == graveyard_7
		maxspeed = 4;
	if room == graveyard_9b
	    maxspeed = 5;
	if room == farm_4
	    maxspeed = 6;
	if room == forest_lap
	    maxspeed = 7;
	// extra
	if room == ancient_13
	    maxspeed = 5;
	
	if maxspeed < 8
		sprite_index = spr_haywire;
	else
		sprite_index = spr_idle;
}
