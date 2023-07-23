var mario = global.secrettiles && !instance_exists(obj_fakeplayer);
if !bbox_in_camera(view_camera[0], 32) or (image_alpha <= 0 && !mario)
	exit;

if (!mario && image_alpha < 1) or global.secrettile_clip_distance > 0
{
	shader_set(shd_secrettile);
	var bounds = shader_get_uniform(shd_secrettile, "u_secret_tile_bounds");
	var alpha = shader_get_uniform(shd_secrettile, "u_secret_tile_alpha");
	var remix = shader_get_uniform(shd_secrettile, "u_remix_flag");
	
	shader_set_uniform_f(bounds, bbox_left, bbox_top, bbox_right, bbox_bottom);
	shader_set_uniform_f(alpha, image_alpha);
	shader_set_uniform_f(remix, mario);
	
	if mario
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

array_foreach(tiles, function(i) {
	draw_tile(i.tileset, i.tile_data, 0, i.x, i.y);
});
shader_reset();
