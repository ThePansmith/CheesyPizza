function shader_set_maskclip(_clip_sprite, _clip_sprite_subimage = 0)
{
	var clip_texture = sprite_get_texture(_clip_sprite, _clip_sprite_subimage);
	
	var u_clip_texture = shader_get_sampler_index(shd_maskclip, "u_clip_texture");
	var u_clip_uvs = shader_get_uniform(shd_maskclip, "u_clip_uvs");
	var u_clip_sprite_size = shader_get_uniform(shd_maskclip, "u_clip_sprite_size");
	
	var uvs = sprite_get_uvs(_clip_sprite, _clip_sprite_subimage);
	
	shader_set(shd_maskclip);
	
	texture_set_stage(u_clip_texture, clip_texture);
	shader_set_uniform_f(u_clip_uvs, uvs[0], uvs[1], uvs[4], uvs[5])
}