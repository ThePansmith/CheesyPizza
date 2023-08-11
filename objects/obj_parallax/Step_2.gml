var _cam_x = camera_get_view_x(view_camera[0]), _cam_y = camera_get_view_y(view_camera[0]);

// update the layers
var roombgs = room_get_bg_layers();
for(var i = 0; i < array_length(roombgs); i++)
{
	var l = roombgs[i];
	l.x += layer_get_hspeed(l.layer_id);
	l.y += layer_get_vspeed(l.layer_id);
	
	if variable_struct_exists(l, "par_x")
		var parallax = [_cam_x * l.par_x, _cam_y * l.par_y];
	else
	{
		var parallax = layer_get_parallax(l.layer_id);
		if parallax == undefined
			parallax = [0, 0];
	}
	
	layer_x(l.layer_id, floor(l.x + parallax[0]));
	layer_y(l.layer_id, floor(l.y + parallax[1]));
}

// asset layers
for(var i = 0; i < array_length(asset_layers); i++)
{
	if !layer_exists(asset_layers[i])
		continue;
	
	layer_x(asset_layers[i], _cam_x * asset_parallax[i][0]);
	layer_y(asset_layers[i], _cam_y * asset_parallax[i][1]);
}
