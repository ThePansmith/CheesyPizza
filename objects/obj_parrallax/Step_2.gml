// giant switch statement
function layer_get_parallax(lay)
{
	var _cam_x = camera_get_view_x(view_camera[0]), _cam_y = camera_get_view_y(view_camera[0]);
	var _cam_w = SCREEN_WIDTH, _cam_h = SCREEN_HEIGHT;
	
	// --------
	
	var n = layer_get_name(lay);
	switch n
	{
		case "Backgrounds_1": return [_cam_x * 0.25, _cam_y * 0.25]; break;
		case "Backgrounds_2": return [_cam_x * 0.2, _cam_y * 0.2]; break;
		case "Backgrounds_3": return [_cam_x * 0.15, _cam_y * 0.15]; break;
		
		case "Backgrounds_Ground1": return [_cam_x * 0.2, 0]; break;
		case "Backgrounds_Ground2": return [_cam_x * 0.18, 0]; break;
		case "Backgrounds_Ground3": return [_cam_x * 0.16, 0]; break;
		
		case "Backgrounds_H1": return [_cam_x * 0.11, _cam_y]; break;
		
		case "Backgrounds_sky": return [_cam_x * 0.25, _cam_y * 0.25]; break;
		case "Backgrounds_sky2": return [_cam_x, _cam_y]; break;
		
		case "Backgrounds_stillscroll": return [_cam_x - calculate_parrallax_still_x(lay, 0.25), _cam_y - calculate_parrallax_still_y(lay, 0.25)]; break;
		case "Backgrounds_stillH1": return [_cam_x * 0.3, _cam_y - calculate_parrallax_still_y(lay, 0.3)]; break;
		case "Backgrounds_stillH2": return [_cam_x * 0.25, _cam_y - calculate_parrallax_still_y(lay, 0.25)]; break;
		case "Backgrounds_stillH3": return [_cam_x * 0.2, _cam_y - calculate_parrallax_still_y(lay, 0.2)]; break;
		case "Backgrounds_stillH4": return [_cam_x * 0.15, _cam_y - calculate_parrallax_still_y(lay, 0.15)]; break;
		case "Backgrounds_scroll": return [_cam_x * 0.3, _cam_y * 0.3]; break;
		case "Backgrounds_scroll2": return [_cam_x * 0.25, _cam_y * 0.25]; break;
		case "Backgrounds_scroll3": return [_cam_x * 0.2, _cam_y * 0.2]; break;
		case "Backgrounds_scroll4": return [_cam_x * 0.15, _cam_y * 0.15]; break;
		case "Backgrounds_zigzag1": return [_cam_x * 0.35, _cam_y * 0.35 + Wave(-bg_zigzag1_offset, bg_zigzag1_offset, 4, 10)]; break;
		case "Backgrounds_zigzag2": return [_cam_x * 0.35, _cam_y * 0.35 + Wave(-bg_zigzag2_offset, bg_zigzag2_offset, 4, 10)]; break;
		case "Backgrounds_stillZH1": return [_cam_x * 0.35, _cam_y - calculate_parrallax_still_y(lay, 0.35) + Wave(-bg_ZH1_offset, bg_ZH1_offset, 4, 10)]; break;
		case "Backgrounds_stillZH2": return [_cam_x * 0.35, _cam_y - calculate_parrallax_still_y(lay, 0.35) + Wave(-bg_ZH2_offset, bg_ZH2_offset, 4, 10)]; break;
		
		case "Foreground_1": case "Foreground_A": return [_cam_x * -0.15, _cam_y * -0.15]; break;
		case "Foreground_2": return [_cam_x * -0.25, _cam_y * -0.25]; break;
		case "Foreground_Ground1": return [_cam_x * -0.15, room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(lay)))]; break;
		
		case "Backgrounds_still1": case "Backgrounds_still2":
			var per = 0.25;
			if n == "Backgrounds_still1"
				per = 0.3;
			
			var per_x = _cam_x / (room_width - SCREEN_WIDTH);
			var per_y = _cam_y / (room_height - SCREEN_HEIGHT);
			var bg_x = calculate_parrallax_still_x(lay, per);
			var bg_y = calculate_parrallax_still_y(lay, per);
			return [_cam_x - bg_x, _cam_y - bg_y];
			break;
	}
}

// update the layers
var roombgs = room_get_bg_layers();
for(var i = 0; i < array_length(roombgs); i++)
{
	var l = roombgs[i];
	l.x += layer_get_hspeed(l.layer_id);
	l.y += layer_get_vspeed(l.layer_id);
	
	var parallax = layer_get_parallax(l.layer_id);
	if parallax == undefined
		parallax = [0, 0];
	
	layer_x(l.layer_id, floor(l.x + parallax[0]));
	layer_y(l.layer_id, floor(l.y + parallax[1]));
}

// asset layers
var _cam_x = camera_get_view_x(view_camera[0]), _cam_y = camera_get_view_y(view_camera[0]);
for(var i = 0; i < array_length(asset_layers); i++)
{
	if !layer_exists(asset_layers[i])
		continue;
	
	layer_x(asset_layers[i], _cam_x * asset_parallax[i][0]);
	layer_y(asset_layers[i], _cam_y * asset_parallax[i][1]);
}
