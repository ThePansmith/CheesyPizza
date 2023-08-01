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
if global.laps >= 2
{
	if room == graveyard_6
		maxspeed = 5;
	if room == graveyard_7
	{
		maxspeed = 4;
		sprite_index = spr_pizzahead_haywire;
		destroy_sounds([snd]);
		snd = fmod_event_create_instance("event:/sfx/pizzahead/haywire");
	}
}
