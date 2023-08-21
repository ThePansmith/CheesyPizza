event_inherited();
with obj_player1
	visible = true;
if surface_exists(player_surface)
	surface_free(player_surface);
	
if surface_exists(pattern_surface)
	surface_free(pattern_surface);
