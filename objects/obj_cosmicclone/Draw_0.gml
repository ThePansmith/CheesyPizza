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
	
	
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);
	//shader_reset();
}
