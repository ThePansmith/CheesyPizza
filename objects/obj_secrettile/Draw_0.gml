if !bbox_in_camera(view_camera[0], 32)
	exit;

shader_set(shd_secrettile);
var uniform_bounds_location = shader_get_uniform(shd_secrettile, "u_secret_tile_bounds");
var uniform_alpha_location = shader_get_uniform(shd_secrettile, "u_secret_tile_alpha");

shader_set_uniform_f(uniform_bounds_location, bbox_left, bbox_top, bbox_right, bbox_bottom);
shader_set_uniform_f(uniform_alpha_location, image_alpha);
var uniform_remix_location = shader_get_uniform(shd_secrettile, "u_remix_flag");
shader_set_uniform_f(uniform_remix_location, REMIX);
	
if (REMIX)
{
	var uniform_clip_distance_location = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_distance");
	var uniform_clip_position_location = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_position");
	var uniform_fade_size_location = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_size");
	var uniform_fade_intensity_location = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_intensity");

	shader_set_uniform_f(uniform_clip_distance_location, global.secrettile_clip_distance);
	shader_set_uniform_f(uniform_clip_position_location, obj_player1.x, obj_player1.y);
	shader_set_uniform_f(uniform_fade_size_location, global.secrettile_fade_size);
	shader_set_uniform_f(uniform_fade_intensity_location, global.secrettile_fade_intensity);
}


array_foreach(tiles, function(i) 
{
	draw_tile(i.tileset, i.tile_data, 0, i.x, i.y);
});

shader_reset();