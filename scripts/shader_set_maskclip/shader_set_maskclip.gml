/// @func	shader_set_maskclip(clip_sprite, clip_sprite_subimage)
/// @desc	Clip everything from a given clipping mask, returns false if shaders aren't supported, returns true otherwise
/// @param	{real}				_x	The X position of where to draw the clip mask
/// @param	{real}				_y	The Y position of where to draw the clip mask
/// @param	{Asset.GMSprite}	_clip_sprite	The sprite asset
/// @param	{real}				_clip_sprite_subimage	The subimage of the sprite asset to use
/// @arg	{bool}	_alpha_fix		Simulate the alphafix to all pixels inside the clip
/// @returns	{bool}
function shader_set_maskclip(_x, _y, _clip_sprite, _clip_sprite_subimage = 0, _alpha_fix = false)
{
	if global.performance
		return false;

	var shader = shd_maskclip;
	
	var u_clip_sprite_texture = shader_get_sampler_index(shader, "u_clip_sprite_texture");
	var u_clip_sprite_uvs = shader_get_uniform(shader, "u_clip_sprite_uvs");
	var u_clip_sprite_size = shader_get_uniform(shader, "u_clip_sprite_size");
	var u_clip_sprite_texelsize = shader_get_uniform(shader, "u_clip_sprite_texelsize");
	var u_clip_sprite_worldposition = shader_get_uniform(shader, "u_clip_sprite_worldposition");
	var u_clip_sprite_trimmed = shader_get_uniform(shader, "u_clip_sprite_trimmed");
	var u_alphafix = shader_get_uniform(shader, "u_alphafix");
		
	var clip_sprite_texture = sprite_get_texture(_clip_sprite, _clip_sprite_subimage);
	var clip_uvs = sprite_get_uvs(_clip_sprite, _clip_sprite_subimage);
	
	shader_set(shader);
	
	texture_set_stage(u_clip_sprite_texture, clip_sprite_texture);
	shader_set_uniform_f(u_clip_sprite_uvs, clip_uvs[0], clip_uvs[1], clip_uvs[2], clip_uvs[3]);
	shader_set_uniform_f(u_clip_sprite_size, sprite_get_width(_clip_sprite), sprite_get_height(_clip_sprite));
	shader_set_uniform_f(u_clip_sprite_texelsize, texture_get_texel_width(clip_sprite_texture), texture_get_texel_height(clip_sprite_texture));
	shader_set_uniform_f(u_clip_sprite_trimmed, clip_uvs[4], clip_uvs[5], clip_uvs[6], clip_uvs[7]);
	shader_set_uniform_f(u_clip_sprite_worldposition, _x, _y);
	shader_set_uniform_f(u_alphafix, _alpha_fix ? 1.0 : 0.0);
	return true;
}