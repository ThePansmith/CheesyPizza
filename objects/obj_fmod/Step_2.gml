fmod_set_parameter("PISSINO", (safe_get(obj_player1, "character") == "PP"), true);
fmod_set_parameter("REMIX", REMIX, true);

if check_modifier(MOD.Mirror)
	fmod_set_listener_attributes(0, room_width - camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2));
else
	fmod_set_listener_attributes(0, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2));
fmod_update();
