with obj_parallax
{
	if id != other.id
	{
		trace("Extra obj_parallax in " + room_get_name(room));
		instance_destroy(other);
	}
}
depth = -1000;

asset_layers = ["Assets_BG", "Assets_BG1", "Assets_BG2", "Assets_stillBG1", "Assets_FG", "Assets_FG1", "Assets_FG2", "Assets_stillBG"];
asset_parallax = [[0.1, 0.1], [0.05, 0.05], [0.1, 0.1], [0.05, 0], [-0.1, -0.1], [-0.05, -0.05], [-0.1, -0.1], [0.1, 0]];
//room_started = false;

portal_offset = {x: 0, y: 0};
sucrose_state = 0;
