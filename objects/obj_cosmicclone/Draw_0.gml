if curr_state != noone && room == curr_state.room
{
	/* shader_set(shd_cosmicclone);
	var u_texture_page = shader_get_sampler_index(shd_cosmicclone, "u_texturePage");
	var u_sprite_uvs = shader_get_uniform(shd_cosmicclone, "u_sprite_uvs");
	
	var sprite_uvs = sprite_get_uvs(sprite_index, image_index);
	
	shader_set_uniform_f(u_sprite_uvs, sprite_uvs[0], sprite_uvs[1], sprite_uvs[6], sprite_uvs[7]);
	
	texture_set_stage(u_texture_page, sprite_get_texture(spr_cosmicclone_layer1, 0));
	for (var i = 0; i < 3; i++)
	{
		var uniform_location = shader_get_uniform(shd_cosmicclone, $"u_layer{i}_info")
		shader_set_uniform_f(uniform_location, layer_uvs[i][0], layer_uvs[i][1], layer_uvs[i][2], layer_uvs[i][3], layer_uvs[i][4], layer_uvs[i][5], layer_uvs[i][6], layer_uvs[i][7]);
	}*/
	
	if !surface_exists(surf)
		surf = surface_create(200, 200);
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	shader_set(shd_pal_swapper);
	for (var i = 0; i < array_length(characters); i++)
	{
		if characters[i][0] != obj_player1.character
			continue;
		
		pal_swap_set(characters[i][1], 58);
		break;
	}

	draw_sprite_ext(sprite_index, image_index, 100, 100, image_xscale, image_yscale, image_angle, c_white, 1.0);
	pattern_reset();
	
	surface_reset_target();
	shader_reset();
	var scaled_size = (32 * 6.25);
	
	var x_pos = x - (scaled_size / 2);
	var y_pos = y - (scaled_size / 2);
	
	draw_set_mask_texture(x_pos, y_pos, surface_get_texture(surf), 200, 200);
	
	//var player_distance_mod = distance_between_points(x, y, target_object.x, target_object.y);
	
	var target_distance_x = (x - target_object.x);
	var target_distance_y = (y - target_object.y);
	
	draw_sprite_ext(spr_cosmicclone_layer1, 0, x_pos, y_pos, 3.125 , 3.125, 0, c_white, 1);

	//draw_sprite_ext(spr_cosmicclone_layer2, 0, x_pos + layer_offsets[0], y - (scaled_size / 2), 3.125 , 3.125, 0, c_white, 1);
	//draw_sprite_ext(spr_cosmicclone_layer3, 0, x_pos + layer_offsets[2], y - (scaled_size / 2), 3.125 , 3.125, 0, c_white, 1);
	//draw_sprite_ext(spr_cosmicclone_layer4, layer_4_index, x_pos + layer_offsets[4], y - (scaled_size / 2), 3.125 , 3.125, 0, c_white, 1);
	draw_sprite_stretched(spr_cosmicclone_layer2, 0, (x_pos - ((layer_offsets[0] + target_distance_x / 3) % 64) - 64), (y_pos + target_distance_y % 64 ), 328, 328);
	draw_sprite_stretched(spr_cosmicclone_layer3, 0, (x_pos - ((layer_offsets[2] + target_distance_x / 6) % 64) - 64), (y_pos + target_distance_y % 64), 328, 328);
	draw_sprite_stretched(spr_cosmicclone_layer4, layer_4_index, (x_pos - ((layer_offsets[4] + target_distance_x / 9) % 64) - 64), (y_pos + target_distance_y % 64), 328, 328);
	
	draw_reset_clip();
	
	//draw_surface(surf, x - 100, y - 100);
	//draw_rectangle_color(x - 100, y - 100, x + 100, y + 100, c_white, c_white, c_white, c_white, true);
	
	//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);
	//shader_reset();
}
