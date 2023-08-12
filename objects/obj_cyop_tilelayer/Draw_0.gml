if secrettile
{
	var spotlight = global.secrettiles && !instance_exists(obj_fakeplayer);
	shader_set(shd_secrettile);
	var bounds = shader_get_uniform(shd_secrettile, "u_secret_tile_bounds");
	var alpha = shader_get_uniform(shd_secrettile, "u_secret_tile_alpha");
	var remix = shader_get_uniform(shd_secrettile, "u_remix_flag");
	
	var left = camera_get_view_x(view_camera[0]);
	var top = camera_get_view_y(view_camera[0]);
	var right = left + camera_get_view_width(view_camera[0]);
	var bottom = top + camera_get_view_height(view_camera[0]);
	shader_set_uniform_f(bounds, left, top, right, bottom);
	shader_set_uniform_f(alpha, image_alpha);
	shader_set_uniform_f(remix, spotlight);
	
	if spotlight 
	{
		var clip_distance = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_distance");
		var clip_position = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_position");
		var fade_size = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_size");
		var fade_intensity = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_intensity");
		shader_set_uniform_f(clip_distance, global.secrettile_clip_distance);
		shader_set_uniform_f(clip_position, obj_player1.x, obj_player1.y);
		shader_set_uniform_f(fade_size, global.secrettile_fade_size);
		shader_set_uniform_f(fade_intensity, global.secrettile_fade_intensity);
	}
}
else
{	
	var final_array = [ ];
	if array_length(global.cyop_broken_tiles) > 0
	{
		shader_set(shd_cyop_secretblock);
		var secret_block_info = shader_get_uniform(shd_cyop_secretblock, "u_secret_block_info");
		var tile_size = shader_get_uniform(shd_cyop_secretblock, "u_tile_size");
		var temp_array = [ ];
		var index = 0;
		for (var i = 0; i < array_length(global.cyop_broken_tiles); i += 2)
		{

			
			var xx = global.cyop_broken_tiles[i];
			var yy = global.cyop_broken_tiles[i + 1];
			
			var camx = camera_get_view_x(view_camera[0]);
			var camy = camera_get_view_y(view_camera[0]);
			
			var camw = camera_get_view_width(view_camera[0]);
			var camh = camera_get_view_height(view_camera[0]);
			
			if (rectangle_in_rectangle(xx, yy, xx + tilelayer.tilesize_x, yy + tilelayer.tilesize_y, camx, camy, camx + camw, camy + camh))
			{
				if array_length(temp_array) < 256
				{
					var match = false;
					for (var j = 0; j < array_length(temp_array) / 2; j += 2)
					{
						match = temp_array[j] == xx && temp_array[j + 1] == yy;
						
						if match
							break;
					}
					
					if match
					{
						trace("CYOP: Attempted to add the same broken tile");
						continue;
					}
					
					temp_array[index] = xx;
					temp_array[index + 1] = yy;
					index += 2;
				}
				else
					trace($"WARNING: cyop_tilelayer has exceeded maximum allowed broken tiles! Tell RadixComet!\nglobal.cyop_broken_tiles: {global.cyop_broken_tiles}\ntemp_array: {temp_array}");
			}
		}
		if array_length(temp_array) > 0
			shader_set_uniform_f_array(secret_block_info, temp_array);
				
		shader_set_uniform_f(tile_size, tilelayer.tilesize_x, tilelayer.tilesize_y);	
	}
}

tilelayer.Draw();
