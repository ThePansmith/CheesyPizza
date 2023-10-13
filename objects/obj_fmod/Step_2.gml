fmod_set_parameter("PINOLINO", (safe_get(obj_player1, "character") == "PN"), true);
fmod_set_parameter("REMIX", REMIX, true);

if MOD.Mirror
	fmod_set_listener_attributes(0, room_width - (CAMX + (CAMW / 2)), CAMY + (CAMH / 2));
else
	fmod_set_listener_attributes(0, CAMX + (CAMW / 2), CAMY + (CAMH / 2));
fmod_update();

event_handle_count = fmod_debug_event_handle_count();
event_handle_free_count = fmod_debug_event_handle_free_count();
event_handle_used_count = event_handle_count - event_handle_free_count;
voice_count = fmod_get_active_voices();

